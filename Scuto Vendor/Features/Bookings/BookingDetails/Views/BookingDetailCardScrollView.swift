//
//  BookingDetailCardScrollView.swift
//  Scuto
//
//  Created by Navine Manivannan on 2018-08-21.
//  Copyright © 2018 Scuto. All rights reserved.
//

import UIKit
import EasyPeasy

class BookingDetailCardScrollView: UIView {
    
    final let scrollView = UIScrollView().then {
        $0.contentSize = CGSize.zero
        $0.backgroundColor = UI.Colors.backgroundColor
        $0.showsVerticalScrollIndicator = false
        $0.showsHorizontalScrollIndicator = false
    }
    
    final let contentView = UIView().then {
        $0.backgroundColor = UI.Colors.backgroundColor
    }
    
    final let stackView = UIStackView().then {
        $0.axis = NSLayoutConstraint.Axis.horizontal
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout Views
extension BookingDetailCardScrollView {
    func layoutViews() {
        addSubview(scrollView)
        scrollView.easy.layout(Top(), Bottom(), Left(), Right())
        
        scrollView.addSubview(contentView)
        contentView.easy.layout(Top(), Left(), Right(), Bottom(), Height().like(scrollView))
    }
    
    func setScrollViewContentSize() {
        scrollView.contentSize = contentView.frame.size
    }
}
