//
//  InstructionView.swift
//  SampleFaceCaptcha
//
//  Created by Filipe Marques on 26/01/23.
//

import UIKit
import FaceCaptcha

class InstructionView: UIView, CustomInstructionView {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadFromNib()
    }
    
    func changeLoadingVisibility(to visibility: FaceCaptcha.LoadingVisibility) {
        
    }
    
    private func loadFromNib() {
        let bundle = Bundle(for: type(of: self))
        
        bundle.loadNibNamed("\(type(of: self))", owner: self)
        
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(view)
    }
    
    
}
