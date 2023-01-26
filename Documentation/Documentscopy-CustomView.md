# Documentoscopia 
Saiba como implementar a customização de view (telas), conforme a sua necessidade.

Você pode utilizar o SDK padrão e por meio dele, também customizar a visualização dessas telas.

## Entenda como funciona

O **componente** de Documentoscopia **é dividido em treze telas**:

### 1. Tela inicial
O usuário define qual o tipo de documento que deseja enviar:

<div><img src="Images/01_tipo_de_documento.png" width="214" height="488"></div>

### 2. Tela de captura do documento (frente)
O usuário recebe a instrução de captura da frente do documento, dentro da marcação apresentada:

<div><img src="Images/02_instrucao_documento_frente.png" width="214" height="488"></div>

### 3. Abaixo, um exemplo de como esse documento deve ficar posicionado:

<div><img src="Images/03_documento_frente.png" width="214" height="488"></div>

### 4. Tela de confirmação da captura do documento (frente)
Nesta tela, o usuário deve confirmar se a imagem do documento capturado está em boa qualidade, clicando em Não, refazer ou Sim:

<div><img src="Images/04_documento_frente_validacao.png" width="214" height="488"></div>

### 5. Tela de captura do documento (verso)
O usuário recebe a instrução de captura do verso do documento, dentro da marcação apresentada:

<div><img src="Images/05_instrucao_documento_verso.png" width="214" height="488"></div>

### 6. Abaixo, um exemplo de como esse documento deve ficar posicionado:

<div><img src="Images/06_documento_verso.png" width="214" height="488"></div>

### 7. Tela de confirmação da captura do documento (verso)
Nesta tela, o usuário deve confirmar se a imagem do documento capturado está em boa qualidade, clicando em Não, refazer ou Sim:

<div><img src="Images/07_documento_verso_validacao.png" width="214" height="488"></div>

### 8. Tela de processamento do envio do documento
A próxima tela que o usuário deve ver é a tela de processamento do envio do documento:

<div><img src="Images/08_envio_de_documento_loading.png" width="214" height="488"></div>

### 9. Tela de conclusão do envio do documento (sucesso)
O usuário receberá uma notificação de **sucesso** caso o envio do documento seja concluído com sucesso:

<div><img src="Images/09_envio_de_documento_sucesso.png" width="214" height="488"></div>

### 10. Tela de conclusão de envio do documento (erro):
O usuário receberá uma notificação de **erro** caso exista uma falha após conclusão do envio do documento:

<div><img src="Images/13_envio_de_documento_erro.png" width="214" height="488"></div>

### 11. Tela para tentar processar o documento novamente (erro):
Naesta tela o usuário poderá clicar no botão **Tentar novamente**, após a mensagem de erro:

<div><img src="Images/10_envio_de_documento_erro.png" width="214" height="488"></div>

### 12. Notificação da câmera do dispositivo desativada:
Antes do passo 2 (Tela de captura do documento (frente)), o usuário será notificado caso a permissão para acessar a câmera estiver desativada:

<div><img src="Images/11_permissao_de_camera_desativada.png" width="214" height="488"></div>

### 13. Tela de instrução para habilitar câmera:
Caso a câmera do dispositivo esteja desativada, o usuário deve receber as instruções de como habilitar:

<div><img src="Images/12_permissao_de_camera_desativada.png" width="214" height="488"></div>

---

## Instalação e configuração das telas customizáveis

A customização das telas é semelhante ao **Liveness**. Ela é feita por meio da criação de objetos do tipo **UIViews**(via código ou via Interface Builder), que implementem os protocolos definidos para cada tela.

Além das subviews especificadas, a view customizada pode conter outros elementos, apenas tomando cuidado para que os mesmos não interfiram nas subviews funcionais.

Para realizar essa implementação é necessário seguir alguns protocolos, para o funcionamento correto do processo de **documentoscopia**. 
Veja a seguir:

### Implementação

Todas as *views* customizadas são passadas via construtor da classe ``DocumentscopyViewController``. Essas *views* são opcionais, logo não há necessidade de especificar todas, caso não seja necessário.

