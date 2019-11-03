//
//  PlayerTableViewCell.swift
//  SwiftChallenge
//
//  Created by Luis on 20/10/2019.
//  Copyright © 2019 Luis Escamez Sánchez. All rights reserved.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {
    
    static let reuseIdentifier : String = "playerTableCell"
    
    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerSurnameLabel: UILabel!
    @IBOutlet weak var playerBirthDateLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        [playerNameLabel, playerSurnameLabel, playerBirthDateLabel].forEach { (label) in
            label?.numberOfLines = 0
        }
    }

    func configureCell(player: Player) {
        updateDataFrom(player: player)
    }
    
    func setImage(_ image: UIImage) {
        self.playerImageView.image = image
    }
}

fileprivate extension PlayerTableViewCell {
    
    
    func updateDataFrom(player: Player) {
        self.playerNameLabel.text = player.name
        self.playerSurnameLabel.text = player.surname
        self.playerBirthDateLabel.text = player.birthDate?.toString(with: .spanishDateFormat)
    }
}
