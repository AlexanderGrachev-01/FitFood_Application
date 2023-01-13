//
//  FFTabBarController.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 13.01.2023.
//

import UIKit

final class FFTabBarController: UITabBarController {
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTabs()
    }
    
    // MARK: - Tabs
    
    private func setUpTabs() {
        let dailyVC = FFDailyViewController()
        let recipesVC = FFRecipesViewController()
        let addingVC = FFAddingViewController()
        let fastingVC = FFFastingViewController()
        let settingsVC = FFSettingsViewController()
        
        dailyVC.navigationItem.largeTitleDisplayMode = .automatic
        recipesVC.navigationItem.largeTitleDisplayMode = .automatic
        addingVC.navigationItem.largeTitleDisplayMode = .never
        fastingVC.navigationItem.largeTitleDisplayMode = .automatic
        settingsVC.navigationItem.largeTitleDisplayMode = .automatic
        
        let dailyNav = UINavigationController(rootViewController: dailyVC)
        let recipesNav = UINavigationController(rootViewController: recipesVC)
        let addingNav = UINavigationController(rootViewController: addingVC)
        let fastingNav = UINavigationController(rootViewController: fastingVC)
        let settingsNav = UINavigationController(rootViewController: settingsVC)
        
        dailyNav.navigationBar.prefersLargeTitles = true
        recipesNav.navigationBar.prefersLargeTitles = true
        addingNav.navigationBar.prefersLargeTitles = true
        fastingNav.navigationBar.prefersLargeTitles = true
        settingsNav.navigationBar.prefersLargeTitles = true
        
        dailyNav.tabBarItem = UITabBarItem(title: "Daily",
                                           image: UIImage(systemName: "text.book.closed"),
                                           tag: 0)
        recipesNav.tabBarItem = UITabBarItem(title: "Recipes",
                                             image: UIImage(systemName: "figure.stand"),
                                             tag: 0)
        addingNav.tabBarItem = UITabBarItem(title: "Add",
                                            image: UIImage(systemName: "plus.circle.fill"),
                                            tag: 0)
        fastingNav.tabBarItem = UITabBarItem(title: "Fasting",
                                             image: UIImage(systemName: "bell.badge"),
                                             tag: 0)
        settingsNav.tabBarItem = UITabBarItem(title: "Settings",
                                              image: UIImage(systemName: "gearshape"),
                                              tag: 0)
        
        setViewControllers([dailyNav,recipesNav, addingNav, fastingNav, settingsNav],
                           animated: true)
    }
}
