//
//  ReviewWriteViewController.swift
//  BookReview_MVP
//
//  Created by 장기화 on 2022/01/18.
//

import UIKit
import SnapKit
import Kingfisher

class ReviewWriteViewController: UIViewController {
    private lazy var presenter = ReviewWritePresenter(viewController: self)
    
    private lazy var bookTitleButton: UIButton = {
        let button = UIButton()
        button.setTitle("책 제목", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .bold)
        button.addTarget(self, action: #selector(tapBookButton), for: .touchUpInside)
        button.titleLabel?.numberOfLines = 2
        return button
    }()
    
    private lazy var bookTextView: UITextView = {
        let textView = UITextView()
        textView.text = "입력해주세요"
        textView.textColor = .secondaryLabel
        textView.font = .systemFont(ofSize: 16, weight: .medium)
        textView.delegate = self
        return textView
    }()
    
    private lazy var bookImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .secondarySystemBackground
        return imageView
    }()
    
    private lazy var separateView: UIView = {
        let view = UIView()
        view.backgroundColor = .separator
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }
}

extension ReviewWriteViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        guard textView.textColor == .secondaryLabel else { return }
        textView.text = ""
        textView.textColor = .label
    }
}

extension ReviewWriteViewController: ReviewWriteProtocol {
    func setUpNavigation() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(tapLeftBarButton))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(tapRightbarButton))
    }
    
    func tapCloseButton() {
        let alertController = UIAlertController(title: "닫으시겠습니까?", message: nil, preferredStyle: .alert)
        
        let close = UIAlertAction(title: "닫기", style: .destructive) { [weak self] _ in
            self?.dismiss(animated: true, completion: nil)
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        [close, cancel]
            .forEach { alertController.addAction($0) }
        present(alertController, animated: true, completion: nil)
    }
    
    func tapSaveButton() {
        dismiss(animated: true, completion: nil)
    }
    
    func presentToBookSearchViewController() {
        present(UINavigationController(rootViewController: BookSearchViewController(bookSearchDelegate: presenter)), animated: true, completion: nil)
    }
    
    func updateViews(title: String, imageURL: URL?) {
        bookTitleButton.setTitle(title, for: .normal)
        bookTitleButton.setTitleColor(.label, for: .normal)
        bookImageView.kf.setImage(with: imageURL)
    }
    
    func setUpLayout() {
        view.backgroundColor = .systemBackground
        [bookTitleButton, separateView, bookTextView, bookImageView]
            .forEach { view.addSubview($0) }
        
        bookTitleButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        separateView.snp.makeConstraints {
            $0.top.equalTo(bookTitleButton.snp.bottom).offset(8)
            $0.leading.equalTo(bookTitleButton)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        bookTextView.snp.makeConstraints {
            $0.top.equalTo(separateView.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        bookImageView.snp.makeConstraints {
            $0.top.equalTo(bookTextView.snp.bottom).offset(16)
            $0.leading.trailing.equalTo(bookTextView)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(bookTextView.snp.width)
        }
    }
}

extension ReviewWriteViewController {
    @objc func tapLeftBarButton() {
        presenter.tapLeftBarButton()
    }
    
    @objc func tapRightbarButton() {
        presenter.tapRightBarButton()
    }
    
    @objc func tapBookButton() {
        presenter.tapBookButton()
    }
}
