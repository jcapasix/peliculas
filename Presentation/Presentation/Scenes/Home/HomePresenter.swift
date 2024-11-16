//
//  HomePresenter.swift
//  Presentation
//
//  Created by Jordan Capa on 16/11/24.
//
import Foundation

class HomePresenter: HomePresenterProtocol {
    weak var view: HomeViewProtocol?
    var router: HomeRouterProtocol?
    
    private var allMovies: [Movie] = []
    
    init(view: HomeViewProtocol, router: HomeRouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func fetchMovies() {
        view?.showMovies(movies: allMovies)
    }
    
    func searchMovies(query: String) {
        if query.isEmpty {
            view?.showMovies(movies: allMovies)
        } else {
            let filteredMovies = allMovies.filter { $0.title.lowercased().contains(query.lowercased()) }
            view?.showMovies(movies: filteredMovies)
        }
    }
    
    func navigateToDetail(movie: Movie) {
        router?.navigateToDetail(from: view!, movie: movie)
    }
}

