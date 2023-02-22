//
//  NetworkService.swift
//  MVVM_ToyProject
//
//  Created by 한택환 on 2023/02/22.
//

import Foundation

class NetworkService {
    func getArticles(url:URL,completion: @escaping ([Article]?)->()){
        URLSession.shared.dataTask(with: url){ data , response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let fetchedData = data {
                let articles = try? JSONDecoder().decode(Articles.self,from:fetchedData)
                if let articles = articles {
                    completion(articles.articles)
                }
                print(articles?.articles)
            }
        }.resume()
    }
}
