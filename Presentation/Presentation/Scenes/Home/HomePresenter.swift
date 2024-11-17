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
    
    private var currentPage = 1
    private var isLoading = false

    func fetchMovies() async {
        guard !isLoading else { return }
        isLoading = true
        do {
            if let movies = try await interactor.fetchUpcomingMovies(page: currentPage) {
                if movies.isEmpty { return }
                self.allMovies.append(contentsOf: movies)
                view?.showMovies(movies: allMovies)
                currentPage += 1
            } else {
                view?.showError(message: "Ha sucedido un error, inténtalo más tarde.")
            }
        } catch {
            view?.showError(message: "Error al cargar las Películas.")
        }
        isLoading = false
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

