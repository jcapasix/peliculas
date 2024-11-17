//
//  MockLoginRouter.swift
//  PresentationTests
//
//  Created by Jordan Capa on 17/11/24.
//

import UIKit
@testable import Presentation

class MockLoginRouter: LoginRouterProtocol {
    
    var didNavigateToHome = false
    
    static func createLoginModule() -> UIViewController {
        return UIViewController()
    }

    func navigateToHome(from view: LoginViewProtocol) {
        didNavigateToHome = true
    }
}
