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
        setup()
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
    
    private let contentView = UIView()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BunzTransactionView {
    func setup (){
        contentView.backgroundColor = UI.Colors.white
        contentView.layer.cornerRadius = 5
        contentView.layer.shadowColor = UI.Colors.black.cgColor
        contentView.layer.shadowOpacity = 0.2
        contentView.layer.shadowRadius = 5.0
        contentView.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    func layoutViews(){
        addSubview(contentView)
        contentView.easy.layout(Width(350), Height(100), LeftMargin(10), RightMargin(10))
        contentView.addSubview(dateLabel)
        dateLabel.easy.layout(Top(10), LeftMargin(20))
        contentView.addSubview(imageNameLabel)
        imageNameLabel.easy.layout(Top(2).to(dateLabel), Width(50), Height(50), LeftMargin(20))
        contentView.addSubview(personNameLabel)
        personNameLabel.easy.layout(Top(2).to(dateLabel), Left(5).to(imageNameLabel))
        contentView.addSubview(userNameLabel)
        userNameLabel.easy.layout(Top(2).to(personNameLabel), Left(5).to(imageNameLabel))
        contentView.addSubview(amountLabel)
        amountLabel.easy.layout(Top(4).to(dateLabel), Left(170).to(personNameLabel))
    }
}

