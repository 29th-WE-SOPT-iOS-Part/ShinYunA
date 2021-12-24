//
//  HomeVC.swift
//  Youtube-Clone
//
//  Created by SHIN YOON AH on 2021/10/27.
//

import UIKit

import Then
import SnapKit

protocol ImageViewDelegate: HomeVC {
    func didClickedThumbnailImage(vc: UIViewController)
}

class HomeVC: UIViewController {
    
    // MARK: - UI
    private lazy var tableView = UITableView(frame: .zero, style: .grouped).then {
        $0.dataSource = self
        $0.delegate = self
        $0.estimatedRowHeight = 100
        $0.contentInset = UIEdgeInsets(top: 44, left: 0, bottom: 0, right: 0)
        $0.register(ThumbnailTVC.self, forCellReuseIdentifier: ThumbnailTVC.identifier)
        
        if #available(iOS 15.0, *) {
            $0.sectionHeaderTopPadding = 0
        }
    }
    private let topHeader = HomeTopHeader().then {
        $0.backgroundColor = .white
    }
    
    // MARK: - Properties
    private let thumbnailMG = HomeManager.shared
    private var scrollingUp = false

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        configUI()
    }
    
    // MARK: - Setup Method
    private func setupLayout() {
        view.addSubviews([tableView,
                          topHeader])
        
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        topHeader.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.width.equalTo(UIScreen.main.bounds.size.width)
            $0.height.equalTo(44)
        }
    }
    
    private func configUI() {
        view.backgroundColor = .white
    }
}

// MARK: - UITableViewDataSource
extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return thumbnailMG.getThumbnailCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ThumbnailTVC.identifier) as? ThumbnailTVC else { return UITableViewCell() }
        cell.getCellConfigureAt(indexPath.row)
        cell.delegate = self
        return cell
    }
}

// MARK: - UITableViewDelegate
extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return HomeHeaderView()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        
        if offset > 115, !scrollingUp {
            topHeader.transform = CGAffineTransform(translationX: 0, y: -(offset/10))
            topHeader.alpha = 1.0 - (offset/150)
        } else {
            topHeader.transform = .identity
            topHeader.alpha = 1.0
        }
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        let actualPosition = scrollView.panGestureRecognizer.translation(in: scrollView.superview)
            if actualPosition.y > 0 {
                scrollingUp = true
            } else {
                scrollingUp = false
            }
    }
}

// MARK: - ImageViewDelegate
extension HomeVC: ImageViewDelegate {
    func didClickedThumbnailImage(vc: UIViewController) {
        present(vc, animated: true, completion: nil)
    }
}
