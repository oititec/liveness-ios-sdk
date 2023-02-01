# Guia de Customização do Liveness3DTheme 

A customização do fluxo de prova de vida, dar-se por meio da utilização da `Liveness3DTheme`. Essa classe na sua construção recebe o template padrão, podendo ser DarkTheme ou LightTheme.<br>
Abaixo, estão mapeadas as propriedades para customização do `Liveness3DTheme`.

## Elementos comuns

### 1. Botão de cancelar
| **Atributo**                         | **Tipo**             | **Descrição**                                                              |
| :----------------------------------- | :------------------- | :------------------------------------------------------------------------- |
| cancelButtonCustomizationCustomImage | UIImage              | Cancela a operação e retorna para view anterior.                           |
| cancelButtonCustomizationLocation    | CancelButtonLocation | Enum que determina a posição do botão. Esquerda, deireita ou desabilitado. |

```swift
public enum CancelButtonLocation: Int {
    case topLeft = 0
    case topRight = 1
    case disabled = 2
}
```

### 2. Frame
| **Atributo**                      | **Tipo** | **Descrição**                                             |
| :-------------------------------- | :------- | :-------------------------------------------------------- |
| frameCustomizationBorderWidth     | Int32?   | Modifica a largura da borda do frame.                     |
| frameCustomizationCornerRadius    | Int32    | Modifica o tamanho do arredondamento das bordas do frame. |
| frameCustomizationBorderColor     | UIColor? | Modifica a cor da borda do frame.                         |
| frameCustomizationBackgroundColor | UIColor? | Modifica a cor de fundo do frame.                         |

### 3. Overlay
| **Atributo**                          | **Tipo** | **Descrição**                                                        |
| :------------------------------------ | :------- | :------------------------------------------------------------------- |
| overlayCustomizationBackgroundColor   | UIColor? | Modifica a cor de fundo da camada de overlay.                        |
| overlayCustomizationBrandingImage     | UIImage? | Adiciona uma imagem na camada de overlay.                            |
| overlayCustomizationShowBrandingImage | Bool     | Propriedade booleana que ativa a visualização da imagem customizada. |

### 4 .Feedback Bar
| **Atributo**                             | **Tipo**         | **Descrição**                                             |
| :--------------------------------------- | :--------------- | :-------------------------------------------------------- |
| feedbackCustomizationCornerRadius        | Int32?           | Modifica o tamanho do arredondamento das bordas da barra. |
| feedbackCustomizationBackgroundColor     | CAGradientLayer? | Modifica a cor de fundo da barra.                         |
| feedbackCustomizationTextColor           | UIColor?         | Modifica a cor do texto do feedback.                      |
| feedbackCustomizationTextFont            | UIFont?          | Adiciona uma fonte customizada para o texto do feedback.  |
| feedbackCustomizationEnablePulsatingText | Bool             | **não consegui validar**                                  |

### 5. Oval
| **Atributo**                          | **Tipo** | **Descrição**                                                  |
| :------------------------------------ | :------- | :------------------------------------------------------------- |
| ovarCustomizationStrokeWidth          | Int32?   | Modifica a largura da borda da camada oval                     |
| ovarCustomizationStrokeColor          | UIColor  | Modifica a cor da borda da camada oval                         |
| ovarCustomizationProgressStrokeWidth  | Int32?   | Modifica a largura da borda do progresso da camada oval        |
| ovarCustomizationProgressColor1       | UIColor  | Modifica a cor da borda de progresso da camada oval            |
| ovarCustomizationProgressColor2       | UIColor  | Modifica a cor da borda de progresso da camada oval            |
| ovarCustomizationProgressRadialOffset | Int32?   | Modifica o distânciamento da borda de progresso da camada oval |

