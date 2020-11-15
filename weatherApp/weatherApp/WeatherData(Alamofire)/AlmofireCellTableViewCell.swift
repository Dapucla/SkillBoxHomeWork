//
//  AlmofireCellTableViewCell.swift
//  weatherApp
//
//  Created by Даниил Алексеев on 08.11.2020.
//

import UIKit

class AlmofireCellTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var tableTempLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
