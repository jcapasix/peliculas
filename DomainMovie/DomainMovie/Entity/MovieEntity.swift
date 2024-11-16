//
//  MovieEntity.swift
//  DomainMovie
//
//  Created by Jordan Capa on 16/11/24.
//

public struct MovieEntity {
    public let title: String
    public let year: String
    public let overview: String
    public let posterUrl: String
    
    public init(title: String, year: String, overview: String, posterUrl: String) {
        self.title = title
        self.year = year
        self.overview = overview
        self.posterUrl = posterUrl
    }
}
