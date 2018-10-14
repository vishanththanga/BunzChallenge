//
//  BunzTransactionView.swift
//  Scuto Vendor
//
//  Created by Rikard Saqe on 2018-10-14.
//  Copyright © 2018 Scuto. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

class BunzTransactionView: UIView {
    var imageName: String = ""
    var personName: String = ""
    var userName: String = ""
    var amount: String = ""

    
    init(imageName: String, personName: String, userName: String, amount: String) {
        super.init(frame: .zero)
        self.imageName = imageName
        self.personName =  personName
        self.userName = userName
        self.amount = amount
        imageNameLabel.image = UIImage(named: imageName)
        personNameLabel.text = personName
        userNameLabel.text = userName
        amountLabel.text = amount
        layoutViews()
    }
    
    private let imageNameLabel = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }
    
    private let personNameLabel = UILabel().then {
        $0.textColor = UI.Colors.black
        $0.font = UI.Font.medium(15)
    }
    
    private let userNameLabel = UILabel().then {
        $0.textColor = UI.Colors.black
        $0.font = UI.Font.medium(15)
    }
    
    private let amountLabel = UILabel().then {
        $0.textColor = UI.Colors.black
        $0.font = UI.Font.medium(15)
    }
    
    private let dateLabel = UILabel().then {
        $0.textColor = UI.Colors.black
        $0.font = UI.Font.medium(15)
        $0.text = "October 14, 2018"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BunzTransactionView {
    func layoutViews(){
        addSubview(dateLabel)
        dateLabel.easy.layout(Top(10), LeftMargin(2))
        addSubview(imageNameLabel)
        imageNameLabel.easy.layout(Top(12), Width(10), Height(10))
        addSubview(personNameLabel)
        personNameLabel.easy.layout(Top(14), LeftMargin(4))
        addSubview(userNameLabel)
        userNameLabel.easy.layout(Top(16), LeftMargin(4))
        addSubview(amountLabel)
        amountLabel.easy.layout(Top(14), RightMargin(2))
    }
}

