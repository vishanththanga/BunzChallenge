//
//  SlitPageControl.swift
//  Scuto
//
//  Created by Navine Manivannan on 2018-08-22.
//  Copyright © 2018 Scuto. All rights reserved.
//

import UIKit
import EasyPeasy

class SlitPageControl: UIView {
    
    private let contentView = UIView()
    private let stackView = UIStackView().then {
        $0.distribution = .equalSpacing
        $0.alignment = .fill
        $0.axis = .horizontal
        $0.spacing = 10
    }
    
    private let numberOfPages: Int
    private var pageViews: [UIView] = []
    
    public var currentPage: Int = 0 {
        willSet(settingPage) {
            if (1...numberOfPages).contains(settingPage) && currentPage != 0 {
                pageViews[currentPage - 1].backgroundColor = UI.Colors.lightGrey
            }
        } didSet {
            if (1...numberOfPages).contains(currentPage) {
                pageViews[currentPage - 1].backgroundColor = UI.Colors.lightBlue
            }
        }
    }
    
    init(numberOfPages: Int) {
        self.numberOfPages = numberOfPages
        super.init(frame: .zero)
        
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SlitPageControl {
    func layoutViews() {
        addSubview(stackView)
        let width = (40 + 10) * CGFloat(numberOfPages)
        stackView.easy.layout(Top(), Bottom(), Left(), Right(), Width(width))
        
        for _ in 0...(numberOfPages - 1) {
            let pageView = UIView().then {
                $0.backgroundColor = UI.Colors.lightGrey
            }
            stackView.addArrangedSubview(pageView)
            pageView.easy.layout(Top(), Bottom(), Height(2), Width(40))
            pageViews.append(pageView)
        }
    }
}
