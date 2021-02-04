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

    /// Trata de clique no botão para abrir o FaceCaptcha
    /// - Parameter sender: Origem do clique
    @IBAction func openFaceCaptchaPressed(_ sender: Any) {

        let fcvarUrlbase = "https://comercial.certiface.com.br:8443/"

        let appKey = "eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJjZXJ0aWZhY2UiLCJ1c2VyIjoiRDRBNkNFQjlENzA0RkQwQUJDNzdEMUY0RTVEOTBDMENDQjJDfGZlbGlwZS5tb2JpbGUiLCJlbXBDb2QiOiIwMDAwMDAwMDAxIiwiZmlsQ29kIjoiMDAwMDAwMjU3OCIsImNwZiI6IjM4MDc1NjUwODY3Iiwibm9tZSI6IjRGQTM1OEMwOTAzRDhDMTU4MURFRjdCRTA5ODlFRDZGNjc5NkJGNjk5NTVGMkYxRTUyRDMzRkZDOEZEOTlBQzQxMjcyQURFMEJGRjVFQTJBRTcwM0NERkUwRTc3OEUyMTAwQ0NCMjQyODMyMzc0M0Q2MjdGNDQ4QzVFRkY5ODVFNkNEMUQwMDJBfEZFTElQRSBTSUxWQSIsIm5hc2NpbWVudG8iOiIwNS8wNS8xOTkwIiwiZWFzeS1pbmRleCI6IkFBQUFFdGM5Sy9vUy9sbHZxQm5SdHdqTnNhemtSVjc5OHBGQ005TGpTU2hCN1d4dEp4eURJbkZvUVdMa01nPT0iLCJrZXkiOiJRV0pzWlNCaGJpQm9iM0JsSUc5bUlHSnZaSGt1SUVGdWVTQnVZWGtnYzJoNWJtVT0iLCJleHAiOjE2MTI0NTc3OTIsImlhdCI6MTYxMjQ1NzQ5Mn0.afDm5M55RXy7vbvstG4tj9mW5YpVOO4eEd5Vi6-tG_I"

        let faceUserModel = FCUserModel("", "", "", "", "", UIImage(named: "overlay"))

        faceCaptcha = FCCameraCapture(model: faceUserModel,
                                      appkey: appKey,
                                      fcvarUrlbase: fcvarUrlbase,
                                      viewController: self,
                                      delegate: self,
                                      showSetupErrors: false)
        faceCaptcha?.show()
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
    func handleCaptureValidation(_ validateModel: FCValidCaptchaModel) {
        debugPrint("handleCaptureValidation: \(validateModel)")
        faceCaptcha = nil
        showAlert(title: "Desafio concluído",
                  message: "Válido: \(validateModel.valid ?? false)\nMotivo: \(validateModel.cause ?? "")")
    }

    /// Callback chamada em caso de erro durante execução do FaceCaptcha.
    /// - Parameters:
    ///   - error: Erro ocorrido
    ///   - imageBase64: imagem capturada
    func handleCaptureVideoError(_ error: FaceCaptchaError, imageBase64: String?) {
        debugPrint("handleCaptureVideoError: \(error)")
        faceCaptcha = nil
        showAlert(title: "Erro",
                  message: "\(error)")
    }
}
