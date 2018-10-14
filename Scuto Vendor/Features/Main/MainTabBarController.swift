//
//  MainTabBarController.swift
//  Scuto
//
//  Created by Navine Manivannan on 2018-06-11.
//  Copyright © 2018 Scuto. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    let homeController = HomeViewController()
    let csvc2 = ComingSoonViewController()
    let csvc3 = ComingSoonViewController()
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
        let vc4 = createFourthViewController()
        let vc5 = createFifthViewController()
        
        self.viewControllers = [vc1, vc2, vc3, vc4, vc5]
        
        selectedIndex = 0
    }
    
    func createFirstViewController() -> UIViewController {
        var navigationVC = ScutoNavigationController(rootViewController: homeController)
        navigationVC = setupTabBarItem(for: navigationVC, title: "", imageName: "homeIcon", selectedImageName: "selectedHomeIcon")
        return navigationVC
    }
    
    func createSecondViewController() -> UIViewController {
        var navigationVC = ScutoNavigationController(rootViewController: homeViewController)
        navigationVC = setupTabBarItem(for: navigationVC, title: "", imageName: "searchIcon", selectedImageName: "selectedSearchcon")
        return navigationVC
    }
    
    func createThirdViewController() -> UIViewController {
        var navigationVC = ScutoNavigationController(rootViewController: profileViewController)
        navigationVC = setupTabBarItem(for: navigationVC, title: "", imageName: "addIcon", selectedImageName: "")
        return navigationVC
    }
    
    func createFourthViewController() -> UIViewController {
        var navigationVC = ScutoNavigationController(rootViewController: csvc2)
        navigationVC = setupTabBarItem(for: navigationVC, title: "", imageName: "messagesIcon", selectedImageName: "")
        return navigationVC
    }
    
    func createFifthViewController() -> UIViewController {
        var navigationVC = ScutoNavigationController(rootViewController: csvc3)
        navigationVC = setupTabBarItem(for: navigationVC, title: "", imageName: "walletIcon", selectedImageName: "")
        return navigationVC
    }
    
    func setupTabBarItem(for navigationController: ScutoNavigationController, title: String, imageName: String, selectedImageName: String) -> ScutoNavigationController {
        let image = UIImage(named: imageName), selectedImage = UIImage(named: selectedImageName)
        navigationController.tabBarItem = UITabBarItem(title: title, image: image, selectedImage: selectedImage)
        return navigationController
    }
}

