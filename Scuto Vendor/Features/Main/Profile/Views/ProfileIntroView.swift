//
//  ProfileIntroView.swift
//  Scuto
//
//  Created by Navine Manivannan on 2018-07-17.
//  Copyright © 2018 Scuto. All rights reserved.
//

import UIKit
import Then
import EasyPeasy

public enum VendorType {
    case photography
}

class ProfileIntroViewModel {
    
    let vendorName: String
    var vendorTypeImage: UIImage = UIImage()
    
    init(vendorName: String, vendorType: VendorType) {
        self.vendorName = vendorName
        self.vendorTypeImage = self.getImageFor(vendorType)
    }
    
    private func getImageFor(_ vendorType: VendorType) -> UIImage {
        switch vendorType {
        case .photography:
            return UIImage(named: "photographyVendorGreyIcon")!
        }
    }
}

class ProfileIntroView: UIView {
    
    private let contentView = UIView().then {
        $0.backgroundColor = UI.Colors.white
        $0.layer.cornerRadius = 4.0
        $0.layer.shadowColor = UI.Colors.black.cgColor
        $0.layer.shadowRadius = 4.0
        $0.layer.shadowOpacity = 0.2
        $0.layer.shadowOffset = CGSize(width: 0, height: 2)
    }
    
    private let vendorName = UILabel().then {
        $0.setFont(UI.Font.headerRegularA, color: UI.Colors.black)
    }
    
    private let scutoVerifiedLabel = UILabel().then {
        $0.setFont(UI.Font.regular(12), color: UI.Colors.black)
        $0.setText("Scuto Verified Vendor", alignment: .center)
    }
    
    private let vendorTypeImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = false
    }

    init(viewModel: ProfileIntroViewModel) {
        super.init(frame: .zero)
        
        vendorName.setText(viewModel.vendorName, alignment: .center)
        vendorTypeImageView.image = viewModel.vendorTypeImage
        
        setupProperties()
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

// MARK: - Setup Properties
extension ProfileIntroView {
    func setupProperties() {

    }
}

// MARK: - LayoutViews
extension ProfileIntroView {
    func layoutViews() {
        addSubview(contentView)
        contentView.easy.layout(Top(), Left(), Right(), Bottom(), Height(140))
        
        contentView.addSubview(vendorName)
        vendorName.easy.layout(Top(42), Left(), Right(), Height(33))
        
        contentView.addSubview(scutoVerifiedLabel)
        scutoVerifiedLabel.easy.layout(Left(8), Bottom(8), Height(14), Width(120))
        
        contentView.addSubview(vendorTypeImageView)
        vendorTypeImageView.easy.layout(Right(8), Bottom(8), Size(20))
    }
}
