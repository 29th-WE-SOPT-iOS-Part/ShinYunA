//
//  ThumbnailTVC.swift
//  Youtube-Clone
//
//  Created by SHIN YOON AH on 2021/10/28.
//

import UIKit

import Then
import SnapKit

class ThumbnailTVC: UITableViewCell {
    static let identifier = "ThumbnailTVC"
    
    // MARK: - UI
    private let menuButton = UIButton().then {
        $0.setImage(YoutubeIcon.moreMenuIcon, for: .normal)
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
    private let profileImage = UIImageView().then {
        $0.image = YoutubeIcon.wesoptProfile
    }
    
    // MARK: - Properties
    private let manager = HomeManager.shared
    weak var delegate: ImageViewDelegate?

    // MARK: - Initalizing
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
        setupTapGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup Method
    private func setupLayout() {
        addSubviews([thumbnailImage,
                    profileImage,
                    menuButton,
                    titleLabel,
                    infoLabel])
        sendSubviewToBack(contentView)
        
        thumbnailImage.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(212)
        }
        
        profileImage.snp.makeConstraints {
            $0.top.equalTo(thumbnailImage.snp.bottom).offset(12)
            $0.leading.equalToSuperview().inset(12)
            $0.width.height.equalTo(36)
        }
        
        menuButton.snp.makeConstraints {
            $0.top.equalTo(thumbnailImage.snp.bottom).offset(7)
            $0.trailing.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(profileImage)
            $0.leading.equalTo(profileImage.snp.trailing).offset(12)
            $0.width.equalTo(UIScreen.main.bounds.size.width * 0.72)
        }
        
        infoLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(titleLabel)
            $0.bottom.equalToSuperview().inset(27)
        }
    }

    private func setupTapGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTappedThumbnail(_:)))
        thumbnailImage.addGestureRecognizer(gesture)
        thumbnailImage.isUserInteractionEnabled = true
    }
    
    // MARK: - Selector
    
    @objc
    private func didTappedThumbnail(_ gesture: UITapGestureRecognizer) {
        let vc = VideoVC()
        let index = getTableCellIndexPath()
        vc.setVideoData(index: index)
        delegate?.didClickedThumbnailImage(vc: vc)
    }
    
    // MARK: - Public Method
    
    public func getCellConfigureAt(_ index: Int) {
        thumbnailImage.image = manager.getThumbnailImage(index: index)
        titleLabel.text = manager.getTitle(index: index)
        
        let author = manager.getAuthor(index: index)
        let views = manager.getViews(index: index)
        let created = manager.getCreatedDate(index: index)
        infoLabel.text = "\(author) ・ 조회수 \(views) ・ \(created) "
    }
}
