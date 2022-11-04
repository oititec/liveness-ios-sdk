# Documentoscopia - Guia de implementação de view customizada

Além de poder usar o SDK em sua forma padrão de exibição, o SDK permite que a forma de visualização seja completamente customizada.

## Entendendo o funcionamento

O componente de Documentoscopia é dividido em três telas:

1. Tela inicial, onde o usuário deve escolhar se irá capturar apenas uma foto (com frente e verso) ou duas fotos (uma da frente e outra do verso)
2. Tela de captura das imagens, onde o usuário irá fotografar o documento e confirmar se as fotos estão boas, e em caso negativo, poderá capturá-las novamente.

De forma semelhante ao Liveness, a customização do visual é feita através da implementação de UIViews, as quais devem implementar os respectivos protocolos descritos nas próximas seções, para o correto funcionamento do processo de documentoscopia. A diferença é que, neste caso, deve-se implementar 2 views, sendo um para cada tela citada anteriormente.

### 1. Tela inicial

Para customizar a tela inicial, é necessária a criação de uma `UIView` (via código ou via Interface Builder) que implemente o protocolo `DocumentscopyCustomView`, que especifica os componentes que a view em questão precisa conter:

```swift
/// Protocolo que deve ser implementado pela view customizada da tela inicial de Documentoscopia
public protocol DocumentscopyCustomView: UIView {
    /// Botão para função voltar da navegação
    var backButton: UIButton! { get }

    /// View que terá a ação de iniciar o fluxo de captura do documento CNH
    var viewCNH: UIView! { get }

    /// View que terá a ação de iniciar o fluxo de captura do documento RG
    var viewRG: UIView! { get }
}
```

Na figura abaixo é possível visualizar o que cada uma das subviews representa na tela:

![Componentes da view customizada](Images/doc_custom_home_view.png)

### 2. Tela de captura

Para customizar a tela de câmera, é necessária a criação de uma `UIView` (via código ou via Interface Builder) que implemente o protocolo `DocumentscopyCustomCameraView`, que especifica os componentes que a view em questão precisa conter:

```swift
/// Protocolo que deve ser implementado pela view customizada da tela de câmera de Documentoscopia
public protocol DocumentscopyCustomCameraView: UIView {
    /// Nesta view será colocado o preview da câmera.
    var cameraPreview: DocumentscopyCameraPreviewView! { get }
    
    /// Botão para capturar foto.
    var captureButton: UIButton! { get }
    
    /// View que será exibida após a captura de uma imagem.
    var previewContainer: UIView! { get }
    
    /// UIImageView onde será exibida a imagem capturada para o usuário confirmar se ficou boa.
    var previewImageView: UIImageView! { get }
    
    /// Botão para que o usuário confirme a foto capturada.
    var usePictureButton: UIButton! { get }
    
    /// Botão para que o usuário capture a foto novamente.
    var takeNewPictureButton: UIButton! { get }
    
    /// Texto informativo com orientação da captura, é exibido por apenas alguns segundos.
    var instructionLabel: UILabel! { get }
    
    /// UIButton para fechar a tela.
    var closeButton: UIButton! { get }
    
    /// UIButton para fechar a tela.
    var backButton: UIButton! { get }
    
    /// UIView de confirmação
    var containerConfirmation: UIView! { get }
    
    /// Constraint que será alterada para mostrar ou esconder a UIView de confirmação
    var bottomViewConfirmationTopConstraint: NSLayoutConstraint! { get }
    
    /// View que indica o momento de utilizar o verso do documento
    var viewVerso: DocumentscopyCameraIndicatorView! { get }
    
    /// View que indica o momento de utilizar a frente do documento
    var viewFrente: DocumentscopyCameraIndicatorView! { get }
    
    /// View que determina onde a camera não será visível
    var cameraMask: UIView! { get }
    
    /// View que determina onde o preview câmera será visível
    var cameraContainerVisualizer: UIView! { get }
}
```

Na figura abaixo é possível visualizar o que cada uma das subviews representa na tela:

![Componentes da view customizada](Images/doc_custom_camera_view.png)

## Passando os parâmetros

Após implementadas as views, elas deverão ser passadas no construtor do `DocumentscopyViewController` através dos argumentos `customView` e `customCameraView` que representam respectivamente, a tela inicial e a tela de captura das imagens do documento.

```swift
let controller = DocumentscopyViewController(
    appKey: appKey, 
    baseURL: baseURL,
    delegate: self, 
    customView: CustomView(),
    customCameraView: CustomCameraView()
)
```

Caso qualquer um desses dois argumentos seja `nil`, será usado o *layout* padrão.

# Observações

Além das subviews especificadas, as views customizadas pode conter outros elementos, apenas tomando cuidado para que os mesmos não interfiram nas subviews funcionais.

No projeto Sample, neste mesmo repositório, encontra-se um exemplo de implementação. Recomenda-se usar como ponto de partida as views inclusas neste sample, modificando-as de acordo com a necessidade.
