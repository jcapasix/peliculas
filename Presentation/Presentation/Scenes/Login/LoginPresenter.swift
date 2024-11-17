//
//  LoginPresenter.swift
//  Presentation
//
//  Created by Jordan Capa on 16/11/24.
//

import Foundation

class LoginPresenter: LoginPresenterProtocol {
    weak var view: LoginViewProtocol?
    var router: LoginRouterProtocol?
    
    private let validUsername = "Admin"
    private let validPassword = "Password*123"
    
    init(view: LoginViewProtocol, router: LoginRouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func handleLogin(username: String, password: String) {
        guard !username.isEmpty else {
            view?.showError(message: "Por favor, ingresa tu nombre de usuario. (Admin | Password*123)")
            return
        }
        
        guard !password.isEmpty else {
            view?.showError(message: "La contraseña no puede estar vacía. Intenta de nuevo. (Admin | Password*123)")
            return
        }
        
        if username == validUsername && password == validPassword {
            router?.navigateToHome(from: view!)
        } else {
            view?.showError(message: "Credenciales incorrectas (Admin | Password*123)")
        }
    }
}
