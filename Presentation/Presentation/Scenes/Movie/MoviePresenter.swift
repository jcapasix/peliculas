//
//  MoviePresenter.swift
//  Presentation
//
//  Created by Jordan Capa on 16/11/24.
//

import Foundation

class MoviePresenter: MoviePresenterProtocol {
    weak var view: MovieViewProtocol?
    var router: MovieRouterProtocol?
    var movie: Movie
    
    init(view: MovieViewProtocol, router: MovieRouterProtocol, movie: Movie) {
        self.view = view
        self.router = router
        self.movie = movie
    }
    
    func fetchMovieDetails() {
        view?.showMovieDetails(movie: movie)
    }
}
