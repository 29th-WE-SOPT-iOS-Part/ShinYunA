//
//  HomeHeaderView.swift
//  Youtube-Clone
//
//  Created by SHIN YOON AH on 2021/10/28.
//

import UIKit

import Then
import SnapKit

class HomeHeaderView: UIView {
    
    // MARK: - UI
    private lazy var channelCollectionView = UICollectionView(frame: .zero, collectionViewLayout: channelLayout).then {
        $0.dataSource = self
        $0.delegate = self
        $0.showsHorizontalScrollIndicator = false
        $0.register(ChannelCVC.self, forCellWithReuseIdentifier: ChannelCVC.identifier)
    }
    private lazy var toggleCollectionView = UICollectionView(frame: .zero, collectionViewLayout: toggleLayout).then {
        $0.dataSource = self
        $0.delegate = self
        $0.showsHorizontalScrollIndicator = false
        $0.register(ToggleCVC.self, forCellWithReuseIdentifier: ToggleCVC.identifier)
    }
    private let separator = UIView().then {
        $0.backgroundColor = .subGray
    }
    private let channelLayout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
    }
    private let toggleLayout = UICollectionViewFlowLayout().then {
        $0.scrollDirection = .horizontal
    }
    
    // MARK: - Properties
    private let manager = HomeManager.shared
    private let lists: [String] = ["All", "Today", "Continue watching", "Unwatched", "Live", "Posts"]

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
        addSubviews([channelCollectionView,
                     toggleCollectionView,
                     separator])
        
        channelCollectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(104)
        }
        
        toggleCollectionView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(48)
        }
        
        separator.snp.makeConstraints {
            $0.top.equalTo(channelCollectionView.snp.bottom)
            $0.bottom.equalTo(toggleCollectionView.snp.top)
            $0.height.equalTo(1)
        }
    }
    
    // MARK: - Helper
    private func calculateCellWidth(index: Int) -> CGFloat {
        let label = UILabel()
        label.text = lists[index]
        label.font = .systemFont(ofSize: 14)
        label.sizeToFit()
        return label.frame.width + 20
    }
}

// MARK: - UICollectionViewDataSource
extension HomeHeaderView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case channelCollectionView:
            return manager.getChannelCount()
        case toggleCollectionView:
            return lists.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case channelCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChannelCVC.identifier, for: indexPath) as? ChannelCVC else { return UICollectionViewCell() }
            cell.getCellConfigureAt(indexPath.item)
            return cell
        case toggleCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ToggleCVC.identifier, for: indexPath) as? ToggleCVC else { return UICollectionViewCell() }
            cell.setToggleLabel(text: lists[indexPath.item])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeHeaderView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case channelCollectionView:
            return CGSize(width: 72, height: 104)
        case toggleCollectionView:
            return CGSize(width: calculateCellWidth(index: indexPath.item), height: 32)
        default:
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
        case toggleCollectionView:
            return 9
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        switch collectionView {
        case toggleCollectionView:
            return UIEdgeInsets(top: 8, left: 13, bottom: 8, right: 13)
        default:
            return UIEdgeInsets.zero
        }
    }
}
