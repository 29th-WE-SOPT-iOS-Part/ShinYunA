//
//  CheckVC.swift
//  Youtube-Clone
//
//  Created by SHIN YOON AH on 2021/10/04.
//

import UIKit

import Then
import SnapKit

class CheckVC: UIViewController {
    
    // MARK: - UI
    var titleLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 30)
        $0.textColor = .black
        $0.numberOfLines = 2
        $0.textAlignment = .center
    }
    private let logoLabel = UILabel().then {
        $0.text = "Google"
        $0.font = .boldSystemFont(ofSize: 40)
        $0.textColor = .black
    }
    private let checkButton = UIButton().then {
        $0.setTitle("확인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 15)
        $0.backgroundColor = .googleBlue
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(touchUpConfirm), for: .touchUpInside)
    }
    private let logoutButton = UIButton().then {
        $0.setTitle("다른 계정으로 로그인하기", for: .normal)
        $0.setTitleColor(.googleBlue, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 15)
        $0.addTarget(self, action: #selector(touchUpLogout), for: .touchUpInside)
    }
    
    // MARK: - Properties
    private let manager = LoginManager.shared

    // MARK: - App Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
    
    // MARK: - Setup Method
    private func setupLayout() {
        view.addSubviews([logoLabel,
                         titleLabel,
                          checkButton,
                         logoutButton])
        
        logoLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(180)
        }
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(logoLabel.snp.bottom).offset(25)
        }
        checkButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(50)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(40)
        }
        logoutButton.snp.makeConstraints {
            $0.top.equalTo(checkButton.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
    }
    
    // MARK: - @objc
    @objc
    private func touchUpLogout() {
        let status = manager.fetchLogout()
        
        if status {
            guard let presentingVC = presentingViewController as? UINavigationController else { return }
            dismiss(animated: true) {
                presentingVC.popToRootViewController(animated: false)
            }
        }
    }
    
    @objc
    private func touchUpConfirm() {
        let mainTabbar = TabbarController()
        mainTabbar.modalPresentationStyle = .fullScreen
        present(mainTabbar, animated: true, completion: nil)
    }
}
