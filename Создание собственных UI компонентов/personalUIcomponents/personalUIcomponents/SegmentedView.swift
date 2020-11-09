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

@IBDesignable
class SegmentedView: UIView {
    @IBOutlet weak var segmentView: UIView!
    
    @IBOutlet weak var animator: UIView!
    @IBOutlet weak var segmentBackground: UIView!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var label: UILabel!
    
    weak var delegate: SegmentedViewDelegate?
    
    @IBInspectable var firstButtonText: String = "Первый"
    @IBInspectable var secondButtonText: String = "Второй"
    @IBInspectable var firstButtonBackgroundColor: UIColor = .red
    @IBInspectable var secondButtonBackgroundColor: UIColor = .red
    @IBInspectable var segmentedViewBackgroundColor: UIColor = .green
    @IBInspectable var animatorViewBackgroundColor: UIColor = .darkGray
    
    override func layoutSubviews() {
        super.layoutSubviews()
        segmentBackground.layer.cornerRadius = 10
        firstButton.layer.cornerRadius = 5
        secondButton.layer.cornerRadius = 5
    }
    
    override init(frame: CGRect) {
            super.init(frame: frame)
    self.commonInit()
    }
    required init?(coder aDecoder: NSCoder) { 
            super.init(coder: aDecoder)
    self.commonInit()
    }
    private func commonInit() {
        firstButton?.setTitle(firstButtonText, for: .normal)
        secondButton?.setTitle(secondButtonText, for: .normal)
        firstButton?.backgroundColor = firstButtonBackgroundColor
        secondButton?.backgroundColor = secondButtonBackgroundColor
        segmentView?.backgroundColor = segmentedViewBackgroundColor
        animator?.backgroundColor = animatorViewBackgroundColor
    }
    
    @IBAction func action1() {
        delegate?.segmentedViewIndex(self, labelText: "Первый")
        UIView.animate(withDuration: 0.2){
        self.segmentBackground.frame.origin.x = 32
        }
    }
    
    @IBAction func action2() {
       delegate?.segmentedViewIndex(self, labelText: "Второй")
       UIView.animate(withDuration: 0.2){
       self.segmentBackground.frame.origin.x = 126
       }
    }

    static func loadFromNIB() -> SegmentedView{
        let nib = UINib(nibName: "SegmentedView", bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as! SegmentedView
    }
}
