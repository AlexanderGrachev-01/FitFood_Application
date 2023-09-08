//
//  HomeTabBarItem.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 08.09.2023.
//

import UIKit

extension UITabBarItem {

    static let main = UITabBarItem(
        title: Asset.Strings.daily,
        image: UIImage(systemName: "text.book.closed"),
        selectedImage: UIImage(systemName: "text.book.closed")
    )

    static let recipes = UITabBarItem(
        title: Asset.Strings.recipes,
        image: UIImage(systemName: "fork.knife.circle"),
        selectedImage: UIImage(systemName: "fork.knife.circle")
    )

    static let add = UITabBarItem(
        title: "Add",
        image: UIImage(systemName: "plus.circle.fill"),
        selectedImage:  UIImage(systemName: "plus.circle.fill")
    )

    static let fasting = UITabBarItem(
        title: Asset.Strings.fasting,
        image: UIImage(systemName: "bell.badge"),
        selectedImage: UIImage(systemName: "bell.badge")
    )

    static let settings = UITabBarItem(
        title: Asset.Strings.settings,
        image: UIImage(systemName: "gearshape"),
        selectedImage: UIImage(systemName: "gearshape")
    )
}
