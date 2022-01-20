//
//  MockUserDefaultsManager.swift
//  BookReview_MVPTests
//
//  Created by 장기화 on 2022/01/20.
//

import Foundation

@testable import BookReview_MVP

final class MockUserDefaultsManager: UserDefaultsManagerProtocol {
    var isCalledGetReview = false
    var isCalledSetReview = false
    
    func getReview() -> [BookReview] {
        isCalledGetReview = true
        return []
    }
    
    func setReview(_ newValue: BookReview) {
        isCalledSetReview = true
    }
}
