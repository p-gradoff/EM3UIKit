//
//  ViewController.swift
//  UIKitPractice
//
//  Created by Alexander Korchak on 30.11.2023.
//

import UIKit

enum ViewConstants {
    static let viewSize: CGFloat = 300
    static let posSpacing: CGFloat = 8
    static var negSpacing: CGFloat { -posSpacing }
}

class EqualSquaresViewController: UIViewController {
    
    @Autolayout private var contentView: UIView = {
        $0.backgroundColor = .lightGray
        return $0
    }(UIView())
    
    @Autolayout private var leadingTopSquareView: UIView = ViewBuilder.getSquare(with: .red)
    @Autolayout private var trailingTopSquareView: UIView = ViewBuilder.getSquare(with: .yellow)
    @Autolayout private var leadingBottomSquareView: UIView = ViewBuilder.getSquare(with: .green)
    @Autolayout private var trailingBottomSquareView: UIView = ViewBuilder.getSquare(with: .blue)
    
    @Autolayout private var topHorizontalStackView: UIStackView = ViewBuilder.getHorizontalStack()
    @Autolayout private var bottomHorizontalStackView: UIStackView = ViewBuilder.getHorizontalStack()
    
    @Autolayout private var verticalStackView: UIStackView = {
        $0.backgroundColor = .clear
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = ViewConstants.posSpacing
        return $0
    }(UIStackView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        [leadingTopSquareView, trailingTopSquareView].forEach { topHorizontalStackView.addArrangedSubview($0) }
        [leadingBottomSquareView, trailingBottomSquareView].forEach { bottomHorizontalStackView.addArrangedSubview($0) }
        [topHorizontalStackView, bottomHorizontalStackView].forEach { verticalStackView.addArrangedSubview($0) }
        
        contentView.addSubview(verticalStackView)
        view.addSubview(contentView)
        
        activateConstraints()
    }
    
    private func activateConstraints() {
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            contentView.widthAnchor.constraint(equalToConstant: ViewConstants.viewSize),
            contentView.heightAnchor.constraint(equalToConstant: ViewConstants.viewSize),
            
            verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: ViewConstants.posSpacing),
            verticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: ViewConstants.posSpacing),
            verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: ViewConstants.negSpacing),
            verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: ViewConstants.negSpacing)
        ])
    }
}

#Preview {
    EqualSquaresViewController()
}

