//
//  BookSearchPresenter.swift
//  BookReview_MVP
//
//  Created by 장기화 on 2022/01/18.
//

import UIKit

protocol BookSearchProtocol {
    func setUpLayout()
    func dismiss()
}

class BookSearchPresenter: NSObject {
    private let viewController: BookSearchProtocol
    
    init(viewController: BookSearchProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        viewController.setUpLayout()
    }
}

extension BookSearchPresenter: UISearchBarDelegate { //vc에서 해도 됨. 취향차이
    
}

extension BookSearchPresenter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewController.dismiss()
    }
}

extension BookSearchPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(indexPath)"
        return cell
    }    
}
