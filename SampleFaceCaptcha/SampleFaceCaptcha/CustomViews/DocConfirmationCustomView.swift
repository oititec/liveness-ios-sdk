//
//  DocConfirmationCustomView.swift
//  SampleFaceCaptcha
//
//  Created by Felipe Augusto on 28/04/21.
//

import UIKit
import FaceCaptcha

class DocConfirmationCustomView: UIView {

    // MARK: - Outlets

    @IBOutlet weak var view: UIView!

    // MARK: - DocConfirmationView

    @IBOutlet weak var container: UIView!
    @IBOutlet weak var pictureTwoContainer: UIView!
    @IBOutlet weak var pictureOneImageView: UIImageView!
    @IBOutlet weak var pictureTwoImageView: UIImageView!
    @IBOutlet weak var changePictureOneButton: UIButton!
    @IBOutlet weak var changePictureTwoButton: UIButton!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var activityIndicatorView: UIView!

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
