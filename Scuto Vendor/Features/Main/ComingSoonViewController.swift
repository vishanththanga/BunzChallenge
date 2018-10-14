//
//  ComingSoonViewController.swift
//  Scuto
//
//  Created by Navine Manivannan on 2018-06-12.
//  Copyright © 2018 Scuto. All rights reserved.
//

import UIKit
import Then
import EasyPeasy

class ComingSoonViewController: UIViewController {
    
    private let backgroundImageView = UIImageView(image: UIImage(named: "comingSoonBackground")!).then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = false
    }
    
    private let comingSoonLabel = UILabel().then {
        $0.setText("This Page is Coming Soon", alignment: .center)
        $0.setFont(UI.Font.headerRegularA, color: UI.Colors.white)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        layoutViews()
    }
}

// MARK: Layout Views
extension ComingSoonViewController {
    func layoutViews() {
        layoutBackgroundImageView()
        layoutComingSoonLabel()
    }
    
    func layoutBackgroundImageView() {
        view.addSubview(backgroundImageView)
        backgroundImageView.easy.layout(Top(-2), Bottom(110), Left(-1), Right(-1))
    }
    
    func layoutComingSoonLabel() {
        view.addSubview(comingSoonLabel)
        comingSoonLabel.easy.layout(ScutoDevice().isiPhoneX() ? Top(204) : Top(180), CenterX(0))
    }
}
