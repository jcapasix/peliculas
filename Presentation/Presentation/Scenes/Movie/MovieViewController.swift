//
//  MovieViewController.swift
//  Presentation
//
//  Created by Jordan Capa on 16/11/24.
//

import UIKit

class MovieViewController: UIViewController, MovieViewProtocol {
    var presenter: MoviePresenterProtocol?
    
    private let movieView = MovieView()
    
    override func loadView() {
        self.view = movieView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.fetchMovieDetails()
    }
    
    func showMovieDetails(movie: Movie) {
        movieView.updateMovieDetails(movie: movie)
    }
}
