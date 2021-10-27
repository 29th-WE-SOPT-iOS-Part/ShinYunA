//
//  HomeVC.swift
//  Youtube-Clone
//
//  Created by SHIN YOON AH on 2021/10/27.
//

import UIKit

import Then
import SnapKit

class HomeVC: UIViewController {
    
    // MARK: - UI
    private lazy var tableView = UITableView(frame: .zero, style: .grouped).then {
        $0.dataSource = self
        $0.delegate = self
        $0.estimatedRowHeight = 100
        $0.register(ThumbnailTVC.self, forCellReuseIdentifier: ThumbnailTVC.identifier)
        
        if #available(iOS 15.0, *) {
            $0.sectionHeaderTopPadding = 0
        }
    }
    
    // MARK: - Properties
    private let thumbnailMG = ThumbnailManager.shared

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        configUI()
    }
    
    // MARK: - Setup Method
    private func setupLayout() {
        view.addSubviews([tableView])
        
        tableView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
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
        return cell
    }
}

// MARK: - UITableViewDelegate
extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "hi"
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}
