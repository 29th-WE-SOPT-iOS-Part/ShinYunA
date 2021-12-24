//
//  VideoVC.swift
//  Youtube-Clone
//
//  Created by SHIN YOON AH on 2021/12/24.
//

import UIKit

import Then
import SnapKit

final class VideoVC: UIViewController {
    
    // MARK: - UI
    
    private let menuButton = UIButton().then {
        $0.setImage(YoutubeIcon.icn_expandBtn, for: .normal)
    }
    private let backButton = UIButton().then {
        $0.setImage(YoutubeIcon.icn_dismissBtn, for: .normal)
    }
    private let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 15)
        $0.numberOfLines = 2
    }
    private let infoLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13)
        $0.textColor = .subGray
    }
    private let thumbnailImage = UIImageView().then {
        $0.contentMode = .scaleToFill
    }
    
    // MARK: - Properties
    
    private let manager = HomeManager.shared
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Setup Methods
    
    private func setupLayout() {
        view.addSubviews([thumbnailImage,
                    backButton,
                    menuButton,
                    titleLabel,
                    infoLabel])
        
        thumbnailImage.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(212)
        }
        
        backButton.snp.makeConstraints {
            $0.top.equalTo(thumbnailImage)
            $0.leading.equalToSuperview()
            $0.width.height.equalTo(36)
        }
        
        menuButton.snp.makeConstraints {
            $0.top.equalTo(thumbnailImage.snp.bottom).offset(12)
            $0.trailing.equalToSuperview().inset(7)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(menuButton)
            $0.leading.equalToSuperview().inset(12)
            $0.width.equalTo(UIScreen.main.bounds.size.width * 0.72)
        }
        
        infoLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(titleLabel)
        }
    }
    
    private func configUI() {
        view.backgroundColor = .white
    }
    
    // MARK: - Public Method
    
    public func setVideoData(index: Int) {
        thumbnailImage.image = manager.getThumbnailImage(index: index)
        titleLabel.text = manager.getTitle(index: index)
        
        let author = manager.getAuthor(index: index)
        let views = manager.getViews(index: index)
        let created = manager.getCreatedDate(index: index)
        infoLabel.text = "\(author) ・ 조회수 \(views) ・ \(created) "
    }
}
