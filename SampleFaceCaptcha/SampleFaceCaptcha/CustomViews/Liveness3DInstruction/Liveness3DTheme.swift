//
//  Livness3DTheme.swift
//  SampleFaceCaptcha
//
//  Created by Filipe Marques on 26/01/23.
//

import Foundation
import FaceCaptcha

public func createLiveness3DCustomTheme() -> Liveness3DTheme {
    
    var theme = Liveness3DTheme(.light)
    
    ///   Common Customization Properties
    
    //    MARK: - Common cancel button
    theme.cancelButtonCustomizationCustomImage = UIImage(named: "")
    theme.cancelButtonCustomizationLocation = .topLeft
    
    //    MARK: - Common faceTec frame
    theme.frameCustomizationBorderWidth = 14
    theme.frameCustomizationCornerRadius = 10
    theme.frameCustomizationBorderColor = .red
    theme.frameCustomizationBackgroundColor = .red
    theme.guidanceCustomizationBackgroundColors = [.brown, .systemPink]
    
    //    MARK: - Common overlay
    theme.overlayCustomizationBackgroundColor = .white
    theme.overlayCustomizationBrandingImage = UIImage(named: "")
    theme.overlayCustomizationShowBrandingImage = false
    
    //    MARK: - Common feedback bar
    theme.feedbackCustomizationCornerRadius = 10
    theme.feedbackCustomizationTextColor = .systemPink
    theme.feedbackCustomizationTextFont = UIFont(name: "", size: 14)
    
    //    MARK: - Common oval
    theme.ovarCustomizationStrokeWidth = 10
    theme.ovarCustomizationStrokeColor = .black
    theme.ovarCustomizationProgressStrokeWidth = 10
    theme.ovarCustomizationProgressColor1 = .purple
    theme.ovarCustomizationProgressColor2 = .green
    theme.ovarCustomizationProgressRadialOffset = 2
    
    //    MARK: - Common background color
    theme.guidanceCustomizationForegroundColor = .white
    
    //    MARK: - Common buttons
    theme.guidanceCustomizationButtonFont = UIFont(name: "", size: 14)
    theme.guidanceCustomizationButtonTextNormalColor = .purple
    theme.guidanceCustomizationButtonBackgroundNormalColor = .purple
    
    theme.guidanceCustomizationButtonTextHighlightColor = .red
    theme.guidanceCustomizationButtonBackgroundHighlightColor = .gray
    
    theme.guidanceCustomizationButtonTextDisabledColor = .black
    theme.guidanceCustomizationButtonBackgroundDisabledColor = .blue
    
    theme.guidanceCustomizationButtonBorderColor = .white
    theme.guidanceCustomizationButtonBorderWidth = 10
    theme.guidanceCustomizationButtonCornerRadius = 10
    
    //    MARK: - Common guidance customization
    theme.guidanceCustomizationReadyScreenTextBackgroundColor = .white
    theme.guidanceCustomizationReadyScreenTextBackgroundCornerRadius = 40
    
    ///   Get ready screen
    
    //    MARK: - Ready screen Guidance header
    theme.guidanceCustomizationReadyScreenOvarFillColor = .systemPink
    theme.guidanceCustomizationReadyScreenHeaderFont = UIFont(name: "", size: 14)
    theme.guidanceCustomizationHeaderFont = UIFont(name: "", size: 14)
    theme.guidanceCustomizationSubtextFont = UIFont(name: "", size: 14)
    theme.guidanceCustomizationReadyScreenHeaderTextColor = .green
    
    //    MARK: - Ready screen Guidance subheader
    theme.guidanceCustomizationReadyScreenSubtextFont = UIFont(name: "", size: 14)
    theme.guidanceCustomizationReadyScreenSubtextTextColor = .brown
    
    ///   Retry screen
    
    //    MARK: - Retry screen Header
    theme.guidanceCustomizationRetryScreenHeaderFont = UIFont(name: "", size: 14)
    theme.guidanceCustomizationRetryScreenHeaderTextColor = .systemPink
    
    //    MARK: - Retry screen Subheader
    theme.guidanceCustomizationRetryScreenSubtextFont = UIFont(name: "", size: 14)
    theme.guidanceCustomizationRetryScreenSubtextTextColor = .red
    
    //    MARK: - Retry screen guidance image
    theme.guidanceCustomizationRetryScreenImageBorderColor = .systemBlue
    theme.guidanceCustomizationRetryScreenImageBorderWidth = 10
    theme.guidanceCustomizationRetryScreenImageCornerRadius = 10
    theme.guidanceCustomizationRetryScreenOvarStrokeColor = .green
    
    ///   Result screen
    
    //    MARK: -  Result screen animation
    theme.resultScreenCustomizationAnimationRelativeScale = 10
    theme.resultScreenCustomizationCustomResultAnimationSuccess = 1
    theme.resultScreenCustomizationCustomResultAnimationUnSuccess = 2
    theme.resultScreenCustomizationCustomStaticResultAnimationSuccess = 3
    theme.resultScreenCustomizationCustomStaticResultAnimationUnSuccess = 4
    theme.resultScreenCustomizationResultAnimationBackgroundColor = .white
    theme.resultScreenCustomizationResultAnimationForegroundColor = .systemPink
    theme.resultScreenCustomizationResultAnimationSuccessBackgroundImage = UIImage(named: "back_button")
    theme.resultScreenCustomizationResultAnimationUnSuccessBackgroundImage = 5
    theme.resultAnimationStyle = .blob
    
    //    MARK: -  Result screen activity indicator
    theme.resultScreenCustomizationForegroundColor = .systemPink
    theme.resultScreenCustomizationBackgroundColors = [.white, .white]
    theme.resultScreenCustomizationActivityIndicatorColor = .systemBlue
    theme.resultScreenCustomizationCustomActivityIndicatorImage = nil
    theme.resultScreenCustomizationCustomActivityIndicatorRotationIntervar = 50
    theme.resultScreenCustomizationCustomActivityIndicatorAnimation = 100
    
    //    MARK: -  Result screen upload process
    theme.resultScreenCustomizationShowUploadProgressBar = true
    theme.resultScreenCustomizationUploadProgressFillColor = .red
    theme.resultScreenCustomizationUploadProgressTrackColor = .green
    
    //    MARK: -  Result screen text
    theme.resultScreenCustomizationMessageFont = UIFont(name: "", size: 15.0)
    theme.feedbackCustomizationEnablePulsatingText = true
    
    return theme
}
