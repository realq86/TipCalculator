//
//  ViewController.swift
//  TipCalculator
//
//  Created by Developer on 9/21/16.
//  Copyright © 2016 Developer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    
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
        
        if let costTextField = sender as? UITextField {

            print("Bill = %@", costTextField.text!)
            
            let costDouble = Double(costTextField.text!) ?? 0
            
            let tip = costDouble * 0.2
            self.changeTipToValue(tip)

            let total = costDouble + tip
            self.changeTotalToValue(total)
        }
    }
    
    func changeTipToValue(_ value:Double) {
        print("Tip = \(value)")
        self.tipLabel.text = String(format: "$%.2f", value)
    }
    
    func changeTotalToValue(_ value:Double) {
        print("Total = \(value)")
        self.totalLabel.text = String(format: "$%.2f", value)
    }
    
}

