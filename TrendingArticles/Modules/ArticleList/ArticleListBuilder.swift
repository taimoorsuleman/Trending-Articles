//
//  ArticleListBuilder.swift
//  TrendingArticles
//
//  Created by Taimoor Suleman on 18/11/2024.
//

import Foundation
import UIKit


final class ArticleListBuilder{
    
    static func build()-> UIViewController{
        let dashboardVC =  UIStoryboard.instantiate(viewControllerType: ArticleListViewController.self, fromStoryboardNamed: StoryboardIdentifiers.main, withIdentifier: .articleListVCIdentifier)
        
        let apiService = ArticleService(networkManager: NetworkManager())
        dashboardVC.viewModel = ArticleListViewModel(apiService: apiService)
        return dashboardVC
    }
}
