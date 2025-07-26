//
//  NewsAppTests.swift
//  NewsAppTests
//
//  Created by apple on 27/07/2025.
//

import XCTest
@testable import NewsApp

class ArticlesViewModelTests: XCTestCase {

    func testFetchArticlesShouldReturnData() {
        let viewModel = ArticlesViewModel()
        let expectation = XCTestExpectation(description: "Fetch articles")

        viewModel.onDataUpdated = {
            XCTAssertFalse(viewModel.articles.isEmpty, "Articles should not be empty")
            expectation.fulfill()
        }

        viewModel.fetchArticles()

        wait(for: [expectation], timeout: 5.0)
    }
}
