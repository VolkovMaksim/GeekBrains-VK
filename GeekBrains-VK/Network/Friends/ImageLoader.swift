//
//  ImageLoader.swift
//  GeekBrains-VK
//
//  Created by Maksim Volkov on 17.01.2022.
//

import Foundation

class ImageLoader {
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        return session
    }()

    func loadImage(url: URL, completion: @escaping(Result<Data, Error>) -> Void) {

        let completionOnMain: (Result<Data, Error>) -> Void = { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
        session.dataTask(with: url, completionHandler:  { data, response, error in
            guard let responseData = data, error == nil else {
                if let error = error {
                    completionOnMain(.failure(error))
                }
                return
            }
            completionOnMain(.success(responseData))

        }).resume()
    }
}
