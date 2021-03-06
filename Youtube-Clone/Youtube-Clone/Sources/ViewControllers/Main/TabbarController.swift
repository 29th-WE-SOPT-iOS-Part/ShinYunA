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
        homeTab.tabBarItem = UITabBarItem(title: "홈", image: YoutubeIcon.homeIconFill, tag: 0)
        
        let shortTab = HomeVC()
        shortTab.tabBarItem = UITabBarItem(title: "Shorts", image: YoutubeIcon.shortsIconFill, tag: 1)
        
        let addTab = HomeVC()
        addTab.tabBarItem = UITabBarItem(title: "추가", image: YoutubeIcon.plueCircleIcon, tag: 2)
        
        let subscribeTab = HomeVC()
        subscribeTab.tabBarItem = UITabBarItem(title: "구독", image: YoutubeIcon.subscriptionsIcon, selectedImage: YoutubeIcon.subscriptionsIconFill)

        let lockerTab = LockerVC()
        lockerTab.tabBarItem = UITabBarItem(title: "보관함", image: YoutubeIcon.LibraryIcon, selectedImage: YoutubeIcon.LibraryIconFill)
        
        let tabs =  [homeTab, shortTab, addTab, subscribeTab, lockerTab]
        
        self.setViewControllers(tabs, animated: false)
        self.selectedViewController = homeTab
    }
    
}
