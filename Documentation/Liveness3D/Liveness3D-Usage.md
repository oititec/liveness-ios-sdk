#  Guia de Uso e Integração

##  Iniciando o Liveness 3D

**PASSO 1.** Crie um objeto do tipo `Liveness3DUser`, passando uma appKey (recebida previamente). Deve diferir para cada vez que for apresentar o Liveness.
> Os parâmetros `defaultTheme`, `lowLightTheme` e `texts` são opcionais e estão relacionados a customização.

```swift
public struct Liveness3DUser {
    var appKey: String
    let environment: Environment3D
    let defaultTheme: Liveness3DTheme?
    let lowLightTheme: Liveness3DTheme?
    let texts: [String: String]?
}

public enum Environment3D { 
    case HML 
    case PRD 
}
```

Detalhes de como customizar o Liveness3DTheme são encontrados [neste link](Liveness3D-Liveness3DTheme.md).

**PASSO 2.**  Crie uma instância para a classe `Liveness3DViewController`, com os parâmetro de *endpoint*,*liveness3DUser* e *debugOn*.

```swift
let liveness3DViewController = Liveness3DViewController(
    endpoint: "", 
    liveness3DUser: Liveness3DUser(
        appKey: appKey,
        environment: .HML
    ),
    debugOn: true,
)
```

**PASSO 3.** Definir o `Delegate`:

```swift
liveness3DViewController.delegate = self
```

> Nota: o objeto `liveness3DViewController` é o mesmo criado no passo 2.

**PASSO 4.** Implementar o `Liveness3DDelegate` na sua View Controller.
 Os métodos são:
 - **handleLiveness3DValidation(validateModel:)**: método chamado no delegate após efetuada a validação da prova de vida;
 - **handleLiveness3DError(error:)**: método chamado no delegate caso o SDK do Liveness3D encontre algum erro de comunicação com o backend ou na validação da prova de vida;
 
 ```swift
public protocol Liveness3DDelegate: AnyObject {
    func handleLiveness3DValidation(validateModel: Liveness3DSuccess)    
    func handleLiveness3DError(error: Liveness3DError)
}
``` 

**PASSO 5.** Apresentar a View Controller do Liveness3D como modal.

```swift
liveness3DViewController.modalPresentationStyle = .fullScreen 
present(liveness3DViewController, animated: true)
```

> Nota: o objeto `liveness3DViewController` é o mesmo criado no passo 2.

#### Exemplo de código completo:

```swift
class ViewController: UIViewController {
    let appKey = "APP-KEY"

    func livenes3DOpenPressed() {
        // Passo 01
        let liveness3DUser = Liveness3DUser(
            appKey: appKey, 
            environment: .PRD
        )
        
        // Passo 02
        let liveness3DViewController = Liveness3DViewController(
            endpoint: "",
            liveness3DUser: liveness3DUser,
            debugOn: false
        )
    
        // Passo 03
        liveness3DViewController.delegate = self
        
        // Passo 05
        liveness3DViewController.modalPresentationStyle = .fullScreen
        present(liveness3DViewController, animated: true)
    }
}
```

```swift
// Passo 04
extension ViewController: Liveness3DDelegate {
    func handleLiveness3DValidation(validateModel: Liveness3DSuccess) {
        // Seu código ...
    }
        
    func handleLiveness3DError(error: Liveness3DError) {
        // Seu código ...
    }
}
```

##  Tratando os métodos de retorno

### Desafio Concluído

O método `handleLiveness3DValidation(validateModel:)` assegura que o desafio de prova de vida foi concluído sem erros e o objeto do `Liveness3DSuccess` indica o resultado da validação biométrica.

```swift
public struct Liveness3DSuccess {
    public var valid: Bool?
    public var codID: Double?
    public var cause: String?
    public var protocolo: String?
    public var scanResultBlob: String?
}
```

>⚠️ Para mais detalhes sobre as propriedades no objeto de retorno, [clique aqui](https://certifaceid.readme.io/docs/integra%C3%A7%C3%A3o-atualizada#42-3d-liveness).

<br/>

### Erro

Para tratar o caso de erro, o método `handleLiveness3DError(error:)` deve recebe um objeto do tipo `Liveness3DError`, onde os atributos abaixo podem ser avaliados:

- **errorCode**: *enum* do tipo `Liveness3DErrorCode`, que indica o erro capturado.
- **errorMessage**: texto que contém uma mensagem explicativa sobre o erro.

```swift
public struct Liveness3DError {
    public let errorCode: Liveness3DErrorCode
    public let errorMessage: String
}

public enum Liveness3DErrorCode: String {    
    case INVALID_APP_KEY = "App Key inválido."
    case NO_CAMERA_PERMISSION = "Não foi concedida permissão de acesso à câmera do aparelho."
    case NO_INTERNET_CONNECTION = "Sem conexão à Internet."
    case LIVENESS_NOT_COMPLETED = "Prova de vida não foi completada."
    case LIVENESS_NOT_INITIALIZED = "Liveness não foi inicializado corretamente."
}
```