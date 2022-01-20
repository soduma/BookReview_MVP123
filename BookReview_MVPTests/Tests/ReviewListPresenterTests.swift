//
//  ReviewListPresenterTests.swift
//  BookReview_MVPTests
//
//  Created by 장기화 on 2022/01/18.
//

import XCTest
@testable import BookReview_MVP

class ReviewListPresenterTests: XCTestCase {
    var sut: ReviewListPresenter! // 테스트대상
    var viewController: MockReviewListViewController!
    var userDefaultsManager: MockUserDefaultsManager!
    
    override func setUp() {
        super.setUp()
        
        viewController = MockReviewListViewController()
        userDefaultsManager = MockUserDefaultsManager()
        
        sut = ReviewListPresenter(viewController: viewController,
        userDefaultsManager: userDefaultsManager)
    }
    
    override func tearDown() {
        super.tearDown()
        
        sut = nil
        viewController = nil
    }
    
    func test_viewDidLoad가호출될때() {
        sut.viewDidLoad()
        
        XCTAssertTrue(viewController.isCalledSetUpNavigation)
        XCTAssertTrue(viewController.isCalledSetUpTableView)
    }
    
    func test_tapRightBarButton가호출될때() {
        sut.tapRightBarButton()
        
        XCTAssertTrue(viewController.isCalledPresentToReviewWriteViewController)
    }
    
    func test_viewWillAppear가호출될때() {
        sut.viewWillAppear()
        
        XCTAssertTrue(userDefaultsManager.isCalledGetReview)
        XCTAssertTrue(viewController.isCalledReloadTableView)
    }
}
