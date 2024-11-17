//
//  MockMovieInteractor.swift
//  PresentationTests
//
//  Created by Jordan Capa on 17/11/24.
//

import UIKit
@testable import Presentation
@testable import DomainMovie

class MockMovieInteractor: MovieInteractorProtocol {
    var stubbedMovies: [MovieEntity]?
    var stubbedMoviesError: Error?

    func fetchUpcomingMovies(page: Int) async throws -> [MovieEntity]? {
        if let error = stubbedMoviesError {
            throw error
        }
        return stubbedMovies
    }
}

