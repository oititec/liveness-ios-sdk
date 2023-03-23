# Changelog

#### 4.1.0
- O *loading* na tela de instruções da Documentoscopia não é mais aplicado na *custom view*.
- O estado do loading da tela de instruções da Documentoscopia pode ser verificado através da implementação do método `changeLoadingVisibility(to:)`, presente no protocolo `DocumentscopyCustomInstructionView`. [Guia de customização de view customizada](../Liveness2D/Documentscopy-CustomView.md#custominstructionview).
- Durante o carregamento da tela de instruções da Documentoscopia, as *views* de RG e CNH ficarão desabilitadas.

#### [4.0.9](4.0.9.md) - BREAKING CHANGE
- Atualização da FaceTec.
- Alteração do comportamento e do visual da tela de captura de permissão de câmera.
- Alteração no inicializador do `Liveness3DViewController`.
- Alterações dos códigos de erro.

#### 4.0.8
- Melhoria na qualidade das imagens capturadas durante o processo de documentoscopia para envio e validação.
- Melhoria na qualidade da pré visualização durante o processo de documentoscopia.

#### 4.0.7
- Correção no apontamento interno dos ambientes de homologação (HML) e produção (PRD) para validação do Liveness3D.
- Correção no envio de logs do SDK em homologação.

#### [4.0.6](4.0.6.md) - BREAKING CHANGE
- Alterações no protocolo `DocumentscopyCustomView`. [Documentoscopia](../Liveness2D/Documentscopy-CustomView.md).
- Alterações no protocolo `CustomCameraPermissionView`. [Documentoscopia](../Liveness2D/Documentscopy-CustomView.md) e [Liveness3D](../Liveness3D/Liveness3D-CustomView.md).

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
