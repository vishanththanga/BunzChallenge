//
//  MainFlowController.swift
//  Scuto
//
//  Created by Navine Manivannan on 2018-08-02.
//  Copyright © 2018 Scuto. All rights reserved.
//

import UIKit

class MainFlowController: UIViewController {
    
    private let mainTabBarController = MainTabBarController()
    private let bunzController = BunzHomeViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //mainTabBarController.homeViewController.delegate = self
    }
    
    func start() {
        presentMainTabBarController()
    }
}

// MARK: - MainTabBarController Flow
extension MainFlowController {
    func presentMainTabBarController() {
        add(childController: mainTabBarController)
    }
}

/*// MARK: - Bookings Flow
extension MainFlowController {
    func startBookingsFlow() {
        add(childController: BunzHomeViewController())
        bunzController.start()
    }
}

// MARK: - MainTabBarController Delegate Functions
extension MainFlowController: HomeViewControllerDelegate {
    func didTapBigButtonView(_ homeBigButtonView: HomeBigButtonView) {
        if homeBigButtonView == mainTabBarController.homeViewController.bookingsButtonView {
            startBookingsFlow()
        }
    }
    
    
}
*/
