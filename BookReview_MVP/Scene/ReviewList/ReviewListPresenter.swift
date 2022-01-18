//
//  ReviewListPresenter.swift
//  BookReview_MVP
//
//  Created by 장기화 on 2022/01/18.
//

import Foundation

protocol ReviewListProtocol {
    
}

class ReviewListPresenter {
    private let viewController: ReviewListProtocol
    
    init(viewController: ReviewListProtocol) {
        self.viewController = viewController
    }
}
