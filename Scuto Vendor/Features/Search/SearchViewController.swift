//
//  SearchViewController.swift
//  Scuto
//
//  Created by Navine Manivannan on 2018-07-09.
//  Copyright © 2018 Scuto. All rights reserved.
//

import UIKit
import EasyPeasy

class SearchViewController: UIViewController {
    
    let searchBarView = SearchBarView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBarView.delegate = self

        setupProperties()
        layoutViews()
    }
}

// MARK: - Setup Properties
extension SearchViewController {
    func setupProperties() {
        view.backgroundColor = UIColor(hexValue: 0xFCFCFC)
    }
}

// MARK: - Layout Views
extension SearchViewController {
    func layoutViews() {
        view.addSubview(searchBarView)
        searchBarView.easy.layout(Top(0), Left(0), Right(0), Height(ScutoDevice().isiPhoneX() ? 104 : 80))
    }
}

extension SearchViewController: SearchBarViewDelegate {
    func didTapClose() {
        dismiss(animated: true, completion: nil)
    }
    
    
}
