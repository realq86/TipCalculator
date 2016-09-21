//
//  ViewController.swift
//  TipCalculator
//
//  Created by Developer on 9/21/16.
//  Copyright © 2016 Developer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
            print("Tip = \(tip)")

            let total = costDouble + tip
            print("Total = \(total)")
        }
    }
}

