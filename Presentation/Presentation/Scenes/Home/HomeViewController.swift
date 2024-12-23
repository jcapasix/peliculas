//
//  HomeViewController.swift
//  Presentation
//
//  Created by Jordan Capa on 16/11/24.
//

import UIKit
import DomainMovie

class HomeViewController: UIViewController, HomeViewProtocol {
    var presenter: HomePresenterProtocol?
    private let homeView = HomeView()
    
    override func loadView() {
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureActions()
        Task {
            await presenter?.fetchMovies()
        }
    }
    
    private func configureActions() {
        homeView.searchBar.delegate = self
        homeView.delegate = self
        title = "Películas"
        if let navigationBar = self.navigationController?.navigationBar {
            navigationBar.titleTextAttributes = [
                .foregroundColor: UIColor.white
            ]
        }
        let backButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    func showMovies(movies: [MovieEntity]) {
        self.homeView.updateMovies(movies: movies)
    }
    
    func showError(message: String) {
        homeView.activityIndicator.stopAnimating()
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
    func scrollViewDidScroll() {
        Task {
            await presenter?.fetchMovies()
        }
    }
    
    func didSelectMovie(movie: MovieEntity) {
        presenter?.navigateToDetail(movie: movie)
    }
}
