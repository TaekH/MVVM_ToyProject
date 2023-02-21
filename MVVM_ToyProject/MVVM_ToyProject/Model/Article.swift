//
//  News.swift
//  MVVM_ToyProject
//
//  Created by 한택환 on 2023/02/21.
//

import Foundation

struct Articles: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let author: String?
    let title: String?
    let description: String?
}
