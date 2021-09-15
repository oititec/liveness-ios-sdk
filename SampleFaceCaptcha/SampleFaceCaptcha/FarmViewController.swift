//
//  FarmViewController.swift
//  SampleFaceCaptcha
//
//  Created by Felipe Augusto on 15/09/21.
//

import UIKit
import FaceCaptcha

class FarmViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private static let baseURL = "https://comercial.certiface.com.br:8443/"
    private static let username = ""
    private static let password = ""
    private static let cpf = ""
    private static let name = ""
    private static let birthday = ""

    private var appKey: String?
    private let repository = CertifaceRepository(baseURL: baseURL)
    private let userDefaults = UserDefaultsManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if userDefaults.getString(forKey: .token) == nil {
            userDefaults.saveString(value: FarmViewController.username, forKey: .username)
            userDefaults.saveString(value: FarmViewController.cpf, forKey: .cpf)
            userDefaults.saveString(value: FarmViewController.name, forKey: .name)
            userDefaults.saveString(value: FarmViewController.birthday, forKey: .birthday)
            authenticate()
        }
    }
    
    @IBAction func startPressed(_ sender: Any) {
        generateAppKey { [weak self] in
            self?.startFaceCaptcha()
        }
    }
    
    private func authenticate() {
        
        startButton.isHidden = true
        activityIndicator.isHidden = false
        
        repository.authenticate(username: FarmViewController.username, password: FarmViewController.password) { [weak self] token in
            DispatchQueue.main.async {
                self?.activityIndicator.isHidden = true
                if let token = token {
                    self?.startButton.isHidden = false
                    self?.userDefaults.saveString(value: token, forKey: .token)
                } else {
                    self?.showAlert(title: "Erro", message: "Erro ao autenticar")
                }
            }
        }
    }
    
    private func generateAppKey(completion: @escaping () -> Void) {
        
        startButton.isHidden = true
        activityIndicator.isHidden = false
        
        repository.generateAppKey { [weak self] appKey in
            DispatchQueue.main.async {
                self?.activityIndicator.isHidden = true
                if let appKey = appKey {
                    self?.startButton.isHidden = false
                    self?.appKey = appKey
                    completion()
                } else {
                    self?.showAlert(title: "Erro", message: "Erro ao autenticar")
                }
            }
        }
    }
    
    private func startFaceCaptcha() {
        
        guard let appKey = appKey else {
            showAlert(title: "Erro", message: "AppKey nil")
            return
        }
        
        let controller = FaceCaptchaViewController(appKey: appKey,
                                                   baseURL: FarmViewController.baseURL,
                                                   delegate: self)
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true, completion: nil)
    }
    
    private func startDocumentscopy() {
        
        guard let appKey = appKey else {
            showAlert(title: "Erro", message: "AppKey nil")
            return
        }
        
        let controller = DocumentscopyViewController(appKey: appKey,
                                                     baseURL: FarmViewController.baseURL,
                                                     documentscopyDelegate: self)
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true, completion: nil)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.present(alert, animated: true, completion: nil)
        }
    }
}

// MARK: - FaceCaptchaDelegate

extension FarmViewController: FaceCaptchaDelegate {

    /// Callback chamada em caso de desafio concluído.
    /// - Parameter validateModel: Modelo para verificação se prova de vida obteve sucesso
    func handleFaceCaptchaValidation(validateModel: FCValidCaptchaModel) {
        debugPrint("handleCaptureValidation: \(validateModel)")
        dismiss(animated: true) {
            self.showAlert(title: "Desafio concluído",
                           message: "Válido: \(validateModel.valid ?? false)\nMotivo: \(validateModel.cause ?? "")")
            self.startDocumentscopy()
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

extension FarmViewController: DocumentscopyDelegate {

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
