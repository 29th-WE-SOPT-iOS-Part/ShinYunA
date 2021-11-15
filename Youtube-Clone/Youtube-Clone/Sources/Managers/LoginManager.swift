//
//  LoginManager.swift
//  Youtube-Clone
//
//  Created by SHIN YOON AH on 2021/10/27.
//

import UIKit
import Firebase

class Login: NSObject {
    static let shared = Login()
    
    let login = "isLogin"
    let def = UserDefaults.standard
    
    private override init() { }
    
    // MARK: - LOGIN
    func isLogin() -> Bool {
        let flag = def.bool(forKey: login)
        
        return flag
    }
    
    func setLogin() {
        def.set(true, forKey: login)
        def.synchronize()
    }
    
    func setLoginOut() {
        def.set(false, forKey: login)
        def.synchronize()
        
        let navi = UINavigationController.init(rootViewController: LoginVC())
        UIApplication.shared.keyWindow?.replaceRootViewController(navi, animated: true, completion: nil)
    }
}

final class LoginManager {
    static let shared = LoginManager()
    
    private init() { }
    
    func dispatchLogin(email: String, pw: String, completion: @escaping ((Bool) -> Void)) {
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: pw) { user, error in
            if let error = error, user == nil {
                completion(false)
            } else {
                if let currentEmail = FirebaseAuth.Auth.auth().currentUser?.email {
                    print("파이어베이스 로그인 성공", currentEmail)
                    Login.shared.setLogin()
                    completion(true)
                }
            }
        }
    }
    
    func dispatchSignUp(email: String, pw: String, completion: @escaping ((Bool) -> Void)) {
        FirebaseAuth.Auth.auth().createUser(withEmail: email, password: pw) { (result, error) in
            if error != nil {
                print("회원가입 실패")
                completion(false)
            } else {
                Login.shared.setLogin()
                completion(true)
            }
        }
    }
    
    func fetchLogout() -> Bool {
        do {
            try FirebaseAuth.Auth.auth().signOut()
            print("로그아웃")
            return true
        } catch let error {
            print(error.localizedDescription)
            return false
        }
    }
    
    func fetchMainLogout() {
        do {
            try FirebaseAuth.Auth.auth().signOut()
            print("로그아웃")
            Login.shared.setLoginOut()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
