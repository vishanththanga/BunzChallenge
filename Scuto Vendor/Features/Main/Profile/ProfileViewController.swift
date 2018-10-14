//
//  ProfileViewController.swift
//  Scuto
//
//  Created by Navine Manivannan on 2018-07-17.
//  Copyright © 2018 Scuto. All rights reserved.
//

import UIKit
import Then
import EasyPeasy

class ProfileViewController: ScrollViewController {
    
    private let headerView = UIView().then {
        $0.backgroundColor = UI.Colors.white
    }
    
    private let headerImageView = UIImageView().then {
        $0.backgroundColor = UI.Colors.lightestGrey
        $0.contentMode     = .scaleAspectFill
        $0.clipsToBounds   = true
    }
    
    private let headerImageViewButton = UIButton().then {
        $0.addTarget(self, action: #selector(didTapHeaderOrProfileImageView(sender:)), for: .touchUpInside)
    }
    
    fileprivate let headerImagePickerController = UIImagePickerController()
    
    private let profileImageView = UIImageView().then {
        $0.backgroundColor     = UI.Colors.lightestGrey
        $0.layer.borderColor   = UI.Colors.white.cgColor
        $0.layer.borderWidth   = 1.5
        $0.layer.cornerRadius  = 75 / 2
        $0.layer.shadowColor   = UI.Colors.black.cgColor
        $0.layer.shadowRadius  = 4.0
        $0.layer.shadowOpacity = 0.2
        $0.layer.shadowOffset  = CGSize(width: 0, height: 2)
        $0.contentMode         = .scaleAspectFill
        $0.clipsToBounds       = true
    }
    
    fileprivate let profileImageViewButton = UIButton().then {
        $0.addTarget(self, action: #selector(didTapHeaderOrProfileImageView(sender:)), for: .touchUpInside)
    }
    
    private let profileImagePickerController = UIImagePickerController()

    private let profileIntroView = ProfileIntroView(viewModel: ProfileIntroViewModel(vendorName: "Ethiks Media", vendorType: VendorType.photography))
    private let profileDescriptionView = ProfileDescriptionView(viewModel: ProfileDescriptionViewModel(description: "Test Description"))
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerImagePickerController.delegate = self
        profileImagePickerController.delegate = self
        
        setupProperties()
        layoutViews()
        setScrollViewContentSize()
    }
}

// MARK: - Setup Properties
extension ProfileViewController {
    func setupProperties() {
        view.backgroundColor = UIColor(hexValue: 0xFCFCFC)
    }
}

// MARK: - Layout Views
extension ProfileViewController {
    func layoutViews() {
        view.addSubview(headerView)
        headerView.easy.layout(Left(), Right(), Top(), ScutoDevice().isiPhoneX() ? Height(44) : Height(20))
        
        contentView.addSubview(headerImageView)
        headerImageView.easy.layout(Left(), Right(), Top(0), Height(208))
        contentView.addSubview(headerImageViewButton)
        headerImageViewButton.easy.layout(Left(), Right(), Top(0), Height(208))
        
        contentView.addSubview(profileIntroView)
        profileIntroView.easy.layout(Top(190), Left(10), Right(10), Bottom())
        
        contentView.addSubview(profileImageView)
        profileImageView.easy.layout(Top(150), CenterX(), Size(75))
        contentView.addSubview(profileImageViewButton)
        profileImageViewButton.easy.layout(Top(150), CenterX(), Size(75))
        
        contentView.addSubview(profileDescriptionView)
        profileDescriptionView.easy.layout(Top(10).to(profileIntroView), Left(10), Right(10))
        
        
    }
}

// MARK: - Button Actions
extension ProfileViewController {
    @objc func didTapHeaderOrProfileImageView(sender: UIButton) {
        let imagePickerController = sender == headerImageViewButton ? headerImagePickerController : profileImagePickerController
        present(imagePickerController, animated: true, completion: nil)
    }
}

// MARK: - UIImagePickerController Delegate and UINavigationController Delegate Functions
extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let imageView = picker == headerImagePickerController ? headerImageView : profileImageView
        guard let image = info[.originalImage] as? UIImage else { return }
        
        imageView.image = image
        
        picker.dismiss(animated: true, completion: nil)
    }
}
