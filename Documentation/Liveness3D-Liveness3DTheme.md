# Guia de Customização do Liveness3DTheme 

A customização do fluxo de prova de vida, dar-se por meio da utilização da `Liveness3DTheme`. Essa classe na sua construção recebe o template padrão, podendo ser DarkTheme ou LightTheme.<br>
Abaixo, estão mapeadas as propriedades para customização do `Liveness3DTheme`.
<br>
<br>
## Tela inicial e atributos globais do fluxo de prova de Vida
<br><div>
<img width="130" height="250" src="./Images/liveness3d/dark_start_screen_liveness3d.png"> &nbsp; &nbsp;
<img width="130" height="250" src="./Images/liveness3d/light_start_screen_liveness3d.png"></div>
<br><br>

| **Atributo** | **Tipo** | **Valor Padrão** | **Descrição** |
|:-------------|:---------|:--------------|:--------------|
| guidanceCustomizationBackgroundColors | [UIColor] | Dark: #000000<br>Light: #FFFFFF | Define a cor de fundo do fluxo de Prova de vida | 
| guidanceCustomizationForegroundColor | UIColor | Dark: #000000<br>Light: #FFFFFF |  |
| guidanceCustomizationHeaderFont | UIFont | Ubuntu-Bold | Define a fonte do título |
| guidanceCustomizationSubtextFont | UIFont | Inter-Regular | Define a fonte do subtítulo |
| guidanceCustomizationButtonFont | UIFont | Inter-Bold | Define a fonte do botão que inicia o fluxo |
| guidanceCustomizationButtonTextNormalColor | UIColor | Dark: #FFFFFF<br>Light: #000000 | Define a cor do botão no seu status normal |
| guidanceCustomizationButtonBackgroundNormalColor | UIColor | #05D758 | Define a cor de fundo do botão no status normal |
| guidanceCustomizationButtonTextHighlightColor | UIColor | Dark: #FFFFFF<br>Light: #000000 | Define a cor do foreground |
| guidanceCustomizationButtonBackgroundHighlightColor | UIColor | Dark: #FFFFFF<br>Light: #000000 | Define a cor do foreground |
| guidanceCustomizationButtonTextDisabledColor | UIColor | Dark: #FFFFFF<br>Light: #000000 | Define a cor do label do botão no status desabilitado |
| guidanceCustomizationButtonBackgroundDisabledColor | UIColor | #b4fdd1 | Define a cor de fundo do botão no status desabilitado |
| guidanceCustomizationButtonBorderColor | UIColor | nil | Define a cor da boarda do botão |
| guidanceCustomizationButtonBorderWidth | Int32 | nil | Define a espessura da borda do botão |
| guidanceCustomizationButtonCornerRadius | Int32 | nil | Define o angulo de curvatura nos cantos do botão |
| ovarCustomizationStrokeWidth | Int32 | nil | Define a espessura da borda oval ao lado da captura do rosto |
| ovarCustomizationStrokeColor | UIColor | #05D758 | Define a cor da borda oval ao lado da captura do rosto |
| ovarCustomizationProgressStrokeWidth | UIColor | #05D758 | Define a cor da borda oval ao lado da captura do rosto que se movimenta ao longo da captura |
| ovarCustomizationProgressColor1 | UIColor | #05D758 | Define a cor da borda oval ao lado da captura do rosto que se movimenta ao longo da captura |
| ovarCustomizationProgressColor2 | UIColor | #05D758 | Define a cor da borda oval ao lado da captura do rosto que se movimenta ao longo da captura | 
| ovarCustomizationProgressRadialOffset | Int32 | nil | Define o raio da circunferência |
| frameCustomizationBorderWidth | Int32 | nil | Define a espessura da borda do frame ao redor do círculo oval de leitura facial |
| frameCustomizationCornerRadius | Int32 | nil | Define o angulo de curvatura nos cantos do frame ao redor do círculo oval de leitura facial |
| frameCustomizationBorderColor | UIColor | #05D758 | Define a cor da borda do frame ao redor do círculo oval de leitura facial |
| frameCustomizationBackgroundColor | UIColor | Dark: #000000<br>Light: #FFFFFF | Define a cor do fundo do frame ao redor do círculo oval de leitura facial |
| frameCustomizationElevation | Int32 | nil | Define o efeito de elevação do frame ao redor do círculo oval de leitura facial |
| overlayCustomizationBackgroundColor | UIColor | Dark: #FFFFFF<br>Light: #000000 | |
| overlayCustomizationBrandingImage | UIImage | nil | Define a logo que irá aparecer no parte inferior da tela durante o fluxo de prova de vida |
| overlayCustomizationShowBrandingImage | Bool | true | Define se a logo deve aparecer |
| feedbackCustomizationCornerRadius | Int32 | nil | Define o angulo de curvatura nos cantos da caixa de texto de feedback para o usuário |  
| feedbackCustomizationBackgroundColors | [UIColor] | Dark: #FFFFFF<br>Light: #000000 | Define a cor de fundo da caixa de texto de feedback para o usuário |
| feedbackCustomizationTextColor | UIColor | Dark: #000000<br>Light: #000000 | Define a cor do foreground |
| feedbackCustomizationTextFont | UIFont |  | Inter-Regular |
| feedbackCustomizationEnablePulsatingText | UIColor | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground | 
| feedbackCustomizationElevation | Int32 | nil | Define o efeito de elevação da caixa de mensagens |
| cancelButtonCustomizationCustomImage | UIImage | <img src="./Images/liveness3d/ic_back_button_liveness3D.png" width="30" height="30">  | Define a imagem customizada para o botão cancelar / voltar |
| cancelButtonCustomizationLocation | CancelButtonLocation | topLeft | define a posição do botão cancelar / voltar do fluxo. |

