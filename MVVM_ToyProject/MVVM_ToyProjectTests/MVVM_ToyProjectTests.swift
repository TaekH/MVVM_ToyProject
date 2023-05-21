//
//  MVVM_ToyProjectTests.swift
//  MVVM_ToyProjectTests
//
//  Created by 한택환 on 2023/02/20.
//

import XCTest
@testable import MVVM_ToyProject

final class MVVM_ToyProjectTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testArticlesCount() {
        let mockNews = [
            Article(author: "a", title: "b", description: "c", publishedAt: "d"),
            Article(author: "a", title: "b", description: "c", publishedAt: "d"),
            Article(author: "a", title: "b", description: "c", publishedAt: "d")
            ]
        let mockNewsVM = NewsViewModel(articles: mockNews)

        let result = mockNewsVM.articleCount
        let expectation = 3
        XCTAssertEqual(result, expectation)
    }
    
    func testPublishedAt() {
        let mockArticle = Article(author: "a", title: "b", description: "c", publishedAt: "2023-05-14T20:59:59Z")
        let mockArticleVM = ArticleViewModel(article: mockArticle)
        
        let result = mockArticleVM.publishedAt
        let expectation = "2023-05-14 20:59:59"
        XCTAssertEqual(result, expectation)
    }

    func testNewsToArticleViewModel() {
        let mockNews = [
            Article(author: "a", title: "b", description: "c", publishedAt: "2023-05-14T20:59:59Z"),
            Article(author: "a", title: "b", description: "c", publishedAt: "d"),
            Article(author: "a", title: "b", description: "c", publishedAt: "d")
            ]
        
        let mockNewsVM = NewsViewModel(articles: mockNews)
        
        let result = mockNewsVM.articleIndex(0)
        XCTAssertEqual(result.author, "a")
        XCTAssertEqual(result.title, "b")
        XCTAssertEqual(result.description, "c")
        XCTAssertEqual(result.publishedAt, "2023-05-14 20:59:59")
    }
}
