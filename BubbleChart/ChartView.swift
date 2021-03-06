//
//  ChartView.swift
//  BubbleChart
//
//  Created by Justin Hilliard on 11/30/15.
//  Copyright © 2015 Justin Hilliard. All rights reserved.
//

import UIKit

class ChartView: UIView {
    
    var type: String = ""
    var data: DataParser = DataParser(catagories: ["TerriblePears", "otherApple", "Banana"], quantity: [50,30,25], type: "rect")
    var bubbleCollection: BubbleCollection = BubbleCollection()
    var rectCollection: RectangleCollection = RectangleCollection()

    override func drawRect(rect: CGRect) {
        data.getScale({
            self.buildObjArr()
            self.rectCollection.writeRectangles()
            self.wirteLabels(self.rectCollection.setLabels())
        })
    }
    
    func buildObjArr(){
        for index in 0...data.noOfObjs-1 {
            if let cata = data.catagories?[index], quant = data.quantity?[index]{
                let percent = data.scale[index]
                if data.type == "bubble" {
                    let weightedRadius = buildWeightedRadius(percent)
                    bubbleCollection.bubbleArr.append(Bubble(radius: weightedRadius, title: cata, quantity: quant, percent: percent))
                } else if data.type == "rect" {
                    let weightedheight = buildWeightedHieght(percent, boundHeight: bounds.height)
                    rectCollection.rectArr.append(Rectangle(height: weightedheight, title: cata, quantity: quant, percent: percent, boundsWidth: bounds.width))
                } else {
                    print("Please use 'rect' for rectangle graph and 'Bubble' for bubble chart")
                }
                
            }
        }
    }
    
    func buildWeightedRadius(percent: Int) -> CGFloat {
        //200 is so that the max radius is half of the most constricting bound
        let weightedRadius: CGFloat
        if bounds.width < bounds.height {
            weightedRadius = (bounds.width * CGFloat(percent))/CGFloat(100)
        } else {
            weightedRadius = (bounds.height * CGFloat(percent))/CGFloat(100)
        }
        return weightedRadius
    }
    
    func buildWeightedHieght(percent: Int, boundHeight: CGFloat) -> CGFloat {
        let weightedHieght: CGFloat
        weightedHieght = (boundHeight * CGFloat(percent))/CGFloat(100)
        return weightedHieght
    }
    
    func wirteLabels(labelArr: Array<UILabel>){
        for lab in labelArr {
            print("label in CV: \(lab.text)")
            self.addSubview(lab)
        }
    }
    
    func printFloodedArea(upperLeft: CGPoint, lowerRight: CGPoint){
        let xLowR = lowerRight.x
        let yLowR = lowerRight.y
        let xUpL = upperLeft.x
        let yUpL = upperLeft.y
        let path = UIBezierPath(rect: CGRect(x: xUpL, y: yUpL, width: xLowR-xUpL, height: yLowR-yUpL))
        UIColor.redColor().setFill()
        path.fill()
    }

}
