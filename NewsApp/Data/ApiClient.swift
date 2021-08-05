//
//  ApiClient.swift
//  NewsApp
//
//  Created by admin on 04.08.2021.
//

import Foundation

class ApiClient  {
    private var dataTask : URLSessionDataTask?

    
    func getNews(completion: @escaping (Result<[Article] , Error>) -> Void) {
        guard let url = Cons.topHeadlinesUrl else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error{
                completion(.failure(error))
                return
            }
            guard let response = response as? HTTPURLResponse else {
                return
            }
            debugPrint(response.statusCode)
            guard let data = data else {
                return
            }
            do {
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(NewsResponse.self, from: data)
                completion(.success(jsonData.articles))
                
                
            } catch let error {
                completion(.failure(error))
            }
        }
        dataTask?.resume()
    }
    
    
    
    
}



struct  Cons {
    static let topHeadlinesUrl = URL(string: "https://newsapi.org/v2/top-headlines?country=ru&apiKey=3b1d4590486c4aa69fce791790dae6e7")
    static let newspaperImage = URL(string:
    "https://images.unsplash.com/photo-1557428894-56bcc97113fe?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=976&q=80")
}
