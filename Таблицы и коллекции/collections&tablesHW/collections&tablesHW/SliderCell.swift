//
//  SliderCell.swift
//  collections&tablesHW
//
//  Created by Даниил Алексеев on 23.10.2020.
//

import UIKit

class SliderCell: UICollectionViewCell {
    

    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage! {
        didSet {
            imageView.image = image
        }
    }
}
