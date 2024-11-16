//
//  MovieRouter.swift
//  Presentation
//
//  Created by Jordan Capa on 16/11/24.
//

import UIKit
import DomainMovie

class MovieRouter: MovieRouterProtocol {
    static func createMovieModule(movie: MovieEntity) -> UIViewController {
        let viewController = MovieViewController()
        let router = MovieRouter()
        let presenter = MoviePresenter(view: viewController, router: router, movie: movie)
        viewController.presenter = presenter
        return viewController
    }
}
