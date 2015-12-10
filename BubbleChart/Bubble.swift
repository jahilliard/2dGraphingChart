//
//  Bubble.swift
//  BubbleChart
//
//  Created by Justin Hilliard on 11/30/15.
//  Copyright © 2015 Justin Hilliard. All rights reserved.
//

let π:CGFloat = CGFloat(M_PI)

import UIKit

class Bubble: NSObject {
    
    var counterColor: UIColor = UIColor.orangeColor()
    
    var center: CGPoint?
    var radius: CGFloat
    let startAngle = CGFloat(0)
    let endAngle = CGFloat(2 * M_PI)
    var title: String
    var label: UILabel = UILabel()
    var quantity: Int
    var percent: Int?
    
    
    init(radius: CGFloat, title: String, quantity: Int, percent: Int) {
        self.radius = radius
        self.title = title
        self.title.replaceRange(self.title.startIndex...self.title.startIndex, with: String(self.title[self.title.startIndex]).capitalizedString)
        self.quantity = quantity
        self.percent = percent
    }
    
    func makeLabel(){
        self.label.center = self.center!
        self.label = UILabel(frame: CGRectMake(self.center!.x-self.radius, self.center!.y-self.radius, self.radius*1.8, self.radius*1.8))
        self.label.text = self.title
        self.label.adjustsFontSizeToFitWidth = true
        self.label.textAlignment = .Center
    }
    
    func setCenter(middle: CGPoint){
        self.center = middle
        self.makeLabel()
    }
    
    func writePath(){
        setColor()
        makeLabel()
        let path = UIBezierPath(arcCenter: self.center!,
            radius: self.radius,
            startAngle: self.startAngle,
            endAngle: self.endAngle,
            clockwise: true)
        counterColor.setFill()
        path.fill()
    }
    
    private func setColor(){
        let red = CGFloat(arc4random_uniform(255) + 1)
        let green = CGFloat(arc4random_uniform(255) + 1)
        let blue = CGFloat(arc4random_uniform(255) + 1)
        counterColor = UIColor(red:red/255.0, green:green/255.0, blue:blue/255.0, alpha:1)
    }

}
