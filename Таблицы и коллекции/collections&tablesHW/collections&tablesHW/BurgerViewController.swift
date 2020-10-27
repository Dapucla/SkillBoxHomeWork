//
//  BurgerViewController.swift
//  collections&tablesHW
//
//  Created by Даниил Алексеев on 21.10.2020.
//

import UIKit

class BurgerViewController: UIViewController {
    @IBOutlet weak var contentView: UIView!
    

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var actionButton: UIButton!
    @IBOutlet weak var pageView: UIPageControl!
    
    @IBOutlet weak var menuButton: UIButton!
    
    @IBOutlet weak var orderButton: UIButton!
    
    let myArr = [UIImage(named: "burger1"),UIImage(named: "burger2"),UIImage(named: "burger3"),UIImage(named: "burger4"),UIImage(named: "burger5")]
    
    var currentIndex = 0
    var timer : Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.numberOfPages = myArr.count
        startTimer()
        
        
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
    func startTimer(){
    
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    
    @objc func timerAction(){
        
        let desiredScrollPosition = (currentIndex < myArr.count - 1) ? currentIndex + 1 : 0
        collectionView.scrollToItem(at: IndexPath(item: desiredScrollPosition, section: 0), at: .centeredHorizontally, animated: true)
    }

}

extension BurgerViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCell", for: indexPath) as! SliderCell
        
        cell.image = myArr[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        currentIndex = Int(scrollView.contentOffset.x / collectionView.frame.size.width)
        pageControl.currentPage = currentIndex
    }
}




