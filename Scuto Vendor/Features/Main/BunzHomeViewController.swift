//
//  BunzHomeViewController.swift
//  Scuto Vendor
//
//  Created by Kartik on 2018-10-14.
//  Copyright © 2018 Scuto. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

class BunzHomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutViews()
    }
}
extension BunzHomeViewController {
    func layoutViews() {
        let sallyTransaction = BunzTransactionView(imageName: "bunzLogo", personName: "Sally", userName: "@sallyofficial", amount: "-50 BTZ")
        view.addSubview(sallyTransaction)
        sallyTransaction.easy.layout(Top(50), Width(100),Height(70))
        
        let escrowTransaction = BunzTransactionView(imageName: "bunzLogo", personName: "Bunz", userName: "Contract", amount: "-50 BTZ")
        view.addSubview(escrowTransaction)
        escrowTransaction.easy.layout(Top(50).to(sallyTransaction), Width(350), Height(100))
    }
}
