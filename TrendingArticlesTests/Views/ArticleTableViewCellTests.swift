//
//  ArticleTableViewCellTests.swift
//  TrendingArticles
//
//  Created by Taimoor Suleman on 20/10/2024.
//

import XCTest
@testable import TrendingArticles

final class ArticleTableViewCellTests: XCTestCase {
    
    var cell: ArticleTableViewCell!
    
    override func setUp() {
        super.setUp()
        let nib = UINib(nibName: "ArticleTableViewCell", bundle: nil)
        cell = nib.instantiate(withOwner: self, options: nil).first as? ArticleTableViewCell
    }
    
    override func tearDown() {
        cell = nil
        super.tearDown()
    }
    
    final func testUIConfiguration() {
        // Given
        let title = "Test Article"
        let desc = "This is a test description."
        let date = "2024-10-19"
        let imgPath = "test_image_path" // Update with a valid image path for testing
        
        // When
        cell.populateUI(title: title, desc: desc, date: date, imgPath: imgPath)
        
        // Then
        XCTAssertEqual(cell.titleLbl.text, title, "Title label should be set correctly.")
        XCTAssertEqual(cell.descLbl.text, desc, "Description label should be set correctly.")
        XCTAssertEqual(cell.dateLbl.text, date, "Date label should be set correctly.")
        
    }
}
