//
//  ReviewListViewController.swift
//  BookReview_MVP
//
//  Created by 장기화 on 2022/01/18.
//

import UIKit
import SnapKit

class ReviewListViewController: UIViewController {
    private lazy var presenter = ReviewListPresenter(viewController: self)
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.dataSource = presenter
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.viewWillAppear()
    }
}

extension ReviewListViewController: ReviewListProtocol {
    func setUpNavigation() {
        title = "도서 리뷰"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tapRightBarButton))
    }
    
    func setUpTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func presentToReviewWriteViewController() {
        let vc = UINavigationController(rootViewController: ReviewWriteViewController())
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    func reloadTableView() {
        tableView.reloadData()
        print("테이블뷰 리로드")
    }
}

extension ReviewListViewController {
    @objc func tapRightBarButton() {
        presenter.tapRightBarButton()
    }
}
