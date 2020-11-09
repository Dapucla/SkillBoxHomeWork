//
//  MyCustomButton.swift
//  personalUIcomponents
//
//  Created by Даниил Алексеев on 24.10.2020.
//

import UIKit

@IBDesignable
class MyCustomButton: UIButton {

    private let myButton = UIButton()
    @IBInspectable var myButtonWidth: CGFloat = 200
    var myButtonHeight: CGFloat = 80
    @IBInspectable var myButtonBorderColor: UIColor = UIColor.blue
    @IBInspectable var myButtonCornerRadius: CGFloat = 15
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       setUp()
    }
    
    required init?(coder aDecoder: NSCoder ) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    func setUp() {
        myButton.layer.borderWidth = 2
        myButton.layer.borderColor = myButtonBorderColor.cgColor
        myButton.setTitle("My Amazing Button", for: .normal)
        myButton.setTitleColor(.blue, for: .normal)
        addSubview(myButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let w = frame.size.width
        let h = frame.size.height
        
        myButton.frame = CGRect(x: w/2 - myButtonWidth/2 , y: h/2 - myButtonHeight/2 , width: myButtonWidth, height: myButtonHeight)
      
        myButton.layer.cornerRadius = myButtonCornerRadius
    }
}
