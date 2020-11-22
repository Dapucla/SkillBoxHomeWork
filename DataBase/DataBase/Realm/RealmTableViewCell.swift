//
//  RealmTableViewCell.swift
//  DataBase
//
//  Created by Даниил Алексеев on 11.11.2020.
//

import UIKit

class RealmTableViewCell: UITableViewCell {

    @IBOutlet weak var taskName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
