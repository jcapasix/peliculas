//
//  MockHomeRouter.swift
//  PresentationTests
//
//  Created by Jordan Capa on 17/11/24.
//

import UIKit
@testable import Presentation
@testable import DomainMovie

class MockHomeRouter: HomeRouterProtocol {
    static func createHomeModule() -> UIViewController {
        return UIViewController()
    }
    
    var didNavigateToDetail = false

    func navigateToDetail(from view: HomeViewProtocol, movie: MovieEntity) {
        didNavigateToDetail = true
    }
}
