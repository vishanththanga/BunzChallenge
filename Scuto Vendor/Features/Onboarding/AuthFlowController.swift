//
//  AuthFlowController.swift
//  Scuto
//
//  Created by Navine Manivannan on 2018-06-11.
//  Copyright © 2018 Scuto. All rights reserved.
//

import UIKit

class AuthFlowController: UIViewController {
    
    private var navController: UINavigationController!
    private let onboardingController = OnboardingViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func start() {
        print("AutFlowController Started")
        presentOnboardingViewController()
    }
    
    func presentOnboardingViewController() {
        navController = UINavigationController(rootViewController: onboardingController)
        navController.navigationBar.isHidden = true
        add(childController: navController)
    }
}
