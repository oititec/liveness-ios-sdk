//
//  Liveness3DCustomTexts.swift
//  SampleFaceCaptcha
//
//  Created by Vitor Souza on 07/06/23.
//  Copyright © 2023 Oiti. All rights reserved.
//

import Foundation
import FaceCaptcha

extension ViewController {
    func createLiveness3DCustomTexts() -> [Liveness3DTextKey: String] {
        return [
            // Ready
            .readyHeader1: "ready_title_1",
            .readyHeader2: "ready_title_2",
            .readyMessage1: "ready_message_1",
            .readyMessage2: "ready_message_2.",
            .readyButton: "ready_button",
            
            // feedback
            .feedbackCenterFace: "feedback_center_face",
            .feedbackFaceNotFound: "feedback_no_face",
            .feedbackFaceNotLookingStraightAhead: "feedback_straight_ahead",
            .feedbackFaceNotUpright: "feedback_upright",
            .feedbackHoldSteady: "feedback_hold",
            .feedbackMovePhoneAway: "feedback_move_away",
            .feedbackMovePhoneCloser: "feedback_move_closer",
            .feedbackMovePhoneToEyeLevel: "feedback_move_eye_level",
            .feedbackUseEvenLighting: "feedback_use_even_lighting",
            .feedbackFrameYourFace: "feedback_start",
            .feedbackPositionFaceStraightInOval: "feedback_look_forward",
            .feedbackHoldSteady1: "feedback_hold_3",
            .feedbackHoldSteady2: "feedback_hold_2",
            .feedbackHoldSteady3: "feedback_hold_1",
            .feedbackEyesStraightAhead: "feedback_straight_ahead",
            .feedbackNeutralExpression: "feedback_no_smile",
            .feedbackBrightenYourEnvironment: "feedback_too_dark",
            .feedbackRemoveDarkGlasses: "feedback_remove_dark_glasses",
            .feedbackConditionsTooBright: "feedback_conditions_too_bright",
            
            // Upload
            .resultUploadMessage: "upload_message",
            .resultSuccessMessage: "upload_all_right_message",
            
            // Retry
            .retryHeader: "retry_header",
            .retrySubheader: "retry_subheader",
            .retryMessageSmile: "retry_message_1",
            .retryMessageLightning: "retry_message_2",
            .retryMessageContrast: "retry_message_3",
            .retryYourPicture: "retry_your_image",
            .retryIdealPicture: "retry_ideal_image",
            .retryButton: "retry_again_button",
        ]
    }
}
