//
//  SearchBarView.swift
//  Scuto
//
//  Created by Navine Manivannan on 2018-07-09.
//  Copyright © 2018 Scuto. All rights reserved.
//

import UIKit
import Then
import EasyPeasy

protocol SearchBarViewDelegate {
    func didTapClose()
}

class SearchBarView: UIView {
    
    var delegate: SearchBarViewDelegate?
    
    private let searchIcon = UIImageView().then {
        $0.image = UIImage(named: "searchIcon")
        $0.contentMode = .scaleAspectFit
    }
    
    private let searchLabel = UILabel().then {
        $0.setText("Search for a Vendor or Venue", alignment: .center)
        $0.setFont(UI.Font.textRegularC, color: UI.Colors.black.withAlphaComponent(0.6))
    }
    
    private let closeButton = UIButton().then {
        $0.setImage(UIImage(named: "blueCloseIcon")!, for: .normal)
        $0.contentMode = .scaleAspectFit
        $0.addTarget(self, action: #selector(didTapClose(sender:)), for: .touchUpInside)
    }
    
    init() {
        super.init(frame: .zero)
        
        setupProperties()
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

// MARK: - Setup Properties
extension SearchBarView {
    func setupProperties() {
        backgroundColor = UI.Colors.white
        setupBorderProperties()
        setupShadowProperties()
    }
    
    func setupBorderProperties() {
        layer.borderColor = UI.Colors.black.cgColor.copy(alpha: 0.4)
        layer.borderWidth = 0.2
    }
    
    func setupShadowProperties() {
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowColor = UI.Colors.black.cgColor
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.1
    }
}

// MARK: - Layout Views
extension SearchBarView {
    func layoutViews() {
        layoutSearchIcon()
        layoutSearchPlaceHolderLabel()
        layoutCloseButton()
    }
    
    func layoutSearchIcon() {
        addSubview(searchIcon)
        searchIcon.easy.layout(Left(20), Bottom(14), Size(18))
    }
    
    func layoutSearchPlaceHolderLabel() {
        addSubview(searchLabel)
        searchLabel.easy.layout(CenterY(0).to(searchIcon), Left(10).to(searchIcon), Height(21))
    }
    
    func layoutCloseButton() {
        addSubview(closeButton)
        closeButton.easy.layout(CenterY(0).to(searchIcon), Right(20), Height(18))
    }
}

// MARK: - SearchBarViewDelegate Function Call
extension SearchBarView {
    @objc func didTapClose(sender: UIButton) {
        delegate?.didTapClose()
    }
}
