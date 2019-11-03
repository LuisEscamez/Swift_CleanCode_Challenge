//
//  SplashScreenViewController.swift
// SwiftChallenge
//
//  Created by Luis on 19/10/2019.
//  Copyright © 2019 Luis Escamez Sánchez. All rights reserved.
//

import Foundation
import UIKit

class SplashScreenViewController: BaseViewController {
    
    var viewModel: SplashScreenInterfaceToViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.interfaceIsLoaded()
    }
}
