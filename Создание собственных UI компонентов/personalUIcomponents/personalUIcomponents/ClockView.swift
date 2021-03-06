//
//  ClockView.swift
//  personalUIcomponents
//
//  Created by Даниил Алексеев on 24.10.2020.
//

import UIKit

@IBDesignable
 class ClockView: UIView {
    
    var markerSize: CGFloat = 4
    var markerLength: CGFloat = 12
    var markerColor: UIColor = UIColor.blue
    
    @IBInspectable var hourLineOffset: CGFloat = 50
    @IBInspectable var hourLineSize: CGFloat = 7
    @IBInspectable var hourLineColor: UIColor = UIColor.green
    var hours: CGFloat = 6 {
        didSet { updateHours() }
    }
    
    @IBInspectable var secondsLineOffset: CGFloat = 15
    @IBInspectable var secondsLineSize: CGFloat = 2
    @IBInspectable var secondsLineColor: UIColor = UIColor.red
    var seconds: CGFloat = 15 {
        didSet { updateSeconds() }
    }
    
    @IBInspectable var minutsLineOffset: CGFloat = 30
    @IBInspectable var minutsLineSize: CGFloat = 5
    @IBInspectable var minutsLineColor: UIColor = UIColor.purple
    var minuts: CGFloat = 5 {
        didSet { updateMinuts() }
    }
    
    private let topMarker = UIView()
    private let leftMarker = UIView()
    private let rightMarker = UIView()
    private let bottomMarker = UIView()
    
    private let roundedView = UIView()
    var roundedViewColor = UIColor.yellow
    
    private let hourLine = UIView()
    private let secondsLine = UIView()
    private let minutsLine = UIView()
    
   //ИНИЦИАЛЕЗИРУЕМ VIEW
    override init(frame: CGRect) {
        super.init(frame: frame)
       setUp()
    }
    
    required init?(coder aDecoder: NSCoder ) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    func setUp() {
        roundedView.backgroundColor = roundedViewColor
        minutsLine.backgroundColor =  minutsLineColor
        secondsLine.backgroundColor = secondsLineColor
        hourLine.backgroundColor = hourLineColor
        
        for v in [topMarker, leftMarker, rightMarker, bottomMarker]{
            v.backgroundColor = markerColor
        }
        
        for v in [topMarker, leftMarker, rightMarker, bottomMarker, hourLine, secondsLine, minutsLine, roundedView]{
            addSubview(v)
        }
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let w = frame.size.width
        let h = frame.size.height
    
        hourLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        hourLine.frame = CGRect(x: w / 2 - hourLineSize / 2, y: hourLineOffset, width: hourLineSize, height: h/2 - hourLineOffset)
       
        secondsLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        secondsLine.frame = CGRect(x: w / 2 - secondsLineSize / 2, y: secondsLineOffset, width: secondsLineSize, height: h/2 - secondsLineOffset)
        
        minutsLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        minutsLine.frame = CGRect(x: w / 2 - minutsLineSize / 2, y: minutsLineOffset, width: minutsLineSize, height: h/2 - minutsLineOffset)
    
        updateHours()
        updateSeconds()
        updateMinuts()
    
        topMarker.frame = CGRect(x: w / 2 - markerSize / 2, y: 0, width: markerSize, height: markerLength)
        leftMarker.frame = CGRect(x: 0, y: h / 2 - markerSize / 2, width: markerLength, height: markerSize)
        rightMarker.frame = CGRect(x: w - markerLength, y: h / 2 - markerSize / 2, width: markerLength, height: markerSize)
        bottomMarker.frame = CGRect(x: w / 2 - markerSize / 2, y: h - markerLength, width: markerSize, height: markerLength)
        
        roundedView.frame = CGRect(x: w / 2 - 8, y: h / 2 - 8, width: 16, height: 16)
        roundedView.layer.cornerRadius = 8
        
        layer.cornerRadius = frame.size.width / 2
    }
    
    func updateHours(){
        let angle = CGFloat.pi * 2 * (hours / CGFloat(12))
        hourLine.transform = CGAffineTransform(rotationAngle: angle)
    }
    
    func updateSeconds(){
        let angle = CGFloat.pi * 2 * (seconds / CGFloat(60))
        secondsLine.transform = CGAffineTransform(rotationAngle: angle)
    }
    
    func updateMinuts(){
        let angle = CGFloat.pi * 2 * (minuts / CGFloat(60))
        minutsLine.transform = CGAffineTransform(rotationAngle: angle)
    }
}