### 6. Botões
| **Atributo**                                        | **Tipo** | **Descrição**                                                     |
| :-------------------------------------------------- | :------- | :---------------------------------------------------------------- |
| guidanceCustomizationButtonFont                     | UIFont?  | Adiciona uma fonte customizada para o texto do botão.             |
| guidanceCustomizationButtonTextNormalColor          | UIColor? | Modifica a cor do texto do botão na sua condição padrão.          |
| guidanceCustomizationButtonBackgroundNormalColor    | UIColor  | Modifica a cor de fundo do botão na sua condição padrão.          |
| guidanceCustomizationButtonTextHighlightColor       | UIColor? | Modifica a cor do texto do botão na sua condição de destaque.     |
| guidanceCustomizationButtonBackgroundHighlightColor | UIColor? | Modifica a cor de fundo do botão na sua condição de destaque.     |
| guidanceCustomizationButtonTextDisabledColor        | UIColor? | Modifica a cor do texto do botão na sua condição de desabilitado. |
| guidanceCustomizationButtonBackgroundDisabledColor  | UIColor  | Modifica a cor de fundo do botão na sua condição de desabilitado. |
| guidanceCustomizationButtonBorderColor              | UIColor? | Modifica a cor da borda do botão.                                 |
| guidanceCustomizationButtonBorderWidth              | Int32?   | Modifica a largura da borda do botão.                             |
| guidanceCustomizationButtonCornerRadius             | Int32?   | Modifica o tamanho do arredondamento das bordas do botão.         |

### 7. Frame Background
| **Atributo**                          | **Tipo**   | **Descrição**                                                                |
| :------------------------------------ | :--------- | :--------------------------------------------------------------------------- |
| guidanceCustomizationBackgroundColors | [UIColor]? | Modifica a cor de fundo e caso receba duas cores diferentes cria um degradê. |

### 8. Guidance
| **Atributo**                         | **Tipo** | **Descrição**                                             |
| :----------------------------------- | :------- | :-------------------------------------------------------- |
| guidanceCustomizationForegroundColor | UIColor? | Modifica a cor de fundo quando estiver em primeiro plano. |
| guidanceCustomizationHeaderFont      | UIFont?  | Adiciona uma fonte customizada para o header.             |
| guidanceCustomizationSubtextFont     | UIFont?  | Adiciona uma fonte customizada para o subtext.            |

<br/>
<div>
    <img src="Images/liveness3d_theme_common_1.png" width="432" height="396" />
    <img src="Images/liveness3d_theme_common_2.png" width="432" height="396" />
<div/>

---

## Tela de pronto para começar

### 1. Header
| **Atributo**                                           | **Tipo**            | **Descrição**                                 |
| :----------------------------------------------------- | :------------------ | :-------------------------------------------- |
| guidanceCustomizationReadyScreenHeaderFont             | UIFont?             | Adiciona uma fonte customizada para o header. |
| guidanceCustomizationReadyScreenHeaderTextColor        | UIColor?            | Modifica a cor da fonte do texto.             |
| guidanceCustomizationReadyScreenHeaderAttributedString | NSAttributedString? | Adiciona um texto para o header.              |

### 2. Subtext
| **Atributo**                                            | **Tipo**            | **Descrição**                                  |
| :------------------------------------------------------ | :------------------ | :--------------------------------------------- |
| guidanceCustomizationReadyScreenSubtextFont             | UIFont?             | Adiciona uma fonte customizada para o subtext. |
| guidanceCustomizationReadyScreenSubtextTextColor        | UIColor?            | Modifica a cor da fonte do texto.              |
| guidanceCustomizationReadyScreenSubtextAttributedString | NSAttributedString? | Adiciona um texto para o subtext.              |

### 3. Textos

> **_Observação:_**
> A propriedade abaixo só será aplicada em telas pequenas. 

| **Atributo**                                               | **Tipo** | **Descrição**                                    |
| :--------------------------------------------------------- | :------- | :----------------------------------------------- |
| guidanceCustomizationReadyScreenOvarFillColor              | UIColor? | **não consegui validar**                         |
| guidanceCustomizationReadyScreenTextBackgroundColor        | UIColor? | Modifica a cor de fundo.                         |
| guidanceCustomizationReadyScreenTextBackgroundCornerRadius | Int32?   | Modifica o tamanho do arredondamento das bordas. |

<br/>
<img src="Images/liveness3d_theme_ready_screen.png" width="432" height="396" />

---

## Tela de resultado

