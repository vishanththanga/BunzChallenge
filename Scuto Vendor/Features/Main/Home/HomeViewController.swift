//
//  HomeViewController.swift
//  Scuto
//
//  Created by Navine Manivannan on 2018-06-19.
//  Copyright © 2018 Scuto. All rights reserved.
//

import UIKit
import Then
import EasyPeasy

protocol HomeViewControllerDelegate: class {
    func didTapBigButtonView(_ homeBigButtonView: HomeBigButtonView)
}

class HomeViewController: ScrollViewController {
    
    weak var delegate: HomeViewControllerDelegate?
    let transition = SearchViewControllerTransition()
    
    private let headerView = UIView().then {
        $0.backgroundColor = UI.Colors.white
    }
    
    let homeHeaderView = HomeHeaderView()
    let homeSearchView = HomeSearchView()
    
    let dividerView = UIView(frame: CGRect(x: 0, y: 0, width: 1.5, height: 105)).then {
        $0.backgroundColor = UI.Colors.black.withAlphaComponent(0.2)
    }
    
    let bookingsButtonView = HomeBigButtonView(imageName: "bookingsIcon", text: "Bookings")
    let paymentsButtonView = HomeBigButtonView(imageName: "paymentsIcon", text: "Payments")
    
    let messagesPreviewCardView = HomePreviewCardView(viewModel: HomePreviewCardViewModel(type: .messages))
    let upcomingBookingsPreviewCardView = HomePreviewCardView(viewModel: HomePreviewCardViewModel(type: .upcomingBookings))
    
    let tempView = UIView().then {
        $0.backgroundColor = .blue
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        homeHeaderView.delegate = self
        homeSearchView.delegate = self
        bookingsButtonView.delegate = self
        paymentsButtonView.delegate = self
        
        layoutViews()
        setScrollViewContentSize()
    }
}

// MARK: Layout Views
extension HomeViewController {
    func layoutViews() {
        view.addSubview(headerView)
        headerView.easy.layout(Left(), Right(), Top(), ScutoDevice().isiPhoneX() ? Height(44) : Height(22))
        
        contentView.addSubview(homeHeaderView)
        homeHeaderView.easy.layout(ScutoDevice().isiPhoneX() ? Top(-44) : Top(-20), Left(0), Right(0), ScutoDevice().isiPhoneX() ? Height(145) : Height(121))
        
        contentView.addSubview(homeSearchView)
        homeSearchView.easy.layout(Top(75).to(homeHeaderView), Left(25), Right(25), Height(45))
        
        contentView.addSubview(dividerView)
        dividerView.easy.layout(Top(40).to(homeSearchView), CenterX(0), Width(1.5), Height(105))
        
        contentView.addSubview(bookingsButtonView)
        bookingsButtonView.easy.layout(Top(50).to(homeSearchView), Right(60).to(dividerView))
        
        contentView.addSubview(paymentsButtonView)
        paymentsButtonView.easy.layout(Top(50).to(homeSearchView), Left(60).to(dividerView))
        
        contentView.addSubview(messagesPreviewCardView)
        messagesPreviewCardView.easy.layout(Top(40).to(dividerView), Left(10), Right(10))
        
        contentView.addSubview(upcomingBookingsPreviewCardView)
        upcomingBookingsPreviewCardView.easy.layout(Top(20).to(messagesPreviewCardView), Left(10), Right(10), Bottom())
    }
}

// MARK: - HomeHeaderViewDelegate
extension HomeViewController: HomeHeaderViewDelegate {
    func didTapUpdateAvailability() {
        print("Tapped UA")
    }
    
    func didTapBusinessInsight() {
        print("Tapped BI")
    }
    
    func didTapManageAccount() {
        print("Tapped MA")
    }
}

// MARK: - HomeSearchViewDelegate
extension HomeViewController: HomeSearchViewDelegate {
    func didTapHomeSearchView() {
//        let searchViewController = SearchViewController()
//        searchViewController.transitioningDelegate = self
//        present(searchViewController, animated: true, completion: nil)
        
    }
}

// MARK: - HomeBigButtonViewDelegate
extension HomeViewController: HomeBigButtonViewDelegate {
    func didTapHomeBigButtonView(_ homeBigButtonView: HomeBigButtonView) {
        delegate?.didTapBigButtonView(homeBigButtonView)
    }
}

// MARK: - UIViewControllerTransitioningDelegate
extension HomeViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.presenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.presenting = false
        return transition
    }
}

