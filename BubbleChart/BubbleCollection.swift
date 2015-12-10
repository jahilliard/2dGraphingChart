//
//  BubbleCollection.swift
//  BubbleChart
//
//  Created by Justin Hilliard on 12/8/15.
//  Copyright © 2015 Justin Hilliard. All rights reserved.
//

import UIKit

class BubbleCollection: NSObject {
    var bubbleArr: Array<Bubble> = []
    var bubLabelArr: Array<UILabel> = []
//    var previousRadius: CGFloat = 0
//    var previousCenter: CGPoint = CGPoint(x: 0, y: 0)
    
    
    func calculateCenterOfCircles(height: CGFloat, width: CGFloat){
        let floodFill: FloodFill = FloodFill(height: height, width: width)
        var bubbleNum = 1
        var slopFactor = 0.4
        var oneDiameter: CGFloat?
        var oneRadius: CGFloat?
            for bubble in self.bubbleArr{
                let tempRadius = CGFloat(1 - slopFactor) * bubble.radius
                if(bubbleNum == 1){
                    bubble.radius = tempRadius
                    bubble.center = CGPoint(x: tempRadius, y: tempRadius)
                    oneDiameter = tempRadius*2
                    oneRadius = tempRadius
                    floodFill.fillBoxes( CGPoint(x: 0, y: 0), lowerRight: CGPoint(x: bubble.center!.x+tempRadius, y: bubble.center!.y+tempRadius))
                } else if ( bubbleNum == 2 ){
                    bubble.radius = tempRadius
                    if ( (oneDiameter! + tempRadius*2) <= width ) {
                        bubble.center = CGPoint(x: oneDiameter! + tempRadius, y: tempRadius)
                    } else if ((oneDiameter! + tempRadius*2) <= height){
                        bubble.center = CGPoint(x: tempRadius, y: oneDiameter! + tempRadius)
                    } else {
                        let addToRadius = sqrt(pow(oneRadius!, 2) + pow(oneRadius!, 2)) 
                        bubble.center = CGPoint(x: addToRadius + tempRadius, y: addToRadius + tempRadius)
                    }
                    floodFill.fillBoxes( CGPoint(x: bubble.center!.x-tempRadius, y: bubble.center!.y-tempRadius), lowerRight: CGPoint(x: bubble.center!.x+tempRadius, y: bubble.center!.y+tempRadius))
                } else {
                    bubble.radius = tempRadius
                    var x = CGFloat(arc4random_uniform(UInt32(floodFill.constraint - (tempRadius*2))))
                    x = x + tempRadius
                    var y = CGFloat(arc4random_uniform(UInt32(floodFill.constraint - (tempRadius*2))))
                    y = y + tempRadius
                    bubble.center = CGPoint(x: x, y: y)
                    while (floodFill.checkIfBoxLocationIsOpen(CGPoint(x: bubble.center!.x-tempRadius, y: bubble.center!.y-tempRadius), lowerRight: CGPoint(x: bubble.center!.x+tempRadius, y: bubble.center!.y+tempRadius)) == false) {
                        x = CGFloat(arc4random_uniform(UInt32(floodFill.constraint - (tempRadius*2))))
                        x = x + tempRadius
                        y = CGFloat(arc4random_uniform(UInt32(floodFill.constraint - (tempRadius*2))))
                        y = y + tempRadius
                        bubble.center = CGPoint(x: x, y: y)
                    }
                }
                bubbleNum++
            }
    }
    
    func writeCircleToUI(){
        for bubble in bubbleArr {
            bubble.writePath()
        }
    }
    
    func setLabels() -> Array<UILabel>{
        for bub in bubbleArr {
            bubLabelArr.append(bub.label)
        }
        return self.bubLabelArr
    }

}
