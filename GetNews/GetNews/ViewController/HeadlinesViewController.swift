//
//  HeadlinesViewController.swift
//  GetNews
//
//  Created by emre usul on 16.01.2023.
//

import UIKit

 class HeadlinesViewController: UIViewController {
    
    public let viewModel: TopHeadlinesViewModel
    
    init(model: TopHeadlinesViewModel) {
        self.viewModel = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let tableView = HeadlinesView().tableView
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        setNavBar(title: "GetNews", preferredLarge: true)
        tableViewSetup()
        viewSubview()
        fetchNews()
        bindModelEvent()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    private func fetchNews() {
        viewModel.fetchHeadlines()
    }
    
    private func bindModelEvent() {
        viewModel.onFetchNewsSuccedd = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        viewModel.onFetchNewsFailure = { error in
            print(error)
        }
    }
    
    private func tableViewSetup() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func viewSubview() {
        view.addSubview(tableView)
    }


}

extension HeadlinesViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HeadlineTableViewCell.identifier, for: indexPath) as! HeadlineTableViewCell
        let news = viewModel.news[indexPath.row]
        cell.configureCell(news: news.title, description: news.description ?? "There is no description for this news")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 200
    }
    
}



