//
//  CommitsTableViewController.swift
//  GitHubAPI
//
//  Created by DTOMac13 on 9/17/20.
//  Copyright © 2020 AKSolutions. All rights reserved.
//

import UIKit

class CommitsTableViewController: UITableViewController {

    private let viewModel = CommitsTableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gradientLayer = viewModel.setBackgroundColor(view: self.view)
        let backgroundView = UIView(frame: tableView.bounds)
        backgroundView.layer.insertSublayer(gradientLayer, at: 0)
        tableView.backgroundView = backgroundView
        
        viewModel.getCommits(){[weak self] in
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }            
        }
    }

    @IBAction func pullToRefresh(_ sender: UIRefreshControl) {
        
        viewModel.getCommits(){[weak self] in
            
            DispatchQueue.main.async {
                sender.endRefreshing()

                self?.tableView.reloadData()
            }
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CommitsTableViewCell.reuseIdentifier, for: indexPath) as? CommitsTableViewCell else {
            return UITableViewCell()
        }
        
        let cellViewModel = viewModel.cellViewModel(index: indexPath.row)
        cell.viewModel = cellViewModel
        
        return cell
    }

 

}
