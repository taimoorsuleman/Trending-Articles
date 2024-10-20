//
//  ArticleDetailViewController.swift
//  TrendingArticles
//
//  Created by Taimoor Suleman on 19/10/2024.
//

import UIKit

class ArticleDetailViewController: UIViewController {

    @IBOutlet weak var titleImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    //MARK: - Variables
    var viewModel: ArticleDetailPresenter?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        updateUI()
    }
    
    private func setupUI() {
        self.navigationController?.navigationBar.setCustomAppearance(backgroundColor: .systemGreen, titleColor: .white)
        self.navigationItem.title = "NY Times Most Popular"
    }
    
    private func updateUI() {

        if let data = viewModel?.getUIData(){
            titleLbl.text = data.title
            descLbl.text = data.desc
            dateLbl.text = data.date
            if let url =  data.image.toUrl{
                titleImg.loadImage(from: url)
            }
        }
    
    }

    
}
