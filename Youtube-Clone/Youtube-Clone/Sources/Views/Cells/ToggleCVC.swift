//
//  ToggleCVC.swift
//  Youtube-Clone
//
//  Created by SHIN YOON AH on 2021/10/28.
//

import UIKit

import Then
import SnapKit

class ToggleCVC: UICollectionViewCell {
    static let identifier = "ToggleCVC"
    
    // MARK: - UI
    private let label = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
    }
    
    // MARK: - Initalizing
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupLayout()
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Method
    private func setupLayout() {
        addSubview(label)
        
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    private func configUI() {
        backgroundColor = .subGray100
        
        layer.cornerRadius = 15
        layer.borderWidth = 1
        layer.borderColor = UIColor.subGray200.cgColor
    }
    
    // MARK: - Public Method
    public func setToggleLabel(text: String) {
        label.text = text
    }
}
