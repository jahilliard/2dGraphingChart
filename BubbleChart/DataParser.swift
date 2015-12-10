//
//  DataParser.swift
//  BubbleChart
//
//  Created by Justin Hilliard on 11/30/15.
//  Copyright © 2015 Justin Hilliard. All rights reserved.
//

import UIKit
import Darwin

let time = 55.3
let min = floor(time);
let sec = round((time - min) * 60.0)

class DataParser: NSObject {
    
    var catagories: Array<String>?
    var quantity: Array<Int>?
    var scale: Array<Int> = []
    var noOfObjs: Int = 0
    var type: String?
    
    init(catagories: Array<String>, quantity: Array<Int>, type: String) {
        if catagories.count == quantity.count {
            self.catagories = catagories
            self.quantity = quantity
            self.noOfObjs = catagories.count
            self.type = type
        } else {
            print("Catagory Array and Quatity Array not the same Size.  Error in Bubble Chart.")
        }
    }
    
    func getScale(completion: (() -> Void)){
        var total = 0
        var currPercent: Double
        if let quant = self.quantity {
            for num in quant {
                total += num
            }
            for num in quant {
                currPercent = Double(num)/Double(total)
                currPercent = round(currPercent*100)
                scale.append(Int(currPercent))
            }
            completion()
        } else {
            print("quantity array is empty")
        }
        
    }
    

}
