//
//  MoviePresenterTests.swift
//  PresentationTests
//
//  Created by Jordan Capa on 17/11/24.
//

import XCTest
@testable import Presentation
import DomainMovie

class MoviePresenterTests: XCTestCase {

    var presenter: MoviePresenter!
    var mockView: MockMovieView!
    var mockRouter: MockMovieRouter!
    
    var movie = MovieEntity(
        title: "Movie 1",
        overview: "",
        releaseDate: "",
        posterUrl: "", voteAverage: 10.0,
        headerUrl: ""
    )

    override func setUp() {
        super.setUp()
        mockView = MockMovieView()
        mockRouter = MockMovieRouter()
        presenter = MoviePresenter(view: mockView, router: mockRouter, movie: movie)
    }

    override func tearDown() {
        presenter = nil
        mockView = nil
        mockRouter = nil
        super.tearDown()
    }

    func testFetchMovieDetails_ShowsMovieDetails() {
        presenter.fetchMovieDetails()
        XCTAssertEqual(mockView.movie?.title, "Movie 1")
    }
}
