//
//  MovieResponse.swift
//  Data
//
//  Created by Jordan Capa on 16/11/24.
//

public struct MovieResponse: Codable {
    let dates: Dates
    let page: Int
    let results: [MovieModel]
    let totalPages: Int
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case dates
        case page
        case results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

public struct Dates: Codable {
    let maximum: String
    let minimum: String
}
