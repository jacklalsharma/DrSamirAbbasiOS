//
//  SectionViewController.swift
//  Dr Samir Abbas
//
//  Created by Anurag on 21/04/18.
//  Copyright © 2018 Anurag. All rights reserved.
//


import UIKit

protocol SectionViewControllerDelegate: class {
    func sectionViewControllerDidLayoutSubViews(size: CGSize)
}

final class SectionViewController: UIViewController {
    
    weak var delegate: SectionViewControllerDelegate?
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        delegate?.sectionViewControllerDidLayoutSubViews(size: view.bounds.size)
    }
}
