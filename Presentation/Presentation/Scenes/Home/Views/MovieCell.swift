//
//  MovieCell.swift
//  Presentation
//
//  Created by Jordan Capa on 17/11/24.
//

import UIKit
import DomainMovie
import SDWebImage

class MovieCell: UITableViewCell {
    
    static let identifier = "MovieCell"
    
    private let movieTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
    private let moviePosterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let movieDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    private let movieDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(moviePosterImageView)
        contentView.addSubview(movieTitleLabel)
        contentView.addSubview(movieDescriptionLabel)
        contentView.addSubview(movieDateLabel)
        setup()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = Utils.backgroundColor
        selectionStyle = .none
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            moviePosterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            moviePosterImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            moviePosterImageView.widthAnchor.constraint(equalToConstant: 90),
            moviePosterImageView.heightAnchor.constraint(equalToConstant: 120),
            
            movieTitleLabel.leadingAnchor.constraint(equalTo: moviePosterImageView.trailingAnchor, constant: 20),
            movieTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            movieTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            movieTitleLabel.heightAnchor.constraint(equalToConstant: 40),
            
            movieDescriptionLabel.leadingAnchor.constraint(equalTo: movieTitleLabel.leadingAnchor),
            movieDescriptionLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 5),
            movieDescriptionLabel.trailingAnchor.constraint(equalTo: movieTitleLabel.trailingAnchor),
            
            movieDateLabel.leadingAnchor.constraint(equalTo: movieTitleLabel.leadingAnchor),
            movieDateLabel.topAnchor.constraint(equalTo: movieDescriptionLabel.bottomAnchor, constant: 10),
            movieDateLabel.trailingAnchor.constraint(equalTo: movieTitleLabel.trailingAnchor),
        ])
    }
    
    func configure(with movie: MovieEntity) {
        movieTitleLabel.text = movie.title
        if let url = URL(string: movie.posterUrl) {
            moviePosterImageView.sd_setImage(with: url, completed: nil)
        }
        movieDescriptionLabel.text = movie.overview
        movieDateLabel.text = movie.releaseDate
    }
}

