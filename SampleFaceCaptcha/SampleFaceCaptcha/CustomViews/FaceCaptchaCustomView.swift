//
//  FaceCaptchaCustomView.swift
//  SampleFaceCaptcha
//
//  Created by Mauricio Lorenzetti on 13/11/20.
//

import UIKit
import FaceCaptcha

class FaceCaptchaCustomView: UIView, FaceCaptchaView {

    // MARK: - Outlets

    @IBOutlet weak var view: UIView!

    // MARK: - FCView

    @IBOutlet weak var cameraContainer: CameraPreviewView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var activityIndicatorView: UIView!
    @IBOutlet weak var challengeIcon: UIImageView!
    @IBOutlet weak var challengeText: UIImageView!
    @IBOutlet weak var initialInstructionView: UIView?
    @IBOutlet weak var challengeContainer: UIView?

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
