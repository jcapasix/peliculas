//
//  LoginRouter.swift
//  Presentation
//
//  Created by Jordan Capa on 16/11/24.
//

import UIKit

class LoginRouter: LoginRouterProtocol {
    static func createLoginModule() -> UIViewController {
        let viewController = LoginViewController()
        let router = LoginRouter()
        let presenter = LoginPresenter(view: viewController, router: router)
        viewController.presenter = presenter
        return viewController
    }
    
    func navigateToHome(from view: LoginViewProtocol) {
        guard let viewController = view as? UIViewController else { return }
        let homeViewController = HomeRouter.createHomeModule()
        viewController.navigationController?.pushViewController(homeViewController, animated: true)
    }
}
