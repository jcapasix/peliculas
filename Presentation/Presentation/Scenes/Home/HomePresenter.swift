//
//  HomePresenter.swift
//  Presentation
//
//  Created by Jordan Capa on 16/11/24.
//
import Foundation
import DomainMovie

class HomePresenter: HomePresenterProtocol {
    weak var view: HomeViewProtocol?
    private var router: HomeRouterProtocol?
    private let interactor: MovieInteractorProtocol
    
    private var allMovies: [MovieEntity] = []
        
    init(view: HomeViewProtocol, interactor: MovieInteractorProtocol, router: HomeRouterProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func fetchMovies() async {
        
        do {
            if let movies = try await interactor.fetchUpcomingMovies(page: 1) {
                self.allMovies = movies
                view?.showMovies(movies: movies)
            } else {
                // Maneja el error o la ausencia de datos
                view?.showError(message: "Failed to fetch upcoming movies.")
            }
        } catch {
            
        }
        
    }
    
    func searchMovies(query: String) {
        if query.isEmpty {
            view?.showMovies(movies: allMovies)
        } else {
            let filteredMovies = allMovies.filter { $0.title.lowercased().contains(query.lowercased()) }
            view?.showMovies(movies: filteredMovies)
        }
    }
    
    func navigateToDetail(movie: MovieEntity) {
        guard let view = self.view else { return}
        router?.navigateToDetail(from: view, movie: movie)
    }
}

