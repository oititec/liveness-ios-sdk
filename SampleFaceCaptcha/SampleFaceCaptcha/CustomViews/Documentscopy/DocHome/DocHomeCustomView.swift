//
//  DocHomeCustomView.swift
//  SampleFaceCaptcha
//
//  Created by Felipe Augusto on 27/04/21.
//

import UIKit
import FaceCaptcha

class DocHomeCustomView: UIView {

    // MARK: - Outlets

    @IBOutlet weak var view: UIView!

    // MARK: - DocHomeView

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var singlePictureView: UIControl!
    @IBOutlet weak var dualPictureView: UIControl!
    @IBOutlet weak var activityIndicatorView: UIView!
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
