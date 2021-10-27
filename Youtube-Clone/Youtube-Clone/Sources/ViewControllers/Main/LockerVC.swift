//
//  LockerVC.swift
//  Youtube-Clone
//
//  Created by SHIN YOON AH on 2021/10/27.
//

import UIKit

import Then
import SnapKit

class LockerVC: UIViewController {
    
    // MARK: - UI
    private let logoutButton = UIButton().then {
        $0.setTitle("로그아웃하기", for: .normal)
        $0.setTitleColor(.googleBlue, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 15)
        $0.addTarget(self, action: #selector(touchUpLogout), for: .touchUpInside)
    }
    
    // MARK: - Properties
    private let manager = LoginManager.shared
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    // MARK: - Setup Method
    private func setupLayout() {
        view.addSubview(logoutButton)
        
        logoutButton.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    // MARK: - @objc
    @objc
    private func touchUpLogout() {
        manager.fetchMainLogout()
    }
}
