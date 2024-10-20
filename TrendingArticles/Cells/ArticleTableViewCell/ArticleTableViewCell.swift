//
//  ArticleTableViewCell.swift
//  TrendingArticles
//
//  Created by Taimoor Suleman on 19/10/2024.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    //MARK: - IBOutlets

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var titleImg: UIImageView!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    //MARK: - Setup Methods
    private func configureUI(){
        titleImg.makeRound()
    }
    
    func populateUI(title:String, desc:String, date:String, imgPath:String){
        self.titleLbl.text = title
        self.descLbl.text = desc
        self.dateLbl.text = date
        if let url =  imgPath.toUrl{
            titleImg.loadImage(from: url)
        }
    }
    
}
