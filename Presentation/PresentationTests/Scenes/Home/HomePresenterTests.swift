//
//  HomePresenterTest.swift
//  PresentationTests
//
//  Created by Jordan Capa on 17/11/24.
//

import XCTest
@testable import Presentation
import DomainMovie

class HomePresenterTests: XCTestCase {

    var presenter: HomePresenter!
    var mockView: MockHomeView!
    var mockRouter: MockHomeRouter!
    var mockInteractor: MockMovieInteractor!

    let movie1 = MovieEntity(
        title: "Movie 1",
        overview: "",
        releaseDate: "",
        posterUrl: "", voteAverage: 10.0,
        headerUrl: ""
    )
    
    override func setUp() {
        super.setUp()
        mockView = MockHomeView()
        mockRouter = MockHomeRouter()
        mockInteractor = MockMovieInteractor()
        presenter = HomePresenter(view: mockView, interactor: mockInteractor, router: mockRouter)
    }

    override func tearDown() {
        presenter = nil
        mockView = nil
        mockRouter = nil
        mockInteractor = nil
        super.tearDown()
    }

    func testFetchMovies_Success() async {
        mockInteractor.stubbedMovies = [movie1]
        await presenter.fetchMovies()
        XCTAssertEqual(mockView.movies?.count, 1)
        XCTAssertEqual(mockView.movies?.first?.title, "Movie 1")
    }

    func testFetchMovies_Failure() async {
        mockInteractor.stubbedMoviesError = NSError(domain: "test", code: 0, userInfo: nil)
        await presenter.fetchMovies()
        XCTAssertEqual(mockView.errorMessage, "Error al cargar las Películas.")
    }

    func testFetchMovies_EmptyResponse() async {
        mockInteractor.stubbedMovies = []
        await presenter.fetchMovies()
        XCTAssertEqual(mockView.movies?.count, nil)
        XCTAssertEqual(mockView.errorMessage, nil)
    }

    func testSearchMovies_EmptyQuery() {
        presenter.allMovies = [movie1]
        presenter.searchMovies(query: "")
        XCTAssertEqual(mockView.movies?.count, 1)
    }

    func testSearchMovies_WithQuery() {
        let movie2 = MovieEntity(
            title: "Movie2",
            overview: "",
            releaseDate: "",
            posterUrl: "", voteAverage: 10.0,
            headerUrl: ""
        )
        presenter.allMovies = [movie1, movie2]
        presenter.searchMovies(query: "Movie 1")
        XCTAssertEqual(mockView.movies?.count, 1)
        XCTAssertEqual(mockView.movies?.first?.title, "Movie 1")
    }

    func testNavigateToDetail() {

        presenter.navigateToDetail(movie: movie1)
        XCTAssertTrue(mockRouter.didNavigateToDetail)
    }
}
