//
//  OnboardingViewController.swift
//  Scuto
//
//  Created by Navine Manivannan on 2018-08-09.
//  Copyright © 2018 Scuto. All rights reserved.
//

import UIKit
import EasyPeasy

protocol OnboardingViewControllerDelegate: class {
    func didTapSignInButton(_ button: UIButton)
}

class OnboardingViewController: UIViewController {
    
    var delegate: OnboardingViewControllerDelegate?
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        layoutViews()
    }
}

// MARK: - Layout Views
extension OnboardingViewController {
    func layoutViews() {

    }
}

// MARK: - Button Actions
extension OnboardingViewController {
    @objc func didTapSignInButton(sender: UIButton) {
        delegate?.didTapSignInButton(sender)
    }
}
