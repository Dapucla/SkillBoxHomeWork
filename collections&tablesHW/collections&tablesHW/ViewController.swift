//
//  ViewController.swift
//  collections&tablesHW
//
//  Created by Даниил Алексеев on 11.10.2020.
//

import UIKit

class ViewController: UIViewController {
    
    struct Product {
        let names: String
        let image: UIImage?
        let previousPrice: String
        let actualPrice: String
        let decount: String
    }
    
    let products = [Product(names: "Куртка", image: UIImage(named: "jacket"), previousPrice: "11000", actualPrice: "8950", decount: "-20%"), Product(names: "Пальто", image: UIImage(named: "coat"), previousPrice: "18500", actualPrice: "13100", decount: "-30%"), Product(names: "Пиджак", image: UIImage(named: "blazer"), previousPrice: "8300", actualPrice: "6750", decount: "-25%"), Product(names: "Джинсы", image: UIImage(named: "jeans"), previousPrice: "5650", actualPrice: "4250", decount: "-27%"), Product(names: "Свитер", image: UIImage(named: "sweater"), previousPrice: "4250", actualPrice: "3300", decount: "-32%"), Product(names: "Жилет", image: UIImage(named: "vest"), previousPrice: "7440", actualPrice: "5170", decount: "-44%")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        let w = UIScreen.main.bounds.size.width / 2.5
        let h = UIScreen.main.bounds.size.height / 2.7
        return CGSize(width: w, height: h)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        let product = products[indexPath.row]
        cell.nameLabel.text = product.actualPrice
        cell.imageView.image = product.image
        cell.previousPriceLaabel.text = product.previousPrice
        cell.productDescribtion.text = product.names
        cell.discount.text = product.decount
        
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
