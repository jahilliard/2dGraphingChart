//
//  FloodFill.swift
//  BubbleChart
//
//  Created by Justin Hilliard on 12/9/15.
//  Copyright © 2015 Justin Hilliard. All rights reserved.
//

import UIKit

var whatIsConstUL: Array<CGPoint> = []
var whatIsConstLR: Array<CGPoint> = []

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
    
    func fillBoxes(upperLeft: CGPoint, lowerRight: CGPoint){print("Called")
        let xLowR = lowerRight.x
        let yLowR = lowerRight.y
        let xUpL = upperLeft.x
        let yUpL = upperLeft.y
        let numOfRowsFromBottom = Int(yUpL/boxSize)
        let numOfColsFromSide = Int(yUpL/boxSize)
        var startPositionInArr = numOfColsFromSide + (numOfRowsFromBottom*granularity) - 1
        let rowAmountInc = Int(( yLowR - yUpL)/boxSize)
        let colAmountInc = Int((xLowR - xUpL)/boxSize)
        if (numOfRowsFromBottom == 0 || numOfColsFromSide==0){
            startPositionInArr = 0
        }
        let boxesToBlock = rowAmountInc * colAmountInc
        var currLocation = startPositionInArr
        var currColCount = 0
        for _ in 0...boxesToBlock-1{
            self.isBoxesFilled[currLocation] = true
            whatIsConstUL.append(upperLeft)
            whatIsConstLR.append(lowerRight)
            currColCount++
            if currColCount == colAmountInc-1 {
                currLocation = currLocation+granularity-currColCount
                currColCount=0
            }
        }
    }
    
    func checkIfBoxLocationIsOpen (upperLeft: CGPoint, lowerRight: CGPoint) -> Bool{
        let xLowR = lowerRight.x
        let yLowR = lowerRight.y
        let xUpL = upperLeft.x
        let yUpL = upperLeft.y
        let numOfRowsFromBottom = Int(yUpL/boxSize)
        let numOfColsFromSide = Int(yUpL/boxSize)
        var startPositionInArr = numOfColsFromSide + (numOfRowsFromBottom*granularity) - 1
        let rowAmountInc = Int(( yLowR - yUpL)/boxSize)
        let colAmountInc = Int((xLowR - xUpL)/boxSize)
        if (numOfRowsFromBottom == 0 || numOfColsFromSide==0){
            startPositionInArr = 0
        }
        let boxesToBlock = rowAmountInc * colAmountInc
        var currLocation = startPositionInArr
        var currColCount = 0
        for _ in 0...boxesToBlock-1{
            if self.isBoxesFilled[currLocation] == true {
                print( "THIS FAILED \(xUpL), \(yUpL), \(xLowR), \(yLowR) ")
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
