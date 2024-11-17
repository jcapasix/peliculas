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
    private let baseImageUrl = "https://image.tmdb.org/t/p/w500/"

    public init() {}
    
    public func fetchUpcomingMovies(page: Int) async throws -> [MovieEntity]? {
        do {
            let movies = try await movieRepository.fetchUpcomingMovies(page: page)
            return movies.compactMap {
                MovieEntity(
                    title: $0.title,
                    overview: $0.overview,
                    releaseDate: $0.releaseDate,
                    posterUrl: "\(baseImageUrl)\($0.posterPath)",
                    voteAverage: $0.voteAverage,
                    headerUrl: "\(baseImageUrl)\($0.backdropPath)"
                )
            }
        } catch {
            return nil
        }
    }
}
