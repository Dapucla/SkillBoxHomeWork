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
    
    @IBOutlet weak var segmentBackground: UIView!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var label: UILabel!
    
    weak var delegate: SegmentedViewDelegate?
    
    @IBInspectable var firstButtonText: String = "Первый"
    @IBInspectable var secondButtonText: String = "Второй"
    @IBInspectable var segmentBackgroundColor: UIColor = .darkGray
    @IBInspectable var ButtonBackgroundColor: UIColor = .systemYellow

    override func layoutSubviews() {
        super.layoutSubviews()
        segmentBackground.layer.cornerRadius = 10
        firstButton.layer.cornerRadius = 5
        secondButton.layer.cornerRadius = 5
        secondButton.backgroundColor = .none
        firstButton.setTitle(firstButtonText, for: .normal)
        secondButton.setTitle(secondButtonText, for: .normal)
        segmentBackground.backgroundColor = segmentBackgroundColor
        firstButton.backgroundColor = ButtonBackgroundColor
        secondButton.backgroundColor = .none
    }

    @IBAction func firstButton(_ sender: Any) {
        delegate?.segmentedViewIndex(self, labelText: "Первый")
        UIView.animate(withDuration: 0.3){
            self.firstButton.backgroundColor = self.ButtonBackgroundColor
            self.secondButton.backgroundColor = .none
        }
    }
    
    @IBAction func secondButton(_ sender: Any) {
        delegate?.segmentedViewIndex(self, labelText: "Второй")
        UIView.animate(withDuration: 0.3){
            self.firstButton.backgroundColor = .none
            self.secondButton.backgroundColor = self.ButtonBackgroundColor
        }
    }
    
    static func loadFromNIB() -> SegmentedView{
        let nib = UINib(nibName: "SegmentedView", bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as! SegmentedView
    }
}
