//
//  ChatCell.swift
//  ParseChat
//
//  Created by Alex Chen on 2/22/17.
//  Copyright © 2017 Alex Chen. All rights reserved.
//

import UIKit

class ChatCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!
    var message: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        messageLabel.text = message
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
