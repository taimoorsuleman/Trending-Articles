//
//  Constants.swift
//  TrendingArticles
//
//  Created by Taimoor Suleman on 18/11/2024.
//

import Foundation


struct Constants {
    static let kImageDimensionRatio = CGFloat(16.0/9.0)
    static let moviesCellHeight = CGFloat(300)
    static let moviesCellWidth = CGFloat(moviesCellHeight * kImageDimensionRatio)
}


struct APIConstants {
    static let apiBaseURL : String = .apiBaseURL
    static let apiKey : String = .apiKey
}

struct StoryboardIdentifiers {
    static let main : String = .mainStoryboardIdentifier
}

struct ViewControllerIdentifiers {
    static let articleListVCIdentifier : String = .articleListVCIdentifier
    static let articleDetailVCIdentifier : String = .articleDetailVCIdentifier
}


struct CellIdentifiers {
    static let articleTableViewCell :String = .articleTableViewCell
}

struct EndPoints {
    static let artcleListEndpoint : String = .artcleListEndpoint
}



extension String {
    //End Points
    static let apiBaseURL = "http://api.nytimes.com"
    static let apiKey = "Ka6iQJTM7fXZ4DnGSAZwlPM3BmQuIQug"
    //StoryBoards
    static let mainStoryboardIdentifier = "Main"
    
    //Strings
    static let emptyString = ""
    
    //Identifiers
    static let articleListVCIdentifier = "ArticleListViewController"
    static let articleDetailVCIdentifier = "ArticleDetailViewController"
    
    static let articleTableViewCell = "ArticleTableViewCell"
    
    static let artcleListEndpoint = "/svc/mostpopular/v2/mostviewed"
}
