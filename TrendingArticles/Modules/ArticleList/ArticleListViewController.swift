//
//  ArticleListViewController.swift
//  TrendingArticles
//
//  Created by Taimoor Suleman on 18/11/2024.
//

import UIKit

class ArticleListViewController: UIViewController {
    
    //MARK: - Iboutlets
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: - Variables
    var viewModel: ArticleListViewModelPresentable?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTableView()
        bindData()
        performRequest()
        navigationItem.largeTitleDisplayMode = .never

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    private func setupUI() {
        self.navigationController?.navigationBar.setCustomAppearance(backgroundColor: .systemGreen, titleColor: .white)
        self.navigationItem.title = "NY Times Most Popular"
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInsetAdjustmentBehavior = .always
        tableView.register(UINib(nibName: CellIdentifiers.articleTableViewCell, bundle: nil), forCellReuseIdentifier: CellIdentifiers.articleTableViewCell)
    }
    
    func performRequest()  {
        viewModel?.fetchArticlesData()
    }
    

}
//MARK: - UITableView Datasource, Delegate
extension ArticleListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: .articleTableViewCell, for: indexPath) as? ArticleTableViewCell{
            

            if let model = viewModel?.getArticleModel(for: indexPath.row){
                cell.populateUI(title: model.title ?? .emptyString,desc: model.abstract ?? .emptyString, date: model.publishedDate ?? .emptyString , imgPath: model.media?.first?.mediaMetadata?.first?.url ?? .emptyString)
            }
            
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let seasonsCount = viewModel?.numberOfArticles() ?? 0
        return seasonsCount
    }
      
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        if let model = viewModel?.getArticleModel(for: indexPath.row){
            let detailVC = ArticleDetailBuilder.build(articleDetail: model)
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
        
    }
    
}

//MARK: - Binding Data
extension ArticleListViewController {
    
    func bindData() {
        
        viewModel?.reloadTableViewData = { [weak self] in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.stopActivityIndicator()
                self.tableView.reloadData()
            }
        }
        
        viewModel?.startActivityIndicator = { [weak self] in
            guard let self = self else { return }
            self.startActivityIndicator()
        }
        
        viewModel?.stopActivityIndicator = { [weak self] in
            guard let self = self else { return }
            self.stopActivityIndicator()
        }
        
    }
}
