//
//  RealmTableViewCell.swift
//  DataStoringPractise
//
//  Created by Даниил Алексеев on 06.12.2020.
//

import UIKit

class RealmTableViewCell: UITableViewCell {
    @IBOutlet weak var taskName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
