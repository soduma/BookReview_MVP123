//
//  BookSearchManager.swift
//  BookReview_MVP
//
//  Created by 장기화 on 2022/01/19.
//

import Foundation
import Alamofire

struct BookSearchManager {
    func request(from keyword: String, completionHandler: @escaping ([Book]) -> Void ) {
        guard let url = URL(string: "https://openapi.naver.com/v1/search/book.json") else { return }
        
        let parameters = RequestModel(query: keyword)
        let headers: HTTPHeaders = [
            "X-Naver-Client-Id": "201FemwuZ7HTebMDK3uG",
            "X-Naver-Client-Secret": "Oqv5e6oDcp"
        ]
        
        AF
            .request(url, method: .get, parameters: parameters, headers: headers)
            .responseDecodable(of: NaverAPI.self) { response in
                switch response.result {
                case .success(let result):
                    completionHandler(result.items)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            .resume()
    }
}
