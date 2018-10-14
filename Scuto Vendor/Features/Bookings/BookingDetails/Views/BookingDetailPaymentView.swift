//
//  BookingDetailPaymentView.swift
//  Scuto
//
//  Created by Navine Manivannan on 2018-08-21.
//  Copyright © 2018 Scuto. All rights reserved.
//

import UIKit
import EasyPeasy

class BookingDetailPaymentsViewModel {
    var totalCost: String?
    
    init(totalCost: String) {
        self.totalCost = self.setupTotalCost(totalCost)
    }
    
    func setupTotalCost(_ cost: String) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        guard let costInteger = Int(cost) else { return nil }
        guard let costWithCommas = numberFormatter.string(from: NSNumber(value: costInteger)) else { return nil}
        return "$ " + costWithCommas
    }
}

class BookingDetailPaymentView: UIView {
    
    private let viewModel: BookingDetailPaymentsViewModel
    
    private let paymentLabel = UILabel().then {
        $0.font = UI.Font.headerA
        $0.textColor = UI.Colors.lightBlue
        $0.text = "Payments"
    }
    
    private let totalCostLabel = UILabel().then {
        $0.font = UI.Font.headerB
        $0.textColor = UI.Colors.black
        $0.text = "Total Cost"
    }
    
    private let totalCostValueLabel = UILabel().then {
        $0.font = UI.Font.regular(24)
        $0.textColor = UI.Colors.black
    }

    init(viewModel: BookingDetailPaymentsViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        
        totalCostValueLabel.text = viewModel.totalCost
        
        setupProperties()
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Properties
extension BookingDetailPaymentView {
    func setupProperties() {
        backgroundColor = UI.Colors.white
        
        layer.cornerRadius = 5.0
        layer.shadowColor = UI.Colors.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 0, height: 4)
    }
}

// MARK: - Layout Views
extension BookingDetailPaymentView {
    func layoutViews() {
        addSubview(paymentLabel)
        paymentLabel.easy.layout(Top(20), CenterX())
        
        addSubview(totalCostLabel)
        totalCostLabel.easy.layout(Top(30).to(paymentLabel), CenterX())
        
        addSubview(totalCostValueLabel)
        totalCostValueLabel.easy.layout(Top().to(totalCostLabel), CenterX())
    }
}
