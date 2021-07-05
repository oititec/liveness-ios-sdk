//
//  ViewController.swift
//  SampleFaceCaptcha
//
//  Created by Felipe Augusto on 27/10/20.
//

import UIKit
import FaceCaptcha

class ViewController: UIViewController {

    private let baseURL = "https://comercial.certiface.com.br:8443/"
    private let appKey = ""

    /// Trata de clique no botão para abrir o FaceCaptcha usando view padrão
    @IBAction private func defaultViewPressed() {
        let controller = FaceCaptchaViewController(appKey: appKey,
                                                   baseURL: baseURL,
                                                   delegate: self)
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true, completion: nil)
    }

    /// Trata de clique no botão para abrir o FaceCaptcha usando imagem customizada
    @IBAction private func customImagePressed() {
        let cameraOverlay = UIImage(named: "custom_overlay")
        let controller = FaceCaptchaViewController(appKey: appKey,
                                                   baseURL: baseURL,
                                                   delegate: self,
                                                   cameraOverlay: cameraOverlay)
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true, completion: nil)
    }

    /// Trata de clique no botão para abrir o FaceCaptcha usando view customizada
    @IBAction private func customViewPressed() {
        let customView = FaceCaptchaCustomView(frame: view.bounds)
        let controller = FaceCaptchaViewController(appKey: appKey,
                                                   baseURL: baseURL,
                                                   delegate: self,
                                                   customView: customView)
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true, completion: nil)
    }

    /// Trata de clique no botão para abrir Documentoscopia usando view padrão
    @IBAction func documentoscopiaPressed(_ sender: Any) {
        let controller = DocumentscopyViewController(appKey: appKey,
                                                     baseURL: baseURL,
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

        let controller = DocumentscopyViewController(appKey: appKey,
                                                     baseURL: baseURL,
                                                     documentscopyDelegate: self,
                                                     customViewParam: customViewParam)

        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true, completion: nil)
    }

    /// Exibe um UIAlertController.
    /// - Parameters:
    ///   - title: Título da alerta
    ///   - message: Mensagem do alerta
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.present(alert, animated: true, completion: nil)
        }
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
