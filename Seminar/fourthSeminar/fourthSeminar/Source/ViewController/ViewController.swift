//
//  ViewController.swift
//  fourthSeminar
//
//  Created by SHIN YOON AH on 2021/10/30.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchupLogin(_ sender: Any) {
        requestLogin()
    }
    
    func simpleAlert(title: String, message: String) {
        let alert = UIAlertController(title: message,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
}

extension ViewController {
    func requestLogin() {
        UserSignService.shared.login(email: emailTextField.text ?? "", password: passwordTextField.text ?? "") { responseData in
            switch responseData {
            case .success(let loginResponse):
                guard let response = loginResponse as? LoginResponseData else { return }
                if let userData = response.data {
                    self.simpleAlert(title: response.message, message: "\(userData.name)님 환영합니다!")
                }
            case .requestErr(let msg):
                print("requestERR \(msg)")
            case .pathErr:
                print("pathErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            }
        }
    }
}
