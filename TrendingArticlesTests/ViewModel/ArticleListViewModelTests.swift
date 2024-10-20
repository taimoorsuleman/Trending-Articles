////
////  SereisViewModelTests.swift
////  TrendingArticlesTests
////
////  Created by Taimoor Suleman on 18/10/2024.
////
//
import XCTest
@testable import TrendingArticles

final class ArticleListViewModelTests: XCTestCase {

    // execute before test
    var sut : ArticleListViewModel!
    var mockService : MockAPIService!
    
    override func setUp() {
        mockService = MockAPIService()
        sut = .init(apiService: mockService)
    }
    
    //after test //deinit
    override func tearDown() {
        mockService = nil
        sut = nil
    }
    
    
    func test_numberOfArticles_WhenNoArticles_ReturnsZero() {
        XCTAssertEqual(sut.numberOfArticles(), 0)
    }
    
    func test_getArticleModel_whenValidIndex_ReturnsArticle() async {
        //given
        let respData = try? await mockService.getArticleList(timePeriod: 7)
        
        //when
        sut.articlesList = respData?.results
        
        //then
        XCTAssertNotNil(sut.getArticleModel(for: 0)) // Check first article
    }

        func testGetArticleModel_WhenInvalidIndex_ReturnsNil() {
            // Assuming articles is empty initially
            XCTAssertNil(sut.getArticleModel(for: -1)) // Negative index
            XCTAssertNil(sut.getArticleModel(for: 0))  // Index out of range for empty articles
        }
    
    func test_articlesApiCall_failure_responseShouldBeNil() async{
        //given
        var respData: ArticleListResponse?
        
        //when
        mockService.isError = true
        respData = try? await mockService.getArticleList(timePeriod: 7)
        
        //then
        XCTAssertNil(respData)
    }
    
    
    func test_articlesApiCall_sucess_responseShouldNotBeNil() async{
        //given
        var respData: ArticleListResponse?
        
        //when

        respData = try? await mockService.getArticleList(timePeriod: 7)
        
        //then
        XCTAssertNotNil(respData)
    }
    
}
