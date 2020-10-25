//
//  SegmentedViewController.swift
//  personalUIcomponents
//
//  Created by Даниил Алексеев on 25.10.2020.
//

import UIKit

class SegmentedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let segmentedView = SegmentedView.loadFromNIB()
        view.addSubview(segmentedView)
        segmentedView.delegate = self

        
    }
    

 

}


extension SegmentedViewController: SegmentedViewDelegate{
    func segmentedViewIndex(_ segmentedView: SegmentedView, labelText: String) {
        segmentedView.label.text = labelText
    }
    
    
}
