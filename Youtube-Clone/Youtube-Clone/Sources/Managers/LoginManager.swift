//
//  LoginManager.swift
//  Youtube-Clone
//
//  Created by SHIN YOON AH on 2021/10/27.
//

import UIKit

class Login: NSObject {
    static let shared = Login()
    let login = "isLogin"
    
    // MARK: - LOGIN
    func isLogin() -> Bool {
        let def = UserDefaults.standard
        let flag = def.bool(forKey: login)
        
        return flag
    }
    
    func setLogin() {
        let def = UserDefaults.standard
        
        def.set(true, forKey: login)
        def.synchronize()
    }
    
    func setLoginOut() {
        let def = UserDefaults.standard

        def.set(false, forKey: login)
        def.synchronize()
        
        let navi = UINavigationController.init(rootViewController: LoginVC())
        UIApplication.shared.keyWindow?.replaceRootViewController(navi, animated: true, completion: nil)
    }
}
