
# Liveness

Biblioteca Liveness para iOS.

## Instalação

O SDK está disponível via [CocoaPods](https://cocoapods.org/) (forma recomendada), mas também pode ser instalado manualmente.

### CocoaPods

1. No início do `Podfile`, inclua a linha:
```rb
source 'https://github.com/oititec/liveness-ios-specs.git'
```
2. Após isso, adicione a dependência:
```rb
pod 'FaceCaptcha', '~> 1.2.0'
```
3. Rode `pod install`.

### Manual

Para adicionar o SDK manualmente no seu projeto, siga estas [instruções](Documentation/ManualInstallation.md).

## Uso

### Permissões de acesso

 No `Info.plist` do projeto, adicione as descrições de uso de câmera (`Privacy - Camera Usage Description`) e microfone (`Privacy - Microphone Usage Description`):

![Instalação 4](Documentation/Images/installation_4.png)

## Documentação

- [Troubleshooting](Documentation/Troubleshooting.md)

## Release notes

- As novidades das versões podem ser acessadas [neste link](Documentation/ReleaseNotes.md).

## Guias de migração

- [1.2.0](Documentation/Migration-Guide-1.2.0.md) - BREAKING CHANGE
