//
//  ViewController.swift
//  LearnCoreGraphic
//
//  Created by Lauriane Haydari on 10/04/2020.
//  Copyright © 2020 Lauriane Haydari. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var drawView: DrawView!
    
    private let viewModel = MainViewModel()
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind(to: viewModel)
        
        viewModel.viewDidLoad()
    }
    
    // MARK: - View actions
    
    
    // MARK: - Private Functions
    
    private func bind(to viewModel: MainViewModel) {
        
    }
}

