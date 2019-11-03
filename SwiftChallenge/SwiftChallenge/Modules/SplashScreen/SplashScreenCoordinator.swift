//
//  SplashScreenCoordinator.swift
//  SwiftChallenge
//
//  Created by Luis on 19/10/2019.
//  Copyright © 2019 Luis Escamez Sánchez. All rights reserved.
//

import UIKit

class SplashScreenCoordinator: BaseCoordinator {
    
    weak private var interface: SplashScreenViewController?
    weak private var viewModel: SplashScreenViewModel?
    
    static func createModule() -> (SplashScreenViewController?, SplashScreenCoordinator?, SplashScreenViewModel) {
        let storyboard = UIStoryboard(name: "SplashScreen", bundle: nil)
        let viewController: SplashScreenViewController = storyboard.instantiateViewController(withIdentifier: "SplashScreenViewControllerId") as! SplashScreenViewController
        let coordinator = SplashScreenCoordinator()
        let viewModel = SplashScreenViewModel(coordinator: coordinator)
        
        viewController.viewModel = viewModel
        coordinator.interface = viewController
        coordinator.viewModel = viewModel
        return (viewController, coordinator, viewModel)
    }
}

extension SplashScreenCoordinator: SplashScreenViewModelToCoordinatorProtocol {
    
    func showSportsMenModule() {
        let (sportsMenVC,_,_) = SportsMenCoordinator.createModule()
        if let vc = sportsMenVC {
           pushViewController(vc, animated: false)
        }
    }
}
