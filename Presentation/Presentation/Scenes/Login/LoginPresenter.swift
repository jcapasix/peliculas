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
        router?.navigateToHome(from: view!)
        return
//        guard !username.isEmpty else {
//            view?.showError(message: "The username cannot be empty.")
//            return
//        }
//        
//        guard !password.isEmpty else {
//            view?.showError(message: "The password cannot be empty.")
//            return
//        }
//        
//        if username == validUsername && password == validPassword {
//            print("Login successful!") // Aquí podrías navegar a la siguiente pantalla
//            router?.navigateToHome(from: view!)
//        } else {
//            view?.showError(message: "Incorrect username or password.")
//        }
    }
}
