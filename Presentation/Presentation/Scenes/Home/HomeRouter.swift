//
//  HomeRouter.swift
//  Presentation
//
//  Created by Jordan Capa on 16/11/24.
//

import UIKit
import DomainMovie

class HomeRouter: HomeRouterProtocol {
    static func createHomeModule() -> UIViewController {
        let viewController = HomeViewController()
        let router = HomeRouter()
        let interactor = MovieInteractor()
        let presenter = HomePresenter(
            view: viewController,
            interactor: interactor,
            router: router
        )
        viewController.presenter = presenter
        return viewController
    }
    
    func navigateToDetail(from view: HomeViewProtocol, movie: MovieEntity) {
        guard let viewController = view as? UIViewController else { return }
        let detailViewController = MovieRouter.createMovieModule(movie: movie)
        viewController.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
