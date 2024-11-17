//
//  MockMovieRouter.swift
//  PresentationTests
//
//  Created by Jordan Capa on 17/11/24.
//

import UIKit
@testable import Presentation
@testable import DomainMovie

class MockMovieRouter: MovieRouterProtocol {
    static func createMovieModule(movie: DomainMovie.MovieEntity) -> UIViewController {
        return UIViewController()
    }
}
