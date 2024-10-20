//
//  ArticleDetailBuilder.swift
//  TrendingArticles
//
//  Created by Taimoor Suleman on 19/10/2024.
//

import Foundation
import UIKit


final class ArticleDetailBuilder{
    
    static func build(articleDetail: ArticleModel)-> UIViewController{
        let detailVC =  UIStoryboard.instantiate(viewControllerType: ArticleDetailViewController.self, fromStoryboardNamed: StoryboardIdentifiers.main, withIdentifier: .articleDetailVCIdentifier)
        
        detailVC.viewModel = ArticleDetailViewModel(articleDetail: articleDetail)
        return detailVC
    }
}
