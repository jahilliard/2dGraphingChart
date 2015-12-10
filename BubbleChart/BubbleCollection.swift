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
//    var previousRadius: CGFloat = 0
//    var previousCenter: CGPoint = CGPoint(x: 0, y: 0)
    
    
    func calculateCenterOfCircles(height: CGFloat, width: CGFloat){
        let floodFill: FloodFill = FloodFill(height: height, width: width)
        var bubbleNum = 1
        var slopFactor = 0.4
        var oneDiameter: CGFloat?
//        while slopFactor >= 0.1 {
            for bubble in self.bubbleArr{
                let tempRadius = CGFloat(1 - slopFactor) * bubble.radius
                if(bubbleNum == 1){
                    bubble.radius = tempRadius
                    bubble.center = CGPoint(x: tempRadius, y: tempRadius)
                    oneDiameter = tempRadius*2
                    floodFill.fillBoxes( CGPoint(x: bubble.center!.x+tempRadius, y: bubble.center!.y+tempRadius), lowerLeft: CGPoint(x: 0,y: 0))
                } else if ( bubbleNum == 2 ){
                    bubble.radius = tempRadius
                    if ( (oneDiameter! + tempRadius*2) <= width ) {
                        bubble.center = CGPoint(x: oneDiameter! + tempRadius, y: tempRadius)
                    } else if ((oneDiameter! + tempRadius*2) <= height){
                        bubble.center = CGPoint(x: tempRadius, y: oneDiameter! + tempRadius)
                    } else {
                        bubble.center = CGPoint(x: oneDiameter! + tempRadius, y: oneDiameter! + tempRadius)
                    }
                    floodFill.fillBoxes( CGPoint(x: bubble.center!.x+tempRadius, y: bubble.center!.y+tempRadius), lowerLeft: CGPoint(x: bubble.center!.x-tempRadius, y: bubble.center!.y-tempRadius))
                } else {
                    bubble.center = CGPoint(x: CGFloat(arc4random_uniform(UInt32(floodFill.constraint - tempRadius))) , y: CGFloat(arc4random_uniform(UInt32(floodFill.constraint - tempRadius))))
                    while (floodFill.checkIfBoxLocationIsOpen(CGPoint(x: bubble.center!.x+tempRadius, y: bubble.center!.y+tempRadius), lowerLeft: CGPoint(x: bubble.center!.x-tempRadius, y: bubble.center!.y-tempRadius)) == false) {
                            bubble.center = CGPoint(x: CGFloat(arc4random_uniform(UInt32(floodFill.constraint - tempRadius))) , y: CGFloat(arc4random_uniform(UInt32(floodFill.constraint - tempRadius))))
                    }
                }
                bubbleNum++
            }
//            slopFactor = slopFactor - 0.1;
//            bubbleNum = 0
//        }
    }
    
    func writeCircleToUI(){
        for bubble in bubbleArr {
            bubble.writePath()
        }
    }

}
