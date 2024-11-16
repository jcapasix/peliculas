//
//  MoviewProtocols.swift
//  Presentation
//
//  Created by Jordan Capa on 16/11/24.
//
import UIKit
import DomainMovie

protocol MovieViewProtocol: AnyObject {
    func showMovieDetails(movie: MovieEntity)
}

protocol MoviePresenterProtocol: AnyObject {
    func fetchMovieDetails()
}

protocol MovieRouterProtocol: AnyObject {
    static func createMovieModule(movie: MovieEntity) -> UIViewController
}
