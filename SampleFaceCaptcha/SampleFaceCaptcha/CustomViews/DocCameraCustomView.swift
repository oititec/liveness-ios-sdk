//
//  DocCameraCustomView.swift
//  SampleFaceCaptcha
//
//  Created by Felipe Augusto on 28/04/21.
//

import UIKit
import FaceCaptcha

class DocCameraCustomView: UIView {

    // MARK: - Outlets

    @IBOutlet weak var view: UIView!

    // MARK: - DocCameraView

    @IBOutlet weak var cameraContainer: CameraPreviewView!
    @IBOutlet weak var captureButton: UIButton!
    @IBOutlet weak var previewContainer: UIView!
    @IBOutlet weak var previewImageView: UIImageView!
    @IBOutlet weak var usePictureButton: UIButton!
    @IBOutlet weak var takeNewPictureButton: UIButton!
    @IBOutlet weak var rotationContainer: UIView!
    @IBOutlet weak var instructionLabel: UILabel!
    @IBOutlet weak var closeButton: UIButton!

    // MARK: - Lifecycle

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadFromNib()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib()
    }

    // MARK: - Methods

    private func loadFromNib() {
        let bundle = Bundle(for: type(of: self))
        bundle.loadNibNamed("\(type(of: self))", owner: self, options: nil)
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
}
