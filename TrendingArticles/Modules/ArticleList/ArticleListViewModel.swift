//
//  ArticleViewModel.swift
//  TrendingArticles
//
//  Created by Taimoor Suleman on 18/11/2024.
//

import Foundation
protocol ArticleListViewModelPresentable {
    
    func numberOfArticles()-> Int
    func fetchArticlesData()
    func getArticleModel(for index: Int) -> ArticleModel?

    var reloadTableViewData: (()->())? { get set }
    var stopActivityIndicator: (()->())? { get set }
    var startActivityIndicator: (()->())? { get set }
    var articlesList: [ArticleModel]? { get set }
}


final class ArticleListViewModel: ArticleListViewModelPresentable {
    
    // MARK: - Properties
    private var apiService: ArticleListWebServiceProtocol
    let timePeriod = PeriodEnum.Week
    
    // MARK: - ViewModel Properties And closures
    var reloadTableViewData: (() -> ())?
    var stopActivityIndicator: (()->())?
    var startActivityIndicator: (() -> ())?
    var articlesList: [ArticleModel]?

    // MARK: - Init
    init(apiService: ArticleListWebServiceProtocol) {
        self.apiService = apiService
    }
    
   
    // MARK: - View Model Methods
    
    func numberOfArticles() -> Int {
        return articlesList?.count ?? 0
    }
    
    
    func getArticleModel(for index: Int) -> ArticleModel? {
        //check index in valid or not
        guard let articles = articlesList, index >= 0 && index < articles.count else { return nil }
        return articlesList?[index]
    }
  
    
    func fetchArticlesData() {
         Task{
             do{
                 self.startActivityIndicator?()
                 let articlesResponse = try await apiService.getArticleList(timePeriod: timePeriod.rawValue)
                 self.articlesList = articlesResponse.results
                 self.reloadTableViewData?()
             }catch{
                self.stopActivityIndicator?()
                
             }
         }
    }
    
    
}
