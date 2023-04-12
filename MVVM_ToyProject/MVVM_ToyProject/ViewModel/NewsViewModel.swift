//
//  NewsViewModel.swift
//  MVVM_ToyProject
//
//  Created by 한택환 on 2023/02/21.
//

import Foundation

struct NewsViewModel {
    var articles: [Article]
}
enum SortOption {
    case up
    case down
}

extension NewsViewModel {
    var articleCount: Int {
        return articles.count
    }
    func articleIndex(_ i: Int) -> ArticleViewModel {
        return ArticleViewModel(article: articles[i])
    }
    mutating func sortArticle(by option: SortOption) {
        switch option {
        case .up:
            articles = articles.sorted(by: { $0.publishedAt?.formatStringToFullDate() ?? Date() < $1.publishedAt?.formatStringToFullDate() ?? Date()})
        case .down:
            articles = articles.sorted(by: { $0.publishedAt?.formatStringToFullDate() ?? Date() > $1.publishedAt?.formatStringToFullDate() ?? Date()})
        }
    }
    }

struct ArticleViewModel {
    let article: Article
}
extension ArticleViewModel {
    var author: String {
        guard let author = article.author else { return "" }
        return author
    }
    var title: String {
        guard let title = article.title else { return "" }
        return title
    }
    var description: String? {
        guard let description = article.description else { return "" }
        return description
    }
    var publishedAt: String {
        guard var publishedAt = article.publishedAt else { return "" }
        publishedAt = publishedAt.replacingOccurrences(of: "T", with: " ")
        return publishedAt.components(separatedBy: ["Z"]).joined()
    }
}
