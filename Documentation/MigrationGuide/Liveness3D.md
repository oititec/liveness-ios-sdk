# Guia de migração - 1.0.0
Essa primeira versão faz parte da modularização do antigo módulo único (FaceCaptcha), onde nesse repositório se encontra isolado o módulo para Liveness 3D.

### Mudanças

1. A _struct_ `Liveness3DThemeType` mudou para `Liveness3DTheme.ThemeType`.

2. O parâmetro _delegate_ no inicializador da classe `Liveness3DViewController` não é mais opcional.

3. A assinatura do tipo ``LoadingVisibility`` mudou para ``Visibility``.

4. O protocolo `CustomInstructionView` foi substituído pelo `Liveness3DCustomInstructionView`. [Guia de Customização: Views](https://devcenter.certiface.io/docs/customizacao-liveness3d-ios#1-tela-de-instruções)

5. O _case_ de `blob` do ``ResultAnimationStyle`` agora recebe um objeto de customização. [Guia de Customização: Liveness3DTheme](https://devcenter.certiface.io/docs/customizacao-liveness3d-ios)

6. A _struct_ `Liveness3DTheme` teve uma reformulação das suas propriedades, com isso houve alteração de nomes e tipos de algumas propriedades e remoção de outras. [Guia de Customização: Liveness3DTheme](https://devcenter.certiface.io/docs/customizacao-liveness3d-ios)

### Liveness3DTheme

**Alterações de nome e tipo**

| **Nome antigo**                                            | **Novo nome**                                      | **Novo Tipo**     |
| :--------------------------------------------------------- | :------------------------------------------------- | :---------------- |
| guidanceCustomizationReadyScreenHeaderFont                 | readyScreenCustomizationHeaderFont                 | ***               |
| guidanceCustomizationReadyScreenHeaderTextColor            | readyScreenCustomizationHeaderTextColor            | UIColor           |
| guidanceCustomizationReadyScreenSubtextFont                | readyScreenCustomizationSubtextFont                | ***               |
| guidanceCustomizationReadyScreenSubtextTextColor           | readyScreenCustomizationSubtextTextColor           | UIColor           |
| guidanceCustomizationReadyScreenTextBackgroundColor        | readyScreenCustomizationTextBackgroundColor        | ***               |
| guidanceCustomizationReadyScreenTextBackgroundCornerRadius | readyScreenCustomizationTextBackgroundCornerRadius | Int32             |
| guidanceCustomizationRetryScreenHeaderFont                 | retryScreenCustomizationHeaderFont                 | ***               |
| guidanceCustomizationRetryScreenHeaderTextColor            | retryScreenCustomizationHeaderTextColor            | UIColor           |
| guidanceCustomizationRetryScreenSubtextFont                | retryScreenCustomizationSubtextFont                | ***               |
| guidanceCustomizationRetryScreenSubtextTextColor           | retryScreenCustomizationSubtextTextColor           | UIColor           |
| guidanceCustomizationRetryScreenImageBorderColor           | retryScreenCustomizationImageBorderColor           | ***               |
| guidanceCustomizationRetryScreenImageBorderWidth           | retryScreenCustomizationImageBorderWidth           | Int32             |
| guidanceCustomizationRetryScreenImageCornerRadius          | retryScreenCustomizationImageCornerRadius          | Int32             |
| resultScreenCustomizationForegroundColor                   | resultScreenCustomizationTextColor                 | UIColor           |
| resultAnimationStyle                                       | resultScreenCustomizationAnimationStyle            | ***               |
| ovarCustomizationStrokeWidth                               | ovalCustomizationStrokeWidth                       | Int32             |
| ovarCustomizationStrokeColor                               | ovalCustomizationStrokeColor                       | ***               |
| ovarCustomizationProgressColor1                            | ovalCustomizationProgressColor1                    | ***               |
| ovarCustomizationProgressColor2                            | ovalCustomizationProgressColor2                    | ***               |
| ovarCustomizationProgressStrokeWidth                       | ovalCustomizationProgressStrokeWidth               | Int32             |
| ovarCustomizationProgressRadialOffset                      | ovalCustomizationProgressRadialOffset              | Int32             |
| frameCustomizationElevation                                | frameCustomizationShadow                           | Liveness3DShadow? |
| frameCustomizationBorderWidth                              | ***                                                | Int32             |
| frameCustomizationBorderColor                              | ***                                                | UIColor           |
| frameCustomizationBackgroundColor                          | ***                                                | UIColor           |
| feedbackCustomizationElevation                             | feedbackCustomizationShadow                        | Liveness3DShadow? |
| feedbackCustomizationBackgroundColor                       | ***                                                | UIColor           |
| feedbackCustomizationCornerRadius                          | ***                                                | Int32             |
| feedbackCustomizationTextColor                             | ***                                                | UIColor           |
| overlayCustomizationBackgroundColor                        | ***                                                | UIColor           |
| guidanceCustomizationButtonBackgroundHighlightColor        | ***                                                | UIColor           |
| guidanceCustomizationButtonTextNormalColor                 | ***                                                | UIColor           |
| guidanceCustomizationButtonTextHighlightColor              | ***                                                | UIColor           |
| guidanceCustomizationButtonTextDisabledColor               | ***                                                | UIColor           |
| guidanceCustomizationButtonBorderColor                     | ***                                                | UIColor           |
| guidanceCustomizationButtonBorderWidth                     | ***                                                | Int32             |
| guidanceCustomizationButtonCornerRadius                    | ***                                                | Int32             |

**Propriedades removidas**

- guidanceCustomizationReadyScreenOvarFillColor
- guidanceCustomizationRetryScreenOvarStrokeColor
- resultScreenCustomizationCustomActivityIndicatorAnimation
- resultScreenCustomizationCustomResultAnimationSuccess
- resultScreenCustomizationCustomResultAnimationUnSuccess
- resultScreenCustomizationCustomStaticResultAnimationSuccess
- resultScreenCustomizationCustomStaticResultAnimationUnSuccess
- resultScreenCustomizationBackgroundColors
- resultScreenCustomizationResultAnimationBackgroundColor
- resultScreenCustomizationResultAnimationForegroundColor
- resultScreenCustomizationResultAnimationSuccessBackgroundImage
- resultScreenCustomizationResultAnimationUnSuccessBackgroundImage
- resultScreenCustomizationActivityIndicatorColor
- resultScreenCustomizationCustomActivityIndicatorRotationIntervar
- resultScreenCustomizationCustomActivityIndicatorImage
- feedbackCustomizationEnablePulsatingText
- guidanceCustomizationForegroundColor
- guidanceCustomizationBackgroundColors  
