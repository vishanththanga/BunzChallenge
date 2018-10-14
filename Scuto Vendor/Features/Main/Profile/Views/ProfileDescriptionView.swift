//
//  ProfileDescriptionView.swift
//  Scuto
//
//  Created by Navine Manivannan on 2018-07-17.
//  Copyright © 2018 Scuto. All rights reserved.
//

import UIKit
import Then
import EasyPeasy

//protocol ProfileDescriptionViewDelegate {
//    func
//}

class ProfileDescriptionViewModel {
    let description: String
    
    init(description: String) {
        self.description = description
    }
}

class ProfileDescriptionView: UIView {
    
    private let contentView = UIView().then {
        $0.backgroundColor = UI.Colors.white
        $0.layer.cornerRadius = 4.0
        $0.layer.shadowColor = UI.Colors.black.cgColor
        $0.layer.shadowRadius = 4.0
        $0.layer.shadowOpacity = 0.2
        $0.layer.shadowOffset = CGSize(width: 0, height: 2)
    }
    
    private let titleLabel = UILabel().then {
        $0.setFont(UI.Font.medium(12), color: UI.Colors.black)
        $0.setText("Description", alignment: .left)
    }
    
    private let descriptionLabel = UILabel().then {
        $0.setFont(UI.Font.textRegularA, color: UI.Colors.black)
        $0.numberOfLines = 0
    }
    
    private let profileDescriptionViewButton = UIButton().then {
        $0.addTarget(self, action: #selector(didTapDescriptionView), for: .touchUpInside)
    }
    
    init(viewModel: ProfileDescriptionViewModel) {
        super.init(frame: .zero)
        
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}

// MARK: - LayoutViews
extension ProfileDescriptionView {
    func layoutViews() {
        addSubview(contentView)
        contentView.easy.layout(Top(), Bottom(), Left(), Right(), Height(30))
        
        contentView.addSubview(titleLabel)
        titleLabel.easy.layout(Top(8), Left(12))
    }
}

// MARK: - Button Actions
extension ProfileDescriptionView {
    @objc func didTapDescriptionView() {
        
    }
}
