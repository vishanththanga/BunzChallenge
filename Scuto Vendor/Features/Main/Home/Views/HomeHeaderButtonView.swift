//
//  HomeHeaderButtonView.swift
//  Scuto
//
//  Created by Navine Manivannan on 2018-06-30.
//  Copyright © 2018 Scuto. All rights reserved.
//

import UIKit
import EasyPeasy

protocol HomeHeaderButtonViewDelegate {
    func didTapButton(withText: String)
}

class HomeHeaderButtonView: UIView {
    
    var delegate: HomeHeaderButtonViewDelegate?
    
    let buttonImageViewBackground = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40)).then {
        $0.layer.cornerRadius = $0.frame.width / 2
        $0.layer.borderColor = UI.Colors.blue.cgColor
        $0.layer.borderWidth = 0.5
        $0.backgroundColor = UI.Colors.white
    }
    
    let buttonImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: 25)).then {
        $0.contentMode = .scaleAspectFit
    }
    
    let buttonLabel = UILabel().then {
        $0.setFont(UI.Font.homeHeaderButton, color: UI.Colors.black)
    }
    let button = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40)).then {
        $0.addTarget(self, action: #selector(didTapButton(sender:)), for: .touchUpInside)
    }
    
    init(imageName: String, text: String) {
        super.init(frame: .zero)
        
        buttonLabel.setText(text, alignment: .center)
        buttonImageView.image = UIImage(named: imageName)
        
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

// MARK: - Layout Views
extension HomeHeaderButtonView {
    func layoutViews() {
        layoutButtonImageViewBackground()
        layoutButtonImageView()
        layoutButtonLabel()
        layoutButton()
    }
    
    func layoutButtonImageViewBackground() {
        addSubview(buttonImageViewBackground)
        buttonImageViewBackground.easy.layout(Top(0), CenterX(0), Size(40))
    }
    
    func layoutButtonImageView() {
        addSubview(buttonImageView)
        buttonImageView.easy.layout(CenterX(0).to(buttonImageViewBackground), CenterY(0).to(buttonImageViewBackground), Size(25))
    }
    
    func layoutButtonLabel() {
        addSubview(buttonLabel)
        buttonLabel.easy.layout(Top(5).to(buttonImageViewBackground), CenterX(0), Height(12))
    }
    
    func layoutButton() {
        addSubview(button)
        button.easy.layout(Top(0), CenterX(0), Size(40))
    }
}

// MARK: - HomeHeaderButtonViewDelegate Function Call
extension HomeHeaderButtonView {
    @objc func didTapButton(sender: UIButton) {
        delegate?.didTapButton(withText: buttonLabel.text!)
    }
}
