//
//  SplashScreenViewModel.swift
//  SwiftChallenge
//
//  Created by Luis on 19/10/2019.
//  Copyright © 2019 Luis Escamez Sánchez. All rights reserved.
//

import Foundation

class SplashScreenViewModel: BaseViewModel {
    
    private let coordinator: SplashScreenViewModelToCoordinatorProtocol
    
    init(coordinator: SplashScreenViewModelToCoordinatorProtocol) {
        self.coordinator = coordinator
    }
}

extension SplashScreenViewModel: SplashScreenInterfaceToViewModelProtocol {
    
    func interfaceIsLoaded() {
        coordinator.showSportsMenModule()
    }
}