### 1. Activity
| **Atributo**                                                     | **Tipo**             | **Descrição**                                                                |
| :--------------------------------------------------------------- | :------------------- | :--------------------------------------------------------------------------- |
| resultScreenCustomizationForegroundColor                         | UIColor?             | Modifica a cor de fundo quando estiver em primeiro plano.                    |
| resultScreenCustomizationBackgroundColors                        | [UIColor]?           | Modifica a cor de fundo e caso receba duas cores diferentes cria um degradê. |
| resultScreenCustomizationActivityIndicatorColor                  | UIColor              | Modifica a cor do activity indicator.                                        |
| resultScreenCustomizationCustomActivityIndicatorImage            | UIImage?             | Adiciona uma imagem customizada para o activity indicator                    |
| resultScreenCustomizationCustomActivityIndicatorRotationIntervar | Int32                | **não consegui validar**                                                     |
| resultScreenCustomizationCustomActivityIndicatorAnimation        | Int                  | **não consegui validar**                                                     |
| resultAnimationStyle                                             | ResultAnimationStyle | **não consegui validar**                                                     |

```swift
public enum ResultAnimationStyle {
    case blob
    case spinner(SpinnerAnimationCustomization)
    case custom(CustomResultAnimationDelegate)
}

public struct SpinnerAnimationCustomization {
    let spinnerColor: UIColor
    let indicatorForegroundColor: UIColor
    let indicatorBackgroundColor: UIColor
}

public protocol CustomResultAnimationDelegate {
    func createActivityIndicatorView() -> UIView?
    func createSuccessAnimationView() -> UIView?
}
```

### 2. Barra de carregamento
| **Atributo**                                      | **Tipo** | **Descrição**                                                        |
| :------------------------------------------------ | :------- | :------------------------------------------------------------------- |
| resultScreenCustomizationShowUploadProgressBar    | Bool     | Propriedade booleana que ativa a visualização da barra de progresso. |
| resultScreenCustomizationUploadProgressFillColor  | UIColor  | Modifica a cor do preenchimento da barra de progresso.               |
| resultScreenCustomizationUploadProgressTrackColor | UIColor  | Modifica a cor da barra de progresso.                                |

### 3. Animação
| **Atributo**                                                     | **Tipo** | **Descrição**                                                                         |
| :--------------------------------------------------------------- | :------- | :------------------------------------------------------------------------------------ |
| resultScreenCustomizationAnimationRelativeScale                  | Float    | **não conssegui validar**                                                             |
| resultScreenCustomizationResultAnimationBackgroundColor          | UIColor  | Modifica a cor de fundo da imagem que aparece após a animação finalizar.              |
| resultScreenCustomizationResultAnimationForegroundColor          | UIColor  | Modifica a cor do icone que vai aparecer em primeiro plano após a animação finalizar. |
| resultScreenCustomizationResultAnimationSuccessBackgroundImage   | UIImage? | Adiciona uma imagem customizada após a animação finalizar com sucesso.                |
| resultScreenCustomizationResultAnimationUnSuccessBackgroundImage | Int      | Adiciona uma imagem customizada após a animação finalizar com erro.                   |
| resultScreenCustomizationCustomResultAnimationSuccess            | Int      | **não conssegui validar**                                                             |
| resultScreenCustomizationCustomResultAnimationUnSuccess          | Int      | **não conssegui validar**                                                             |
| resultScreenCustomizationCustomStaticResultAnimationSuccess      | Int      | **não conssegui validar**                                                             |
| resultScreenCustomizationCustomStaticResultAnimationUnSuccess    | Int      | **não conssegui validar**                                                             |

### 4. Mensagem de sucesso
| **Atributo**                         | **Tipo** | **Descrição**                                              |
| :----------------------------------- | :------- | :--------------------------------------------------------- |
| resultScreenCustomizationMessageFont | UIFont?  | Adiciona uma fonte customizada para a mensagem de sucesso. |
| resultScreenSuccessMessage           | String   | Adiciona uma mensagem customizada de sucesso.              |

<br/>
<div>
    <img src="Images/liveness3d_theme_result_screen_1.png" width="432" height="396" />
    <img src="Images/liveness3d_theme_result_screen_2.png" width="432" height="396" />
<div/>

---

