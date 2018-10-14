//
//  HomeHeaderView.swift
//  Scuto
//
//  Created by Navine Manivannan on 2018-06-29.
//  Copyright © 2018 Scuto. All rights reserved.
//

import UIKit
import EasyPeasy

protocol HomeHeaderViewDelegate {
    func didTapUpdateAvailability()
    func didTapBusinessInsight()
    func didTapManageAccount()
}

class HomeHeaderView: UIView {
    
    var delegate: HomeHeaderViewDelegate?
    
    let headerBackgroundImageView = UIImageView(image: UIImage(named: ScutoDevice().isiPhoneX() ? "homeHeaderBackgroundX" : "homeHeaderBackground")!).then {
        $0.contentMode = .scaleAspectFill
    }
    
    let scutoLogo = UIImageView(image: UIImage(named: "scutoBlackLogo"))
    let updateAvailabilityButton = HomeHeaderButtonView(imageName: "updateAvailabilityIcon", text: "Update Availability")
    let businessInsightButton = HomeHeaderButtonView(imageName: "businessInsightIcon", text: "Business Insight")
    let manageAccountButton = HomeHeaderButtonView(imageName: "manageAccountIcon", text: "Manage Account")
    
    init() {
        super.init(frame: .zero)
        
        updateAvailabilityButton.delegate = self
        businessInsightButton.delegate = self
        manageAccountButton.delegate = self
        
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension HomeHeaderView {
    func layoutViews() {
        layoutHeaderBackgroundImageView()
        layoutScutoLogo()
        layoutBusinessInsightButton()
        layoutUpdateAvailabilityButton()
        layoutManageAccountButton()
    }
    
    func layoutHeaderBackgroundImageView() {
        addSubview(headerBackgroundImageView)
        headerBackgroundImageView.easy.layout(Top(0), Left(0), Right(0), ScutoDevice().isiPhoneX() ? Height(145) : Height(121))
    }
    
    func layoutScutoLogo() {
        addSubview(scutoLogo)
        scutoLogo.easy.layout(CenterX(0), Width(65), Height(34), ScutoDevice().isiPhoneX() ? Top(60) : Top(36))
    }
    
    func layoutBusinessInsightButton() {
        addSubview(businessInsightButton)
        businessInsightButton.easy.layout(CenterX(0), Width(65), Height(57), ScutoDevice().isiPhoneX() ? Top(130) : Top(106))
    }
    
    func layoutUpdateAvailabilityButton() {
        addSubview(updateAvailabilityButton)
        updateAvailabilityButton.easy.layout(Right(43).to(businessInsightButton), Width(65), Height(34), ScutoDevice().isiPhoneX() ? Top(130) : Top(106))
    }
    
    func layoutManageAccountButton() {
        addSubview(manageAccountButton)
        manageAccountButton.easy.layout(Left(43).to(businessInsightButton), Width(65), Height(34), ScutoDevice().isiPhoneX() ? Top(130) : Top(106))
    }
}

extension HomeHeaderView: HomeHeaderButtonViewDelegate {
    func didTapButton(withText text: String) {
        switch text {
            case "Business Insight":
                delegate?.didTapBusinessInsight()
            case "Update Availability":
                delegate?.didTapUpdateAvailability()
            case "Manage Account":
                delegate?.didTapManageAccount()
            default:
                break
        }
    }

    
    
    
}
