//
//  HomeProtocols.swift
//  Presentation
//
//  Created by Jordan Capa on 16/11/24.
//
import UIKit
import DomainMovie

protocol HomeViewProtocol: AnyObject {
    func showMovies(movies: [MovieEntity])
    func showError(message: String)
}

protocol HomePresenterProtocol: AnyObject {
    func fetchMovies() async
    func searchMovies(query: String)
    func navigateToDetail(movie: MovieEntity)
}

protocol HomeRouterProtocol: AnyObject {
    static func createHomeModule() -> UIViewController
    func navigateToDetail(from view: HomeViewProtocol, movie: MovieEntity)
}
