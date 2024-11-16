//
//  LoginViewController.swift
//  Presentation
//
//  Created by Jordan Capa on 16/11/24.
//

import UIKit

class LoginViewController: UIViewController, LoginViewProtocol {
    var presenter: LoginPresenterProtocol?
    
    private let loginView = LoginView()
    
    override func loadView() {
        self.view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureActions()
    }
    
    private func configureActions() {
        loginView.loginButton.addTarget(self, action: #selector(didTapLogin), for: .touchUpInside)
    }
    
    @objc private func didTapLogin() {
        let username = loginView.usernameTextField.text ?? ""
        let password = loginView.passwordTextField.text ?? ""
        presenter?.handleLogin(username: username, password: password)
    }
    
    func showError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
