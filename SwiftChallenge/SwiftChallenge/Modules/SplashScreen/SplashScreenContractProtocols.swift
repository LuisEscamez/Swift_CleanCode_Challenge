//
//  SplashScreenContractProtocols.swift
//  SwiftChallenge
//
//  Created by Luis on 19/10/2019.
//  Copyright © 2019 Luis Escamez Sánchez. All rights reserved.
//

import Foundation


/**
 This protocol will declare all methods connecting the Interface with the ViewModel.
 */
//MARK: - Interface -> ViewModel
protocol SplashScreenInterfaceToViewModelProtocol: BaseInterfaceToViewModelProtocol {
}

/**
 This protocol will declare all methods connecting the ViewModel with the Coordinator.
 */
//MARK: - ViewModel -> Coordinator
protocol SplashScreenViewModelToCoordinatorProtocol: class {
    func showSportsMenModule()
}
