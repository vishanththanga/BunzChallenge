//
//  BunzTransactionDetailsView.swift
//  Scuto Vendor
//
//  Created by Rikard Saqe on 2018-10-14.
//  Copyright © 2018 Scuto. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

class BunzTransactionDetailsView: UIView {
    
    init() {
        super.init(frame: .zero)
        layoutViews()
    }
    
    private let transactionDetailsLabel = UILabel().then {
        $0.textColor = UI.Colors.black
        $0.font = UI.Font.medium(15)
        $0.text = "Transaction Details"
    }

    private let imageViewLabel = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }

    private let DisputeButton = BorderedButton(UI.Colors.black, secondaryColor: UI.Colors.yellow).then {
        $0.setTitle("DISPUTE", for: .normal)
        $0.contentMode = .scaleAspectFill
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BunzTransactionDetailsView {
    func layoutViews(){
        addSubview(transactionDetailsLabel)
        transactionDetailsLabel.easy.layout(Top(2), CenterX())
        addSubview(imageViewLabel)
        imageViewLabel.easy.layout(Top(12), Width(10), Height(10))
        let transaction = BunzTransactionView(imageName: "", personName: "Sally", userName: "@SallyOfficial", amount: "100,000 BTZ")
        addSubview(transaction)
        transaction.easy.layout(Top(10).to(transactionDetailsLabel))
    }
}
