//
//  BookSearchViewController.swift
//  BookReview_MVP
//
//  Created by 장기화 on 2022/01/18.
//

import UIKit
import SnapKit

class BookSearchViewController: UIViewController {
    private lazy var presenter = BookSearchPresenter(viewController: self, delegate: bookSearchDelegate)
    
    private let bookSearchDelegate: BookSearchDelegate

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.delegate = presenter
        tableView.dataSource = presenter
        return tableView
    }()
    
    init(bookSearchDelegate: BookSearchDelegate) {
        self.bookSearchDelegate = bookSearchDelegate
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        navigationItem.searchController?.dismiss(animated: true, completion: nil)
        dismiss(animated: true, completion: nil)
    }
    
    func reloadView() {
        tableView.reloadData()
    }
}
