//
//  JsonParser.swift
//  
//
//  Created by 黃筱崴 on 2023/6/21.
//

import Foundation

public class JsonParser {
    
    public static let instance: JsonParser = .init()
}

// MARK: - Read Files
public extension JsonParser {
    
    /// The function will return the json data when it download successfully.
    /// - Parameters:
    ///   - urlString: an url string
    ///   - completion: a handler with Result
    func load(from urlString: String,
              completion: @escaping (Result<Data, Error>) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completion(.failure(ParseError.unvalidUrl))
            return
        }
        
        let urlSessionTask = URLSession(configuration: .default)
            .dataTask(with: url, completionHandler: { (data, response, error) in
                
                guard let data = data else {
                    
                    if let error: Error = error {
                        completion(.failure(error))
                    }
                    else {
                        completion(.failure(ParseError.unknown))
                    }
                    return
                }
                completion(.success(data))
            })
        urlSessionTask.resume()
    }
}
