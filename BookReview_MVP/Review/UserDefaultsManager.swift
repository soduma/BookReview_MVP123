//
//  UserDefaultsManager.swift
//  BookReview_MVP
//
//  Created by 장기화 on 2022/01/19.
//

import Foundation

protocol UserDefaultsProtocol {
    func getReview() -> [BookReview]
    func setReview(_ newValue: BookReview)
}

struct UserDefaultsManager: UserDefaultsProtocol {
    enum Key: String {
        case review
    }
    
    func getReview() -> [BookReview] {
        guard let data = UserDefaults.standard.data(forKey: Key.review.rawValue) else { return [] }
        
        return (try? PropertyListDecoder().decode([BookReview].self, from: data)) ?? []
    }
    
    func setReview(_ newValue: BookReview) {
        var currentReviews: [BookReview] = getReview()
        currentReviews.insert(newValue, at: 0)
        
        UserDefaults.standard.set(try? PropertyListEncoder().encode(currentReviews), forKey: Key.review.rawValue)
    }
}