<br><br>
## Tela de leitura facial do fluxo de prova de Vida
<br>
<div>
<img width="130" height="250" src="./Images/liveness3d/dark_ready_screen_liveness3d.png"> &nbsp; &nbsp;
<img width="130" height="250" src="./Images/liveness3d/light_ready_screen_liveness3d.png"></div>
<br><br>

| **Atributo** | **Tipo** | **Valor Padrão** | **Descrição** |
|:-------------|:---------|:--------------|:--------------|
| guidanceCustomizationReadyScreenHeaderFont | UIFont | Ubuntu-Bold | Define a fonte do título da tela de leitura facial |
| guidanceCustomizationReadyScreenHeaderTextColor | UIColor | | Define a cor do título da tela de leitura facial |
| guidanceCustomizationReadyScreenHeaderAttributedString | NSAttributedString | nil | Define o conteúdo do título da tela de leitura facial, em formato de AttributedString |
| guidanceCustomizationReadyScreenSubtextFont | UIFont | Inter-Regular | Define a fonte do subtítulo da tela de leitura facial |
| guidanceCustomizationReadyScreenSubtextTextColor | UIColor | Dark: #FFFFFF<br>Light: #000000 | Define a cor subtítulo da ela de inicio de captura do fluxo de prova de vida |
| guidanceCustomizationReadyScreenSubtextAttributedString | NSAttributedString | nil | |
| guidanceCustomizationReadyScreenOvarFillColor | UIColor | #05D758 | Define a cor do foreground |
| guidanceCustomizationReadyScreenTextBackgroundColor | UIColor | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground |
| guidanceCustomizationReadyScreenTextBackgroundCornerRadius | Int32 | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground |

<br><br>
## Tela de tentar novament do fluxo de prova de Vida
<br>
<div>
<img width="130" height="250" src="./Images/liveness3d/dark_retry_screen_liveness3d.png"> &nbsp; &nbsp;
<img width="130" height="250" src="./Images/liveness3d/light_retry_screen_liveness3d.png"></div>
<br><br>

