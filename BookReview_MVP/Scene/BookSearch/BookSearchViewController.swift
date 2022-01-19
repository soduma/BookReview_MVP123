//
//  BookSearchViewController.swift
//  BookReview_MVP
//
//  Created by 장기화 on 2022/01/18.
//

import UIKit
import SnapKit

class BookSearchViewController: UIViewController {
    private lazy var presenter = BookSearchPresenter(viewController: self)

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.delegate = presenter
        tableView.dataSource = presenter
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewDidLoad()
    }
}

extension BookSearchViewController: BookSearchProtocol {
    func setUpLayout() {
        view.backgroundColor = .systemBackground
        let searchController = UISearchController()
//        searchController.obscuresBackgroundDuringPresentation = false // 서치바 활성때 배경색이 어두워지지 않게
        searchController.searchBar.delegate = presenter
        navigationItem.searchController = searchController
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func dismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    func reloadView() {
        tableView.reloadData()
    }
}
