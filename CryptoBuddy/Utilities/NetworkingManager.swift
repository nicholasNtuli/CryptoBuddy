//
//  NetworkingManager.swift
//  CryptoBuddy
//
//  Created by Sihle Ntuli on 2023/05/03.
//

import Foundation
import Combine

class NetworkingManager {
    
    enum NetworkingError: LocalizedError {
        case badURLResponse(url: URL)
        case unknown
        
        var erroDescription: String? {
            switch self {
            case .badURLResponse(url: let url): return "[🔥] Bad reponse from URL: \(url)"
            case .unknown: return "[⚠️] Unknown error occured"
            }
        }
    }
    
    static func download(url: URL) -> AnyPublisher<Data, Error> {
        /// Go into the background thread automatically and download the data
        return URLSession.shared.dataTaskPublisher(for: url)
            /// Background thread
            ///.subscribe(on: DispatchQueue.global(qos: .default))
            /// Mapping the response
            .tryMap({ try handleURLResponse(output: $0, url: url) })
            /// If the url fails then retry 3 times because the publisher failed then just retry
            .retry(3)
            /// Returing the data into the app
            .eraseToAnyPublisher()
    }
    
    static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300 else {
            throw NetworkingError.badURLResponse(url: url)
        }
        return output.data
    }
    
    static func handleCompletion(completion: Subscribers.Completion<Error>) {
        switch completion {
        case .finished:
            break
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
    
}
