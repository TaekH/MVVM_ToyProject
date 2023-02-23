//
//  NewsViewModel.swift
//  MVVM_ToyProject
//
//  Created by 한택환 on 2023/02/21.
//

import Foundation



struct NewsViewModel {
    let articles: [Article]
}

extension NewsViewModel {
    var articleCount: Int {
        return articles.count
    }
    
    func articleIndex(_ i: Int) -> ArticleViewModel {
        return ArticleViewModel(article: articles[i])
    }
}

struct ArticleViewModel {
    let article: Article
}

extension ArticleViewModel {
    var author: String? {
        return article.author
    }
    var title: String? {
        return article.title
    }
    var description: String? {
        return article.description
    }
}
