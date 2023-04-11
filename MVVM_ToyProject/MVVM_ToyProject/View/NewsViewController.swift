//
//  ViewController.swift
//  MVVM_ToyProject
//
//  Created by 한택환 on 2023/02/20.
//

import UIKit

final class NewsViewController: UIViewController {
    
    private var newsVM: NewsViewModel!
    private var newsTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.rowHeight = 150
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpData()
        setNewsView()
    }
    
    private func setUpData() {
        NetworkService().getArticles() { articles in
            if let articles = articles {
                self.newsVM = NewsViewModel(articles: articles)
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
        if let newVM = newsVM {
            return newVM.articleCount
        } else { return 0 }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "News", for: indexPath) as? NewsTableViewCell else { fatalError("no matched newsTableView identifier") }
        
        if let newsVM = newsVM {
            let articleVM = newsVM.articleIndex(indexPath.row)
            cell.titleLabel.text = articleVM.title
            cell.authorLabel.text = articleVM.author
            cell.descriptionLabel.text = articleVM.description
        }
        return cell
    }
}
