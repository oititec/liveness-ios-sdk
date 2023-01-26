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
    private let appKey = "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJjZXJ0aWZhY2UiLCJ1c2VyIjoiRkQxRjBENUUwOEMxMUVDRTg3OTg0NTJGNUU1Q0M2OTkyfG9pdGkuZmFjZXRlYy5obWwiLCJlbXBDb2QiOiIwMDAwMDAwMDAxIiwiZmlsQ29kIjoiMDAwMDAwMjc2OSIsImNwZiI6Ijc4NjUyMTg2NzIzIiwibm9tZSI6IkNEMEU2RDg2Mzk0QzZERDY3MUY4RUY1M0E5ODM1Qzc5RkI2QkU3MUI2RjE1Mzc1QzQ5Q0YzMERDQTUwQzk4MTkyMzMxRjgyOTIzRjhFNUJDMUFDMjQxNDQxNzlENTE2QzZCOTA3MjFGRkFFOEE3RDRBOEZBQ0RDOUZDNDc0RUQ4Njg4MDR8QUxFU1NBTkRSTyBGQVJJQSIsIm5hc2NpbWVudG8iOiIyNy8wNS8xOTcyIiwiZWFzeS1pbmRleCI6IkFBQUFFaTlmUWFUUHdTNlIyWnJiTzJzL0FLNGlvOEFTVjlUbWw0ZTZxblQxd3UvQ20yWEVuN1A5TVphQmFRPT0iLCJrZXkiOiJRMjl1YzJsa1pYSWdjM0JsWVd0cGJtY2diV1VnY0hKdmMzQmxZM1FnZDJoaGRHVT0iLCJleHAiOjE2NzQ3NzAzNDAsImlhdCI6MTY3NDc3MDA0MH0.l-lb8SuRFLrNBzf3xu9RObagSMIMYwLEXbAdo_S5p9g"
    
    /// Trata de clique no botão para abrir o FaceCaptcha usando view padrão
    @IBAction private func defaultLiveness3D() {
        presentLiveness3D()
    }
    
    /// Trata de clique no botão para abrir o FaceCaptcha usando imagem customizada
    @IBAction private func customLiveness3D() {
        presentLiveness3D(theme: createLiveness3DCustomTheme(), customPersmissionView: PermissionView(), customInstructionView: InstructionView())
    }
    
    private func presentLiveness3D(
        theme: Liveness3DTheme? = nil,
        customPersmissionView: CustomCameraPermissionView? = nil,
        customInstructionView: CustomInstructionView? = nil
    ) {
            
        let liveness3DUser = Liveness3DUser(
            appKey: appKey, environment: .HML,
            defaultTheme: theme, lowLightTheme: theme
        )
        let controller = Liveness3DViewController(
            endpoint: baseURL,
            liveness3DUser: liveness3DUser,
            debugOn: true,
            customInstructionView: customInstructionView,
            customPermissionView: customPersmissionView
        )
        controller.delegate = self
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
    }
    
    /// Trata de clique no botão para abrir o FaceCaptcha usando view padrão
    @IBAction private func defaultFaceCaptcha() {
        presentFaceCaptcha()
    }
    
    /// Trata de clique no botão para abrir o FaceCaptcha usando imagem customizada
    @IBAction private func customFaceCaptchaImage() {
        let cameraOverlay = UIImage(named: "custom_overlay")
        presentFaceCaptcha(cameraOverlay: cameraOverlay)
    }
    
    /// Trata de clique no botão para abrir o FaceCaptcha usando view customizada
    @IBAction private func customFaceCaptcha() {
        let customView = FaceCaptchaCustomView(frame: view.bounds)
        presentFaceCaptcha(customView: customView)
    }
    
    private func presentFaceCaptcha(
        cameraOverlay: UIImage? = nil,
        customView: FaceCaptchaView? = nil
    ) {
        let controller = FaceCaptchaViewController(
            appKey: appKey, baseURL: baseURL,
            delegate: self, cameraOverlay: cameraOverlay,
            customView: customView
        )
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
    }
    
    /// Trata de clique no botão para abrir Documentoscopia usando view padrão
    @IBAction func defaultDocumentscopy() {
        presentDocumentscopy()
    }
    
    /// Trata de clique no botão para abrir Documentoscopia usando view customizada
    @IBAction private func customDocumentscopy() {
        presentDocumentscopy(
            customInstructionView: DocInstruction(),
            customView: nil,
            customCameraPermissionView: PermissionView(),
            customLoadingView: DocLoading(),
            customResultView: DocResult()
        )
    }
    
    private func presentDocumentscopy(
        customInstructionView: DocumentscopyCustomInstructionView? = nil,
        customView: DocumentscopyCustomView? = nil,
        customCameraPermissionView: DocumentscopyCustomCameraPermissionView? = nil,
        customLoadingView: DocumentscopyCustomLoadingView? = nil,
        customResultView: DocumentscopyCustomResultView? = nil
        
    ) {
        
        let controller = DocumentscopyViewController(
            appKey: appKey, baseURL: baseURL,
            delegate: self,
            customInstructionView: customInstructionView,
            customView: customView,
            customCameraPermissionView: customCameraPermissionView,
            customLoadingView: customLoadingView,
            customResultView: customResultView
        )
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true)
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

