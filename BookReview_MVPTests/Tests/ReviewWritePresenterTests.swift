//
//  ReviewWritePresenterTests.swift
//  BookReview_MVPTests
//
//  Created by 장기화 on 2022/01/20.
//

import XCTest

@testable import BookReview_MVP

class ReviewWritePresenterTests: XCTestCase {
    var sut: ReviewWritePresenter!
    var viewController: MockReviewWriteViewController!
    var userDefaultsManager: MockUserDefaultsManager!
    
    override func setUp() {
        super.setUp()
        
        viewController = MockReviewWriteViewController()
        userDefaultsManager = MockUserDefaultsManager()
        
        sut = ReviewWritePresenter(viewController: viewController, userDefaultsManager: userDefaultsManager)
    }
    
    override func tearDown() {
        super.tearDown()
        
        sut = nil
        viewController = nil
        userDefaultsManager = nil
    }
    
    func test_viewDidLoad가호출될때() {
        sut.viewDidLoad()
        XCTAssertTrue(viewController.isCalledSetUpNavigation)
        XCTAssertTrue(viewController.isCalledSetUpLayout)
    }
    
    func test_tapLeftBarButton가호출될때() {
        sut.tapLeftBarButton()
        XCTAssertTrue(viewController.isCalledTapCloseButton)
    }
    
    func test_tapRightBarButton가호출될때book이존재하지않으면() {
        sut.book = nil
        sut.tapRightBarButton(contentText: "공부하기 좋은 책입니다.")
        XCTAssertFalse(userDefaultsManager.isCalledSetReview)
        XCTAssertFalse(viewController.isCalledTapSaveButton)
    }
    
    func test_tapRightBarButton가호출될때book이존재하고contentText가존재하지않으면() {
        sut.book = Book(title: "Swift", imageURL: "")
        sut.tapRightBarButton(contentText: nil)
        XCTAssertFalse(userDefaultsManager.isCalledSetReview)
        XCTAssertFalse(viewController.isCalledTapSaveButton)
    }
    
    func test_tapRightBarButton가호출될때book이존재하고contentText가placeHolder와같으면() {
        sut.book = Book(title: "Swift", imageURL: "")
        sut.tapRightBarButton(contentText: sut.contentTextViewPlaceHolder)
        XCTAssertFalse(userDefaultsManager.isCalledSetReview)
        XCTAssertFalse(viewController.isCalledTapSaveButton)
    }
    
    func test_tapRightBarButton가호출될때book이존재하고contentText가placeHolder와같지않게존재하면() {
        sut.book = Book(title: "Swift", imageURL: "")
        sut.tapRightBarButton(contentText: "공부하기 좋은 책입니다.")
        XCTAssertTrue(userDefaultsManager.isCalledSetReview)
        XCTAssertTrue(viewController.isCalledTapSaveButton)
    }
    
    func test_tapBookButton이호출될때() {
        sut.tapBookButton()
        XCTAssertTrue(viewController.isCalledPresentToBookSearchViewController)
    }
}

final class MockReviewWriteViewController: ReviewWriteProtocol {
    var isCalledSetUpNavigation = false
    var isCalledTapCloseButton = false
    var isCalledTapSaveButton = false
    var isCalledSetUpLayout = false
    var isCalledPresentToBookSearchViewController = false
    var isCalledUpdateViews = false
    
    func setUpNavigation() {
        isCalledSetUpNavigation = true
    }
    
    func tapCloseButton() {
        isCalledTapCloseButton = true
    }
    
    func tapSaveButton() {
        isCalledTapSaveButton = true
    }
    
    func setUpLayout() {
        isCalledSetUpLayout = true
    }
    
    func presentToBookSearchViewController() {
        isCalledPresentToBookSearchViewController = true
    }
    
    func updateViews(title: String, imageURL: URL?) {
        isCalledUpdateViews = true
    }
}
