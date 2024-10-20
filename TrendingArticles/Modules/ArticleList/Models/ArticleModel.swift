//
//  Article.swift
//  TrendingArticles
//
//  Created by Taimoor Suleman on 18/10/2024.
//

// MARK: - ArticleModel
struct ArticleModel: Codable {
    let url: String?
    let publishedDate: String?
    let title, abstract: String?
    let media: [Media]?

    enum CodingKeys: String, CodingKey {
        case url
        case publishedDate = "published_date"
        case title, abstract
        case media
    }
    
    static let mock = ArticleModel(
        url: "https://www.nytimes.com/2024/10/18/us/politics/trump-white-house-press-secretary-press-secretary-press-secretary.html",
        publishedDate: "2024-10-18T:00:00Z",
        title: "Trump Press Secretary Press Secretary Press Secretary",
        abstract: "Trump Press Secretary Press Secretary Press Secretary",
        media: Media.mockedArray)
}
