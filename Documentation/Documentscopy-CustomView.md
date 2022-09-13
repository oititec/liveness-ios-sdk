# Documentoscopia - Guia de implementação de view customizada

Além de poder usar o SDK em sua forma padrão de exibição, o SDK permite que a forma de visualização seja completamente customizada.

## Entendendo o funcionamento

O componente de Documentoscopia é dividido em quatro telas:

1. Tela inicial, onde o usuário deve escolhar se irá capturar o documento RG ou o documento CNH.
2. Tela de captura das imagens, onde o usuário irá fotografar o documento.
3. Tela de loading, a qual é apresentado enquanto as imagens estão sendo validadas.
4. Tela de resultado da operação, podendo ter tela de erro ou sucesso.

No fluxo de capura do documento é possível customizar apenas a primeira tela. De forma semelhante ao Liveness, a customização do visual é feita através da implementação de UIView, que deve implementar o protocolo descrito na próxima seção, para o correto funcionamento do processo de documentoscopia. 

### 1. Tela inicial

Para customizar a tela inicial, é necessária a criação de uma `UIView` (via código ou via Interface Builder) que implemente o protocolo `DocumentscopyCustomView`, que especifica os componentes que a view em questão precisa conter:

```swift
/// Protocolo que deve ser implementado pela view customizada da tela inicial de Documentoscopia
public protocol DocumentscopyCustomView: UIView {
    
    // MARK: - Views obrigatórias
    
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

## Passando os parâmetros

Após implementada a view, ela deverá ser passada no construtor do `DocumentscopyViewController` através do argumento `customView`.
Além das três views customizadas, é possível passar as strings `camInstructionSingle`, `camInstructionFront` e `camInstructionBack`. Estas strings são as instruções que serão exibidas na label `instructionLabel` da tela de câmera.


```swift
let strings = [
                "readyScreenFrontDocumentInstructionText": "",
                "frontDocumentvalidationText": "",
                "backDocumentInstructionText": "",
                "backDocumentvalidationText": "",
                "confirmationTitleText": "",
                ""
            ]

let controller = DocumentscopyViewController(appKey: appKey,
                                             baseURL: baseURL,
                                             documentscopyDelegate: self,
                                             customViewParam: customViewParam)
```

Caso qualquer um dos argumentos do construtor de `DocumentscopyCustomViewParam` seja `nil`, será usado o padrão.

# Observações

Além das subviews especificadas, a view customizada pode conter outros elementos, apenas tomando cuidado para que os mesmos não interfiram nas subviews funcionais.

No projeto Sample, neste mesmo repositório, encontra-se um exemplo de implementação. Recomenda-se usar como ponto de partida as views inclusas neste sample, modificando-as de acordo com a necessidade.
