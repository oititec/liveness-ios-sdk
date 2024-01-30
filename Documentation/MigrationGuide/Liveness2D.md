# Guia de migração - Liveness 2D

Este guia tem como propósito auxiliar na migração do SDK monólito (**FaceCaptcha**) para o novo módulo de Liveness 2D (**OILiveness2D**).

> **Versões utilizadas**
>
> Foram utilizadas na elaboração desse guia a versão _5.1.4_ do SDK **FaceCaptcha** e a versão _1.3.0_ do SDK **OILiveness2D**.

## Mudanças

### Podfile

No arquivo `Podfile` houveram duas alterações:

```sh
# Antigo
source 'https://github.com/oititec/liveness-ios-specs.git'

# Novo
source 'https://github.com/oititec/ios-artifactory.git'
```

```ruby
# Antigo
pod 'FaceCaptcha', '5.1.4'

# Novo
pod 'OILiveness2D', '1.3.0'
```

### Importação

Dentro dos arquivos `.swift` houve a alteração da importação do módulo, agora deve ser feita referência ao módulo `OILiveness2D` para ter acesso ao contéudo do **FaceCaptcha** e **Documentscopy**.

```swift
// Antigo
import FaceCaptcha

// Novo
import OILiveness2D
```

### FaceCaptcha

1. As assinaturas dos métodos do protocolo `FaceCaptchaDelegate` foram alteradas.

    ```swift
    // Antigo

    func handleFaceCaptchaValidation(validateModel: FCValidCaptchaModel) { }
    func handleFaceCaptchaError(error: FaceCaptchaError) { }
    func handleFaceCaptchaCanceled() { }

    // Novo

    func handleSuccess(model: FaceCaptchaSuccessModel) { }
    func handleError(error: FaceCaptchaError) { }
    func handleCanceled() { }
    ```

2. O parâmetro `cameraOverlay` da classe `FaceCaptchaViewController` foi removido.

3. O parâmetro `customView` da classe `FaceCaptchaViewController` foi alterado para `customLivenessView`.

4. O protocolo `FaceCaptchaView` mudou para `FaceCaptchaCustomView`.

5. Houveram alterações nas propriedades e métodos do protocolo `FaceCaptchaCustomView` (antigo `FaceCaptchaView`):

    | **Nome antigo**        | **Novo nome**    | **Novo Tipo**                 |
    | :--------------------- | :--------------- | :---------------------------- |
    | cameraContainer        | cameraPreview    | ***                           |
    | initialInstructionView | instructionLabel | UILabel!                      |
    | activityIndicatorView  | recognizingLabel | UILabel!                      |
    | ***                    | cameraOverlay    | UIView!                       |
    | ***                    | backButton       | UIButton!                     |
    | ***                    | progressView     | UIView!                       |

    **Métodos adicionados**
    - updateProgress(to:)
    - setInstructionLabelTitle(to:)

    **Propriedades removidas**
    - challengeContainer

6. Foram adicionados novos parâmetros para customização das telas no inicializador da classe `FaceCaptchaViewController`.

    - customInstructionsView
    - customProcessResultView
    - customResultView
    - customCameraPermissionView

### Documentoscopia

1. O parâmetro `customCameraPermissionView` do inicializador da `DocumentscopyViewController` mudou para última posição.

2. A assinatura do tipo ``DocumentscopyCustomCameraPermissionView`` mudou para ``CustomCameraPermissionView``. 

3. A assinatura dos tipos ``LoadingVisibility`` (_DocumentscopyCustomInstructionView_) e ``DocumentscopyConfirmationSheetVisibility`` (_DocumentscopyCustomView_) mudou para ``Visibility``.

4. A partir dessa versão a implementação do método `changeLoadingVisibility(to:)` do protocolo ``DocumentscopyCustomInstructionView`` é obrigatória.

5. A assinatura do tipo ``DocumentscopyCameraPreviewView`` mudou para ``CameraPreviewView``.

6. O tipo ``DocumentscopyFocusIndicator`` foi substituído pelo ``FocusIndicator``.