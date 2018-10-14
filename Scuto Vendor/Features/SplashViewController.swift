//
//  SplashViewController.swift
//  Scuto
//
//  Created by Navine Manivannan on 2018-08-03.
//  Copyright © 2018 Scuto. All rights reserved.
//

import UIKit
import Lottie
import EasyPeasy

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UI.Colors.white
        
        let imageView = UIImageView(image: UIImage(named: "scutoLightBlueLogo"))
        view.addSubview(imageView)
        imageView.easy.layout(CenterX(), Top(220))

        let animationView = LOTAnimationView(name: "splash-view-controller-animation")
        self.view.addSubview(animationView)
        print("\(animationView.animationDuration)")
        animationView.play()
    }
}
