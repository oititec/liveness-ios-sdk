//
//  ViewController.swift
//  SampleFaceCaptcha
//
//  Created by Felipe Augusto on 27/10/20.
//

import UIKit
import FaceCaptcha

class ViewController: UIViewController {

    @IBOutlet weak var cpfTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private let baseURL = "https://comercial.certiface.com.br:8443/"
    private var appKey: String?
    
    private var repository: CertifaceRepository?
    private let userDefaults = UserDefaultsManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if userDefaults.getString(forKey: .token)?.isEmpty ?? true {
            userDefaults.saveString(value: baseURL, forKey: .baseURL)
            performSegue(withIdentifier: "Credentials", sender: self)
        } else {
            repository = CertifaceRepository(baseURL: getSavedBaseURL())
        }
    }
    
    private func populateView() {
        cpfTextField.text = userDefaults.getString(forKey: .cpf)
        nameTextField.text = userDefaults.getString(forKey: .name)
        birthdayTextField.text = userDefaults.getString(forKey: .birthday)
    }
    
    private func getSavedBaseURL() -> String {
        return userDefaults.getString(forKey: .baseURL) ?? ""
    }
    
    private func generateAppKey(completion: @escaping (String) -> Void) {
        
        view.endEditing(true)
        
        userDefaults.saveString(value: cpfTextField.text, forKey: .cpf)
        userDefaults.saveString(value: nameTextField.text, forKey: .name)
        userDefaults.saveString(value: birthdayTextField.text, forKey: .birthday)
        
        activityIndicator.isHidden = false
        
        repository?.generateAppKey(completion: { [weak self] appKey in
            DispatchQueue.main.async {
                self?.activityIndicator.isHidden = true
                if let appKey = appKey {
                    self?.appKey = appKey
                    completion(appKey)
                } else {
                    self?.showAlert(title: "Erro", message: "Erro ao gerar app key. Verifique se as credenciais estão corretas.")
                }
            }
        })
    }
    
    @IBAction func viewTapped(_ sender: Any) {
        view.endEditing(true)
    }
    
    /// Trata de clique no botão para abrir o FaceCaptcha usando view padrão
    @IBAction private func defaultViewPressed() {
        generateAppKey { appKey in
            let controller = FaceCaptchaViewController(appKey: appKey,
                                                       baseURL: self.getSavedBaseURL(),
                                                       delegate: self)
            controller.modalPresentationStyle = .fullScreen
            self.present(controller, animated: true, completion: nil)
        }
    }

    /// Trata de clique no botão para abrir o FaceCaptcha usando imagem customizada
    @IBAction private func customImagePressed() {
        generateAppKey { appKey in
            let cameraOverlay = UIImage(named: "custom_overlay")
            let controller = FaceCaptchaViewController(appKey: appKey,
                                                       baseURL: self.getSavedBaseURL(),
                                                       delegate: self,
                                                       cameraOverlay: cameraOverlay)
            controller.modalPresentationStyle = .fullScreen
            self.present(controller, animated: true, completion: nil)
        }
    }

    /// Trata de clique no botão para abrir o FaceCaptcha usando view customizada
    @IBAction private func customViewPressed() {
        generateAppKey { appKey in
            let customView = FaceCaptchaCustomView(frame: self.view.bounds)
            let controller = FaceCaptchaViewController(appKey: appKey,
                                                       baseURL: self.getSavedBaseURL(),
                                                       delegate: self,
                                                       customView: customView)
            controller.modalPresentationStyle = .fullScreen
            self.present(controller, animated: true, completion: nil)
        }
    }

    /// Trata de clique no botão para abrir Documentoscopia usando view padrão
    @IBAction func documentoscopiaPressed(_ sender: Any) {
        let controller = DocumentscopyViewController(appKey: appKey ?? "",
                                                     baseURL: getSavedBaseURL(),
                                                     documentscopyDelegate: self)
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true, completion: nil)
    }

    /// Trata de clique no botão para abrir Documentoscopia usando view customizada
    @IBAction private func customDocumentoscopiaPressed() {

        let customViewParam = DocumentscopyCustomViewParam(
            homeView: DocHomeCustomView(frame: view.bounds),
            cameraView: DocCameraCustomView(frame: view.bounds),
            confirmationView: DocConfirmationCustomView(frame: view.bounds),
            camInstructionSingle: "Centralize o documento",
            camInstructionFront: "Centralize a frente",
            camInstructionBack: "Centralize o verso"
        )

        let controller = DocumentscopyViewController(appKey: appKey ?? "",
                                                     baseURL: getSavedBaseURL(),
                                                     documentscopyDelegate: self,
                                                     customViewParam: customViewParam)

        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true, completion: nil)
    }
}

// MARK: - FaceCaptchaDelegate

extension ViewController: FaceCaptchaDelegate {

    /// Callback chamada em caso de desafio concluído.
    /// - Parameter validateModel: Modelo para verificação se prova de vida obteve sucesso
    func handleFaceCaptchaValidation(validateModel: FCValidCaptchaModel) {
        debugPrint("handleCaptureValidation: \(validateModel)")
        dismiss(animated: true) {
            self.showAlert(title: "Desafio concluído",
                           message: "Válido: \(validateModel.valid ?? false)\nMotivo: \(validateModel.cause ?? "")")
        }
    }

    /// Callback chamada em caso de erro durante execução do FaceCaptcha.
    /// - Parameters:
    ///   - error: Erro ocorrido
    func handleFaceCaptchaError(error: FaceCaptchaError) {
        debugPrint("handleCaptureVideoError: \(error)")
        dismiss(animated: true) {
            self.showAlert(title: "Erro",
                           message: "\(error)")
        }
    }

    /// Callback chamada ao clicar no botão de cancelar/fechar.
    func handleFaceCaptchaCanceled() {
        debugPrint("handleCaptureCanceled")
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - DocumentscopyDelegate

extension ViewController: DocumentscopyDelegate {

    /// Callback chamada em caso de Documentoscopia concluída..
    func handleDocumentscopyCompleted() {
        debugPrint("handleDocumentscopyCompleted")
        dismiss(animated: true) {
            self.showAlert(title: "Sucesso",
                           message: "Documentoscopia concluída")
        }
    }

    /// Callback chamada em caso de erro durante execução da Documentoscopia.
    /// - Parameters:
    ///   - error: Erro ocorrido
    func handleDocumentscopyError(error: DocumentscopyError) {
        debugPrint("handleDocumentscopyError: \(error)")
        dismiss(animated: true) {
            self.showAlert(title: "Erro",
                           message: "\(error)")
        }
    }

    /// Callback chamada ao clicar no botão de cancelar/fechar.
    func handleDocumentscopyCanceled() {
        debugPrint("handleDocumentscopyCanceled")
        dismiss(animated: true, completion: nil)
    }
}

extension UIViewController {
    
    /// Exibe um UIAlertController.
    /// - Parameters:
    ///   - title: Título da alerta
    ///   - message: Mensagem do alerta
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.present(alert, animated: true, completion: nil)
        }
    }
}