## Tela de tente novamente

### 1. Header
| **Atributo**                                           | **Tipo**            | **Descrição**                                             |
| :----------------------------------------------------- | :------------------ | :-------------------------------------------------------- |
| guidanceCustomizationRetryScreenHeaderFont             | UIFont?             | Adiciona uma fonte customizada para a mensagem do header. |
| guidanceCustomizationRetryScreenHeaderTextColor        | UIColor?            | Modifica a cor da fonte do header.                        |
| guidanceCustomizationRetryScreenHeaderAttributedString | NSAttributedString? | Adiciona uma mensagem personalizada no header.            |

### 2. Customização do Subtext
| **Atributo**                                            | **Tipo**            | **Descrição**                                              |
| :------------------------------------------------------ | :------------------ | :--------------------------------------------------------- |
| guidanceCustomizationRetryScreenSubtextFont             | UIFont?             | Adiciona uma fonte customizada para a mensagem do subtext. |
| guidanceCustomizationRetryScreenSubtextTextColor        | UIColor?            | Modifica a cor da fonte do subtext                         |
| guidanceCustomizationRetryScreenSubtextAttributedString | NSAttributedString? | Adiciona uma mensagem personalizada no subtext             |

### 4. Imagem
| **Atributo**                                      | **Tipo** | **Descrição**                                                     |
| :------------------------------------------------ | :------- | :---------------------------------------------------------------- |
| guidanceCustomizationRetryScreenImageBorderColor  | UIColor  | Modifica a cor da borda do preview da imagem de retentativa.      |
| guidanceCustomizationRetryScreenImageBorderWidth  | Int32?   | Modifica a largura da borda do preview da imagem de retentativa.  |
| guidanceCustomizationRetryScreenImageCornerRadius | Int32?   | Modifica o tamanho do arredondamento das bordas.                  |
| guidanceCustomizationRetryScreenOvarStrokeColor   | UIColor? | Modifica a cor da borda do preview oval da imagem de retentativa. |

<br/>
<img src="Images/liveness3d_theme_retry_screen.png" width="432" height="396" />

-----
<br/>