// MARK: - Liveness3DDelegate

extension ViewController: Liveness3DDelegate {
    func handleLiveness3DValidation(validateModel: FaceCaptcha.Liveness3DSuccess) {
        debugPrint("handleCaptureValidation: \(validateModel)")
        let message = String("Válido: \(validateModel.valid ?? false)")
            .appending("\nCausa: \(String(describing: validateModel.cause))")
            .appending("\nCodID: \(String(describing: validateModel.codID))")
            .appending("\nProtocolo: \(String(describing: validateModel.protocolo))")
        
        showAlert(title: "Liveness 3D Concluído", message: message)
    }
    
    func handleLiveness3DError(error: FaceCaptcha.Liveness3DError) {
        debugPrint("handleCaptureValidation: \(error)")
        showAlert(
            title: "Liveness 3D Falhou",
            message: "Code: \(error.errorCode)\nMessage:\(error.errorMessage)"
        )
    }
}

// MARK: - FaceCaptchaDelegate

extension ViewController: FaceCaptchaDelegate {
    
    /// Callback chamada em caso de desafio concluído.
    /// - Parameter validateModel: Modelo para verificação se prova de vida obteve sucesso
    func handleFaceCaptchaValidation(validateModel: FCValidCaptchaModel) {
        debugPrint("handleCaptureValidation: \(validateModel)")
        dismiss(animated: true) {
            self.showAlert(
                title: "FaceCaptcha Concluído",
                message: "Válido: \(validateModel.valid ?? false)\nMotivo: \(validateModel.cause ?? "")"
            )
        }
    }
    
    /// Callback chamada em caso de erro durante execução do FaceCaptcha.
    /// - Parameters:
    ///   - error: Erro ocorrido
    func handleFaceCaptchaError(error: FaceCaptchaError) {
        debugPrint("handleCaptureVideoError: \(error)")
        dismiss(animated: true) {
            self.showAlert(title: "FaceCaptcha Falhou", message: "Erro: \(error)")
        }
    }
    
    /// Callback chamada ao clicar no botão de cancelar/fechar.
    func handleFaceCaptchaCanceled() {
        debugPrint("handleCaptureCanceled")
        dismiss(animated: true) {
            self.showAlert(
                title: "FaceCaptcha Cancelado",
                message: "FaceCaptcha foi cancelado"
            )
        }
    }
}

// MARK: - DocumentscopyDelegate

extension ViewController: DocumentscopyDelegate {
    
    /// Callback chamada em caso de Documentoscopia concluída..
    func handleDocumentscopyCompleted() {
        debugPrint("handleDocumentscopyCompleted")
        dismiss(animated: true) {
            self.showAlert(
                title: "Documentoscopia Concluída",
                message: "Documentoscopia foi concluída"
            )
        }
    }
    
    /// Callback chamada em caso de erro durante execução da Documentoscopia.
    /// - Parameters:
    ///   - error: Erro ocorrido
    func handleDocumentscopyError(error: DocumentscopyError) {
        debugPrint("handleDocumentscopyError: \(error)")
        dismiss(animated: true) {
            self.showAlert(title: "Documentoscopia Falhou", message: "Erro: \(error)")
        }
    }
    
    /// Callback chamada ao clicar no botão de cancelar/fechar.
    func handleDocumentscopyCanceled() {
        debugPrint("handleDocumentscopyCanceled")
        dismiss(animated: true) {
            self.showAlert(
                title: "Documentoscopia Cancelada",
                message: "Documentoscopia foi cancelada"
            )
        }
    }
}
