//
//  HomeSearchView.swift
//  Scuto
//
//  Created by Navine Manivannan on 2018-06-13.
//  Copyright © 2018 Scuto. All rights reserved.
//

import UIKit
import Then
import EasyPeasy

protocol HomeSearchViewDelegate {
    func didTapHomeSearchView()
}

class HomeSearchView: UIView {
    
    var delegate: HomeSearchViewDelegate?
    
    private let searchIcon = UIImageView().then {
        $0.image = UIImage(named: "searchIcon")
        $0.contentMode = .scaleAspectFit
    }
    
    private let searchLabel = UILabel().then {
        $0.setText("Search for a Vendor or Venue", alignment: .center)
        $0.setFont(UI.Font.textRegularC, color: UI.Colors.black.withAlphaComponent(0.6))
    }
    
    private let searchViewButton = UIButton().then {
        $0.addTarget(self, action: #selector(didTapHomeSearchView(sender:)), for: .touchUpInside)
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
extension HomeSearchView {
    func setupProperties() {
        backgroundColor = UI.Colors.white
        setupBorderProperties()
        setupShadowProperties()
    }
    
    func setupBorderProperties() {
        layer.borderColor = UI.Colors.black.cgColor.copy(alpha: 0.4)
        layer.borderWidth = 0.2
        layer.cornerRadius = 5
    }
    
    func setupShadowProperties() {
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowColor = UI.Colors.black.cgColor
        layer.shadowRadius = 5
        layer.shadowOpacity = 0.05
    }
}

// MARK: - Layout Views
extension HomeSearchView {
    func layoutViews() {
        layoutSearchIcon()
        layoutSearchPlaceHolderLabel()
        layoutSearchViewButton()
    }
    
    func layoutSearchIcon() {
        addSubview(searchIcon)
        searchIcon.easy.layout(Left(20), CenterY(0), Size(18))
    }
    
    func layoutSearchPlaceHolderLabel() {
        addSubview(searchLabel)
        searchLabel.easy.layout(Edges(0))
    }
    
    func layoutSearchViewButton() {
        addSubview(searchViewButton)
        searchViewButton.easy.layout(Edges(0))
    }
}

// MARK: - HomeSearchViewDelegate Function Call
extension HomeSearchView {
    @objc func didTapHomeSearchView(sender: UIButton) {
        delegate?.didTapHomeSearchView()
    }
    
    
}
