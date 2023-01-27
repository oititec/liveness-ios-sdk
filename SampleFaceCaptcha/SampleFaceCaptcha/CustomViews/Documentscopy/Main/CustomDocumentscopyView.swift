//
//  CustomDocumentscopyView.swift
//  SampleFaceCaptcha
//
//  Created by Filipe Marques on 26/01/23.
//

import UIKit
import FaceCaptcha

class CustomDocumentscopyView: UIView, DocumentscopyCustomView {
    @IBOutlet weak var cameraMask: UIView!
    @IBOutlet weak var frontIndicatorView: DocumentscopyIndicatorView!
    @IBOutlet weak var backIndicatorView: DocumentscopyIndicatorView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var cameraPreview: DocumentscopyCameraPreviewView!
    @IBOutlet weak var cameraVisualizer: UIView!
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var usePictureButton: DocumentscopyEditableButton!
    @IBOutlet weak var takeNewPictureButton: UIButton!
    @IBOutlet weak var captureButton: UIButton!
    @IBOutlet weak var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadFromNib()
    }
    
    func displayConfirmationSheet(visibility: FaceCaptcha.DocumentscopyConfirmationSheetVisibility, animated: Bool) { }

    private func loadFromNib() {
        let bundle = Bundle(for: type(of: self))
        bundle.loadNibNamed("\(type(of: self))", owner: self)
        
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(view)
    }
    
}

class CustomIndicator: DocumentscopyIndicatorView {
    func setFocus(to value: Bool, animated: Bool) {
        if value {
            backgroundColor = .green
        } else {
            backgroundColor = .red
        }
    }
}

class CustomButton: DocumentscopyEditableButton {
    func changeTitle(to newTitle: String) {
        setTitle(newTitle, for: .normal)
    }
}
