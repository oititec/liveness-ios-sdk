# Liveness - Release Notes

#### [1.2.0](Migration-Guide-1.2.0.md)
- Foi criado um novo enum, `FaceCaptchaError`, que indica o tipo de erro retornado pelo SDK.
- Correção para o problema de câmera travada (tela preta).
- Melhorias no gerenciamento de memória, para evitar possíveis leaks.
- Alteração no construtor do `FCCameraView`, incluindo o atributo `showSetupErrors`, para indicar se o SDK deve exibir dialogs de erro durante o setup.
- Alteração nos métodos do protocolo `FCCameraCaptureDelegate`.
- Após realizar os desafios, agora o próprio SDK se encarrega de chamar o método `validate`, tirando essa responsabilidade do cliente.
- Ao minimizar o aplicativo durante o processo de biometria, agora o desafio é interrompido retornando o erro `FCCameraCapture.challengeInterrupted`
