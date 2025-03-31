//
//  SquareBuilder.swift
//  UIKitPractice
//
//  Created by Павел Градов on 01.04.2025.
//

import UIKit

struct ViewBuilder {
    static func getSquare(with color: UIColor) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        return view
    }
    
    static func getHorizontalStack() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = ViewConstants.posSpacing
        stack.distribution = .fillEqually
        stack.backgroundColor = .clear
        return stack
    }
}
