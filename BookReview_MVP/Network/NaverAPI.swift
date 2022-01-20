//
//  NaverAPI.swift
//  BookReview_MVP
//
//  Created by 장기화 on 2022/01/19.
//

import Foundation
import UIKit

struct NaverAPI: Codable {
    var items: [Book]
}

struct Book: Codable {
    let title: String
    private let image: String?
    
    var imageURL: URL? {
        return URL(string: image ?? "")
    }
    
    init(title: String, imageURL: String?) {
        self.title = title
        self.image = imageURL
    }
}
