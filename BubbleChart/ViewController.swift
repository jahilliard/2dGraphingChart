//
//  ViewController.swift
//  BubbleChart
//
//  Created by Justin Hilliard on 11/30/15.
//  Copyright © 2015 Justin Hilliard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var bubbleTest: UILabel!
    @IBOutlet weak var rectTest: UILabel!
    @IBOutlet weak var bubLargestValue: UITextField!
    @IBOutlet weak var bubSecVal: UITextField!
    @IBOutlet weak var bubThirdVal: UITextField!
    @IBOutlet weak var rectLargestVal: UITextField!
    @IBOutlet weak var rectSecondVal: UITextField!
    @IBOutlet weak var rectThirdVal: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        bubbleTest.text = "Enter Bubble Ratios"
        rectTest.text = "Enter Rectangle Ratios"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

