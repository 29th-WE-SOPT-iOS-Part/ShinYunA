//
//  ChannelCVC.swift
//  Youtube-Clone
//
//  Created by SHIN YOON AH on 2021/10/28.
//

import UIKit

import Then
import SnapKit

class ChannelCVC: UICollectionViewCell {
    static let identifier = "ChannelCVC"
    
    // MARK: - UI
    private let profileImage = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    private let channelLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .subGray
        $0.textAlignment = .center
    }
    
    // MARK: - Properties
    private let manager = HomeManager.shared
    
    // MARK: - Initalizing
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Method
    private func setupLayout() {
        addSubviews([profileImage,
                    channelLabel])
        
        profileImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.leading.trailing.equalToSuperview().inset(7)
            $0.width.height.equalTo(58)
        }
        
        channelLabel.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview().inset(7)
            $0.bottom.equalToSuperview().inset(14)
            $0.width.equalTo(58)
        }
    }
    
    // MARK: - Public Method
    public func getCellConfigureAt(_ index: Int) {
        profileImage.image = manager.getChannelImage(index: index)
        channelLabel.text = manager.getChannelTitle(index: index)
    }
}
