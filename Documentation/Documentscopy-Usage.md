# Documentoscopia

Guia de uso e integração da Documentoscopia para iOS.

### Iniciando a Documentoscopia

1. Importe o FaceCaptcha no controller onde irá usá-lo:
```swift
import FaceCaptcha
```

2. Instancie `DocumentscopyViewController`, passando os seguintes parâmetros:
- *appKey*: App Key recebida previamente.
- *baseURL*: URL apontando para o ambiente desejado.
- *documentscopyDelegate*: delegate que implementará os métodos para tratar o retorno da documentoscopia.
```swift
let controller = DocumentscopyViewController(appKey: appKey, baseURL: baseURL, documentscopyDelegate: self)
```

3. Apresente o controller instanciado:
```swift
controller.modalPresentationStyle = .fullScreen
present(controller, animated: true, completion: nil)
```

### Tratando o retorno

1. Implemente o protocolo `DocumentscopyDelegate` para ser notificado sobre a conclusão da documentoscopia:
```swift
public protocol DocumentscopyDelegate: class {
    func handleDocumentscopyError(error: DocumentscopyError)
    func handleDocumentscopyCompleted()
    func handleDocumentscopyCanceled()
}
```

Este protocolo contém três métodos:

- *handleDocumentscopyError*: método chamado em caso de falha, recebe um enum do tipo `DocumentscopyError`, que indica o erro ocorrido.
- *handleDocumentscopyCompleted*: método chamado em caso de envio de documento concluído com sucesso.
- *handleDocumentscopyCanceled*: método chamado se o usuário clicar no botão fechar/cancelar.

**Importante:** em todos os métodos, deve-se fazer o dismiss do controller:
```swift
dismiss(animated: true, completion: nil)
```

`DocumentscopyError` pode assumir os seguintes valores:
```swift
public enum DocumentscopyError {

    /// App Key inválido.
    case invalidAppKey
    /// Certiface offline.
    case certifaceOff
    /// Problema ao configurar a câmera
    case cameraSetupFailed
    /// Não foi concedida permissão de acesso à câmera do aparelho.
    case noCameraPermission
    /// Erro ao capturar foto
    case errorCapturePicture
    /// Sem conexão à Internet.
    case noInternetConnection
    /// Erro na requisição de validação dos desafios.
    case validationError
    /// App foi minimizado durante o uso do FaceCaptcha, isso faz com que o desafio seja encerrado.
}
```
