# FaceCaptcha 2.0.0 - Guia de migração

#### Guia de migração para a versão 2.0.0 da SDK FaceCaptcha iOS.

1. Agora é possível implementar sua própria view customizada para ser exibida pelo FaceCaptcha. Para isto, consulte [este guia.](CustomView.md)

2. O construtor da classe `FCCameraCapture` agora possui a seguinte assinatura:
```swift
public init(appKey: String,
            baseURL: String,
            viewController: UIViewController,
            delegate: FCCameraCaptureDelegate,
            showSetupErrors: Bool = false,
            cameraOverlay: UIImage? = nil,
            customView: FCView? = nil)
```
O formato anterior foi marcado como descontinuado, porém continua funcionando normalmente.

3. A assinatura dos métodos do `FCCameraCaptureDelegate` mudaram para:
```swift
public protocol FCCameraCaptureDelegate: class {
    func handleCaptureValidation(validateModel: FCValidCaptchaModel)
    func handleCaptureVideoError(error: FaceCaptchaError, imageBase64: String?)
    func handleCaptureCanceled()
}
```
Isso resultou na inclusão do método `handleCaptureCanceled`, chamado quando o usuário clica no botão fechar/cancelar. A única ação necessária em relação ao Liveness a ser tomada neste método é a atribuição do faceCaptcha para nil, da mesma forma que já era feito nos outros métodos do protocolo.