| **Atributo**                                                     | **Tipo**           | **Valor Padrão**                                         | **Descrição**                                                                      |
| :--------------------------------------------------------------- | :----------------- | :------------------------------------------------------- | :--------------------------------------------------------------------------------- |
| guidanceCustomizationBackgroundColors                            | [UIColor]          | Dark: #000000<br>Light: #FFFFFF                          | Define a cor do background (cor do plano de fundo) do fluxo de Prova de vida       |
| guidanceCustomizationForegroundColor                             | UIColor            | Dark: #000000<br>Light: #FFFFFF                          | Define a cor do foreground (cor do primeiro plano)                                 |
| guidanceCustomizationHeaderFont                                  | UIFont             | Ubuntu-Bold                                              | Define a fonte do título da primeira tela do fluxo de prova de vida                |
| guidanceCustomizationSubtextFont                                 | UIFont             | Inter-Regular                                            | Define a fonte do subtítulo da primeira tela do fluxo de prova de vida             |
| guidanceCustomizationReadyScreenHeaderFont                       | UIFont             | Ubuntu-Bold                                              |                                                                                    |
| guidanceCustomizationReadyScreenHeaderTextColor                  | UIColor            |                                                          | Define a cor do título da primeira tela do fluxo de prova de vida                  |
| guidanceCustomizationReadyScreenHeaderAttributedString           | NSAttributedString | nil                                                      |                                                                                    |
| guidanceCustomizationReadyScreenSubtextFont                      | UIFont             | Inter-Regular                                            | Define a fonte do subtítulo da tela de início de captura do fluxo de prova de vida |
| guidanceCustomizationReadyScreenSubtextTextColor                 | UIColor            | Dark: #FFFFFF<br>Light: #000000                          | Define a cor subtítulo da tela de início de captura do fluxo de prova de vida      |
| guidanceCustomizationReadyScreenSubtextAttributedString          | NSAttributedString | nil                                                      |                                                                                    |
| guidanceCustomizationRetryScreenHeaderFont                       | UIFont             | Ubuntu-Bold                                              | Define a cor do foreground                                                         |
| guidanceCustomizationRetryScreenHeaderTextColor                  | UIColor            | Dark: #FFFFFF<br>Light: #1E1E1E                          | Define a cor do foreground                                                         |
| guidanceCustomizationRetryScreenHeaderAttributedString           | NSAttributedString | nil                                                      |                                                                                    |
| guidanceCustomizationRetryScreenSubtextFont                      | UIFont             | Inter-Regular                                            | Define a cor do foreground                                                         |
| guidanceCustomizationRetryScreenSubtextTextColor                 | UIColor            | Dark: #FFFFFF<br>Light: #666666                          | Define a cor do foreground                                                         |
| guidanceCustomizationRetryScreenSubtextAttributedString          | NSAttributedString | nil                                                      | Define a cor do foreground                                                         |
| guidanceCustomizationButtonFont                                  | UIFont             | Inter-Bold                                               | Define a cor do foreground                                                         |
| guidanceCustomizationButtonTextNormalColor                       | UIColor            | Dark: #000000<br>Light: #FFFFFF                          | Define a cor do foreground                                                         |
| guidanceCustomizationButtonBackgroundNormalColor                 | UIColor            | #05D758                                                  | Define a cor do foreground                                                         |
| guidanceCustomizationButtonTextHighlightColor                    | UIColor            | Dark: #FFFFFF<br>Light: #000000                          | Define a cor do foreground                                                         |
| guidanceCustomizationButtonBackgroundHighlightColor              | UIColor            | Dark: #000000<br>Light: #FFFFFF                          | Define a cor do foreground                                                         |
| guidanceCustomizationButtonTextDisabledColor                     | UIColor            | Dark: #000000<br>Light: #FFFFFF                          | Define a cor do foreground                                                         |
| guidanceCustomizationButtonBackgroundDisabledColor               | UIColor            | #b4fdd1                                                  | Define a cor do foreground                                                         |
| guidanceCustomizationButtonBorderColor                           | UIColor            | nil                                                      | Define a cor do foreground                                                         |
| guidanceCustomizationButtonBorderWidth                           | Int32              | nil                                                      | Define a espessura da borda do botão                                               |
| guidanceCustomizationButtonCornerRadius                          | Int32              | nil                                                      | Define a cor do foreground                                                         |
| guidanceCustomizationReadyScreenOvarFillColor                    | UIColor            | #05D758                                                  | Define a cor do foreground                                                         |
| guidanceCustomizationReadyScreenTextBackgroundColor              | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| guidanceCustomizationReadyScreenTextBackgroundCornerRadius       | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| guidanceCustomizationRetryScreenImageBorderColor                 | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| guidanceCustomizationRetryScreenImageBorderWidth                 | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| guidanceCustomizationRetryScreenImageCornerRadius                | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| guidanceCustomizationRetryScreenOvarStrokeColor                  | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| resultScreenCustomizationAnimationRelativeScale                  | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| resultScreenCustomizationForegroundColor                         | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| resultScreenCustomizationBackgroundColors                        | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| resultScreenCustomizationActivityIndicatorColor                  | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| resultScreenCustomizationCustomActivityIndicatorImage            | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| resultScreenCustomizationCustomActivityIndicatorRotationIntervar | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| resultScreenCustomizationCustomActivityIndicatorAnimation        | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| resultScreenCustomizationShowUploadProgressBar                   | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| resultScreenCustomizationUploadProgressFillColor                 | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor da barra de carregamento.                                             |
| resultScreenCustomizationUploadProgressTrackColor                | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| resultScreenCustomizationResultAnimationBackgroundColor          | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| resultScreenCustomizationResultAnimationForegroundColor          | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| resultScreenCustomizationResultAnimationSuccessBackgroundImage   | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| resultScreenCustomizationResultAnimationUnSuccessBackgroundImage | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| resultScreenCustomizationCustomResultAnimationSuccess            | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| resultScreenCustomizationCustomResultAnimationUnSuccess          | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| resultScreenCustomizationCustomStaticResultAnimationSuccess      | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| resultScreenCustomizationCustomStaticResultAnimationUnSuccess    | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| resultScreenCustomizationMessageFont                             | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| ovarCustomizationStrokeWidth                                     | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| ovarCustomizationStrokeColor                                     | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| ovarCustomizationProgressStrokeWidth                             | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| ovarCustomizationProgressColor1                                  | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| ovarCustomizationProgressColor2                                  | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| ovarCustomizationProgressRadialOffset                            | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| frameCustomizationBorderWidth                                    | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| frameCustomizationCornerRadius                                   | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| frameCustomizationBorderColor                                    | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| frameCustomizationBackgroundColor                                | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| frameCustomizationElevation                                      | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| overlayCustomizationBackgroundColor                              | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| overlayCustomizationBrandingImage                                | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| overlayCustomizationShowBrandingImage                            | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| feedbackCustomizationCornerRadius                                | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| feedbackCustomizationBackgroundColors                            | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| feedbackCustomizationTextColor                                   | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| feedbackCustomizationTextFont                                    | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| feedbackCustomizationEnablePulsatingText                         | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| feedbackCustomizationElevation                                   | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| cancelButtonCustomizationCustomImage                             | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| cancelButtonCustomizationLocation                                | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |
| resultScreenOverrideSuccessMessage                               | UIColor            | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground                                                         |

