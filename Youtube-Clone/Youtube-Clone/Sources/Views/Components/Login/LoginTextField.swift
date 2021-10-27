//
//  LoginTextField.swift
//  Youtube-Clone
//
//  Created by SHIN YOON AH on 2021/10/04.
//

import UIKit

class LoginTextField: UITextField {

    // MARK: - Initalizing
    override init(frame: CGRect) {
        super.init(frame: frame)
        constraint(heightAnchor, constant: 60)
        configUI()
    }
    
    convenience init(placeholder: String, isSecureTextEntry: Bool = false) {
        self.init(frame: .zero)
        self.placeholder = placeholder
        self.isSecureTextEntry = isSecureTextEntry
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Method
    private func configUI() {
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.darkGray.cgColor
        layer.cornerRadius = 10
        
        setLeftPaddingPoints(20)
        setRightPaddingPoints(20)
    }
}
