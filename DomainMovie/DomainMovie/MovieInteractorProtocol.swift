//
//  MovieInteractorProtocol.swift
//  DomainMovie
//
//  Created by Jordan Capa on 16/11/24.
//

public protocol MovieInteractorProtocol: AnyObject {
    func fetchUpcomingMovies(page: Int) async throws -> [MovieEntity]?
}
