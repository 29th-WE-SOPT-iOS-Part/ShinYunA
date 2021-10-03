//
//  CheckVC.swift
//  Youtube-Clone
//
//  Created by SHIN YOON AH on 2021/10/04.
//

import UIKit

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
    private let signinButton = UIButton().then {
        $0.setTitle("확인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 15)
        $0.backgroundColor = .googleBlue
        $0.layer.cornerRadius = 10
    }

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
                         signinButton])
        
        logoLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(180)
        }
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(logoLabel.snp.bottom).offset(25)
        }
        signinButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(50)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(40)
        }
    }
}
