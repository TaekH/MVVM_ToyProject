//
//  ViewController.swift
//  MVVM_ToyProject
//
//  Created by 한택환 on 2023/02/20.
//

import UIKit

final class NewsViewController: UIViewController {
    
    private var newsVM: NewsViewModel!
    private var newsTableView: UITableView!
    private var observer: NSKeyValueObservation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setNewsView()
        // Do any additional setup after loading the view.
    }
    
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = URL(string: "https://newsapi.org/v2/everything?q=tesla&from=2023-01-22&sortBy=publishedAt&apiKey=1d54e43914a942ccb07949ebf0d00e3d")!
        NetworkService().getArticles(url: url) { //1
            (articles) in
            
            if let articles = articles {
                self.newsVM = NewsViewModel(articles: articles) //2
            }
            DispatchQueue.main.async {
                self.newsTableView.reloadData()
            }
        }
    }
}

private extension NewsViewController {
    func setNewsView() {
        newsTableView.dataSource = self
        //newsTableView.delegate = self
        newsTableView.register(NewsTableViewCell.classForCoder(), forCellReuseIdentifier: "News")
        self.view.addSubview(newsTableView)
        setNewsLayout()
        
    }
    
}
private extension NewsViewController {
    func setNewsLayout() {
        newsTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newsTableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            newsTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            newsTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            newsTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
}

extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsVM.articleCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "News", for: indexPath) as? NewsTableViewCell else {fatalError("no matched newsTableView identifier")}
        
        let articleVM = newsVM.articleIndex(indexPath.row)
        cell.titleLabel.text = articleVM.title
        cell.authorLabel.text = articleVM.author
        cell.descriptionLabel.text = articleVM.description
        return cell
    }
}
