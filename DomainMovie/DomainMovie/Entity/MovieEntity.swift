//
//  MovieEntity.swift
//  DomainMovie
//
//  Created by Jordan Capa on 16/11/24.
//

public struct MovieEntity {
    public let title: String
    public let overview: String
    public let releaseDate: String
    public let posterUrl: String
    public let voteAverage: Double
    public let headerUrl: String
    
    public init(title: String, overview: String, releaseDate: String, posterUrl: String, voteAverage: Double, headerUrl: String) {
        self.title = title
        self.overview = overview
        self.releaseDate = releaseDate
        self.posterUrl = posterUrl
        self.voteAverage = voteAverage
        self.headerUrl = headerUrl
    }
}
