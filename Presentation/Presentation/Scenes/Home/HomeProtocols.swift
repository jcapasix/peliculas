//
//  HomeProtocols.swift
//  Presentation
//
//  Created by Jordan Capa on 16/11/24.
//
import UIKit

struct Movie {
    let title: String
    let year: String
    let genre: String
}

protocol HomeViewProtocol: AnyObject {
    func showMovies(movies: [Movie])
    func showError(message: String)
}

protocol HomePresenterProtocol: AnyObject {
    func fetchMovies()
    func searchMovies(query: String)
    func navigateToDetail(movie: Movie)
}

protocol HomeRouterProtocol: AnyObject {
    static func createHomeModule() -> UIViewController
    func navigateToDetail(from view: HomeViewProtocol, movie: Movie)
}
