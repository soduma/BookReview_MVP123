//
//  ReviewWritePresenter.swift
//  BookReview_MVP
//
//  Created by 장기화 on 2022/01/18.
//

import UIKit

protocol ReviewWriteProtocol {
    func setUpNavigation()
    func tapCloseButton()
    func tapSaveButton()
    func setUpLayout()
    func presentToBookSearchViewController()
    func updateViews(title: String, imageURL: URL?)
}

class ReviewWritePresenter {
    private let viewController: ReviewWriteProtocol
    
    init(viewController: ReviewWriteProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        viewController.setUpNavigation()
        viewController.setUpLayout()
    }
    
    func tapLeftBarButton() {
        viewController.tapCloseButton()
    }
    
    func tapRightBarButton() {
        viewController.tapSaveButton()
    }
    
    func tapBookButton() {
        viewController.presentToBookSearchViewController()
    }
}

extension ReviewWritePresenter: BookSearchDelegate {
    func selectBook(_ book: Book) {
        viewController.updateViews(title: book.title, imageURL: book.imageURL)
    }
}
