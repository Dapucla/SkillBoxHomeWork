//
//  BurgerViewController.swift
//  collections&tablesHW
//
//  Created by Даниил Алексеев on 21.10.2020.
//

import UIKit

class BurgerViewController: UIViewController {
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var pageView: UIPageControl!
    
    @IBOutlet weak var menuButton: UIButton!
    
    @IBOutlet weak var orderButton: UIButton!
    let myArr = [UIImage(named: "burger1"),UIImage(named: "burger2"),UIImage(named: "burger3"),UIImage(named: "burger4"),UIImage(named: "burger5")]
    override func viewDidLoad() {
        super.viewDidLoad()
        pageView.numberOfPages = myArr.count
        pageView.currentPage = 0
        
        contentView.layer.cornerRadius = 15
        orderButton.layer.cornerRadius = 15
        actionButton.layer.cornerRadius = 15
        
        menuButton.backgroundColor = .clear
        menuButton.layer.cornerRadius = 15
        menuButton.layer.borderWidth = 3
        menuButton.layer.borderColor = UIColor.green.cgColor
        
        orderButton.backgroundColor = .clear
        orderButton.layer.cornerRadius = 15
        orderButton.layer.borderWidth = 3
        orderButton.layer.borderColor = UIColor.green.cgColor
    }
}

extension BurgerViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myArr.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! BurgerlCollectionViewCell
        cell.imageview.image = myArr[indexPath.row]
        return cell
    }
}

extension BurgerViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = sliderCollectionView.frame.size
        return CGSize(width: size.width, height: size.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}



