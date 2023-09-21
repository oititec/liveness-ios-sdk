# Changelog

## [versão 5.1.2](https://github.com/oititec/liveness-ios-sdk/releases/tag/5.1.2)

_data: 21/09/2023_

- **Atualização da FaceTec - [versão 9.6.52](https://github.com/oititec/ios-liveness3d-ft/releases/tag/9.6.52)**
  - Adicionada nova checagem de injeção de video no dispositivo e servidor para mitigar a ameaça das IAs Generativas;
  - Melhorias de performance em modelos mais antigos de iPhones e iPads que melhoram a taxa de sucesso;
  - Melhorias de estabilidade.

## [versão 5.1.1](https://github.com/oititec/liveness-ios-sdk/releases/tag/5.1.1)

_data: 24/08/2023_

- **Atualização da FaceTec - [versão 9.6.45](https://github.com/oititec/ios-liveness3d-ft/releases/tag/9.6.45)**
  - Adicionada nova checagem de injeção de video no dispositivo e servidor para mitigar a ameaça das IAs Generativas;
  - Melhorias de performance em modelos mais antigos de iPhones e iPads que melhoram a taxa de sucesso;
  - Melhorias de estabilidade.

## [versão 5.1.0](https://github.com/oititec/liveness-ios-sdk/releases/tag/5.1.0)

_data: 02/08/2023_

- **Melhorias**
  - Adicionado o parâmetro `ticket` (_opcional_) no inicializador da classe `DocumentscopyViewController` para uso da Certiface API.

## [versão 5.0.1](https://github.com/oititec/liveness-ios-sdk/releases/tag/5.0.1)

_data: 06/07/2023_

- **Atualização da FaceTec - [versão 9.6.40](https://github.com/oititec/ios-liveness3d-ft/releases/tag/9.6.40)**
  - A propriedade `feedbackEyesStraightAhead` foi descontinuada.
  - Adicionada nova checagem de injeção de video no dispositivo e servidor para mitigar a ameaça das IAs Generativas;
  - Melhorias de performance em modelos mais antigos de iPhones e iPads que melhoram a taxa de sucesso;
  - Melhorias de estabilidade.

## [versão 5.0.0](https://github.com/oititec/liveness-ios-sdk/releases/tag/5.0.0)

_data: 09/06/2023_

- **Breaking changes**
  - O _enum_ `Environment3D` teve sua nomenclatura alterada para `Environment`. [[Guia de uso e integração | Liveness3D](../Liveness3D/Liveness3D-Usage.md#iniciando-o-liveness-3d)]
  - O parâmetro `baseURL` do inicializador da **Documentscopy** foi substituído pelo parâmetro `environment`. [[Guia de uso e integração | Documentoscopia](../Liveness2D/Documentscopy-Usage.md#iniciando-a-documentoscopia)]
  - O parâmetro `baseURL` do inicializador do **FaceCaptcha** foi substituído pelo parâmetro `environment`. [[Guia de uso e integração | FaceCaptcha](../Liveness2D/FaceCaptcha-Usage.md#iniciando-o-facecaptcha)]
  - A _struct_ `Liveness3DTheme` teve algumas propriedades removidas [[Guia de Customização: Liveness3DTheme](../Liveness3D/Liveness3D-Liveness3DTheme.md)], segue a lista:
    - guidanceCustomizationReadyScreenHeaderAttributedString
    - guidanceCustomizationReadyScreenSubtextAttributedString
    - guidanceCustomizationRetryScreenHeaderAttributedString
    - guidanceCustomizationRetryScreenSubtextAttributedString
    - resultScreenSuccessMessage
  - A customização de textos agora é feita somente pelo dicionário de textos e a chave do dicionário mudou de `String` para o _enum_ `Liveness3DTextKey`. [[Guia de Customização: Textos](../Liveness3D/Liveness3D-CustomTexts.md)]

## [versão 4.1.3](https://github.com/oititec/liveness-ios-sdk/releases/tag/4.1.3)

_data: 26/05/2023_

- **Atualização da FaceTec - [versão 9.6.33](https://github.com/oititec/ios-liveness3d-ft/releases/tag/9.6.33)**
  - Adicionada nova checagem de injeção de video no dispositivo e servidor para mitigar a ameaça das IAs Generativas;
  - Melhorias de performance em modelos mais antigos de iPhones e iPads que melhoram a taxa de sucesso;
  - Melhorias de estabilidade.

## [versão 4.1.2](https://github.com/oititec/liveness-ios-sdk/releases/tag/4.1.2)

_data: 25/04/2023_

- **Atualização da FaceTec - [versão 9.6.29](https://github.com/oititec/ios-liveness3d-ft/releases/tag/9.6.29)**
  - Adicionadas novas camadas de IA para proteção contra ataques sofisticados de nível 5 nos dispositivos e servidores.
  - Melhorias de compatibilidade, estabilidade e desempenho.

## [versão 4.1.1](https://github.com/oititec/liveness-ios-sdk/releases/tag/4.1.1)

_data: 06/04/2023_

- **Melhorias**

  - Alteração do target mínimo de **iOS 10.0** para **iOS 11.0**.
  - Remoção do suporte para as arquiteturas _armv7_ (dispositivo) e _i386_ (simulador).

- **Atualização da FaceTec - [versão 9.6.25](https://github.com/oititec/ios-liveness3d-ft/releases/tag/9.6.25)**
  - Adicionadas novas camadas de IA para proteção contra ataques sofisticados de nível 5 nos dispositivos e servidores.
  - Melhorias de compatibilidade, estabilidade e desempenho.

## [versão 4.1.0](https://github.com/oititec/liveness-ios-sdk/releases/tag/4.1.0)

_data: 24/03/2023_

- **Melhorias**
  - O _loading_ na tela de instruções da Documentoscopia não é mais aplicado na _custom view_.
  - O estado do loading da tela de instruções da Documentoscopia pode ser verificado através da implementação do método `changeLoadingVisibility(to:)`, presente no protocolo `DocumentscopyCustomInstructionView`. [Guia de customização de view customizada](../Liveness2D/Documentscopy-CustomView.md#custominstructionview).
  - Durante o carregamento da tela de instruções da Documentoscopia, as _views_ de RG e CNH ficarão desabilitadas.

## [versão 4.0.9](https://github.com/oititec/liveness-ios-sdk/releases/tag/4.0.9)

_data: 20/03/2023_

- **Breaking changes**

  - Alteração do comportamento e do visual da tela de captura de permissão de câmera.
  - Alteração no inicializador do `Liveness3DViewController`.
  - Alterações dos códigos de erro.

- **Atualização da FaceTec - [versão 9.6.18](https://github.com/oititec/ios-liveness3d-ft/releases/tag/9.6.18)**
  - Melhorias nas taxas de correspondência e de sucesso do liveness.
  - Melhorias de compatibilidade, estabilidade, segurança e desempenho.

## [versão 4.0.8](https://github.com/oititec/liveness-ios-sdk/releases/tag/4.0.8)

_data: 23/02/2023_

- **Melhorias**
  - Melhoria na qualidade das imagens capturadas durante o processo de documentoscopia para envio e validação.
  - Melhoria na qualidade da pré visualização durante o processo de documentoscopia.

## [versão 4.0.7](https://github.com/oititec/liveness-ios-sdk/releases/tag/4.0.7)

_data: 13/02/2023_

- **Melhorias**
  - Correção no apontamento interno dos ambientes de homologação (HML) e produção (PRD) para validação do Liveness3D.
  - Correção no envio de logs do SDK em homologação.

## [versão 4.0.6](https://github.com/oititec/liveness-ios-sdk/releases/tag/4.0.6)

_data: 31/01/2023_

- **Breaking changes**
  - O protocolo `DocumentscopyCustomView` teve alterações nos tipos das propriedades: `backIndicatorView`, `frontIndicatorView` e `usePictureButton`. [Guia de customização de view customizada](Documentation/Liveness2D/Documentscopy-CustomView.md).
  - O protocolo `DocumentscopyCustomView` possui dois novos métodos: `setFocus(to:animated:)` e `setUsePictureButtonTitle(to:)`. [Guia de customização de view customizada](Documentation/Liveness2D/Documentscopy-CustomView.md).
  - A assinatura do método `showBottomSheet()` do protocolo `CustomCameraPermissionView` mudou para `showBottomSheet(visibility:)`. [Guia de customização: Views](Documentation/Liveness3D/Liveness3D-CustomView.md) e [Guia de customização de view customizada](Documentation/Liveness2D/Documentscopy-CustomView.md)

## [versão 4.0.3](https://github.com/oititec/liveness-ios-sdk/releases/tag/4.0.3)

_data: 19/01/2023_

- **Atualização da FaceTec - [versão 9.6.10](https://github.com/oititec/ios-liveness3d-ft/releases/tag/9.6.10)**
  - Melhorias significantes nas taxas de correspondência de segurança e de sucusso do Liveness e 3D.
  - Melhoria na compatibilidade de dispositivos.
  - Melhorias de performance, estabilidade e uso de memória.

---

#### 3.1.1

- Correção na lógica de exibição do indicador de rotação na tela de câmera da documentoscopia.

#### 3.1.0

- Fluxo de recaptura de documento em caso de falha.

#### [3.0.0](3.0.0.md) - BREAKING CHANGE

- Alteração na forma como são capturadas as fotos do FaceCaptcha, fazendo com que não seja mais necessária a permissão de microfone.
- Alteração nos nomes de classes e protocolos referentes ao FaceCatpcha.

#### 2.2.0

- [Documentoscopia com view customizável.](../Liveness2D/Documentscopy-CustomView.md)
- Ajuste na qualidade das imagens do Liveness.

#### 2.1.1

- [Documentoscopia.](../Liveness2D/Documentscopy-Usage.md)

#### [2.0.0](2.0.0.md) - BREAKING CHANGE

- Layout redesenhado.
- Mecanismo de view customizada.
- Nova assinatura do construtor do `FCCameraCapture`.
- Pequenas mudanças no protocolo `FCCameraCaptureDelegate`.

#### 1.2.2

- Ajuste no dismiss da câmera.

#### 1.2.1

- `BUILD_LIBRARIES_FOR_DISTRIBUTION` habilitado.

#### [1.2.0](1.2.0.md) - BREAKING CHANGE

- Foi criado um novo enum, `FaceCaptchaError`, que indica o tipo de erro retornado pelo SDK.
- Correção para o problema de câmera travada (tela preta).
- Melhorias no gerenciamento de memória, para evitar possíveis leaks.
- Alteração no construtor do `FCCameraCapture`, incluindo o atributo `showSetupErrors`, para indicar se o SDK deve exibir dialogs de erro durante o setup.
- Alteração nos métodos do protocolo `FCCameraCaptureDelegate`.
- Após realizar os desafios, agora o próprio SDK se encarrega de chamar o método `validate`, tirando essa responsabilidade do cliente.
- Ao minimizar o aplicativo durante o processo de biometria, agora o desafio é interrompido retornando o erro `FCCameraCapture.challengeInterrupted`
