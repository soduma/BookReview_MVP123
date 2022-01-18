//
//  ReviewListViewController.swift
//  BookReview_MVP
//
//  Created by 장기화 on 2022/01/18.
//

import UIKit

class ReviewListViewController: UIViewController {
    private lazy var presenter = ReviewListPresenter(viewController: self)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
}

extension ReviewListViewController: ReviewListProtocol {
    func setUpNavigation() {
        title = "도서 리뷰"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
    }
    
}
