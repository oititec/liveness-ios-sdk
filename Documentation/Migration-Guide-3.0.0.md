# FaceCaptcha 3.0.0 - Guia de migração

#### Guia de migração para a versão 3.0.0 da SDK FaceCaptcha iOS.

1. A permissão de microfone agora pode ser removida (caso seu aplicativo não a utilize para nenhuma outra função).

2. A classe `FCCameraCapture` não existe mais. Deve-se usar o controller `FaceCaptchaViewController` em seu lugar. Para mais informações sobre como usá-lo, acesse [este link.](FaceCaptcha-Usage.md)

3. O protocolo `FCCameraCaptureDelegate` agora se chama `FaceCaptchaDelegate`.

4. A assinatura dos métodos do `FaceCaptchaDelegate` (antigo `FCCameraCaptureDelegate`) mudaram para:
```swift
public protocol FaceCaptchaDelegate: class {
    func handleFaceCaptchaValidation(validateModel: FCValidCaptchaModel)
    func handleFaceCaptchaError(error: FaceCaptchaError)
    func handleFaceCaptchaCanceled()
}
```
5. O protocolo `FCView` (para as views customizadas) agora se chama `FaceCaptchaView`.

6. A view customizada agora necessita obrigatoriamente da subview `cameraContainer`, que deve ser do tipo `CameraPreviewView` (esta classe faz parte do SDK do FaceCaptcha). Para mais detalhes, acesse [este link.](CustomView.md)
