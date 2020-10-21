//
//  ViewController.swift
//  collections&tablesHW
//
//  Created by Даниил Алексеев on 11.10.2020.
//

import UIKit

class ViewController: UIViewController {

    let names = ["Куртка","Пальто","Пиджак","Джинсы", "Свитер","Жилет"]
    let images = [UIImage(named: "jacket"),UIImage(named: "coat"),UIImage(named: "blazer"),UIImage(named: "jeans"),UIImage(named: "sweater"),UIImage(named: "vest")]
    let previousPrice = ["11000","18500","8300","5650","4250","7440"]
    let actualPrice = ["8950", "13100", "6750", "4250", "3300", "5170"]
    let decount = ["-20%", "-30%", "-25%", "-27%", "-32%", "-44%"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let w = UIScreen.main.bounds.size.width / 2.5
        let h = UIScreen.main.bounds.size.height / 2.7
        return CGSize(width: w, height: h  )
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return names.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.nameLabel.text = actualPrice[indexPath.row]
        cell.imageView.image = images[indexPath.row]
        cell.previousPriceLaabel.text = previousPrice[indexPath.row]
        cell.productDescribtion.text = names[indexPath.row]
        cell.discount.text = decount[indexPath.row]
        
        cell.layer.borderWidth = 0.3
        cell.layer.borderColor = UIColor.lightGray.cgColor
        return cell
    }
}

extension ViewController: UICollectionViewDelegate{
     func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            if let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: indexPath) as? CollectionReusableView{
                headerView.titleLaberl.text = "Скидки"
               
                return headerView
            }
        default:
            return UICollectionReusableView()
        }
        return UICollectionReusableView()
    }
}
