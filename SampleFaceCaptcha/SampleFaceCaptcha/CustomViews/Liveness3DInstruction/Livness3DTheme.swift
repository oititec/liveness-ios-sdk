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
    
    /// Common Customization Properties

    //    MARK: - Cancel button
    theme.cancelButtonCustomizationCustomImage = UIImage(named: "")
    theme.cancelButtonCustomizationLocation = .topLeft
    
    //    MARK: - FaceTec frame
    theme.frameCustomizationBorderWidth = 14
    theme.frameCustomizationCornerRadius = 10
    theme.frameCustomizationBorderColor = .red
    theme.frameCustomizationBackgroundColor = .red
    theme.frameCustomizationElevation = 10
    
    //    MARK: - Overlay
    theme.overlayCustomizationBackgroundColor = .green
    theme.overlayCustomizationBrandingImage = UIImage(named: "")
    theme.overlayCustomizationShowBrandingImage = false
    
    //    MARK: - Feedback bar
    theme.feedbackCustomizationCornerRadius = 10
    theme.feedbackCustomizationTextColor = .systemPink
    theme.feedbackCustomizationTextFont = UIFont(name: "", size: 14)
    
    //    MARK: - Oval
    theme.ovarCustomizationStrokeWidth = 10
    theme.ovarCustomizationStrokeColor = .black
    theme.ovarCustomizationProgressStrokeWidth = 10
    theme.ovarCustomizationProgressColor1 = .purple
    theme.ovarCustomizationProgressColor2 = .green
    theme.ovarCustomizationProgressRadialOffset = 2
    
    //    MARK: - Background color
    theme.guidanceCustomizationForegroundColor = .white
    
    //    MARK: - Buttons
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
    
    //    MARK: - Guidance customization
    theme.guidanceCustomizationReadyScreenTextBackgroundColor = .systemPink
    theme.guidanceCustomizationReadyScreenTextBackgroundCornerRadius = 10
    
    ///
    theme.guidanceCustomizationBackgroundColors = [.systemBlue, .brown]
    theme.guidanceCustomizationHeaderFont = UIFont(name: "", size: 14)
    theme.guidanceCustomizationSubtextFont = UIFont(name: "", size: 14)
    theme.guidanceCustomizationReadyScreenHeaderFont = UIFont(name: "", size: 14)
    theme.guidanceCustomizationReadyScreenHeaderTextColor = .green
    theme.guidanceCustomizationReadyScreenHeaderAttributedString = NSAttributedString(string: "Titulo")
    theme.guidanceCustomizationReadyScreenSubtextFont = UIFont(name: "", size: 14)
    theme.guidanceCustomizationReadyScreenSubtextTextColor = .brown
    theme.guidanceCustomizationReadyScreenSubtextAttributedString = NSAttributedString(string: "Subtexto")
    theme.guidanceCustomizationRetryScreenHeaderFont = UIFont(name: "", size: 14)
    theme.guidanceCustomizationRetryScreenHeaderTextColor = .systemPink
    theme.guidanceCustomizationRetryScreenHeaderAttributedString = NSAttributedString(string: "Retry titulo")
    theme.guidanceCustomizationRetryScreenSubtextFont = UIFont(name: "", size: 14)
    theme.guidanceCustomizationRetryScreenSubtextTextColor = .red
    theme.guidanceCustomizationRetryScreenSubtextAttributedString = NSAttributedString(string: "Retry subtexto")
    theme.guidanceCustomizationReadyScreenOvarFillColor = .systemPink
    theme.guidanceCustomizationRetryScreenImageBorderColor = .systemBlue
    theme.guidanceCustomizationRetryScreenImageBorderWidth = 10
    theme.guidanceCustomizationRetryScreenImageCornerRadius = 10
    theme.guidanceCustomizationRetryScreenOvarStrokeColor = .green
    theme.resultScreenCustomizationAnimationRelativeScale = 10
    theme.resultScreenCustomizationForegroundColor = .red
    theme.resultScreenCustomizationBackgroundColors = [.white, .red]
    theme.resultScreenCustomizationActivityIndicatorColor = .systemBlue
    theme.resultScreenCustomizationCustomActivityIndicatorImage = nil
    theme.resultScreenCustomizationCustomActivityIndicatorRotationIntervar = 1230
    theme.resultScreenCustomizationCustomActivityIndicatorAnimation = 1
    theme.resultScreenCustomizationShowUploadProgressBar = true
    theme.resultScreenCustomizationUploadProgressFillColor = .red
    theme.resultScreenCustomizationUploadProgressTrackColor = .green
    theme.resultScreenCustomizationResultAnimationBackgroundColor = .green
    theme.resultScreenCustomizationResultAnimationForegroundColor = .purple
    theme.resultScreenCustomizationResultAnimationSuccessBackgroundImage = UIImage()
    theme.resultScreenCustomizationResultAnimationUnSuccessBackgroundImage = 5
    theme.resultScreenCustomizationCustomResultAnimationSuccess = 1
    theme.resultScreenCustomizationCustomResultAnimationUnSuccess = 2
    theme.resultScreenCustomizationCustomStaticResultAnimationSuccess = 3
    theme.resultScreenCustomizationCustomStaticResultAnimationUnSuccess = 4
    theme.resultScreenCustomizationMessageFont = UIFont(name: "", size: 15.0)
    theme.feedbackCustomizationEnablePulsatingText = true
    theme.feedbackCustomizationElevation = 10
    theme.resultAnimationStyle = .blob
    theme.resultScreenSuccessMessage = "Valeu!!"
    
    
    return theme
}
