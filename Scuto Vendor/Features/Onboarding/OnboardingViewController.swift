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
    
    //var thayallansButton = BorderedButton()
   // thayallansButton.configure(
    
    let backgroundImage = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.image = UIImage(named: "onboardingBackground")
    }
    
    let welcomeLabel = UILabel().then {
        $0.setFont(UI.Font.demiBold(30), color: UI.Colors.black)
        $0.setText("Welcome to", alignment: .center)
    }
    
    let scutoLogo = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: "scutoLightBlueLogo")
    }
    
    let takeControlLabel = UILabel().then {
        $0.setFont(UI.Font.medium(16), color: UI.Colors.black)
        $0.setText("Take Control Of Your Business Now", alignment: .center)
    }
    
    let getStartedHereButton = BorderedButton(UI.Colors.lightBlue, secondaryColor: UI.Colors.white) .then {
        $0.setTitle("HELLO", for: .normal)
        $0.setTitle("HELLO", for: .highlighted)
        $0.setTitle("HELLO", for: .selected)
    }
    
    let signInButton = UIButton().then {
        $0.setTitle("Already have an account? Sign in", for: .normal)
        $0.setTitleColor(UI.Colors.black, for: .normal)
        $0.titleLabel?.setFont(UI.Font.regular(18), color: UI.Colors.black)
        $0.addTarget(self, action: #selector(didTapSignInButton(sender:)), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        layoutViews()
    }
}

// MARK: - Layout Views
extension OnboardingViewController {
    func layoutViews() {
        view.addSubview(backgroundImage)
        backgroundImage.easy.layout(Top(), Bottom(), Left(), Right())
        
        view.addSubview(welcomeLabel)
        welcomeLabel.easy.layout(Top(ScutoDevice().isiPhoneX() ? 94 : 70), CenterX())
        
        view.addSubview(scutoLogo)
        scutoLogo.easy.layout(Top().to(welcomeLabel), Right().to(welcomeLabel, .right), Width(60), Height(30))
        
        view.addSubview(signInButton)
        signInButton.easy.layout(CenterX(), Bottom(20), Left(), Right())
        
        view.addSubview(getStartedHereButton)
        getStartedHereButton.easy.layout(CenterX(), Bottom(75).to(signInButton))

        let paymentView = BookingDetailPaymentView(viewModel: BookingDetailPaymentsViewModel(totalCost: "8240"))
        view.addSubview(paymentView)
        paymentView.easy.layout(CenterX(), Top(200), Width(247), Height(326))
    }
}

// MARK: - Button Actions
extension OnboardingViewController {
    @objc func didTapSignInButton(sender: UIButton) {
        delegate?.didTapSignInButton(sender)
    }
}
