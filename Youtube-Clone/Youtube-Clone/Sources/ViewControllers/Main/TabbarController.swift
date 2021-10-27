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
//        configUI()
        setupTabs()
    }
    
    // MARK: - Custom Method
    private func configUI() {
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().backgroundColor = UIColor.secondarySystemBackground
        UITabBar.appearance().tintColor = .systemGreen
    }
    
    private func setupTabs(){
        let homeTab = HomeVC()
        homeTab.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house.fill"), tag: 0)
        
        let shortTab = HomeVC()
        shortTab.tabBarItem = UITabBarItem(title: "Shorts", image: UIImage(systemName: "creditcard.fill"), tag: 1)
        
        let addTab = HomeVC()
        addTab.tabBarItem = UITabBarItem(title: "추가", image: UIImage(systemName: "arrow.up.bin.fill"), tag: 2)
        
        let subscribeTab = HomeVC()
        subscribeTab.tabBarItem = UITabBarItem(title: "구독", image: UIImage(systemName: "gift.fill"), tag: 3)

        let lockerTab = HomeVC()
        lockerTab.tabBarItem = UITabBarItem(title: "보관함", image: UIImage(named: "detailTabIconSelected"), tag: 4)
        
        let tabs =  [homeTab, shortTab, addTab, subscribeTab, lockerTab]
        
        self.setViewControllers(tabs, animated: false)
        self.selectedViewController = homeTab
    }
    
}