```swift
let controller = DocumentscopyViewController(
    appKey: appKey, baseURL: baseURL, delegate: self,
    customView: CustomView(),
    customCameraView: CustomCameraView()
)
```
**Caso qualquer um desses dois argumentos seja `nil`, será usado o *layout* padrão.**

### 1. Tela inicial

### `customView`
Essa view deve estar em conformidade com o protocolo ``DocumentscopyCustomView`` que contém os seguintes atributos:

```swift
public protocol DocumentscopyCustomView: UIView {
    var backButton: UIButton! { get }
    var viewCNH: UIView! { get }
    var viewRG: UIView! { get }
}
```

| **Indice** | **Elemento** | **Descrição** |
|:-----------|:-------------|:--------------|
| (**1**) | `backButton` | Botão para função voltar da navegação. |
| (**2**) | `viewCNH` | View que terá a ação de iniciar o fluxo de captura do documento CNH. |
| (**3**) | `viewRG` | View que terá a ação de iniciar o fluxo de captura do documento RG. |

<br/>
<img src="Images/dc_instructions.png" width="432" height="396" />

---

## 2. Tela de captura do documento

#### `customCameraView`
Essa view deve estar em conformidade com o protocolo ``DocumentscopyCustomCameraView`` que contém os seguintes atributos:

```swift
public protocol DocumentscopyCustomCameraView: UIView {
    var cameraPreview: DocumentscopyCameraPreviewView! { get }
    var captureButton: UIButton! { get }    
    var previewContainer: UIView! { get }
    var previewImageView: UIImageView! { get }
    var usePictureButton: DocumentscopyEditableButton! { get }    
    var takeNewPictureButton: UIButton! { get }
    var instructionLabel: UILabel! { get }
    var closeButton: UIButton! { get }    
    var backButton: UIButton! { get }    
    var containerConfirmation: UIView! { get }    
    var bottomViewConfirmationTopConstraint: NSLayoutConstraint! { get }
    var viewVerso: DocumentscopyCameraIndicatorView! { get }    
    var viewFrente: DocumentscopyCameraIndicatorView! { get }    
    var cameraMask: UIView! { get }
    var cameraContainerVisualizer: UIView! { get }
}
```

| **Indice** | **Elemento** | **Descrição** |
|:-----------|:-------------|:--------------|
| (**1**) | `backButton` | UIButton para fechar a tela. |
| (**2**) | `closeButton` | UIButton para fechar a tela. |
| (**3**) | `viewFrente` | View que indica o momento de utilizar a frente do documento. |
| (**4**) | `viewVerso` | View que indica o momento de utilizar o verso do documento. |
| (**5**) | `instructionLabel` | Texto informativo com orientação da captura, é exibido por apenas alguns segundos. |
| (**6**) | `cameraPreview` | Nesta view será colocado o preview da câmera. |
| (**7**) | `cameraContainerVisualizer` | View que determina onde o preview câmera será visível. |
| (**8**) | `cameraMask` | View que determina onde a camera não será visível. |
| (**9**) | `captureButton` | Botão para capturar foto. |
| (**10**) | `previewContainer` | View que será exibida após a captura de uma imagem. |
| (**11**) | `previewImageView` | UIImageView onde será exibida a imagem capturada para o usuário confirmar se ficou boa. |
| (**12**) | `containerConfirmation` | UIView de confirmação. |
| (**13**) | `takeNewPictureButton` | Botão para que o usuário capture a foto novamente. |
| (**14**) | `usePictureButton` | Botão para que o usuário confirme a foto capturada. |
|          | `bottomViewConfirmationTopConstraint` | Constraint que será alterada para mostrar ou esconder a UIView de confirmação. |

<br/>
<div>
    <img src="Images/dc_camera_1.png" width="432" height="396" />
    <img src="Images/dc_camera_2.png" width="432" height="396" />
<div/>
    
**DocumentscopyCameraPreviewView**

É uma classe customizada que herda de uma `UIView`.

<br/>

**DocumentscopyIndicatorView**

É `typealias` que força uma herança para o tipo `UIView` e obriga a assinatura do protocolo ``DocumentscopyIndicatorViewProtocol``.

```swift 
@objc public protocol DocumentscopyIndicatorViewProtocol {
    func setFocus(to value: Bool, animated: Bool)
}
```

