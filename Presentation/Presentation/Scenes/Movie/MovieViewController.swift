//
//  MovieViewController.swift
//  Presentation
//
//  Created by Jordan Capa on 16/11/24.
//

import UIKit
import DomainMovie

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
    
    func showMovieDetails(movie: MovieEntity) {
        movieView.updateMovieDetails(movie: movie)
    }
}
