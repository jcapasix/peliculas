//
//  MockMovieView.swift
//  PresentationTests
//
//  Created by Jordan Capa on 17/11/24.
//

import UIKit
@testable import Presentation
@testable import DomainMovie

class MockMovieView: MovieViewProtocol {
    var movie: MovieEntity?

    func showMovieDetails(movie: MovieEntity) {
        self.movie = movie
    }
}
