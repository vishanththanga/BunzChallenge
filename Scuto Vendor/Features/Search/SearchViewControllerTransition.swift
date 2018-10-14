//
//  SearchViewControllerTransition.swift
//  Scuto
//
//  Created by Navine Manivannan on 2018-07-09.
//  Copyright © 2018 Scuto. All rights reserved.
//

import UIKit
import EasyPeasy
import Then

class SearchViewControllerTransition: NSObject, UIViewControllerAnimatedTransitioning {
    var presenting = true
    var firstDuration = 0.4, secondDuration = 0.2
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return firstDuration + secondDuration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        let presentingFrom = transitionContext.viewController(forKey: .from )
        let presentingTo = transitionContext.viewController(forKey: .to)
        
        let fromVC = presenting ? presentingFrom : presentingTo
        let toVC = presenting ? presentingTo : presentingFrom
        
        let animationComponents = setupAnimationComponents(containerView, fromVC, toVC)
        
        UIView.animate(withDuration: firstDuration, animations: {
            self.firstAnimation(animationComponents, toVC)
        }, completion: { _ in
            UIView.animate(withDuration: self.secondDuration, animations: {
                self.secondAnimation(toVC)
            }, completion: { _ in
                
                // TODO
                if self.presenting {
                    guard let background = animationComponents["background"] as? UIView,
                        let searchBarBackground = animationComponents["searchBarBackground"] as? UIView else { return }
                    background.removeFromSuperview()
                    searchBarBackground.removeFromSuperview()
                    (fromVC as! MainTabBarController).homeViewController.homeSearchView.isHidden = false
                }
                
                // ----
                transitionContext.completeTransition(true)
            })
        })
    }
}

// MARK: - Setup Animation Components
extension SearchViewControllerTransition {
    func setupAnimationComponents(_ containerView: UIView, _ fromVC: UIViewController?, _ toVC: UIViewController?) -> [String: AnyObject] {
        let background = UIView().then {
            $0.backgroundColor = UIColor(hexValue: 0xFCFCFC)
            $0.alpha = presenting ? 0.0 : 1.0
        }
        
        let searchBarBackground = UIView().then {
            $0.backgroundColor = UI.Colors.white
            $0.layer.borderColor = UI.Colors.black.cgColor.copy(alpha: 0.4)
            $0.layer.borderWidth = 0.2
            $0.layer.cornerRadius = presenting ? 5 : 0
        }
        
        if presenting {
            if let fromVC = fromVC as? MainTabBarController, let toVC = toVC as? SearchViewController {
                fromVC.homeViewController.homeSearchView.isHidden = true
                toVC.view.alpha = 0.0
                
                fromVC.view.addSubview(background)
                background.easy.layout(Edges(0))
                
                fromVC.view.addSubview(searchBarBackground)
                searchBarBackground.easy.layout(ScutoDevice().isiPhoneX() ? Top(220) : Top(196), Left(25), Right(25), Height(45))
                
                containerView.addSubview(toVC.view)
                
            }
        } else {
            if let fromVC = toVC as? SearchViewController {
                containerView.addSubview(fromVC.view)
            }
        }
        
        return ["background": background, "searchBarBackground": searchBarBackground]
    }
}

// MARK: - Animations
extension SearchViewControllerTransition {
    func firstAnimation(_ animationComponents: [String: AnyObject], _ toVC: UIViewController?) {
        guard let background = animationComponents["background"] as? UIView,
            let searchBarBackground = animationComponents["searchBarBackground"] as? UIView else { return }
        
        if presenting {
            background.alpha = 1.0
            searchBarBackground.layer.cornerRadius = 0
            searchBarBackground.transform = CGAffineTransform(scaleX: 1.3, y: ScutoDevice().isiPhoneX() ? 2.4 : 1.8).translatedBy(x: 0, y: -80)
        } else {
            guard let fromVC = toVC as? SearchViewController else { return }
            fromVC.view.alpha = 0.0
        }
    }
    
    func secondAnimation(_ toVC: UIViewController?) {
        if presenting {
            guard let toVC = toVC as? SearchViewController else { return }
            toVC.view.alpha = 1.0
        }
    }
}
