//
//  Rectangle.swift
//  BubbleChart
//
//  Created by Justin Hilliard on 12/8/15.
//  Copyright © 2015 Justin Hilliard. All rights reserved.
//

import UIKit

class Rectangle: NSObject {
    var counterColor: UIColor = UIColor.orangeColor()
    
    var top: CGFloat?
    var height: CGFloat
    var title: String
    var label: UILabel = UILabel()
    var labelCenter: CGFloat?
    var quantity: Int
    var percent: Int
    
    var boundsWidth: CGFloat
    
    
    init(height: CGFloat, title: String, quantity: Int, percent: Int, boundsWidth: CGFloat){
        self.height = height
        self.title = title
        self.quantity = quantity
        self.percent = percent
        self.boundsWidth = boundsWidth
    }
    
    func writeRect(top: CGFloat){
        self.top = top
        setColor()
        makeLabel()
        let path = UIBezierPath(rect: CGRect(x: 0, y: top, width: boundsWidth, height: height))
        counterColor.setFill()
        path.fill()
    }
    
    func makeLabel(){
        let x = (self.boundsWidth/2)
        let y = (self.top! + (self.height/2))
        self.label.center = CGPoint(x: x, y: y)
        self.label = UILabel(frame: CGRectMake(0, self.top!, boundsWidth, self.height))
        self.label.text = self.title
        self.label.adjustsFontSizeToFitWidth = true
        self.label.textAlignment = .Center
    }
    
//    func setLabelCenter(center: CGFloat){
//        self.labelCenter = center
//    }
    
    private func setColor(){
        let red = CGFloat(arc4random_uniform(255) + 1)
        let green = CGFloat(arc4random_uniform(255) + 1)
        let blue = CGFloat(arc4random_uniform(255) + 1)
        counterColor = UIColor(red:red/255.0, green:green/255.0, blue:blue/255.0, alpha:1)
    }

}
