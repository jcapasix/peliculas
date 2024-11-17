//
//  MockLoginView.swift
//  PresentationTests
//
//  Created by Jordan Capa on 17/11/24.
//

import UIKit
@testable import Presentation

class MockLoginView: LoginViewProtocol {
    var errorMessage: String?

    func showError(message: String) {
        errorMessage = message
    }
}
