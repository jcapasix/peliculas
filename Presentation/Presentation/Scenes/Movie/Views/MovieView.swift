//
//  MovieView.swift
//  Presentation
//
//  Created by Jordan Capa on 16/11/24.
//

import UIKit
import DomainMovie

class MovieView: UIView {
    
    // MARK: - UI Elements

    private let headerImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let voteAverageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        return label
    }()

    private let releaseDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        return label
    }()

    private let overviewLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        backgroundColor = Utils.backgroundColor
        addSubview(headerImageView)
        addSubview(posterImageView)
        addSubview(titleLabel)
        addSubview(voteAverageLabel)
        addSubview(releaseDateLabel)
        addSubview(overviewLabel)
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            headerImageView.topAnchor.constraint(equalTo: topAnchor),
            headerImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerImageView.heightAnchor.constraint(equalToConstant: 220),
            
            posterImageView.topAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: 20),
            posterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            posterImageView.widthAnchor.constraint(equalToConstant: 120),
            posterImageView.heightAnchor.constraint(equalToConstant: 150),
            
            titleLabel.topAnchor.constraint(equalTo: posterImageView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            voteAverageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            voteAverageLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 20),
            voteAverageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            releaseDateLabel.topAnchor.constraint(equalTo: voteAverageLabel.bottomAnchor, constant: 10),
            releaseDateLabel.leadingAnchor.constraint(equalTo: posterImageView.trailingAnchor, constant: 20),
            releaseDateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            overviewLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 20),
            overviewLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            overviewLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])
    }

    func updateMovieDetails(movie: MovieEntity) {
        if let posterPath = URL(string: movie.posterUrl) {
            posterImageView.sd_setImage(with: posterPath, completed: nil)
        }
        if let posterPath = URL(string: movie.headerUrl) {
            headerImageView.sd_setImage(with: posterPath, completed: nil)
        }
        titleLabel.text = movie.title
        voteAverageLabel.text = "Rating: \n \(movie.voteAverage)"
        releaseDateLabel.text = "Release Date: \n \(movie.releaseDate)"
        overviewLabel.text = movie.overview
    }
}