| **Atributo** | **Tipo** | **Valor Padrão** | **Descrição** |
|:-------------|:---------|:--------------|:--------------|
| guidanceCustomizationRetryScreenHeaderFont | UIFont | Ubuntu-Bold | Define a fonte do título da tela de tentar novamente |
| guidanceCustomizationRetryScreenHeaderTextColor | UIColor | Dark: #FFFFFF<br>Light: #1E1E1E | Define a cor do título da tela de tentar novamente |
| guidanceCustomizationRetryScreenHeaderAttributedString | NSAttributedString | nil | Define o conteúdo para o título da tela de tentar novamente no formato de NSAttributedString |
| guidanceCustomizationRetryScreenSubtextAttributedString | NSAttributedString | nil | Define o conteúdo para o subtítulo da tela de tentar novamente no formato de NSAttributedString |
| guidanceCustomizationRetryScreenSubtextFont | UIFont | Inter-Regular | Define a fonte para o subtítulo da tela de tentar novamente |
| guidanceCustomizationRetryScreenSubtextTextColor | UIColor | Dark: #FFFFFF<br>Light: #666666 | Define a cor para o subtítulo da tela de tentar novamente |
| guidanceCustomizationRetryScreenImageBorderColor | UIColor | #05D758 | Define a cor da borda das imagens de "Foto ideal" e "sua foto" |
| guidanceCustomizationRetryScreenImageBorderWidth | Int32 | nil | Define a espessura da borda das imagens de "Foto ideal" e "sua foto"  |
| guidanceCustomizationRetryScreenImageCornerRadius | Int32 | nil | Define o angulo de curvatura nos cantos da borda das imagens de "Foto ideal" e "sua foto" |
| guidanceCustomizationRetryScreenOvarStrokeColor | UIColor | #05D758 | Define a cor do círculo oval ao redor das das imagens de "Foto ideal" e "sua foto" |

<br><br>
## Tela de carregando e resultado do fluxo de prova de Vida
<br>
<div>
<img width="120" height="250" src="./Images/liveness3d/light_upload_screen_liveness3d.png"> &nbsp; &nbsp;
<img width="120" height="250" src="./Images/liveness3d/light_result_screen_liveness3d.png"></div>
<br><br>

| **Atributo** | **Tipo** | **Valor Padrão** | **Descrição** |
|:-------------|:---------|:--------------|:--------------|
| resultScreenCustomizationAnimationRelativeScale | Int32 | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground |
| resultScreenCustomizationForegroundColor | UIColor | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground |
| resultScreenCustomizationBackgroundColors | [UIColor] | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground |
| resultScreenCustomizationActivityIndicatorColor | UIColor | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground |
| resultScreenCustomizationCustomActivityIndicatorImage | UIImage | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground |
| resultScreenCustomizationCustomActivityIndicatorRotationIntervar | INT32 | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground |
| resultScreenCustomizationCustomActivityIndicatorAnimation | UIColor | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground |
| resultScreenCustomizationShowUploadProgressBar | UIColor | #05D758 |  |
| resultScreenCustomizationUploadProgressFillColor | UIColor | #05D758 | Define a cor da barra de progresso do carregando do fluxo de prova de vida |
| resultScreenCustomizationUploadProgressTrackColor | UIColor | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground |
| resultScreenCustomizationResultAnimationBackgroundColor | UIColor | Dark: #000000<br>Light: #FFFFFF | Define a cor de fundo da tela de resultado do fluxo de prova de vida |
| resultScreenCustomizationResultAnimationForegroundColor | UIColor | nil |  |
| resultScreenCustomizationResultAnimationSuccessBackgroundImage | UIImage | nil | Define a imagem da tela de resultado da operação para caso de sucesso |
| resultScreenCustomizationResultAnimationUnSuccessBackgroundImage | UIImage | nil | Define a imagem da tela de resultado da operação para caso de falha |    
| resultScreenCustomizationCustomResultAnimationSuccess | UIColor | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground |
| resultScreenCustomizationCustomResultAnimationUnSuccess | UIColor | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground |
| resultScreenCustomizationCustomStaticResultAnimationSuccess | UIColor | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground |
| resultScreenCustomizationCustomStaticResultAnimationUnSuccess | UIColor | UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00) | Define a cor do foreground |
| resultScreenCustomizationMessageFont | UIFont | nil | Define a fonte para o o texto da tela de resultado da prova de vida |