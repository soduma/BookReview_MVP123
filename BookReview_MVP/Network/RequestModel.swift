//
//  RequestModel.swift
//  BookReview_MVP
//
//  Created by 장기화 on 2022/01/19.
//

import Foundation

struct RequestModel: Codable {
    ///검색할 책 키워드
    let query: String
}
