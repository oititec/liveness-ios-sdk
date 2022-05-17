# Guia de Customização do Liveness3DTheme 

Abaixo, estão mapeadas as propriedades para customização do `Liveness3DTheme`.

    //Guidance customization
    var guidanceCustomizationBackgroundColors: UIColor?
    var guidanceCustomizationForegroundColor: UIColor = UIColor(red: 1.00, green: 1.00, blue: 1.00, alpha: 1.00)
    var guidanceCustomizationHeaderFont: UIFont? = nil
    var guidanceCustomizationSubtextFont: UIFont? = nil

    //Ready Screen
    var guidanceCustomizationReadyScreenHeaderFont: UIFont? = nil
    var guidanceCustomizationReadyScreenHeaderTextColor: Int? = 0
    var guidanceCustomizationReadyScreenHeaderAttributedString: String? = ""
    var guidanceCustomizationReadyScreenSubtextFont: UIFont? = nil
    var guidanceCustomizationReadyScreenSubtextTextColor: Int? = 0
    var guidanceCustomizationReadyScreenSubtextAttributedString: String? = ""

    //Retry Screen
    var guidanceCustomizationRetryScreenHeaderFont: UIFont? = nil
    var guidanceCustomizationRetryScreenHeaderTextColor: Int? = 0
    var guidanceCustomizationRetryScreenHeaderAttributedString: String = ""
    var guidanceCustomizationRetryScreenSubtextFont: UIFont? = nil
    var guidanceCustomizationRetryScreenSubtextTextColor: Int? = 0
    var guidanceCustomizationRetryScreenSubtextAttributedString: String? = ""
    var guidanceCustomizationButtonFont: UIFont? = nil
    var guidanceCustomizationButtonTextNormalColor: UIColor = UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1.00)
    var guidanceCustomizationButtonBackgroundNormalColor: UIColor = UIColor(red: 0.02, green: 0.84, blue: 0.35, alpha: 1.00)
    var guidanceCustomizationButtonTextHighlightColor: UIColor = UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1.00)
    var guidanceCustomizationButtonBackgroundHighlightColor: UIColor = UIColor(red: 0.22, green: 0.43, blue: 0.60, alpha: 1.00)
    var guidanceCustomizationButtonTextDisabledColor: UIColor = UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1.00)
    var guidanceCustomizationButtonBackgroundDisabledColor: UIColor = UIColor(red: 0.60, green: 0.93, blue: 0.73, alpha: 1.00)
    var guidanceCustomizationButtonBorderColor: Int? = 0
    var guidanceCustomizationButtonBorderWidth: Int? = -1
    var guidanceCustomizationButtonCornerRadius: Int? = -1
    var guidanceCustomizationReadyScreenOvarFillColor: UIColor? = UIColor(red: 0.00, green: 1.00, blue: 1.00, alpha: 1.00)
    var guidanceCustomizationReadyScreenTextBackgroundColor: Int? = -1
    var guidanceCustomizationReadyScreenTextBackgroundCornerRadius: Int? = -1
    var guidanceCustomizationRetryScreenImageBorderColor: UIColor = UIColor(red: 0.25, green: 0.50, blue: 0.70, alpha: 1.00)
    var guidanceCustomizationRetryScreenImageBorderWidth: Int? = -1
    var guidanceCustomizationRetryScreenImageCornerRadius: Int? = -1
    var guidanceCustomizationRetryScreenOvarStrokeColor: Int? = -1

    //Result Screen Customization
    var resultScreenCustomizationAnimationRelativeScale: Float = 1.0
    var resultScreenCustomizationForegroundColor: UIColor = UIColor(red: 0.25, green: 0.50, blue: 0.70, alpha: 1.00)
    var resultScreenCustomizationBackgroundColors: [UIColor] = [UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1.00), UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1.00)]
    var resultScreenCustomizationActivityIndicatorColor: UIColor = UIColor(red: 0.02, green: 0.84, blue: 0.35, alpha: 1.00)
    var resultScreenCustomizationCustomActivityIndicatorImage: Int = 0
    var resultScreenCustomizationCustomActivityIndicatorRotationIntervar: Int = 1000
    var resultScreenCustomizationCustomActivityIndicatorAnimation: Int = 0
    var resultScreenCustomizationShowUploadProgressBar: Bool = true
    var resultScreenCustomizationUploadProgressFillColor: UIColor = UIColor(red: 0.02, green: 0.84, blue: 0.35, alpha: 1.00)
    var resultScreenCustomizationUploadProgressTrackColor: UIColor = UIColor(red: 0.02, green: 0.84, blue: 0.35, alpha: 1.00)
    var resultScreenCustomizationResultAnimationBackgroundColor: UIColor = UIColor(red: 0.02, green: 0.84, blue: 0.35, alpha: 1.00)
    var resultScreenCustomizationResultAnimationForegroundColor: UIColor = UIColor(red: 0.02, green: 0.84, blue: 0.35, alpha: 1.00)
    var resultScreenCustomizationResultAnimationSuccessBackgroundImage: Int = 0
    var resultScreenCustomizationResultAnimationUnSuccessBackgroundImage: Int = 0
    var resultScreenCustomizationCustomResultAnimationSuccess: Int = 0
    var resultScreenCustomizationCustomResultAnimationUnSuccess: Int = 0
    var resultScreenCustomizationCustomStaticResultAnimationSuccess: Int = 0
    var resultScreenCustomizationCustomStaticResultAnimationUnSuccess: Int = 0
    var resultScreenCustomizationMessageFont: UIFont? = nil

    //Ovar Customization
    var ovarCustomizationStrokeWidth: Int? = -1
    var ovarCustomizationStrokeColor: UIColor = UIColor(red: 0.02, green: 0.84, blue: 0.35, alpha: 1.00)
    var ovarCustomizationProgressStrokeWidth: Int? = -1
    var ovarCustomizationProgressColor1: UIColor = UIColor(red: 0.02, green: 0.84, blue: 0.35, alpha: 1.00)
    var ovarCustomizationProgressColor2: UIColor = UIColor(red: 0.02, green: 0.84, blue: 0.35, alpha: 1.00)
    var ovarCustomizationProgressRadialOffset: Int? = -1

    //Frame Customization
    var frameCustomizationBorderWidth: Int? = -1
    var frameCustomizationCornerRadius: Int32 =  20
    var frameCustomizationBorderColor: UIColor = UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1.00)
    var frameCustomizationBackgroundColor: UIColor = UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1.00)
    var frameCustomizationElevation: Int? = 0

    //Overlay Customization
    var overlayCustomizationBackgroundColor: UIColor = UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1.00)
    var overlayCustomizationBrandingImage: UIImage? = nil
    var overlayCustomizationShowBrandingImage: Bool = false

    //Feedback Customization
    var feedbackCustomizationCornerRadius: Int? = -1
    var feedbackCustomizationBackgroundColors: CAGradientLayer = generateDefaultGradient()
    var feedbackCustomizationTextColor: UIColor = UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1.00)
    var feedbackCustomizationTextFont: UIFont? = nil
    var feedbackCustomizationEnablePulsatingText: Bool = true
    var feedbackCustomizationElevation: Int? = 10

    //Cancel Button Customization
    var cancelButtonCustomizationCustomImage: UIImage? = UIImage(named: "ic_nav_close_button")
    var cancelButtonCustomizationLocation: FaceTecCancelButtonLocation = .topLeft
    
    
