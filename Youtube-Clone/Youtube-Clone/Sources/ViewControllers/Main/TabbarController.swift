//
//  TabbarController.swift
//  Youtube-Clone
//
//  Created by SHIN YOON AH on 2021/10/27.
//

import UIKit

class TabbarController: UITabBarController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        setupTabs()
    }
    
    // MARK: - Custom Method
    private func configUI() {
        UITabBar.appearance().tintColor = .black
        UITabBar.appearance().unselectedItemTintColor = .lightGray
    }
    
    private func setupTabs(){
        let homeTab = HomeVC()
        homeTab.tabBarItem = UITabBarItem(title: "홈", image: UIImage(named: "homeIconFill"), tag: 0)
        
        let shortTab = HomeVC()
        shortTab.tabBarItem = UITabBarItem(title: "Shorts", image: UIImage(named: "shortsIconFill"), tag: 1)
        
        let addTab = HomeVC()
        addTab.tabBarItem = UITabBarItem(title: "추가", image: UIImage(named: "plueCircleIcon"), tag: 2)
        
        let subscribeTab = HomeVC()
        subscribeTab.tabBarItem = UITabBarItem(title: "구독", image: UIImage(named: "subscriptionsIcon"), selectedImage: UIImage(named: "subscriptionsIconFill"))

        let lockerTab = HomeVC()
        lockerTab.tabBarItem = UITabBarItem(title: "보관함", image: UIImage(named: "LibraryIcon"), selectedImage: UIImage(named: "LibraryIconFill"))
        
        let tabs =  [homeTab, shortTab, addTab, subscribeTab, lockerTab]
        
        self.setViewControllers(tabs, animated: false)
        self.selectedViewController = homeTab
    }
    
}
