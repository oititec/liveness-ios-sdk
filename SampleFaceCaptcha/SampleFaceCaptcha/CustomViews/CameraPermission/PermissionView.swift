//
//  PermissionView.swift
//  SampleFaceCaptcha
//
//  Created by Filipe Marques on 26/01/23.
//

import UIKit
import FaceCaptcha


final class PermissionView: UIView, CustomCameraPermissionView {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var checkPermissionButton: UIButton!
    @IBOutlet weak var openSettingsButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadFromNib()
    }
    
    
    func showBottomSheet() {
        openSettingsButton.isHidden = false
        closeButton.isHidden = false
    }
    
    private func loadFromNib() {
        let bundle = Bundle(for: type(of: self))
        
        bundle.loadNibNamed("\(type(of: self))", owner: self, options: nil)
        
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(view)
        
        openSettingsButton.isHidden = true
        closeButton.isHidden = true
    }
}
