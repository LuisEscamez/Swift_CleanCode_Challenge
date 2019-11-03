//
//  SportsMenTableViewModel.swift
//  SwiftChallenge
//
//  Created by Luis on 19/10/2019.
//  Copyright © 2019 Luis Escamez Sánchez. All rights reserved.
//

import UIKit
import Foundation
import RxSwift

class SportsMenViewModel: BaseTableViewViewModel {
    
    let coordinator: SportsMenViewModelToCoordinatorProtocol
    private let sportsMenUseCase: SportsUseCase?
    
    private var tableSectionTitlesList = [String]()
    private var playersForSection = [ Int : [Player] ]()
    var showLoaderHud: Bindable = Bindable(true)
    var sportsFetched: Bindable = Bindable(false)
    
    
    init(coordinator: SportsMenViewModelToCoordinatorProtocol, sportsMenUseCase: SportsUseCase?, imageUseCase: ImagesUseCase) {
        self.coordinator = coordinator
        self.sportsMenUseCase = sportsMenUseCase
        super.init(imageUseCase: imageUseCase)
    }
}

extension SportsMenViewModel: SportsMenInterfaceToViewModelProtocol {
    
    func interfaceIsLoaded() {
        showLoaderHud.value = true
        fetchSports()
    }
}

extension SportsMenViewModel: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableSectionTitlesList.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableSectionTitlesList[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playersForSection[section]?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlayerTableViewCell.reuseIdentifier) as! PlayerTableViewCell
        guard let player = getPlayerFor(indexPath) else { return UITableViewCell() }
        cell.configureCell(player: player)
        imageForCell(cell: cell, at: indexPath)
        return cell
    }
}

// MARK: - Private Methods
fileprivate extension SportsMenViewModel {
    
    func fetchSports() {
        sportsMenUseCase?.execute(onSuccess: { (sports) in
            self.handleServiceSuccess(sports: sports)
        }, onFailure: { (error) in
            self.handleServiceError(error: error)
        })
    }
    
    func handleServiceSuccess(sports: [Sport]){
        self.clasifySportsInSections(sports: sports)
        self.sportsFetched.value = true
        self.showLoaderHud.value = false
    }
    
    func handleServiceError(error: Error) {
        self.showLoaderHud.value = false
        GeneralManager.customPrint(error.localizedDescription) //Simulate action error, for example... show error screen or alert
    }
    
    func clasifySportsInSections(sports: [Sport]) {
        for i in 0...sports.count-1 {
            self.playersForSection[i] = sports[i].playersList
            if let title = sports[i].sportTitle?.rawValue {
                self.tableSectionTitlesList.append(title)
            }
        }
    }
    
    func getPlayerFor(_ indexPath: IndexPath) -> Player? {
        let sectionPlayers = playersForSection[indexPath.section]
        return sectionPlayers?[indexPath.row]
    }
    
    func getUrlForPlayerAt(_ indexPath: IndexPath) -> String {
        return (playersForSection[indexPath.section]?[indexPath.row].imageURL).emptyIfNil()
    }
    
    func imageForCell(cell: PlayerTableViewCell, at indexPath: IndexPath) {
        let defaultImage : UIImage = .notFoundImage
        cell.tag = indexPath.row
        cell.setImage(defaultImage)
        let key = getUrlForPlayerAt(indexPath)
        self.obtainImageFor(key: key, cell: cell) { (image) in
            if indexPath.row == cell.tag {
                cell.setImage(image)
            }
        }
    }
}
