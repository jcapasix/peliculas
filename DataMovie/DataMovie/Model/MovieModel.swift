//
//  MovieModel.swift
//  DataMovie
//
//  Created by Jordan Capa on 16/11/24.
//

public struct MovieModel: Codable {
    public let id: Int
    public let title: String
    public let originalTitle: String
    public let releaseDate: String
    public let overview: String
    public let posterPath: String
    public let backdropPath: String
    public let voteAverage: Double
    public let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case originalTitle = "original_title"
        case releaseDate = "release_date"
        case overview
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}


