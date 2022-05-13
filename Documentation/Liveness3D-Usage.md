#  Guia de Uso e Integração do Liveness 3D 

> Versão Beta. 


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

**PASSO 2.**  Instancie um Intent para a classe `Liveness3DActivity`, com os seguintes extras:

- *Liveness3DActivity.PARAM_ENDPOINT*: URL apontando para o ambiente desejado.
- *Liveness3DActivity.PARAM_LIVENESS3D_USER*: objeto do tipo `Liveness3DUser`, criado no passo anterior.
- *Liveness3DActivity.PARAM_DEBUG_ON (opcional)*: booleano para ajudar a depurar. Faz com que mensagens de log sejam exibidas na tela através de `Toasts`.

```kotlin
val intent = Intent(this, Liveness3DActivity::class.java).apply {
    putExtra(Liveness3DActivity.PARAM_ENDPOINT, ENDPOINT)
    putExtra(Liveness3DActivity.PARAM_LIVENESS3D_USER, liveness3DUser)
    putExtra(Liveness3DActivity.PARAM_DEBUG_ON, false) // Passar true para mostrar logs na tela
}
```

**PASSO 3.** Chame `startActivityForResult`:

```kotlin
startActivityForResult(intent, 3D_RESULT_REQUEST)
```
