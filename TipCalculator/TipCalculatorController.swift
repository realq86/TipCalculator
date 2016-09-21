//
//  ViewController.swift
//  TipCalculator
//
//  Created by Developer on 9/21/16.
//  Copyright © 2016 Developer. All rights reserved.
//

import UIKit

class TipCalculatorController: UIViewController {

    
    @IBOutlet weak var billLabel: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLevelSegmentControll: UISegmentedControl!
    
    let tipAmountArray = [0.15, 0.20, 0.25]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("test")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func touchOutsideTextField(_ sender: AnyObject) {
        print("Touch outside textfield")
        
        self.view.endEditing(true)
        
    }
    
    @IBAction func editingDidEnd(_ sender: AnyObject) {
        
        print("Bill = %@", billLabel.text)
        let costDouble = Double(self.billLabel.text!) ?? 0
        let tip = costDouble * self.currentTipLevel()
        self.changeTipToValue(tip)

        let total = costDouble + tip
        self.changeTotalToValue(total)
    }
    
    @IBAction func segmentControlValueChanged(_ sender: AnyObject) {
        print("Value Changed to %d", self.tipLevelSegmentControll.selectedSegmentIndex)
    }
    func changeTipToValue(_ value:Double) {
        print("Tip = \(value)")
        self.tipLabel.text = String(format: "$%.2f", value)
    }
    
    func changeTotalToValue(_ value:Double) {
        print("Total = \(value)")
        self.totalLabel.text = String(format: "$%.2f", value)
    }
    
    func currentTipLevel()->Double {
        return self.tipAmountArray[self.tipLevelSegmentControll.selectedSegmentIndex]
    }
}
