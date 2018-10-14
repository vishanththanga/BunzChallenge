//
//  BunzBalanceView.swift
//  Scuto Vendor
//
//  Created by Vishanth T. on 2018-10-14.
//  Copyright © 2018 Scuto. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

class BunzBalanceView: UIView {

    var totalBalanceValue: String = ""

    init(totalBalanceValue: String) {
        super.init(frame: .zero)
        self.totalBalanceValue =  totalBalanceValue
        totalBalanceValueLabel.text = totalBalanceValue
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let totalBalanceLabel = UILabel().then {
        $0.textColor = UI.Colors.black
        $0.font = UI.Font.medium(15)
        $0.text = "Total Balance"
    }

    private let totalBalanceValueLabel = UILabel().then {
        $0.textColor = UI.Colors.black
        $0.font = UI.Font.medium(15)
    }
}

extension BunzBalanceView {
    func layoutViews(){
        addSubview(totalBalanceLabel)
        totalBalanceLabel.easy.layout(Top(25), CenterX())
        addSubview(totalBalanceValueLabel)
        totalBalanceValueLabel.easy.layout(Top(2).to(totalBalanceLabel) , CenterX())
    }
}

