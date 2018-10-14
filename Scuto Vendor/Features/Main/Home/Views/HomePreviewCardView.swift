//
//  HomePreviewCardView.swift
//  Scuto
//
//  Created by Navine Manivannan on 2018-08-03.
//  Copyright © 2018 Scuto. All rights reserved.
//

import UIKit
import EasyPeasy

enum HomePreviewCardType {
    case messages
    case upcomingBookings
}

class HomePreviewCardViewModel {
    let type: HomePreviewCardType
    let title: String
    
    init(type: HomePreviewCardType) {
        self.type = type
        title = type == .messages ? "Messages" : "Upcoming Bookings"
    }
}

class HomePreviewCardView: UIView {
    
    private let viewModel: HomePreviewCardViewModel
    
    private let contentView = UIView().then {
        $0.backgroundColor = UI.Colors.white
        $0.layer.borderColor = UI.Colors.black.cgColor.copy(alpha: 0.4)
        $0.layer.borderWidth = 0.2
        $0.layer.cornerRadius = 5
        $0.layer.shadowOffset = CGSize(width: 0, height: 1)
        $0.layer.shadowColor = UI.Colors.black.cgColor
        $0.layer.shadowRadius = 5
        $0.layer.shadowOpacity = 0.05
        
    }
    
    private let titleLabel = UILabel().then {
        $0.setFont(UI.Font.textRegularC, color: UI.Colors.black)
    }
    
    private let tableView = UITableView()
    
    init(viewModel: HomePreviewCardViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        setupProperties()
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HomePreviewCardView {
    func setupProperties() {
        titleLabel.text = viewModel.title
    }
}

extension HomePreviewCardView {
    func layoutViews() {
        addSubview(contentView)
        contentView.easy.layout(Top(), Bottom(), Left(), Right(), Height(160))
        
        contentView.addSubview(titleLabel)
        titleLabel.easy.layout(Top(10), Left(10), Right(), Height(20))
    }
}
