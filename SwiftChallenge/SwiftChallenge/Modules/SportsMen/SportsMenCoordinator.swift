//
//  SportsMenTableCoordinator.swift
//  SwiftChallenge
//
//  Created by Luis on 19/10/2019.
//  Copyright © 2019 Luis Escamez Sánchez. All rights reserved.
//

import UIKit

class SportsMenCoordinator: BaseCoordinator {
    
    weak private var interface: SportsMenViewController?
    weak private var viewModel: SportsMenViewModel?
    var showLoaderHud: Bindable = Bindable(true)
    
    static func createModule() -> (SportsMenViewController?, SportsMenCoordinator?, SportsMenViewModel) {
        
        let storyboard = UIStoryboard(name: "SportsMen", bundle: nil)
        let viewController: SportsMenViewController = storyboard.instantiateViewController(withIdentifier: "SportsMenViewControllerId") as! SportsMenViewController
        let coordinator = SportsMenCoordinator()
        let viewModel = SportsMenViewModel(coordinator: coordinator, sportsMenUseCase: SportsUseCase(service: SportsService()), imageUseCase: ImagesUseCase(service: ImagesService()))
        
        viewController.viewModel = viewModel
        coordinator.interface = viewController
        coordinator.viewModel = viewModel
        
        return (viewController, coordinator, viewModel)
    }
}

extension SportsMenCoordinator: SportsMenViewModelToCoordinatorProtocol {
    
}
