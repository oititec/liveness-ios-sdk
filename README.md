
# Liveness

Biblioteca Liveness para iOS.

## Instalação

### CocoaPods

Adicione a seguinte entrada no seu Podfile:

```rb
pod 'FaceCaptcha'
```

Rode `pod install`.
Não esqueça de colocar `import FaceCaptcha` nos arquivos em que for usar a biblioteca.

### Manual

1. Arraste o `FaceCaptcha.framework` para dentro do projeto:

![Instalação 1](Documentation/Images/installation_1.png)

2. Não se esqueça de marcar as opções abaixo:

![Instalação 2](Documentation/Images/installation_2.png)

3.  Nas configurações gerais do projeto, selecione o `​FaceCaptcha.framework​` e deixe em `Embed: Embed & Sign`:

![Instalação 3](Documentation/Images/installation_3.png)

#### Permissões de acesso:

No `Info.plist` do projeto, adicione as descrições de uso de câmera (`Privacy - Camera Usage Description`) e microfone (`Privacy - Microphone Usage Description`):

![Instalação 4](Documentation/Images/installation_4.png)

## Documentação

- [Troubleshooting](Documentation/Troubleshooting.md)

## Release notes

- As novidades das versões podem ser acessadas [neste link](Documentation/ReleaseNotes.md).

## Guias de migração

- [1.2.0](Documentation/Migration-Guide-1.2.0.md)
