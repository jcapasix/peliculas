//
//  MoviePresenter.swift
//  Presentation
//
//  Created by Jordan Capa on 16/11/24.
//

import Foundation
import DomainMovie

class MoviePresenter: MoviePresenterProtocol {
    weak var view: MovieViewProtocol?
    var router: MovieRouterProtocol?
    var movie: MovieEntity
    
    init(view: MovieViewProtocol, router: MovieRouterProtocol, movie: MovieEntity) {
        self.view = view
        self.router = router
        self.movie = movie
    }
    
    func fetchMovieDetails() {
        view?.showMovieDetails(movie: movie)
    }
}