## Customização dos textos
Os textos do fluxo do Liveness3D podem ser alterados utilizando o objeto do tipo ``Liveness3DTheme``, onde as propriedades responsáveis por cada um desses textos são de dois tipos possíveis: `NSAttributedString` ou `String`.

```swift
var theme = Liveness3DTheme(.light)

theme.guidanceCustomizationReadyScreenHeaderAttributedString = NSAttributedString(string: "Titulo")
theme.resultScreenSuccessMessage = "Mensagem de sucesso!"
```
### Ready Screen

| **Indice** | **Propriedade**                                         | **Tipo**            |
| :--------- | :------------------------------------------------------ | :------------------ |
| (**1**)    | guidanceCustomizationReadyScreenHeaderAttributedString  | NSAttributedString? |
| (**2**)    | guidanceCustomizationReadyScreenSubtextAttributedString | NSAttributedString? |

<img src="Images/liveness3d_ready.png" width="432" height="396" />

<br/>

### Retry Screen

| **Indice** | **Propriedade**                                         | **Tipo**            |
| :--------- | :------------------------------------------------------ | :------------------ |
| (**1**)    | guidanceCustomizationRetryScreenHeaderAttributedString  | NSAttributedString? |
| (**2**)    | guidanceCustomizationRetryScreenSubtextAttributedString | NSAttributedString? |

<img src="Images/liveness3d_retry.png" width="432" height="396" />

<br/>

### Result Screen

| **Indice** | **Propriedade**            | **Tipo** |
| :--------- | :------------------------- | :------- |
| (**1**)    | resultScreenSuccessMessage | String   |

<img src="Images/liveness3d_result.png" width="432" height="396" />

---

## Animação

A animação da tela de resultado pode assumir três valores: `blob`, `spinner()` ou `custom()`, esses valores são atribuídos a propriedade `resultAnimationStyle` do `Liveness3DTheme`. Caso nenhum valor seja atribuído a essa propriedade o valor `spinner()` será aplicado por padrão.

```swift
var theme = Liveness3DTheme(.light)

theme.resultAnimationStyle = .blob
theme.resultAnimationStyle = .spinner(customization)
theme.resultAnimationStyle = .custom(delegate)
```

<br>

### **Blob Animation**

<br>

| **Descrição**            | **Animação**                                                   | **Customização**                                                                                                       |
| :----------------------- | :------------------------------------------------------------- | :--------------------------------------------------------------------------------------------------------------------- |
| Exemplo da <br> Animação | <img src="Images/blob_loading.gif" width="195" height="422" /> | A customização da animação de Blob é definida <br> pelos parâmetros do `Liveness3DTheme` listados<br>na tabela abaixo: |

<br>

