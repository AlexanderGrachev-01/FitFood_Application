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
        
        configureTubs()
    }
    
    // MARK: - Tabs
    
    private func configureTubs() {
        let dailyVC = FFDailyViewController()
        let recipesVC = FFRecipesViewController()
        let addingVC = FFAddingViewController()
        let fastingVC = FFFastingViewController()
        let settingsVC = FFSettingsViewController()
        
        dailyVC.navigationItem.largeTitleDisplayMode = .never
        recipesVC.navigationItem.largeTitleDisplayMode = .automatic
        addingVC.navigationItem.largeTitleDisplayMode = .never
        fastingVC.navigationItem.largeTitleDisplayMode = .automatic
        settingsVC.navigationItem.largeTitleDisplayMode = .never
        
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
        
        dailyNav.tabBarItem = UITabBarItem(
            title: Asset.Strings.daily,
            image: UIImage(systemName: "text.book.closed"),
            tag: 0
        )
        recipesNav.tabBarItem = UITabBarItem(
            title: Asset.Strings.recipes,
            image: UIImage(systemName: "fork.knife.circle"),
            tag: 0
        )
        addingNav.tabBarItem = UITabBarItem(
            title: "Add",
            image: UIImage(systemName: "plus.circle.fill"),
            tag: 0
        )
        fastingNav.tabBarItem = UITabBarItem(
            title: Asset.Strings.fasting,
            image: UIImage(systemName: "bell.badge"),
            tag: 0
        )
        settingsNav.tabBarItem = UITabBarItem(
            title: Asset.Strings.settings,
            image: UIImage(systemName: "gearshape"),
            tag: 0
        )
        
        setViewControllers(
            [dailyNav,recipesNav, addingNav, fastingNav, settingsNav],
            animated: true
        )
        
        tabBar.addTopBorder(with: Asset.Colors.separator, height: 0.5)
        tabBar.backgroundColor = Asset.Colors.secondaryBackground
    }
}
