//
//  FloodFill.swift
//  BubbleChart
//
//  Created by Justin Hilliard on 12/9/15.
//  Copyright © 2015 Justin Hilliard. All rights reserved.
//

import UIKit

class FloodFill {
    var height: CGFloat
    var width: CGFloat
    var boxSize: CGFloat
    var constraint: CGFloat
    var granularity: Int = 1000
    var isBoxesFilled: Array<Bool> = []
    
    init(height: CGFloat, width: CGFloat){
        self.height = height
        self.width = width
        if (height >= width) {
            boxSize = width/CGFloat(granularity)
            constraint = width
        } else {
            boxSize = height/CGFloat(granularity)
            constraint = height 
        }
        self.buildSetBox()
    }
    
    func buildSetBox(){
        for _ in 0...(granularity*granularity)-1{
            isBoxesFilled.append(false)
        }
    }
    
    func fillBoxes(upperRight: CGPoint, lowerLeft: CGPoint){
        let xUpR = upperRight.x
        let yUpR = upperRight.y
        let xLowL = lowerLeft.x
        let yLowL = lowerLeft.y
        let numOfRowsFromBottom = Int(yLowL/boxSize)
        let numOfColsFromSide = Int(xLowL/boxSize)
        var startPositionInArr = 0
        let rowAmountInc = Int(( yUpR - yLowL)/boxSize)
        let colAmountInc = Int((xUpR - xLowL)/boxSize)
        if (lowerLeft != CGPoint(x: 0,y: 0)){
            startPositionInArr = numOfColsFromSide + (numOfRowsFromBottom*10) - 1
        }
        let boxesToBlock = rowAmountInc * colAmountInc
        var currLocation = startPositionInArr
        var currColCount = 0
        for _ in 0...boxesToBlock-1{
            self.isBoxesFilled[currLocation] = true
            currColCount++
            if currColCount == colAmountInc-1 {
                currLocation = currLocation+granularity-currColCount
                currColCount=0
            }
        }
    }
    
    func checkIfBoxLocationIsOpen (upperRight: CGPoint, lowerLeft: CGPoint) -> Bool{
        print("Called")
        let xUpR = upperRight.x
        let yUpR = upperRight.y
        let xLowL = lowerLeft.x
        let yLowL = lowerLeft.y
        let numOfRowsFromBottom = Int(yLowL/boxSize)
        let numOfColsFromSide = Int(xLowL/boxSize)
        var startPositionInArr = 0
        let rowAmountInc = Int(( yUpR - yLowL)/boxSize)
        let colAmountInc = Int((xUpR - xLowL)/boxSize)
        if (lowerLeft != CGPoint(x: 0,y: 0)){
            startPositionInArr = numOfColsFromSide + (numOfRowsFromBottom*10) - 1
        }
        let boxesToBlock = rowAmountInc * colAmountInc
        var currLocation = startPositionInArr
        var currColCount = 0
        for _ in 0...boxesToBlock-1{
            if self.isBoxesFilled[currLocation] == true {
                return false
            }
            currColCount++
            if currColCount == colAmountInc-1 {
                currLocation = currLocation+granularity-currColCount
                currColCount=0
            }
        }
        return true
    }

}
