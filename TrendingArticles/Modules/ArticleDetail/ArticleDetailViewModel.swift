//
//  ArticleDetailViewModel.swift
//  TrendingArticles
//
//  Created by Taimoor Suleman on 19/10/2024.
//

import Foundation

protocol ArticleDetailPresenter{
    func getUIData() -> (title:String,desc:String,image:String,date:String)

}

final class ArticleDetailViewModel : ArticleDetailPresenter {
    
    private var articleDetail: ArticleModel
    
    init(articleDetail: ArticleModel) {
        self.articleDetail = articleDetail
    }
    
    func getUIData() -> (title: String, desc: String, image: String, date: String) {
        let title = articleDetail.title ?? ""
        let desc = articleDetail.abstract ?? ""
        let image = articleDetail.media?.first?.mediaMetadata?.last?.url ?? ""
        let date = articleDetail.publishedDate ?? ""
        return (title, desc, image, date)
    }
}
