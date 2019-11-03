//
//  SportsMenTableContractProtocols.swift
//  SwiftChallenge
//
//  Created by Luis on 19/10/2019.
//  Copyright © 2019 Luis Escamez Sánchez. All rights reserved.
//

import UIKit

//MARK: - Interface -> ViewModel
/**
 This protocol will declare all methods connecting the Interface with the ViewModel.
 */
protocol SportsMenInterfaceToViewModelProtocol: BaseInterfaceToViewModelProtocol, UITableViewDelegate, UITableViewDataSource {
    var showLoaderHud: Bindable<Bool> { get set }
    var sportsFetched: Bindable<Bool> { get set }
}

//MARK: - ViewModel -> Coordinator
/**
 This protocol will declare all methods connecting the ViewModel with the Coordinator.
 */
protocol SportsMenViewModelToCoordinatorProtocol: class {
    
}
