//
//  HomeViewController.swift
//  Presentation
//
//  Created by Jordan Capa on 16/11/24.
//

import UIKit

class HomeViewController: UIViewController, HomeViewProtocol {
    var presenter: HomePresenterProtocol?
    
    private let homeView = HomeView()
    
    override func loadView() {
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureActions()
        presenter?.fetchMovies()
    }
    
    private func configureActions() {
        homeView.searchBar.delegate = self
        homeView.delegate = self
        title = "Peliculas"
    }
    
    func showMovies(movies: [Movie]) {
        homeView.updateMovies(movies: movies)
    }
    
    func showError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.searchMovies(query: searchText)
    }
}

extension HomeViewController: HomeViewDelegate {
    func didSelectMovie(movie: Movie) {
        presenter?.navigateToDetail(movie: movie)
    }
}
