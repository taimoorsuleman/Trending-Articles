//
//  Untitled.swift
//  TrendingArticles
//
//  Created by Taimoor Suleman on 20/10/2024.
//

import XCTest
@testable import TrendingArticles

final class ArticleDetailViewModelTests: XCTestCase {
    
    // execute before test
    var sut : ArticleDetailViewModel!
    var mockData : ArticleModel!
    
    override func setUp() {
        mockData = ArticleModel.mock
        sut = .init(articleDetail: mockData)
    }
    
    //after test //deinit
    override func tearDown() {
        mockData = nil
        sut = nil
    }
    
    
    func testGetUIData_ReturnsCorrectData() {
        let uiData = sut.getUIData()
        XCTAssertEqual(uiData.title, "Trump Press Secretary Press Secretary Press Secretary")
        XCTAssertEqual(uiData.desc, "Trump Press Secretary Press Secretary Press Secretary")
        XCTAssertEqual(uiData.image, "https://test.com")
        XCTAssertEqual(uiData.date, "2024-10-18T:00:00Z")
    }
    
    
}
