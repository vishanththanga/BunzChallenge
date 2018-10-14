//
//  BunzImageView.swift
//  Scuto Vendor
//
//  Created by Rikard Saqe on 2018-10-14.
//  Copyright © 2018 Scuto. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

class BunzImageView: UIView {
    var imageName: String = ""
    var heading: String = ""
    var picDescription: String = ""
    
    init(imageName: String, heading: String, picDescription: String) {
        super.init(frame: .zero)
        self.imageName = imageName
        self.heading =  heading
        self.picDescription = picDescription
        image.image = UIImage(named: imageName)
        headingLabel.text = heading
        descriptionLabel.text = picDescription
        layoutViews()
    }
    
    private let image = UIImageView().then {
        $0.contentMode = .scaleAspectFill

    }
    
    private let headingLabel = UILabel().then {
        $0.textColor = UI.Colors.black
        $0.font = UI.Font.medium(15)
    }
    
    private let descriptionLabel = UILabel().then {
        $0.textColor = UI.Colors.black
        $0.font = UI.Font.medium(15)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BunzImageView {
    func layoutViews(){
        addSubview(image)
        image.easy.layout(Top(), Width(150), Height(225))
        addSubview(headingLabel)
        headingLabel.easy.layout(Top(1).to(image), LeftMargin(1))
        addSubview(descriptionLabel)
        descriptionLabel.easy.layout(Top(1).to(headingLabel), LeftMargin(1))
    }
}


