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
        // Do any additional setup after loading the view.
    
    }
}

extension ReviewListViewController: ReviewListProtocol {
    
}
