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
    private let userDefaultsManager: UserDefaultsManagerProtocol
    
    var book: Book?
    let contentTextViewPlaceHolder = "입력해주세요"
    
    init(viewController: ReviewWriteProtocol, userDefaultsManager: UserDefaultsManagerProtocol = UserDefaultsManager()) {
        self.viewController = viewController
        self.userDefaultsManager = userDefaultsManager
    }
    
    func viewDidLoad() {
        viewController.setUpNavigation()
        viewController.setUpLayout()
    }
    
    func tapLeftBarButton() {
        viewController.tapCloseButton()
    }
    
    func tapRightBarButton(contentText: String?) {
        guard let book = book,
              let contentText = contentText, contentText != contentTextViewPlaceHolder else { return }
        let bookReview = BookReview(title: book.title, content: contentText, imageURL: book.imageURL)
        userDefaultsManager.setReview(bookReview)
        viewController.tapSaveButton()
    }
    
    func tapBookButton() {
        viewController.presentToBookSearchViewController()
    }
}

extension ReviewWritePresenter: BookSearchDelegate {
    func selectBook(_ book: Book) {
        self.book = book
        viewController.updateViews(title: book.title, imageURL: book.imageURL)
    }
}
