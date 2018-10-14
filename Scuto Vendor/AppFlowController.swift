//
//  AppFlowController.swift
//  Scuto
//
//  Created by Navine Manivannan on 2018-08-01.
//  Copyright © 2018 Scuto. All rights reserved.
//

import UIKit

class AppFlowController: UIViewController {
    
    private let splashViewController = SplashViewController()
    private let mainFlowController = MainFlowController()
    private let authFlowController = AuthFlowController()
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func start() {
        presentSplashViewController()
    }
}

// MARK: - SpashViewController Flow
extension AppFlowController {
    func presentSplashViewController() {
        add(childController: splashViewController)
        
        let deadline = DispatchTime.now() + 2.5
        DispatchQueue.main.asyncAfter(deadline: deadline, execute: {
            self.dismissSplashViewController()
        })
    }
    
    func dismissSplashViewController() {
        remove(childController: splashViewController, delay: 1)
        startMainFlowController()
    }
}

// MARK: - Start Child FlowControllers
extension AppFlowController {
    func startMainFlowController() {
        mainFlowController.start()
        add(childController: mainFlowController, animation: .fadeIn, duration: 0.25)
    }
    
    func startAuthFlowController() {
        authFlowController.start()
        add(childController: authFlowController, animation: .fadeIn, duration: 0.25)
    }
}
