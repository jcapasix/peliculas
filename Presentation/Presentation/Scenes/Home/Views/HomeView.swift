//
//  HomeView.swift
//  Presentation
//
//  Created by Jordan Capa on 16/11/24.
//

import UIKit
import DomainMovie

protocol HomeViewDelegate {
    func didSelectMovie(movie: MovieEntity)
}

class HomeView: UIView {
    
    // MARK: - UI Elements
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "Buscar Película"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.barTintColor = Utils.backgroundColor
        searchBar.backgroundColor = Utils.backgroundColor
        if let textField = searchBar.value(forKey: "searchField") as? UITextField {
            textField.textColor = .white
        }
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white
        ]
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(string: "Buscar Película", attributes: attributes)
        return searchBar
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    
    private var movies: [MovieEntity] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.activityIndicator.stopAnimating()
            }
        }
    }
    
    public var delegate: HomeViewDelegate?
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.frame = self.bounds
        tableView.backgroundView = activityIndicator
        tableView.backgroundColor = Utils.backgroundColor
        tableView.register(MovieCell.self, forCellReuseIdentifier: MovieCell.identifier)
        self.activityIndicator.startAnimating()
        backgroundColor = Utils.backgroundColor
        addSubview(searchBar)
        addSubview(tableView)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func updateMovies(movies: [MovieEntity]) {
        self.movies = movies
    }
}

extension HomeView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let movie = movies[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.identifier, for: indexPath) as? MovieCell else {
            return UITableViewCell()
        }
        cell.configure(with: movie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        delegate?.didSelectMovie(movie: movie)
    }
}
