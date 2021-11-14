//
//  UIView+.swift
//  Youtube-Clone
//
//  Created by SHIN YOON AH on 2021/10/04.
//

import UIKit

internal extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
    
    func constraint(_ anchor: NSLayoutDimension, constant: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        anchor.constraint(equalToConstant: constant).isActive = true
    }
}
