//
//  File.swift
//  Youmee
//
//  Created by Wolfy on 01/02/2017.
//  Copyright © 2017 incrediApps. All rights reserved.
//

import UIKit

protocol CustomTabBarDataSource {
    func tabBarItemsInCustomTabBar(tabBarView: CustomTabBar) -> [UITabBarItem]
}

protocol CustomTabBarDelegate {
    func didSelectViewController(tabBarView: CustomTabBar, atIndex index: Int)
}

class CustomTabBar: UIView {
    
    var tabBarItems: [UITabBarItem]!
    var datasource: CustomTabBarDataSource!
    var delegate: CustomTabBarDelegate!
    var customTabBarItems: [CustomTabBarItem]!
    var tabBarButtons: [UIButton]!

    func setup() {
        // get tab bar items from default tab bar
        tabBarItems = datasource.tabBarItemsInCustomTabBar(tabBarView: self)
        
        customTabBarItems = []
        tabBarButtons = []
        
        let containers = createTabBarItemContainers()
        createTabBarItems(containers: containers)
    }
    
    func createTabBarItemContainers() -> [CGRect] {
        
        var containerArray = [CGRect]()
        
        // create container for each tab bar item
        for index in 0..<tabBarItems.count {
            let tabBarContainer = createTabBarContainer(index: index)
            containerArray.append(tabBarContainer)
        }
        
        return containerArray
    }
    
    func createTabBarContainer(index: Int) -> CGRect {
        
        let tabBarContainerWidth = self.frame.width / CGFloat(tabBarItems.count)
        let tabBarContainerRect = CGRect(x: tabBarContainerWidth * CGFloat(index), y: 0, width: tabBarContainerWidth, height: self.frame.height)
        
        return tabBarContainerRect
    }

    func createTabBarItems(containers: [CGRect]) {
        
        var index = 0
        for item in tabBarItems {
            
            let container = containers[index]
            
            let customTabBarItem = CustomTabBarItem(frame: container)
            customTabBarItem.setup(item: item)
            
            self.addSubview(customTabBarItem)
            customTabBarItems.append(customTabBarItem)
            
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: container.width, height: container.height))
            button.addTarget(self, action: Selector(("barItemTapped:")), for: UIControlEvents.touchUpInside)
            
            customTabBarItem.addSubview(button)
            tabBarButtons.append(button)
            
            index += 1
        }
    }
    
    func barItemTapped(sender : UIButton) {
        let index = tabBarButtons.index(of: sender)!
        
        delegate.didSelectViewController(tabBarView: self, atIndex: index)
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
    self.backgroundColor = UIColor(red: 0.000, green: 0.576, blue: 0.918, alpha: 1.00)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
