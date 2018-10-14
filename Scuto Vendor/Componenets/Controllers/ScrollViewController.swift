//
//  ScrollViewController.swift
//  Scuto
//
//  Created by Navine Manivannan on 2018-07-26.
//  Copyright © 2018 Scuto. All rights reserved.
//

import UIKit
import Then
import EasyPeasy

class ScrollViewController: UIViewController {
    
    final let scrollView = UIScrollView().then {
        $0.contentSize = CGSize.zero
        $0.backgroundColor = UI.Colors.backgroundColor
        $0.showsVerticalScrollIndicator = false
        $0.showsHorizontalScrollIndicator = false
    }
    
    final let contentView = UIView().then {
        $0.backgroundColor = UI.Colors.backgroundColor
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(scrollView)
        scrollView.easy.layout(Top(), Bottom(), Left(), Right())

        scrollView.addSubview(contentView)
        contentView.easy.layout(Top(), Left(), Right(), Bottom(), Width().like(scrollView))
        
        setScrollViewContentSize()
    }
    
    func setScrollViewContentSize() {
        scrollView.contentSize = contentView.frame.size
    }
}
