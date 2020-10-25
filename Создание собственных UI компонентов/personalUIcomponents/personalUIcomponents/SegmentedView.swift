//
//  SegmentedView.swift
//  personalUIcomponents
//
//  Created by Даниил Алексеев on 25.10.2020.
//

import UIKit



protocol SegmentedViewDelegate: NSObjectProtocol {
    func segmentedViewIndex(_ segmentedView: SegmentedView, labelText: String)
}
class SegmentedView: UIView {
    
  
    
   

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBInspectable var segmentedControlColor: UIColor = UIColor.darkGray
    @IBInspectable var segmentTitle1: String = "Первый"
    @IBInspectable var segmentTitle2: String = "Второй"
    @IBInspectable var segmentTintColor: UIColor = UIColor.systemTeal
    
    
    @IBOutlet weak var label: UILabel!
    
    weak var delegate: SegmentedViewDelegate?
    
    @IBAction func indexChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex
            {
            case 0:
                delegate?.segmentedViewIndex(self, labelText: "Первый")
            case 1:
                delegate?.segmentedViewIndex(self, labelText: "Второй")
            default:
                break
            
        }
    }
    
    
    var isSetuped = false
    
    override func layoutSubviews() {
   
        segmentedControl.backgroundColor = segmentedControlColor
        segmentedControl.setTitle(segmentTitle1, forSegmentAt: 0)
        segmentedControl.setTitle(segmentTitle2, forSegmentAt: 1)
        segmentedControl.selectedSegmentTintColor = segmentTintColor
       
        if isSetuped { return }
        isSetuped = true
    }
    
    static func loadFromNIB() -> SegmentedView{
        let nib = UINib(nibName: "SegmentedView", bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as! SegmentedView
    }
    
    
    
    
}
