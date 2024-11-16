//
//  MovieInteractor.swift
//  Domain
//
//  Created by Jordan Capa on 16/11/24.
//

import DataMovie
import CoreData

public class MovieInteractor: MovieInteractorProtocol {
    
    private let movieRepository = MovieRepository()

    public init() {}
    
    public func fetchUpcomingMovies(page: Int) async throws -> [MovieEntity]? {
        do {
            let movies = try await movieRepository.fetchUpcomingMovies(page: page)
            return movies.compactMap {
                MovieEntity(title: $0.title, year: $0.releaseDate, genre: $0.title)
            }
        } catch {
            return nil
        }
    }
}
