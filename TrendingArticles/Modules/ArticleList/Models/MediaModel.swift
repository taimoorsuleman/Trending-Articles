//
//  MediaModel.swift
//  TrendingArticles
//
//  Created by Taimoor Suleman on 19/10/2024.
//

// MARK: - Media
struct Media: Codable {
    let mediaMetadata: [MediaMetadatum]?

    enum CodingKeys: String, CodingKey {
        case mediaMetadata = "media-metadata"
    }
    
    static let mockedArray = [Media(mediaMetadata: MediaMetadatum.mockedArray)]
}

// MARK: - MediaMetadatum
struct MediaMetadatum: Codable {
    let url: String?
    
    static let mockedArray: [MediaMetadatum] = [MediaMetadatum(url: "https://test.com")]
}

