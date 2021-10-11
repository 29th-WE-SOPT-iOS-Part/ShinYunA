//
//  CustomTabbarController.swift
//  secondSeminar
//
//  Created by SHIN YOON AH on 2021/10/09.
//

import UIKit

class CustomTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTabbar()
    }
    
    private func setupTabbar() {
        guard let brownVC = storyboard?.instantiateViewController(withIdentifier: "BrownVC"),
              let tealVC = storyboard?.instantiateViewController(withIdentifier: "TealVC") else { return }
        
        brownVC.tabBarItem.title = "최이준"
        brownVC.tabBarItem.image = UIImage(systemName: "house")
        brownVC.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        
        tealVC.tabBarItem.title = "귀여워"
        tealVC.tabBarItem.image = UIImage(systemName: "circle")
        tealVC.tabBarItem.selectedImage = UIImage(systemName: "circle.fill")
        
        setViewControllers([brownVC, tealVC], animated: true)
    }

}
