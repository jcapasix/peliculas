//
//  MovieEntity.swift
//  DomainMovie
//
//  Created by Jordan Capa on 16/11/24.
//

public struct MovieEntity {
    public let title: String
    public let year: String
    public let genre: String
    
    public init(title: String, year: String, genre: String) {
        self.title = title
        self.year = year
        self.genre = genre
    }
}
