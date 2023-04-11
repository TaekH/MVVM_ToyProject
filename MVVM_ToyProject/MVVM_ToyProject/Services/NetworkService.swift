//
//  NetworkService.swift
//  MVVM_ToyProject
//
//  Created by 한택환 on 2023/02/22.
//

import Foundation

class NetworkService {
    func getArticles(completion: @escaping ([Article]?) -> Void ){
        guard let url = URL(string: "https://newsapi.org/v2/everything?q=apple&from=2023-04-10&to=2023-04-10&sortBy=popularity&apiKey=1d54e43914a942ccb07949ebf0d00e3d") else { return }
        
        URLSession.shared.dataTask(with: url){ data , response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }
            guard let data = data else { return }
            let articles = try? JSONDecoder().decode(Articles.self,from: data )
            if let articles = articles {
                completion(articles.articles)
            }
        }.resume()
    }
}
