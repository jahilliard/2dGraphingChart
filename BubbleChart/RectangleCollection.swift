//
//  RectangleCollection.swift
//  BubbleChart
//
//  Created by Justin Hilliard on 12/8/15.
//  Copyright © 2015 Justin Hilliard. All rights reserved.
//

import UIKit

class RectangleCollection: NSObject {
    var rectArr: Array<Rectangle> = []
    var rectLabelArr: Array<UILabel> = []
    
    func writeRectangles(){
        var top = CGFloat(0)
        for rect in rectArr {
            rect.writeRect(top)
            top = rect.height + top
        }
    }
    
    func setLabels() -> Array<UILabel>{
        for rect in rectArr {
            rectLabelArr.append(rect.label)
        }
        return self.rectLabelArr
    }
}
