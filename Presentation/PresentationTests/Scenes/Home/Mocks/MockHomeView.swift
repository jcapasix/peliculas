//
//  MockHomeView.swift
//  PresentationTests
//
//  Created by Jordan Capa on 17/11/24.
//

import UIKit
@testable import Presentation
@testable import DomainMovie

class MockHomeView: HomeViewProtocol {
    var movies: [MovieEntity]?
    var errorMessage: String?

    func showMovies(movies: [MovieEntity]) {
        self.movies = movies
    }

    func showError(message: String) {
        errorMessage = message
    }
}
