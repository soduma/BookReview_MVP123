//
//  MockReviewListViewController.swift
//  BookReview_MVPTests
//
//  Created by 장기화 on 2022/01/20.
//

import Foundation

@testable import BookReview_MVP

final class MockReviewListViewController: ReviewListProtocol {
    var isCalledSetUpNavigation = false
    var isCalledSetUpTableView = false
    var isCalledPresentToReviewWriteViewController = false
    var isCalledReloadTableView = false
    
    func setUpNavigation() {
        isCalledSetUpNavigation = true
    }
    
    func setUpTableView() {
        isCalledSetUpTableView = true
    }
    
    func presentToReviewWriteViewController() {
        isCalledPresentToReviewWriteViewController = true
    }
    
    func reloadTableView() {
        isCalledReloadTableView = true
    }
}