| **Elemento** | **Descrição** |
|:-------------|:--------------|
| `setFocus(to:animated:)` | Método que indica se a *view* está ou não em foco. O parâmetro de **animated** indica quando a troca de foco do componente deve ou não ser animada (*opcional*). |
<br/>

**DocumentscopyEditableButton**

É `typealias` que força uma herança para o tipo `UIButton` e obriga a assinatura do protocolo ``DocumentscopyEditableButtonProtocol``.

```swift 
@objc public protocol DocumentscopyEditableButtonProtocol: AnyObject {
    func changeTitle(to newTitle: String)
}
```

| **Elemento** | **Descrição** |
|:-------------|:--------------|
| `changeTitle(to:)` | Método que altera o texto do botão. |

<br/>

**DocumentscopyConfirmationSheetVisibility**

```swift
public enum DocumentscopyConfirmationSheetVisibility {
    case displayed
    case hidden
}
```
---
    
## 3. Tela de processamento do documento
    
### `customLoadingView`

Essa view deve estar em conformidade com o tipo ``DocumentscopyCustomLoadingView`` que é um ``typealias`` para o tipo ``UIView``

<br/>
<img src="Images/fc_process_result.png" width="432" height="396" />

---

## 4. Tela de Resultado do Processamento
    
### `customResultView`

Essa view deve estar em conformidade com o protocolo ``DocumentscopyCustomResultView`` que contém os seguintes atributos:

```swift
public protocol DocumentscopyCustomResultView: UIView {
    var resultButton: UIButton! { get }
    
    func display(for resultType: DocumentscopyResultType)
}
```

| **Indice** | **Elemento** | **Descrição** |
|:-----------|:-------------|:--------------|
| (**1**) | `resultButton` | Botão para fechar o fluxo de reconhecimento de documento. |
|         | `display(for:)` | Esse método recebe como parâmetro um `enum` do tipo `DocumentscopyResultType` que indica qual resultado deve ser mostrado. |

<br/>

| **Tipo de resultado** | **Exemplo de tela** |
|:----------------------|:--------------------|
| Sucesso | <img src="Images/dc_result_success.png" width="432" height="396" /> |
| Tente Novamente | <img src="Images/dc_result_tryagain.png" width="432" height="396" /> |
| Erro | <img src="Images/dc_result_error.png" width="432" height="396" /> |

**DocumentscopyResultType**

```swift
public enum DocumentscopyResultType {
    case success
    case tryAgain
    case error(DocumentscopyError)
}
```   
---
    
## 5. Tela de permissão da câmera

### `customCameraPermissionView`

Essa view deve estar em conformidade com o protocolo ``DocumentscopyCustomCameraPermissionView`` que contém os seguintes atributos:

```swift
public protocol DocumentscopyCustomCameraPermissionView: UIView {
    var backButton: UIButton! { get }
    var checkPermissionButton: UIButton! { get }
    var openSettingsButton: UIButton! { get }
    var closeButton: UIButton! { get }
    
    func showBottomSheet()
}
```

| **Indice** | **Elemento** | **Descrição** |
|:-----------|:-------------|:--------------|
| (**1**) | `backButton` | Botão para função voltar da navegação. |
| (**2**) | `checkPermissionButton` | Botão responsável por verificar a permissão de câmera e solicitá-la se necessário. |
| (**3**) | `openSettingsButton` | Botão que redireciona o usuário para o menu de permissões do aplicativo na configurações do dispositivo. |
| (**4**) | `closeButton` | Botão que fechar o fluxo de validação da permissão de câmera e volta para tela anterior. |
|         | `showBottomSheet` | Método responsável por indicar o momento de mostrar os botões de ``openSettingsButton`` e ``closeButton``. |

<br/>
<div>
    <img src="Images/camera_permission_1.png" width="432" height="396" />
    <img src="Images/camera_permission_2.png" width="432" height="396" />
<div/>

---
    
## Observações

No projeto Sample, neste mesmo repositório, encontra-se um exemplo de implementação. Recomenda-se usar como ponto de partida as views inclusas neste sample, modificando-as de acordo com a necessidade.
