//
//  BorderedButton.swift
//  Scuto
//
//  Created by Navine Manivannan on 2018-08-15.
//  Copyright © 2018 Scuto. All rights reserved.
//

import UIKit

class   BorderedButton: UIButton {
    
    let primaryColor: UIColor
    let secondaryColor: UIColor
    
    var buttonTapHandler: (() -> Void)?
    
    init(_ primaryColor: UIColor, secondaryColor: UIColor) {
        self.primaryColor = primaryColor
        self.secondaryColor = secondaryColor
        
        super.init(frame: .zero)
        
        setupProperties()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupProperties() {
        setTitleColor(primaryColor, for: .normal)
        setTitleColor(secondaryColor, for: .highlighted)
        setTitleColor(secondaryColor, for: .selected)
        
        setBackgroundColor(secondaryColor, for: .highlighted)
        setBackgroundColor(primaryColor, for: .normal)
        setBackgroundColor(primaryColor, for: .normal)
        
        layer.borderColor = primaryColor.cgColor
        layer.borderWidth = 1.5
        
        addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc func didTapButton() {
        isSelected = true
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.25, execute: { [unowned self] in
            self.isSelected = false
        })
        buttonTapHandler?()
    }
}

// MARK: - UIButton Override Functions
extension BorderedButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / 2
        clipsToBounds = true
    }
    
    override func setTitle(_ title: String?, for state: UIControl.State) {
        super.setTitle(title, for: state)
    }
}
