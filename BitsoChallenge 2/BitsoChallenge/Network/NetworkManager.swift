//
//  NetworkManager.swift
//  BitsoChallenge
//
//  Created by Hassan Baraka on 06/05/21.
//

import UIKit

final class NetworkManager{
    typealias BookParamaters =  Result<Book,Error>
    typealias PriceParameters = Result<Prices,Error>
    static var shared = NetworkManager()
    let session:DataTaskMaker
     init(session: DataTaskMaker = URLSession.shared){
        self.session = session
    }
}
protocol DataTaskMaker {
  func dataTask(with url: URL,
                completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}
extension URLSession: DataTaskMaker{ }

extension NetworkManager {
    func fetchBooks(completion: @escaping (BookParamaters) -> ()) {
        let urlString = "https://api.bitso.com/v3/available_books/"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let err = error{
                completion(.failure(err))
            }
            guard let response = response as? HTTPURLResponse else { return }
            print(response.statusCode)
            guard let data = data else { return }
            
            do {
                let bookDataReturned = try JSONDecoder().decode(Book.self, from: data)
                completion(.success(bookDataReturned))
                print("\(bookDataReturned)")
            } catch let error as NSError {
                completion(.failure(error))
                print("Fetching error: \(error), \(error.userInfo)")
            }
        }.resume()
    }
    func fetchPrice(completion: @escaping (PriceParameters) -> ()) {
        let urlString = "https://api.bitso.com/v3/ticker/"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let err = error{
                completion(.failure(err))
            }
            guard let response = response as? HTTPURLResponse else { return }
            print(response.statusCode)
            guard let data = data else { return }
            
            do {
                //print(data as Any)
                let priceDataReturned = try JSONDecoder().decode(Prices.self, from: data)
                completion(.success(priceDataReturned))
               // print("\(priceDataReturned)")
            } catch let error as NSError {
                completion(.failure(error))
                print("Fetching error: \(error), \(error.userInfo)")
            }
        }.resume()
    }
}

