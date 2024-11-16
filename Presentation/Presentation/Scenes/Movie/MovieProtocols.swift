//
//  MoviewProtocols.swift
//  Presentation
//
//  Created by Jordan Capa on 16/11/24.
//
import UIKit

protocol MovieViewProtocol: AnyObject {
    func showMovieDetails(movie: Movie)
}

protocol MoviePresenterProtocol: AnyObject {
    func fetchMovieDetails()
}

protocol MovieRouterProtocol: AnyObject {
    static func createMovieModule(movie: Movie) -> UIViewController
}
