//
//  RestApi.swift
//  Sasflix
//
//  Created by Evgeniy Kozyrev on 05.11.2024.
//

import Foundation
import SwiftUI

struct Response {
    let data: Data
    
}

enum Request: String, Decodable {
    case GET
    case POST
}


struct aRequest {
    
    @MainActor func getPosts(completion: @escaping (Result<Posts, NetworkError>) -> Void) {
        dataRequest(with: "https://dummyjson.com/posts", objectType: Posts.self, completion: completion)
    }

    @MainActor func getCommentPost(postId: UInt, completion: @escaping (Result<Comments, NetworkError>) -> Void) {
        dataRequest(with: "https://dummyjson.com/posts/\(postId)/comments", objectType: Comments.self, completion: completion)
    }
    
    func dataRequest<T: Decodable>(with url: String, objectType: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        // create the URL instance
        guard let requestURL = URL(string: url) else {
           completion(.failure(.badURL(url)))
           return
        }
        
        // create the session object
        let session = URLSession.shared
        
        // Now create the URLRequest object using the URL object
        let request = URLRequest(url: requestURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60)
        
        // create dataTask using the session object to send data to the server
        let task: URLSessionDataTask = session.dataTask(with: request, completionHandler: { data, response, error in
            
            // declare result type
            let result: Result<T, NetworkError>
            
            // defer the to call completion handler
            defer {
                completion(result)
            }
            
           if let error {
               result = .failure(.networkError(error))
               return
           }

           guard let data = data, !data.isEmpty else {
               result = .failure(.invalidData)
               return
           }
            
            do {
                // create decodable object from data
                let responseObject = try JSONDecoder().decode(objectType.self, from: data)
                result = .success(responseObject)
            } catch let error as DecodingError {
                result = .failure(.jsonParsingError(error))
            } catch {
                result = .failure(.unknown(error))
            }
        })
               task.resume()
        }
}

struct RestApi {
    let baseUrl: String = "dummyjson.com"
    
    enum Resources {
        static let path = "/posts"
    }
}
// NetworkError enum which covers all possible Network errors

enum NetworkError: Error {
    case badURL(String)
    case networkError(Error)
    case invalidData
    case jsonParsingError(DecodingError)
    case invalidStatusCode(Int)
    case unknown(Error)
 }

// dataRequest which sends request to given URL and convert to Decodable Object
