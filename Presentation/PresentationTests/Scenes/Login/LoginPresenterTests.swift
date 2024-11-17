//
//  LoginPresenterTests.swift
//  PresentationTests
//
//  Created by Jordan Capa on 17/11/24.
//

import XCTest
@testable import Presentation

class LoginPresenterTests: XCTestCase {

    var presenter: LoginPresenter!
    var mockView: MockLoginView!
    var mockRouter: MockLoginRouter!

    override func setUp() {
        super.setUp()
        mockView = MockLoginView()
        mockRouter = MockLoginRouter()
        presenter = LoginPresenter(view: mockView, router: mockRouter)
    }

    override func tearDown() {
        presenter = nil
        mockView = nil
        mockRouter = nil
        super.tearDown()
    }

    func testHandleLogin_EmptyUsername_ShowsError() {
        presenter.handleLogin(username: "", password: "Password*123")
        XCTAssertTrue(mockView.errorMessage == "Por favor, ingresa tu nombre de usuario. (Admin | Password*123)")
    }

    func testHandleLogin_EmptyPassword_ShowsError() {
        presenter.handleLogin(username: "Admin", password: "")
        XCTAssertTrue(mockView.errorMessage == "La contraseña no puede estar vacía. Intenta de nuevo. (Admin | Password*123)")
    }

    func testHandleLogin_InvalidCredentials_ShowsError() {
        presenter.handleLogin(username: "Admin", password: "Admin")
        XCTAssertTrue(mockView.errorMessage == "Credenciales incorrectas (Admin | Password*123)")
    }

    func testHandleLogin_ValidCredentials_NavigatesToHome() {
        presenter.handleLogin(username: "Admin", password: "Password*123")
        XCTAssertTrue(mockRouter.didNavigateToHome)
    }
}
