//
//  ViewController.swift
//  SampleFaceCaptcha
//
//  Created by Felipe Augusto on 27/10/20.
//

import UIKit
import FaceCaptcha

class ViewController: UIViewController {

    @IBAction func openFaceCaptchaPressed(_ sender: Any) {

        let fcvarUrlbase = "https://comercial.certiface.com.br:8443/"

        let appKey = ""

        /* Modelo USER para envio dos parametos enviando appKey */
        let faceUserModel = FCUserModel("", "", "", "", "", UIImage(named: "overlay"))

        /* Abrir a camera com o overlapoyview que definir */
        let faceCamera = FCCameraCapture(model: faceUserModel, appkey: "\(appKey)", fcvarUrlbase: "\(fcvarUrlbase)", viewController: self, delegate: self)
        faceCamera.show()
    }
}

// MARK: - FCCameraCaptureDelegate

extension ViewController: FCCameraCaptureDelegate {

    /// Callback se a API do certiface estiver indisponível ou app key inválido
    /// certiface indisponível error = certfaceoff
    /// appkey inválido error = appkeyinvalido
    /// - Parameters:
    ///   - error:
    ///   - imageBase64: uma unica imagem base64
    func handleCaptureVideoError(_ error: String, _ imageBase64: String) {
        debugPrint("ERROR: \(error)")
        debugPrint("BASE64: \(imageBase64)")
    }

    /// Callback do serviço quando termina de processar e separar os frames do video.
    ///
    /// - Parameters:
    ///   - fcCameraCapture: FCCameraCapture Object para efetuar a chamada do validate.
    ///   - fcImages: Frames do video para envio nos parametros necessários.
    func handleCaptureVideo(_ fcCameraCapture: FCCameraCapture, _ fcImages: [UIImage]) {

        /* Chamar o serviço de validação passando os frames de parametro */
        fcCameraCapture.validate(fcImages, { (fcValidateModel, error) in

            if let error = error {
                debugPrint("ERROR: \(error)")
            }

            guard let fcValidateModel = fcValidateModel else {
                debugPrint("ERROR: fcValidateModel not loaded")
                return
            }

            debugPrint("SUCCESS: \(fcValidateModel)")

            let alert = UIAlertController(title: "Resultado",
                                          message: "Válido: \(fcValidateModel.valid ?? false)\nMotivo: \(fcValidateModel.cause ?? "")",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        })
    }
}
