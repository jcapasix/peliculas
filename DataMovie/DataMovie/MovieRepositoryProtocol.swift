//
//  MovieRepositoryProtocol.swift
//  Data
//
//  Created by Jordan Capa on 16/11/24.
//

public protocol MovieRepositoryProtocol {
    func fetchUpcomingMovies(page: Int) async throws -> [MovieModel]
}
