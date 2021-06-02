# Changelog

#### 2.2.0
- [Documentoscopia com view customizável.](Documentscopy-CustomView.md)

#### 2.1.1
- [Documentoscopia.](Documentscopy-Usage.md)

#### [2.0.0](Migration-Guide-2.0.0.md) - BREAKING CHANGE
- Layout redesenhado.
- Mecanismo de view customizada.
- Nova assinatura do construtor do `FCCameraCapture`.
- Pequenas mudanças no protocolo `FCCameraCaptureDelegate`.

#### 1.2.2
- Ajuste no dismiss da câmera.

#### 1.2.1
- `BUILD_LIBRARIES_FOR_DISTRIBUTION` habilitado.

#### [1.2.0](Migration-Guide-1.2.0.md) - BREAKING CHANGE
- Foi criado um novo enum, `FaceCaptchaError`, que indica o tipo de erro retornado pelo SDK.
- Correção para o problema de câmera travada (tela preta).
- Melhorias no gerenciamento de memória, para evitar possíveis leaks.
- Alteração no construtor do `FCCameraCapture`, incluindo o atributo `showSetupErrors`, para indicar se o SDK deve exibir dialogs de erro durante o setup.
- Alteração nos métodos do protocolo `FCCameraCaptureDelegate`.
- Após realizar os desafios, agora o próprio SDK se encarrega de chamar o método `validate`, tirando essa responsabilidade do cliente.
- Ao minimizar o aplicativo durante o processo de biometria, agora o desafio é interrompido retornando o erro `FCCameraCapture.challengeInterrupted`
