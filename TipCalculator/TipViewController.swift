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
    @IBOutlet weak var tipShade: UIView!
    @IBOutlet weak var totalShade: UIView!
    @IBOutlet weak var billShade: UIView!
    @IBOutlet weak var segmentShade: UIView!
    
    let tipAmountArray = [0.15, 0.20, 0.25]
    let tipDecimalArray = [".15", ".2", ".25"]
    var tipValue = 0.00
    var totalValue = 0.00
    let decimalHandler = NSDecimalNumberHandler(roundingMode: .up, scale: 2, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: true)
    let currencyFormatter = NumberFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //This can be moved to viewWillAppear if it is desired for the keyboard to pop up even on returning from Settings.

        print("viewDidLoad")
        
        self.setTheme()
        
        //Lead with Tips and Total alpha setting at 10%

        
        self.tipLabel.text = "0.00"
        self.totalLabel.text = "0.00"

    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
        self.loadDefualtSettings()
        self.updateAllFields()
        self.updateViews()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.saveBillAmount()
        print("view will disappear \(self.billLabel.text)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
/*      Setting default setting and access to NSUserDefaults    */
    func loadDefualtSettings() {
        let userDefualts = UserDefaults.standard
        
        let defaultLevel = userDefualts.integer(forKey: "Defualt_Tip_Level")
        self.setCurrentTipLevel(defaultLevel)
        
        let lastBill = userDefualts.string(forKey: "Last_Bill_Amount")
        
        let lastDate = userDefualts.object(forKey: "Last_Bill_Time") as? NSDate
        print("last date is \(lastDate), currentDate is \(Date())")
        
        let moreThanTen = (lastDate != nil) ? self.nowIsMoreThanTenMinFrom(date: lastDate!): false
        
        if lastBill == "" || lastBill == nil || moreThanTen {
            self.billLabel.text = "0.00"
            self.billLabel.becomeFirstResponder()
        }
        else {
            self.billLabel.text = lastBill
        }
        
        self.currencyFormatter.numberStyle = .currency
    }
    
    func saveBillAmount() {
        let userDefualts = UserDefaults.standard
        userDefualts.set(self.billLabel.text, forKey: "Last_Bill_Amount")
        print("save date \(NSDate())")
        userDefualts.set(NSDate(), forKey: "Last_Bill_Time")
    }



/*       View action code   */
    
    func setTheme() {
        self.tipShade.alpha = 0.1;
        self.totalShade.alpha = 0.1;
        self.billShade.backgroundColor = UIColor(colorLiteralRed: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        self.tipShade.backgroundColor = UIColor(colorLiteralRed: 76/255, green: 76/255, blue: 76/255, alpha: 1)
        self.totalShade.backgroundColor = UIColor(colorLiteralRed: 76/255, green: 76/255, blue: 76/255, alpha: 1)
        self.segmentShade.backgroundColor = UIColor(colorLiteralRed: 102/255, green: 102/255, blue: 102/255, alpha: 1)
    }
    
    @IBAction func touchOutsideTextField(_ sender: AnyObject) {
        print("Touch outside textfield")
        
        self.view.endEditing(true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func editingDidEnd(_ sender: AnyObject) {
        self.updateAllFields()
        
        //Return alpha values of tips and total label back to 1.
        self.updateViews()
    }
    
    @IBAction func editingDidBegin(_ sender: AnyObject) {
        
        self.fadeViews()
    }
    
    func updateViews() {
        weak var weakSelf = self

        UIView.animate(withDuration: 0.5) {
            let strongSelf = weakSelf
            strongSelf?.tipShade.alpha = 1
            strongSelf?.totalShade.alpha = 1
        }
    }
    
    func fadeViews() {
        //Clear labels when editing begins.
        self.billLabel.text = ""
        self.tipLabel.text = ""
        self.totalLabel.text = ""
        self.tipShade.alpha = 0.1;
        self.totalShade.alpha = 0.1;
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
    
/*         Time calculation Code   */
    
    func nowIsMoreThanTenMinFrom(date:NSDate) -> Bool {
        let tenMin = TimeInterval(60 * 10)
        let tenMinLater = date.addingTimeInterval(tenMin)
        
        let now = NSDate()
        if now.compare(tenMinLater as Date) == ComparisonResult.orderedAscending {
            //now is before date, aka now is within 10 min of last save
            return false
        }
        else if now.compare(tenMinLater as Date) == ComparisonResult.orderedDescending {
            //now is after date, aka now is more than 10 min of last save
            return true
        }
        else {
            //Equal rare case of exactly 10 min
            return true
        }
    }


}

