//
//  HomeBigButtonView.swift
//  Scuto
//
//  Created by Navine Manivannan on 2018-07-04.
//  Copyright © 2018 Scuto. All rights reserved.
//

import UIKit
import Then
import EasyPeasy

protocol HomeBigButtonViewDelegate: class {
    func didTapHomeBigButtonView(_ homeBigButtonView: HomeBigButtonView)
}

class HomeBigButtonView: UIView {
    
    weak var delegate: HomeBigButtonViewDelegate?
    var title: String {
        if let title = buttonLabel.text {
            return title
        }
        return ""
    }
    
    private let buttonImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    private let buttonLabel = UILabel().then {
        $0.setFont(UI.Font.textMediumB, color: UI.Colors.black)
    }
    
    private let homeBigButton = UIButton().then {
        $0.addTarget(self, action: #selector(didTapHomeBigButtonView), for: .touchUpInside)
    }

    init(imageName: String, text: String) {
        super.init(frame: .zero)
        
        buttonImageView.image = UIImage(named: imageName)
        buttonLabel.text = text
        
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}

// MARK: - Layout Views
extension HomeBigButtonView {
    func layoutViews() {
        addSubview(buttonImageView)
        buttonImageView.easy.layout(Top(0), Left(), Right(), CenterX(0), Width(37), Height(65))
        
        addSubview(buttonLabel)
        buttonLabel.easy.layout(Top(8).to(buttonImageView), CenterX(0), Height(14), Bottom())
        
        addSubview(homeBigButton)
        homeBigButton.easy.layout(Edges())
    }
}

// MARK: - Button Actions
extension HomeBigButtonView {
    @objc func didTapHomeBigButtonView() {
        delegate?.didTapHomeBigButtonView(self)
    }
}
