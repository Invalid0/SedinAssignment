//
//  APIService.swift
//  SedinAssignment
//
//  Created by EMPULSE on 01/11/23.
//

import Foundation
import Combine

class APIService {
    func fetchData<T: Codable>(from url: URL, responseType: T.Type) -> AnyPublisher<T, Error> {
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
