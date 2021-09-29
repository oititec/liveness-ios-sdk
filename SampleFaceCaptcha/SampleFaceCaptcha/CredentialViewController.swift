//
//  CredentialViewController.swift
//  SampleFaceCaptcha
//
//  Created by Felipe Augusto on 28/09/21.
//

import UIKit

class CredentialViewController: UIViewController {
    
    @IBOutlet weak var serverTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private var repository: CertifaceRepository?
    private let userDefaults = UserDefaultsManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        populateView()
    }
    
    private func populateView() {
        serverTextField.text = userDefaults.getString(forKey: .baseURL)
        usernameTextField.text = userDefaults.getString(forKey: .username)
    }
    
    @IBAction func viewTapped(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func savePressed(_ sender: Any) {
        
        view.endEditing(true)
        
        guard
            let baseURL = serverTextField.text,
            let username = usernameTextField.text,
            let password = passwordTextField.text
        else {
            return
        }
        
        saveButton.isHidden = true
        activityIndicator.isHidden = false
        
        repository = CertifaceRepository(baseURL: baseURL)
        
        repository?.authenticate(username: username, password: password, completion: { [weak self] token in
            
            DispatchQueue.main.async {
                
                self?.saveButton.isHidden = false
                self?.activityIndicator.isHidden = true
                
                if let token = token {
                    self?.userDefaults.saveString(value: token, forKey: .token)
                    self?.userDefaults.saveString(value: self?.serverTextField.text, forKey: .baseURL)
                    self?.userDefaults.saveString(value: self?.usernameTextField.text, forKey: .username)
                    self?.dismiss(animated: true, completion: nil)
                } else {
                    self?.showAlert(title: "Erro", message: "Erro ao autenticar")
                }
            }
        })
    }
}
