#  Guia de Uso e Integração do Liveness 3D 

> Documento em construção. Versão Beta. 


###  Iniciando o Liveness 3D

**PASSO 1.** Crie um objeto do tipo `Liveness3DUser`, passando uma appKey (recebida previamente). Deve diferir para cada vez que for apresentar o Liveness.

```swift
public struct Liveness3DUser { 
    let appKey: String 
    let environment: Environment3D = .HML 
    let liveness3DTheme: Liveness3DTheme? 
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
func handleLiveness3DValidation(validateModel: LNValidLivenessModel) {
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

####  Componentes e propriedades customizáveis 
**1. Customização de tela de desafios:**

**2. Customização completa:**

###  Tratando o retorno
**Receber Resultado Liveness** 
**Tratar Desafio Concluído**
**Tratar Caso de Erro** 