| **Indice** | **Propriedade**                                           | **Tipo** | **Descrição**                                                                   |
| :--------- | :-------------------------------------------------------- | :------- | :------------------------------------------------------------------------------ |
| (**1**)    | `resultScreenCustomizationActivityIndicatorColor`         | UIColor  | Altera a cor do *blob*                                                          |
| (**2**)    | `resultScreenCustomizationResultAnimationForegroundColor` | UIColor  | Altera a cor do *checkmark* ao final<br>da animação de carregamento.            |
| (**3**)    | `resultScreenCustomizationResultAnimationBackgroundColor` | UIColor  | Altera a cor do circulo do *checkmark*<br>ao final da animação de carregamento. |

<br>

### Código de customização

```swift
theme.resultScreenCustomizationActivityIndicatorColor = .blue
theme.resultScreenCustomizationResultAnimationForegroundColor = .systemPink
theme.resultScreenCustomizationResultAnimationBackgroundColor = .yellow
theme.resultAnimationStyle = .blob
```
<br>

### Resultado

<div>
    <img src="Images/blob_customization_1.png" width="432" height="396" />
    <img src="Images/blob_customization_2.png" width="432" height="396" />
</div>

***
<br>

### **Spinner Animation**
<br>

| **Descrição**            | **Animação**                                                      | **Customização**                                                                                            |
| :----------------------- | :---------------------------------------------------------------- | :---------------------------------------------------------------------------------------------------------- |
| Exemplo da <br> Animação | <img src="Images/spinner_loading.gif" width="195" height="422" /> | A customização da animação de Spinner é feita através do<br>objeto do tipo `SpinnerAnimationCustomization`. |

### `SpinnerAnimationCustomization`
| **Indice** | **Propriedade**            | **Tipo** | **Descrição**                                                                   |
| :--------- | :------------------------- | :------- | :------------------------------------------------------------------------------ |
| (**1**)    | `spinnerColor`             | UIColor  | Altera a cor do *spinner*                                                       |
| (**2**)    | `indicatorForegroundColor` | UIColor  | Altera a cor do *checkmark* ao final<br>da animação de carregamento.            |
| (**3**)    | `indicatorBackgroundColor` | UIColor  | Altera a cor do circulo do *checkmark*<br>ao final da animação de carregamento. |

<br>

### Código de customização

```swift
let customization = SpinnerAnimationCustomization(
    spinnerColor: .red,
    indicatorForegroundColor: .yellow,
    indicatorBackgroundColor: .blue
)
theme.resultAnimationStyle = .spinner(customization)
```
<br>

### Resultado

<div>
    <img src="Images/spinner_customization_1.png" width="432" height="396" />
    <img src="Images/spinner_customization_2.png" width="432" height="396" />
</div>

***

### **Custom Animation**
<br>

| **Descrição**            | **Animação**                                                     | **Customização**                                                                                                                            |
| :----------------------- | :--------------------------------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------ |
| Exemplo da <br> Animação | <img src="Images/custom_loading.gif" width="195" height="422" /> | A animação personalizada é feita através de um<br>objeto que deve estar em conformidade com o<br>protocolo `CustomResultAnimationDelegate`. |

### `CustomResultAnimationDelegate`
| **Indice** | **Método**                      | **Tipo de retorno** | **Descrição**                                                        |
| :--------- | :------------------------------ | :------------------ | :------------------------------------------------------------------- |
| (**1**)    | `createActivityIndicatorView()` | UIView?             | Altera a cor do *spinner*                                            |
| (**2**)    | `createSuccessAnimationView()`  | UIView?             | Altera a cor do *checkmark* ao final<br>da animação de carregamento. |

<br>

### Código de customização

```swift
class CustomResultAnimation: CustomResultAnimationDelegate {
    func createActivityIndicatorView() -> UIView? {
        let activityIndicator = UIView()
        activityIndicator.backgroundColor = .red
        return activityIndicator
    }
    
    func createSuccessAnimationView() -> UIView? {
        let successAnimation = UIView()
        successAnimation.backgroundColor = .blue
        return successAnimation
    }
}
```

```swift
theme.resultAnimationStyle = .custom(CustomResultAnimation())
```
<br>

### Resultado

<div>
    <img src="Images/custom_customization_1.png" width="432" height="396" />
    <img src="Images/custom_customization_2.png" width="432" height="396" />
</div>
