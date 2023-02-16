# Liveness - Prova de Vida

Guia de uso e integração do Liveness para iOS.

### Iniciando o FaceCaptcha

1. Importe o FaceCaptcha no controller onde irá usá-lo:
```swift
import FaceCaptcha
```

2. Instancie `FaceCaptchaViewController`, passando os seguintes parâmetros:
- *appKey*: App Key recebida previamente.
- *baseURL*: URL apontando para o ambiente desejado.
- *delegate*: delegate que implementará os métodos para tratar o retorno do FaceCaptcha.
```swift
let controller = FaceCaptchaViewController(appKey: appKey,
                                           baseURL: baseURL,
                                           delegate: self)
```

3. Apresente o controller instanciado:
```swift
controller.modalPresentationStyle = .fullScreen
present(controller, animated: true, completion: nil)
```

### Customização

Além de poder usar o SDK em sua forma padrão de exibição, são fornecidas duas formas de customização:

1. Imagem de fundo customizada:
Para exibir uma imagem de fundo (overlay da câmera) customizada, basta passar a imagem desejada para o construtor do `FaceCaptchaViewController`, através do parâmetro `cameraOverlay`. Exemplo:
```swift
let controller = FaceCaptchaViewController(appKey: appKey,
                                           baseURL: baseURL,
                                           delegate: self,
                                           cameraOverlay: UIImage(named: "custom_overlay")
```

2. Visual completamente customizado:
É possível configurar completamente o visual exibido pelo FaceCaptcha. Para isso, é necessário criar uma UIView que implemente o protocolo `FaceCaptchaView`, e passá-la para o construtor do `FaceCaptchaViewController` através do parâmetro `customView`. Exemplo:
```swift
// MyCustomView must implement FaceCaptchaView
let customView: FaceCaptchaView = MyCustomView(frame: view.bounds)
let controller = FaceCaptchaViewController(appKey: appKey,
                                           baseURL: baseURL,
                                           delegate: self,
                                           customView: customView)
```
Detalhes de como implementar a view customizada são encontrados [neste link](FaceCaptcha-CustomView.md).


### Tratando o retorno

1. Implemente o protocolo `FaceCaptchaDelegate` para ser notificado sobre a conclusão da prova de vida:
```swift
public protocol FaceCaptchaDelegate: class {
    func handleFaceCaptchaValidation(validateModel: FCValidCaptchaModel)
    func handleFaceCaptchaError(error: FaceCaptchaError)
    func handleFaceCaptchaCanceled()
}
```

Este protocolo contém dois métodos:

- *handleFaceCaptchaValidation*: recebe um objeto do tipo `FCValidCaptchaModel`, no qual é possível verificar se a prova de vida foi válida, e, caso não tenha sido, o motivo pelo qual falhou.
- *handleFaceCaptchaError*: recebe um enum do tipo `FaceCaptchaError`, que indica o erro ocorrido.
- *handleFaceCaptchaCanceled*: método chamado se o usuário clicar no botão fechar/cancelar.

**Importante:** em todos os métodos, deve-se fazer o dismiss do controller:
```swift
dismiss(animated: true, completion: nil)
```

`FaceCaptchaError` pode assumir os seguintes valores:
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
    /// Erro inesperado em algum request
    case requestError
    /// Falha em configurar câmera
    case errorCameraSetup
    /// Erro ao capturar foto
    case errorCapturePicture
}
```
