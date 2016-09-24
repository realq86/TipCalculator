//
//  ViewController.swift
//  TipCalculator
//
//  Created by Developer on 9/21/16.
//  Copyright © 2016 Developer. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {

    
    @IBOutlet weak var billLabel: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLevelSegmentControll: UISegmentedControl!
    @IBOutlet weak var tipShadeAlpha: UIView!
    @IBOutlet weak var totalShadeAlpha: UIView!
    
    let tipAmountArray = [0.15, 0.20, 0.25]
    let tipDecimalArray = [".15", ".2", ".25"]
    var tipValue = 0.00
    var totalValue = 0.00
    let decimalHandler = NSDecimalNumberHandler(roundingMode: .up, scale: 2, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: true)
    let currencyFormatter = NumberFormatter()
    
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //This can be moved to viewWillAppear if it is desired for the keyboard to pop up even on returning from Settings.
        self.billLabel.becomeFirstResponder()

        print("viewDidLoad")
        
        //Lead with Tips and Total alpha setting at 10%
        self.tipShadeAlpha.alpha = 0.1;
        self.totalShadeAlpha.alpha = 0.1;
        
        self.billLabel.text = "0.00"
        self.tipLabel.text = "0.00"
        self.totalLabel.text = "0.00"

    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
        self.loadDefualtSettings()
        self.updateAllFields()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadDefualtSettings() {
        let userDefualts = UserDefaults.standard
        
        let defaultLevel = userDefualts.integer(forKey: "Defualt_Tip_Level")
        self.setCurrentTipLevel(defaultLevel)
        
        self.currencyFormatter.numberStyle = .currency
    }


/*       View action code   */
    @IBAction func touchOutsideTextField(_ sender: AnyObject) {
        print("Touch outside textfield")
        
        self.view.endEditing(true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func editingDidEnd(_ sender: AnyObject) {
        self.updateAllFields()
        
        //Return alpha values of tips and total label back to 1.
        weak var weakSelf = self
        UIView.animate(withDuration: 0.5) {
            var strongSelf = weakSelf
            strongSelf?.tipShadeAlpha.alpha = 1
            strongSelf?.totalShadeAlpha.alpha = 1
        }
    }
    
    @IBAction func editingDidBegin(_ sender: AnyObject) {
        
        //Clear labels when editing begins.
        self.billLabel.text = ""
        self.tipLabel.text = ""
        self.totalLabel.text = ""
        self.tipShadeAlpha.alpha = 0.1;
        self.totalShadeAlpha.alpha = 0.1;
    }
    
    
/*       View manipulation code   */
    
    func changeTipToValue(_ value:Double) {
        print("Tip = \(value)")
        
        self.tipLabel.text = String(format: "$%.2f", value)
    }
    func changeTipToDecimal(_ tipDecimal:NSDecimalNumber) {
        self.tipLabel.text = currencyFormatter.string(from: tipDecimal)!
    }
    
    func changeTotalToValue(_ value:Double) {
        print("Total = \(value)")
        self.totalLabel.text = String(format: "$%.2f", value)
    }
    func changeTotalToDecimal(_ totalDecimal:NSDecimalNumber) {
        self.totalLabel.text = currencyFormatter.string(from: totalDecimal)!
    }
    
    func currentTipLevel()->Double {
        return self.tipAmountArray[self.tipLevelSegmentControll.selectedSegmentIndex]
    }
    
    func setCurrentTipLevel(_ level:Int) {
        self.tipLevelSegmentControll.selectedSegmentIndex = level
    }
    
    
/*       Math calculation code can be extracted to other class if needed   */
    
    func updateAllFields() {

        var billString:String
        if self.billLabel.text == "" {
            billString = "0.00"
        }
        else {
            billString = self.billLabel.text!
        }
        let costDecimal = NSDecimalNumber(string: billString)
        let tipDecimal = self.calculateNewTipDecimal(costDecimal)
        self.changeTipToDecimal(tipDecimal)
        
        let total = self.calculateNewTotalDecimal(costDecimal, tipDecimal)
        self.changeTotalToDecimal(total)
    }
    
    func caculateNewTipValue(_ costDouble:Double) ->Double {
        let tip = costDouble * self.currentTipLevel()
        return tip
    }
    
    func calculateNewTipDecimal(_ decimal:NSDecimalNumber) ->NSDecimalNumber {
        let tipLevel = self.tipDecimalArray[self.tipLevelSegmentControll.selectedSegmentIndex]
        let tipLevelDecimal = NSDecimalNumber(string: tipLevel)
        print(tipLevelDecimal)
        print(decimal)
        let tip = decimal.multiplying(by: tipLevelDecimal, withBehavior: self.decimalHandler)
        return tip
    }
    
    func calculateNewTotalValue(_ costDouble:Double, _ tipDouble:Double) ->Double {
        let total = costDouble + tipDouble
        return total
    }
    
    func calculateNewTotalDecimal(_ costDecimal:NSDecimalNumber, _ tipDecimal:NSDecimalNumber)->NSDecimalNumber {
        return costDecimal.adding(tipDecimal)
    }
    

}

