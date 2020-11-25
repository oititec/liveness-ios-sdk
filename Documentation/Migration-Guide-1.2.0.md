# Liveness 1.2.0 - Guia de migração

#### Guia de migração para a versão 1.2.0 da SDK Liveness iOS.

1. Devido a algumas melhorias em relação ao gerenciamento de memória, agora é necessário manter uma referência para o objeto da classe `FCCameraCapture` no controller que o estiver usando.
Esta referência deve ser desalocada assim que algum dos métodos do protocolo `FCCameraCaptureDelegate` forem chamados.

2. O construtor da classe `FCCameraCapture` agora possui um novo parâmetro, `showSetupErrors`, com valor default de `false`. Caso valor seja passado como `true`, a biblioteca exibirá um `UIAlertController` ao ocorrer erro em algumas validações iniciais, como teste de conectividade, por exemplo.
Independente do valor deste parâmetro, o método de erro do delegate sempre será chamado.

3. A assinatura dos métodos do `FCCameraCaptureDelegate` mudaram para:
```swift
public protocol FCCameraCaptureDelegate: class {
    func handleCaptureValidation(_ validateModel: FCValidCaptchaModel)
    func handleCaptureVideoError(_ error: FaceCaptchaError, imageBase64: String?)
}
```
Isso resulta em duas importantes mudanças:

- O método `handleCaptureValidation` agora já recebe o resultado da validação dos desafios, não sendo mais necessária a chamada do método `validate`.
- O método `handleCaptureVideoError` agora recebe um `enum` do tipo `FaceCaptchaError`,  que pode conter os seguintes valores:
```swift
/// Erros que podem ser retornados pelo FaceCaptcha.
public enum FaceCaptchaError {
    /// App Key inválido.
    case invalidAppKey
    /// Certiface offline.
    case certifaceOff
    /// Não foi concedida permissão de acesso à câmera do aparelho.
    case noCameraPermission
    /// Sem conexão à Internet.
    case noInternetConnection
    /// Chamada telefônica em andamento. Não é possível iniciar o desafio durante uma chamada telefônica.
    case phoneCallInProgress
    /// Erro na requisição de validação dos desafios.
    case validationError
    /// App foi minimizado durante o uso do FaceCaptcha, isso faz com que o desafio seja encerrado.
    case challengeInterrupted
}
```
