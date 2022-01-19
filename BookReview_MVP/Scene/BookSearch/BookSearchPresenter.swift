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
    func reloadView()
}

class BookSearchPresenter: NSObject {
    private let viewController: BookSearchProtocol
    private let manager = BookSearchManager()
    
    private var books: [Book] = []
    
    init(viewController: BookSearchProtocol) {
        self.viewController = viewController
    }
    
    func viewDidLoad() {
        viewController.setUpLayout()
    }
}

extension BookSearchPresenter: UISearchBarDelegate { //vc에서 해도 됨. 취향차이
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        manager.request(from: searchText) { [weak self] newBooks in
            self?.books = newBooks
            self?.viewController.reloadView()
        }
    }
}

extension BookSearchPresenter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewController.dismiss()
    }
}

extension BookSearchPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = books[indexPath.row].title
        return cell
    }
}
