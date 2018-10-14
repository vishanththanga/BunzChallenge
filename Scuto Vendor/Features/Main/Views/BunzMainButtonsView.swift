//
//  BunzMainButtonsView.swift
//  Scuto Vendor
//
//  Created by Vishanth T. on 2018-10-14.
//  Copyright © 2018 Scuto. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

class BunzMainButtonsView: UIView {
    init() {
        super.init(frame: .zero)
        layoutViews()
    }
    
    private let image1Pic = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.image = UIImage(named: "Send")
    }
    
    private let image1Name = UILabel().then {
        $0.textColor = UI.Colors.black
        $0.font = UI.Font.medium(15)
        $0.text = "Send"
    }
    
    private let image2Pic = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.image = UIImage(named: "QR Code")
    }
    
    private let image2Name = UILabel().then {
        $0.textColor = UI.Colors.black
        $0.font = UI.Font.medium(15)
        $0.text = "Receive"
    }
    
    private let image3Pic = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.image = UIImage(named: "Earn")
    }
    
    private let image3Name = UILabel().then {
        $0.textColor = UI.Colors.black
        $0.font = UI.Font.medium(15)
        $0.text = "Earn"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BunzMainButtonsView {
    func layoutViews(){
        addSubview(image2Pic)
        image2Pic.easy.layout(CenterY(), CenterX(), Width(50), Height(50))
        addSubview(image2Name)
        image2Name.easy.layout(Top(1).to(image2Pic), LeftMargin(1))
        addSubview(image1Pic)
        image1Pic.easy.layout(CenterY(), Left(70).to(image2Pic), Width(50), Height(50))
        addSubview(image1Name)
        image1Name.easy.layout(Top(1).to(image1Pic), LeftMargin(1))
        addSubview(image3Pic)
        image3Pic.easy.layout(CenterY(), Right(70).to(image2Pic), Width(50), Height(50))
        addSubview(image3Name)
        image3Name.easy.layout(Top(1).to(image3Pic), LeftMargin(1))
       
    }
}
