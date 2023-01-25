# Documentoscopia 
Saiba como implementar a customização de view (telas), conforme a sua necessidade.

Você pode utilizar o SDK padrão e por meio dele, também customizar a visualização dessas telas.

## Entenda como funciona

O **componente** de Documentoscopia **é dividido em doze telas**:

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

### 10. Tela de conclusão do envio do documento (erro)
O usuário receberá uma notificação de **erro** caso exista uma falha após conclusão do envio do documento:

<div><img src="Images/10_envio_de_documento_erro.png" width="214" height="488"></div>

### 11. Notificação da câmera do dispositivo desativada:
Antes do passo 2 (Tela de captura do documento (frente)), o usuário será notificado caso a permissão para acessar a câmera estiver desativada:

<div><img src="Images/11_permissao_de_camera_desativada.png" width="214" height="488"></div>

### 12. Tela de instrução para habilitar câmera:
Caso a câmera do dispositivo esteja desativada, o usuário deve receber as instruções de como habilitar:

<div><img src="Images/12_permissao_de_camera_desativada.png" width="214" height="488"></div>

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

### 2. Tela de captura

### `customCameraView`
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
    
### Tela de processamento
    
   
    
### Tela de permissão da câmera


    
## Observações

No projeto Sample, neste mesmo repositório, encontra-se um exemplo de implementação. Recomenda-se usar como ponto de partida as views inclusas neste sample, modificando-as de acordo com a necessidade.
