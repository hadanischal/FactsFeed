//
//  FeedsViewController.swift
//  FactsFeed
//
//  Created by Nischal Hada on 5/29/18.
//  Copyright © 2018 NischalHada. All rights reserved.
//

import UIKit

class FeedsViewController: UIViewController {
    private let refreshControl = UIRefreshControl()
    @IBOutlet weak var tableView: UITableView!
    fileprivate var service: FeedsService! = FeedsService()
    let dataSource = FeedsDataSource()
    lazy var viewModel: FeedsViewModel = {
        let viewModel = FeedsViewModel(service: service, dataSource: dataSource)
        return viewModel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self.dataSource
        self.dataSource.data.addAndNotify(observer: self) { [weak self] in
            self?.tableView.reloadData()
        }
        self.setupUI()
        self.setupUIRefreshControl()
        self.serviceCall()
    }

    func setupUIRefreshControl() {//refresh
        refreshControl.addTarget(self, action: #selector(serviceCall), for: UIControl.Event.valueChanged)
        self.tableView.addSubview(refreshControl)
    }
    @objc func serviceCall() {
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
            self.viewModel.fetchServiceCall { result in
                switch result {
                case .success :
                    self.title = self.viewModel.title //json value
                    break
                case .failure :
                    break
                }
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
        }
        refreshControl.endRefreshing()
    }
    func setupUI() {
        self.tableView.backgroundColor = ThemeColor.white
        self.view.backgroundColor = ThemeColor.white
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.refresh, target: self, action: #selector(serviceCall))
    }
}

// MARK: - TableViewDelegate Setup

extension FeedsViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
