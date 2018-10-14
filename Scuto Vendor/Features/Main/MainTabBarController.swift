//
//  MainTabBarController.swift
//  Scuto
//
//  Created by Navine Manivannan on 2018-06-11.
//  Copyright © 2018 Scuto. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    let csvc1 = ComingSoonViewController()
    let homeViewController = HomeViewController()
    let profileViewController = ProfileViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBarProperties()
        setupViewControllers()
        
    }
}

// MARK: Setup TabBar Properties
extension MainTabBarController {
    func setupTabBarProperties() {
        let attributes: [NSAttributedString.Key: Any] = [.font: UI.Font.tabBarMenu]
        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: UIControl.State.normal)
        
        tabBar.isTranslucent = false
        tabBar.backgroundColor = UI.Colors.white
        tabBar.layer.borderWidth = 0.1
    }
}

// MARK: - Setup TabBar View Controllers
extension MainTabBarController {
    func setupViewControllers() {
        let vc1 = createFirstViewController()
        let vc2 = createSecondViewController()
        let vc3 = createThirdViewController()
        
        self.viewControllers = [vc1, vc2, vc3]
        
        selectedIndex = 1
    }
    
    func createFirstViewController() -> UIViewController {
        var navigationVC = ScutoNavigationController(rootViewController: csvc1)
        navigationVC = setupTabBarItem(for: navigationVC, title: "CHAT", imageName: "chatIcon", selectedImageName: "selectedChatIcon")
        return navigationVC
    }
    
    func createSecondViewController() -> UIViewController {
        var navigationVC = ScutoNavigationController(rootViewController: homeViewController)
        navigationVC = setupTabBarItem(for: navigationVC, title: "HOME", imageName: "homeIcon", selectedImageName: "selectedHomeIcon")
        return navigationVC
    }
    
    func createThirdViewController() -> UIViewController {
        var navigationVC = ScutoNavigationController(rootViewController: profileViewController)
        navigationVC = setupTabBarItem(for: navigationVC, title: "PROFILE", imageName: "profileIcon", selectedImageName: "selectedProfileIcon")
        return navigationVC
    }
    
    func setupTabBarItem(for navigationController: ScutoNavigationController, title: String, imageName: String, selectedImageName: String) -> ScutoNavigationController {
        let image = UIImage(named: imageName), selectedImage = UIImage(named: selectedImageName)
        navigationController.tabBarItem = UITabBarItem(title: title, image: image, selectedImage: selectedImage)
        return navigationController
    }
}

