//
//  ReviewListPresenter.swift
//  BookReview_MVP
//
//  Created by 장기화 on 2022/01/18.
//

import UIKit
import Kingfisher

protocol ReviewListProtocol {
    func setUpNavigation()
    func setUpTableView()
    func presentToReviewWriteViewController()
    func reloadTableView()
}

class ReviewListPresenter: NSObject {
    private let viewController: ReviewListProtocol
    private let userDefaultManager = UserDefaultsManager()
    
    private var bookReview: [BookReview] = []
    
    init(viewController: ReviewListProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        viewController.setUpNavigation()
        viewController.setUpTableView()
    }
    
    func viewWillAppear() {
        bookReview = userDefaultManager.getReview()
        viewController.reloadTableView()
    }
    
    func tapRightBarButton() {
        viewController.presentToReviewWriteViewController()
    }
}

extension ReviewListPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookReview.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let bookReview = bookReview[indexPath.row]
        cell.textLabel?.text = bookReview.title
        cell.detailTextLabel?.text = bookReview.content
        cell.imageView?.kf.setImage(with: bookReview.imageURL, completionHandler: { _ in
            cell.setNeedsLayout()
        })
        cell.selectionStyle = .none
        return cell
    }
}
