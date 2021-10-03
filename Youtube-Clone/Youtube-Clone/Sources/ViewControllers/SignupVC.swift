//
//  SignupVC.swift
//  Youtube-Clone
//
//  Created by SHIN YOON AH on 2021/10/04.
//

import UIKit

import Then
import SnapKit

class SignupVC: UIViewController {
    
    // MARK: - UI
    private let logoLabel = UILabel().then {
        $0.text = "Google"
        $0.font = .boldSystemFont(ofSize: 40)
        $0.textColor = .black
    }
    private let titleLabel = UILabel().then {
        $0.text = "회원가입"
        $0.font = .boldSystemFont(ofSize: 30)
        $0.textColor = .black
    }
    private let signinButton = UIButton().then {
        $0.setTitle("다음", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 15)
        $0.backgroundColor = .googleBlue
        $0.layer.cornerRadius = 10
    }
    private var showPasswordButton = UIButton().then {
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(systemName: "square")
        configuration.titlePadding = 10
        configuration.imagePadding = 10
        configuration.baseForegroundColor = .lightGray
        configuration.attributedTitle = AttributedString("비밀번호 표시", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)]))
        $0.configuration = configuration
    }
    private lazy var loginStackView = UIStackView().then {
        $0.alignment = .fill
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = 15
        $0.addArrangedSubview(nameTextfield)
        $0.addArrangedSubview(accountTextfield)
        $0.addArrangedSubview(passwordTextfield)
    }
    private let nameTextfield = LoginTextField(placeholder: "이름을 입력해주세요")
    private let accountTextfield = LoginTextField(placeholder: "이메일 또는 휴대전화")
    private let passwordTextfield = LoginTextField(placeholder: "비밀번호 입력", isSecureTextEntry: true)

    // MARK: - App Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    // MARK: - Custom Method
    private func setupLayout() {
        view.addSubviews([logoLabel,
                         titleLabel,
                         loginStackView,
                         showPasswordButton,
                         signinButton])
        
        logoLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(30)
        }
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(logoLabel.snp.bottom).offset(15)
        }
        loginStackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(110)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        showPasswordButton.snp.makeConstraints {
            $0.top.equalTo(loginStackView.snp.bottom).offset(10)
            $0.leading.equalToSuperview().inset(20)
        }
        signinButton.snp.makeConstraints {
            $0.top.equalTo(loginStackView.snp.bottom).offset(70)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(40)
        }
    }
}