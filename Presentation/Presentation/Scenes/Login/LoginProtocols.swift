//
//  LoginProtocols.swift
//  Presentation
//
//  Created by Jordan Capa on 16/11/24.
//
import UIKit

protocol LoginViewProtocol: AnyObject {
    func showError(message: String)
}

protocol LoginPresenterProtocol: AnyObject {
    func handleLogin(username: String, password: String)
}

protocol LoginRouterProtocol: AnyObject {
    static func createLoginModule() -> UIViewController
    func navigateToHome(from view: LoginViewProtocol)
}
