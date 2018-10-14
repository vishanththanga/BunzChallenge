//
//  UIViewController+AddRemoveChildren.swift
//  Scuto
//
//  Created by Navine Manivannan on 2018-08-01.
//  Copyright © 2018 Scuto. All rights reserved.
//

import UIKit

extension UIViewController {
    enum AnimationType {
        case fadeIn
        case overlayFromBottom
        case overlayFromRight
    }
    
    func add(childController: UIViewController, animation: AnimationType? = nil, duration: Double = 0) {
        addChild(childController)
        view.addSubview(childController.view)
        childController.didMove(toParent: self)
        
        guard let animation = animation else { return }
        
        switch animation {
        case .fadeIn:
            fadeIn(childController, duration)
        case .overlayFromBottom:
            overlayFromBottom(childController, duration)
        case .overlayFromRight:
            overlayFromRight(childController, duration)
        }
    }
    
    func remove(childController: UIViewController, delay: Double = 0) {
        let deadline = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: deadline, execute: {
            childController.willMove(toParent: nil)
            childController.view.removeFromSuperview()
            childController.removeFromParent()
        })
    }
    
    private func fadeIn(_ controller: UIViewController, _ duration: Double) {
        controller.view.alpha = 0.0
        UIView.animate(withDuration: duration, delay: 0.0, options: .curveEaseOut, animations: {
            controller.view.alpha = 1.0
        }, completion: nil)
        
    }
    
    private func overlayFromBottom(_ controller: UIViewController, _ duration: Double) {
        let originalFrame = controller.view.frame
        controller.view.frame = CGRect(x: 0, y: originalFrame.height, width: originalFrame.width, height: originalFrame.height)
        UIView.animate(withDuration: duration, delay: 0.0, options: .curveEaseOut, animations: {
            controller.view.frame = originalFrame
        }, completion: nil)
    }
    
    private func overlayFromRight(_ controller: UIViewController, _ duration: Double) {
        let originalFrame = controller.view.frame
        controller.view.frame = CGRect(x: originalFrame.width, y: 0, width: originalFrame.width, height: originalFrame.height)
        UIView.animate(withDuration: duration, delay: 0.0, options: .curveEaseOut, animations: {
            controller.view.frame = originalFrame
        }, completion: nil)
    }
}
