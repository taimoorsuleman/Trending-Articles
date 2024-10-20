//
//  String.swift
//  TrendingArticles
//
//  Created by Taimoor Suleman on 18/11/2024.
//

import Foundation

extension String {
    
    /// Converts String to URL?
    var toUrl: URL? {
        guard let url = URL(string: self),
            url.scheme == "http" || url.scheme == "https" else {
            return nil
        }
        return URL(string: self)
    }
}
