//
//  ViewController.swift
//  SampleFaceCaptcha
//
//  Created by Felipe Augusto on 27/10/20.
//

import UIKit
import FaceCaptcha

class ViewController: UIViewController {

    /// Armazena FCCameraCapture durante o processo prova de vida.
    /// Deve ser desalocado nas chamadas do FCCameraCaptureDelegate.
    private var faceCaptcha: FCCameraCapture?

    private let baseURL = "https://comercial.certiface.com.br:8443/"
    private let appKey = ""

    /// Trata de clique no botão para abrir o FaceCaptcha usando view padrão
    @IBAction private func defaultViewPressed() {
        faceCaptcha = FCCameraCapture(appKey: appKey,
                                      baseURL: baseURL,
                                      viewController: self,
                                      delegate: self)
        faceCaptcha?.show()
    }

    /// Trata de clique no botão para abrir o FaceCaptcha usando imagem customizada
    @IBAction private func customImagePressed() {
        let cameraOverlay = UIImage(named: "custom_overlay")
        faceCaptcha = FCCameraCapture(appKey: appKey,
                                      baseURL: baseURL,
                                      viewController: self,
                                      delegate: self,
                                      cameraOverlay: cameraOverlay)
        faceCaptcha?.show()
    }

    /// Trata de clique no botão para abrir o FaceCaptcha usando view customizada
    @IBAction private func customViewPressed() {
        let customView = LivenessCustomView(frame: view.bounds)
        faceCaptcha = FCCameraCapture(appKey: appKey,
                                      baseURL: baseURL,
                                      viewController: self,
                                      delegate: self,
                                      customView: customView)
        faceCaptcha?.show()
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

// MARK: - FCCameraCaptureDelegate

extension ViewController: FCCameraCaptureDelegate {

    /// Callback chamada em caso de desafio concluído.
    /// - Parameter validateModel: Modelo para verificação se prova de vida obteve sucesso
    func handleCaptureValidation(validateModel: FCValidCaptchaModel) {
        debugPrint("handleCaptureValidation: \(validateModel)")
        faceCaptcha = nil
        showAlert(title: "Desafio concluído",
                  message: "Válido: \(validateModel.valid ?? false)\nMotivo: \(validateModel.cause ?? "")")
    }

    /// Callback chamada em caso de erro durante execução do FaceCaptcha.
    /// - Parameters:
    ///   - error: Erro ocorrido
    ///   - imageBase64: imagem capturada
    func handleCaptureVideoError(error: FaceCaptchaError, imageBase64: String?) {
        debugPrint("handleCaptureVideoError: \(error)")
        faceCaptcha = nil
        showAlert(title: "Erro",
                  message: "\(error)")
    }

    /// Callback chamada ao clicar no botão de cancelar/fechar.
    func handleCaptureCanceled() {
        debugPrint("handleCaptureCanceled")
        faceCaptcha = nil
    }
}

// MARK: - DocumentscopyDelegate

extension ViewController: DocumentscopyDelegate {

    func handleDocumentscopyError(error: DocumentscopyError) {
        debugPrint("handleDocumentscopyError: \(error)")
        dismiss(animated: true) {
            self.showAlert(title: "Erro",
                           message: "\(error)")
        }
    }

    func handleDocumentscopyCompleted() {
        debugPrint("handleDocumentscopyCompleted")
        dismiss(animated: true) {
            self.showAlert(title: "Sucesso",
                           message: "Documentoscopia concluída")
        }
    }

    func handleDocumentscopyCanceled() {
        debugPrint("handleDocumentscopyCanceled")
        dismiss(animated: true, completion: nil)
    }
}
