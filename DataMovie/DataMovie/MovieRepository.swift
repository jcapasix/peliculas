//
//  MovieRepository.swift
//  Data
//
//  Created by Jordan Capa on 16/11/24.
//

import Alamofire
import CoreData

public class MovieRepository: MovieRepositoryProtocol {
    
    private let apiKey = "f46b58478f489737ad5a4651a4b25079"
    private let baseURL = "https://api.themoviedb.org/3/movie/upcoming"
    private let context: NSManagedObjectContext
    
    public init() {
        self.context = MovieCoreDataStack.shared.context
    }
    
    public func fetchUpcomingMovies(page: Int) async throws -> [MovieModel] {
        let url = "\(baseURL)?page=\(page)&api_key=\(apiKey)"
        do {
            let response = try await AF.request(url, method: .get)
                .validate()
                .serializingDecodable(MovieResponse.self)
                .value
            self.saveMoviesToCoreData(movies: response.results)
            return response.results
        } catch {
            return try await fetchMoviesFromCoreData()
        }
    }
    
    private func saveMoviesToCoreData(movies: [MovieModel]) {
        for movie in movies {
            let movieEntity = MovieCoreData(context: context)
            movieEntity.id = Int32(movie.id)
            movieEntity.title = movie.title
            movieEntity.releaseDate = movie.releaseDate
            movieEntity.overview = movie.overview
            movieEntity.posterPath = movie.posterPath
            movieEntity.backdropPath = movie.backdropPath
            movieEntity.voteAverage = movie.voteAverage
            movieEntity.voteCount = Int32(movie.voteCount)
        }
        
        do {
            try context.save()
        } catch {
            print("Error al guardar la Pelicula en CoreData: \(error)")
        }
    }
    
    private func fetchMoviesFromCoreData() async throws -> [MovieModel] {
        let fetchRequest: NSFetchRequest<MovieCoreData> = MovieCoreData.fetchRequest()
        let fetchedMovies = try context.fetch(fetchRequest)
        
        return fetchedMovies.map { movieCoreData in
            MovieModel(id: Int(movieCoreData.id),
                  title: movieCoreData.title ?? "",
                  originalTitle: movieCoreData.title ?? "",
                  releaseDate: movieCoreData.releaseDate ?? "",
                  overview: movieCoreData.overview ?? "",
                  posterPath: movieCoreData.posterPath ?? "",
                  backdropPath: movieCoreData.backdropPath ?? "",
                  voteAverage: movieCoreData.voteAverage,
                  voteCount: Int(movieCoreData.voteCount)
            )
        }
    }
}

