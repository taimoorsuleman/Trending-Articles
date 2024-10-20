//
//  String+ExtTests.swift
//  TrendingArticles
//
//  Created by Taimoor Suleman on 20/10/2024.
//

import XCTest
@testable import TrendingArticles

class StringExtensionsTests: XCTestCase {

    func testToUrl_ValidString_ReturnsURL() {
        
        let validURLString = "https://www.google.com"
        let url = validURLString.toUrl
        XCTAssertNotNil(url)
        XCTAssertEqual(url?.absoluteString, validURLString)
    }

    func testToUrl_InvalidString_ReturnsNil() {
        let invalidURLString = "hthej.sjdhsjk.fjfwuy"
        let url = invalidURLString.toUrl
        XCTAssertNil(url)
    }

}
