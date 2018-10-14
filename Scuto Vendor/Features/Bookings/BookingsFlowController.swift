//
//  BookingsFlowController.swift
//  Scuto
//
//  Created by Navine Manivannan on 2018-08-01.
//  Copyright © 2018 Scuto. All rights reserved.
//

import UIKit

class BookingsFlowController: UIViewController {
    
    private var navController: UINavigationController!
    private let bookingsListController = UIViewController().then {
        $0.view.backgroundColor = .black
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        start()
    }
    
    func start() {
        //add(childController: navController)
        navController = UINavigationController(rootViewController: bookingsListController)
        add(childController: navController, animation: .overlayFromRight, duration: 0.25)
        //navController.pushViewController(bookingsListController, animated: false)
    }

}
