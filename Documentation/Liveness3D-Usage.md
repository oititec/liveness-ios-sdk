#  Guia de Uso e Integração do Liveness 3D 

> Versão Beta. 


###  Iniciando o Liveness 3D

**PASSO 1.** Crie um objeto do tipo `Liveness3DUser`, passando uma appKey (recebida previamente). Deve diferir para cada vez que for apresentar o Liveness.

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

**PASSO 2.**  Crie uma instância para a classe `Liveness3DViewController`, com os seguintes parâmetros:

 - *endpoint*: String: URL apontando para o ambiente desejado;
 - *liveness3DUser*: Liveness3DUser: objeto do tipo `Liveness3DUser`, criado no passo anterior;
 - *debugOn*: Bool: booleano para ajudar a depurar. Faz com que mensagens de log sejam exibidas na tela através de `Toasts`.


```swift
    Liveness3DViewController( 
        endpoint: baseURL, 
        liveness3DUser: Liveness3DUser(appKey: appKey), 
        debugOn: true )
```


**PASSO 3.** Definir o `Delegate`:

```swift
liveness3DViewController.delegate = self
```


> Nota: o objeto `liveness3DViewController` é o mesmo criado no passo 2.

**PASSO 4.** Implementar o `Liveness3DDelegate` na sua View Controller.
 Os métodos são:
 - *handleLiveness3DValidation*: método chamado no delegate após efetuada a validação da prova de vida;
 - *handleLiveness3DError*: método chamado no delegate caso o SDK do Liveness3D encontre algum erro de comunicação com o backend ou na validação da prova de vida;
 - *handleLiveness3DCanceled*: método chamado no delegate caso o usuário cancele o fluxo de validação da prova de vida.
 
 ```swift
public protocol Liveness3DDelegate: AnyObject {
    func handleLiveness3DValidation(validateModel: LNValidLivenessModel) 
    func handleLiveness3DError(error: Liveness3DError) 
    func handleLiveness3DCanceled() 
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

private let baseURL = "URL_BASE"
private let appKey = "APP-KEY"

@IBAction private func livenes3DOpenPressed() {
    //Step 01
    let liveness3DUser = Liveness3DUser(appKey: appKey)
    
    //Step 02
    let liveness3DViewController = Liveness3DViewController(
                                    endpoint: baseURL,
                                    liveness3DUser: liveness3DUser ,
                                    debugOn: true)
   
    //Step 03
    liveness3DViewController.delegate = self
    
    //Step 05
    
    liveness3DViewController.modalPresentationStyle = .fullScreen
    present(liveness3DViewController, animated: true)
    }
}
```



```swift
    //Step 04
extension ViewController: Liveness3DDelegate {
func handleLiveness3DValidation(validateModel: Liveness3DSuccess) {
      //YOUR CODE
}
    
func handleLiveness3DError(error: Liveness3DError) {
    //YOUR CODE
}
    
func handleLiveness3DCanceled() {
    //YOUR CODE
}
}
```


###  Customização

Além de poder usar o SDK em sua forma padrão de exibição, são fornecidas duas formas de customização.

####  Componentes e propriedades customizáveis 

**1. Customização de tela de desafios:**

```swift
    Liveness3DViewController( 
        endpoint: baseURL, 
        liveness3DUser: Liveness3DUser(appKey: appKey, liveness3DTheme: theme), 
        debugOn: true )
```

**2. Customização completa:**

```swift
    Liveness3DViewController( 
        endpoint: baseURL, 
        liveness3DUser: Liveness3DUser(appKey: appKey, liveness3DTheme: theme),
        customInstructionView: instructionView, 
        customPermissionView: permissionView, 
        debugOn: true )
```

Os dois últimos parâmetros *(customInstructionView; customPermissionView)* permitem o envio de telas customizáveis, porém exigem os componentes obrigatórios abaixo:

|Tela|Componentes|id|Descrição|
|------|--|-----------|---------|
|Instruction_Screen|UIButton|backButton|Botão de retornar à tela anterior.|
|Instruction_Screen|UIButton|continueButton|Avançar para a próxima etapa.|
|Permission_Screen|UIButton|backButton|Botão de retornar à tela anterior.|
|Permission_Screen|UIButton|continueButton|Solicitar permissões de câmera ao usuário.|


Detalhes de como customizar os elementos dos desafios são encontrados [neste link](Liveness3D-CustomView.md).



###  Tratando o retorno

**Receber Resultado Liveness** 

Para receber resultado Liveness3D deve-se setar o atributo delegate da instância do `Liveness3DViewController`. Depois é necessário implementar o delegate `Liveness3DDelegate` na ViewController.

```swift
liveness3DViewController.delegate = self
```

```swift
    
extension ViewController: Liveness3DDelegate {
func handleLiveness3DValidation(validateModel: Liveness3DSuccess) {
      //YOUR CODE
}
    
func handleLiveness3DError(error: Liveness3DError) {
    //YOUR CODE
}
    
func handleLiveness3DCanceled() {
    //YOUR CODE
}
}
```

>⚠️ Para mais detalhes dos tipos de retorno, [clique aqui](https://certifaceid.readme.io/docs/integra%C3%A7%C3%A3o-atualizada#42-3d-liveness).



**Tratar Desafio Concluído**

Para tratar o caso de desafio concluído implemente o exemplo abaixo:

```swift
    
extension ViewController: Liveness3DDelegate {
func handleLiveness3DValidation(validateModel: Liveness3DSuccess) {
      //YOUR CODE
}
...
}
```

O objeto `Liveness3DSuccess` deve ter a mesma estrutura do Response encontrado [aqui](https://certifaceid.readme.io/docs/integra%C3%A7%C3%A3o-atualizada#42-3d-liveness)




**Tratar Caso de Erro** 


Para tratar o caso de erro, o método `handleLiveness3DError` deve receber um objeto `error`, onde os atributos abaixo podem ser avaliados:

- *errorCode*: Enum do tipo `Liveness3DErrorCode`, que indica qual erro ocorreu.
- *errorMessage*: String que contém uma mensagem explicativa sobre o erro.



```swift
extension ViewController: Liveness3DDelegate {
...    
func handleLiveness3DError(error: Liveness3DError) {
    //YOUR CODE
}
...
}
```

`Liveness3DErrorCode` pode assumir os seguintes valores:

```swift
public enum Liveness3DErrorCode: String {

// Parâmetros inválidos
  case INVALID_BUNDLE_PARAMS = "INVALID_BUNDLE_PARAMS"

// App Key inválido.
   case INVALID_APP_KEY = "INVALID_APP_KEY"

// Aparelho não possui câmera frontal
   case NO_FRONT_CAMERA = "NO_FRONT_CAMERA"

// Não foi concedida permissão de acesso à câmera do aparelho.
   case NO_CAMERA_PERMISSION = "NO_CAMERA_PERMISSION"

// Sem conexão à Internet.
   case NO_INTERNET_CONNECTION = "NO_INTERNET_CONNECTION"

// Erro na requisição.
   case REQUEST_ERROR = "REQUEST_ERROR"

// VIEW fornecida para a view customizada é inválida
   case INVALID_CUSTOM_FRAGMENT_INSTRUCTION_SCREEN = "INVALID_CUSTOM_FRAGMENT_INSTRUCTION_SCREEN"
   case INVALID_CUSTOM_FRAGMENT_PERMISSION_SCREEN = "INVALID_CUSTOM_FRAGMENT_PERMISSION_SCREEN"
}
```

**Tratar Desafio Cancelado pelo Usuário**

Sempre que houver desistência da operação da Prova de Vida, o delegate deve chamar o método `handleLiveness3DCanceled` para avisar que o fluxo não foi concluído devido o cancelamento efetuado pelo usuário.

```swift
extension ViewController: Liveness3DDelegate {
...    
func handleLiveness3DCanceled() {
    //YOUR CODE
}
}
```
