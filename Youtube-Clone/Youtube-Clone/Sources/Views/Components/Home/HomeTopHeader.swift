//
//  HomeTopHeader.swift
//  Youtube-Clone
//
//  Created by SHIN YOON AH on 2021/10/28.
//

import UIKit

import Then
import SnapKit

class HomeTopHeader: UIView {
    
    // MARK: - UI
    private let logoImage = UIImageView().then {
        $0.image = YoutubeIcon.premiumLogo
    }
    private let sharingButton = UIButton().then {
        $0.setImage(YoutubeIcon.windowSharingIcon, for: .normal)
    }
    private let alertButton = UIButton().then {
        $0.setImage(YoutubeIcon.notificationIcon, for: .normal)
    }
    private let searchButton = UIButton().then {
        $0.setImage(YoutubeIcon.SearchIcon, for: .normal)
    }
    private let profileButton = UIButton().then {
        $0.setImage(YoutubeIcon.wesoptProfile, for: .normal)
    }

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
        addSubviews([logoImage,
                    profileButton,
                    searchButton,
                    alertButton,
                    sharingButton])
        
        logoImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(11)
            $0.leading.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(13)
        }
        
        profileButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.height.equalTo(24)
        }
        
        searchButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(5)
            $0.trailing.equalTo(profileButton.snp.leading).offset(-17)
        }
        
        alertButton.snp.makeConstraints {
            $0.top.equalTo(searchButton)
            $0.trailing.equalTo(searchButton.snp.leading).offset(-11)
        }
        
        sharingButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(6)
            $0.trailing.equalTo(alertButton.snp.leading).offset(-12)
        }
    }
}
