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
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 10
        $0.isEnabled = true
        $0.addTarget(self, action: #selector(touchUpSignIn), for: .touchUpInside)
    }
    private lazy var showPasswordButton = UIButton().then {
        setupButtonState($0)
        $0.addTarget(self, action: #selector(touchUpShowPassword), for: .touchUpInside)
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
    
    // MARK: - Properties
    private var canShow = false

    // MARK: - App Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        setupTextfield()
        hideKeyboardWhenTappedAround()
    }
    
    // MARK: - Setup Method
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
    
    private func setupTextfield() {
        nameTextfield.delegate = self
        accountTextfield.delegate = self
        passwordTextfield.delegate = self
    }
    
    private func setupButtonState(_ button: UIButton) {
        if #available(iOS 15.0, *) {
            var configuration = UIButton.Configuration.plain()
            configuration.image = UIImage(systemName: canShow ? "checkmark.square.fill" :  "square")
            configuration.titlePadding = 10
            configuration.imagePadding = 10
            configuration.baseForegroundColor = canShow ? .googleBlue : .lightGray
            configuration.attributedTitle = AttributedString("비밀번호 표시", attributes: AttributeContainer([NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)]))
            button.configuration = configuration
        } else {
            button.setTitle("비밀번호 표시", for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
            button.setTitleColor(.black, for: .normal)
            button.setImage(UIImage(systemName: canShow ? "checkmark.square.fill" :  "square"), for: .normal)
            button.tintColor = canShow ? .googleBlue : .lightGray
            button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        }
        
        passwordTextfield.isSecureTextEntry = canShow ? false : true
    }
    
    // MARK: - @objc
    @objc
    private func touchUpSignIn() {
        let vc = CheckVC()
        if let text = nameTextfield.text {
            vc.titleLabel.text = text + "님\n환영합니다!"
        }
        present(vc, animated: true, completion: nil)
    }
    
    @objc
    private func touchUpShowPassword() {
        canShow.toggle()
        setupButtonState(showPasswordButton)
    }
}

// MARK: - UITextFieldDelegate
extension SignupVC: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let isNameEmpty = nameTextfield.text?.isEmpty,
           let isAccountEmpty = accountTextfield.text?.isEmpty,
           let isPasswordEmpty = passwordTextfield.text?.isEmpty {
            if isNameEmpty || isAccountEmpty || isPasswordEmpty {
                signinButton.isEnabled = false
                signinButton.backgroundColor = .lightGray
            } else {
                signinButton.isEnabled = true
                signinButton.backgroundColor = .googleBlue
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameTextfield:
            accountTextfield.becomeFirstResponder()
        case accountTextfield:
            passwordTextfield.becomeFirstResponder()
        case passwordTextfield:
            passwordTextfield.resignFirstResponder()
        default:
            break
        }
        
        return true
    }
}
