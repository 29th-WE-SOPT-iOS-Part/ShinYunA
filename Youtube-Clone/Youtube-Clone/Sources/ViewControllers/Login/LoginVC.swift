//
//  LoginVC.swift
//  Youtube-Clone
//
//  Created by SHIN YOON AH on 2021/10/04.
//

import UIKit

import Then
import SnapKit

class LoginVC: UIViewController {
    
    // MARK: - UI
    private let logoImage = UIImageView().then {
        $0.image = YoutubeIcon.logo
    }
    private let titleLabel = UILabel().then {
        $0.text = "로그인"
        $0.font = .boldSystemFont(ofSize: 30)
        $0.textColor = .black
    }
    private let infoLabel = UILabel().then {
        $0.text = "Continue to YouTube. You'll also sign in to Google services in your apps & Safari."
        $0.font = .systemFont(ofSize: 13)
        $0.textColor = .lightGray
        $0.textAlignment = .center
        $0.numberOfLines = 2
    }
    private let signupButton = UIButton().then {
        $0.setTitle("계정만들기", for: .normal)
        $0.setTitleColor(.googleBlue, for: .normal)
        $0.setTitleColor(.googleBlue.withAlphaComponent(0.7), for: .highlighted)
        $0.titleLabel?.font = .systemFont(ofSize: 15)
        $0.addTarget(self, action: #selector(touchUpSignUp), for: .touchUpInside)
    }
    private let signinButton = UIButton().then {
        $0.setTitle("다음", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 15)
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 10
        $0.isEnabled = false
        $0.addTarget(self, action: #selector(touchUpSignIn), for: .touchUpInside)
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
    private let manager = LoginManager.shared
    
    // MARK: - App Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupTextfield()
        hideKeyboardWhenTappedAround()
    }
    
    // MARK: - Setup Method
    private func setupLayout() {
        view.addSubviews([logoImage,
                         titleLabel,
                         infoLabel,
                         loginStackView,
                         signupButton,
                         signinButton])
        
        logoImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(30)
        }
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(logoImage.snp.bottom).offset(15)
        }
        infoLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        loginStackView.snp.makeConstraints {
            $0.top.equalTo(infoLabel.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        signupButton.snp.makeConstraints {
            $0.top.equalTo(loginStackView.snp.bottom).offset(75)
            $0.leading.equalToSuperview().inset(30)
        }
        signinButton.snp.makeConstraints {
            $0.top.equalTo(loginStackView.snp.bottom).offset(70)
            $0.trailing.equalToSuperview().inset(30)
            $0.width.equalTo(70)
            $0.height.equalTo(35)
        }
    }
    
    private func setupTextfield() {
        nameTextfield.delegate = self
        accountTextfield.delegate = self
        passwordTextfield.delegate = self
    }
    
    private func getUserProfile() {
        let vc = CheckVC()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    private func getAlertController() {
        let alert = UIAlertController(
            title: "로그인 실패",
            message: "로그인에 실패하셨습니다. 다시 입력해주세요",
            preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - @objc
    @objc
    private func touchUpSignUp() {
        let vc = SignupVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    private func touchUpSignIn() {
        guard let email = accountTextfield.text, !email.isEmpty,
              let pw = passwordTextfield.text, !pw.isEmpty,
              let name = nameTextfield.text, !name.isEmpty else {
                  print("이메일과 패스워드를 입력해주세요.")
                  return
              }
        
        manager.dispatchLogin(email: email, pw: pw, name: name) { result in
            if result {
                self.getUserProfile()
            } else {
                self.getAlertController()
            }
        }
    }
}

// MARK: - UITextFieldDelegate
extension LoginVC: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        let isNameEmpty = nameTextfield.hasText
        let isAccountEmpty = accountTextfield.hasText
        let isPasswordEmpty = passwordTextfield.hasText
        
        if isNameEmpty && isAccountEmpty && isPasswordEmpty {
            signinButton.isEnabled = true
            signinButton.backgroundColor = .googleBlue
        } else {
            signinButton.isEnabled = true
            signinButton.backgroundColor = .lightGray
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
