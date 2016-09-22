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
    
    let tipAmountArray = [0.15, 0.20, 0.25]
    
    var tipValue = 0.00
    var totalValue = 0.00
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
        self.loadDefualtSettings()
        self.updateAllFields()
        self.billLabel.becomeFirstResponder()
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
    }


/*       View action code   */
    @IBAction func touchOutsideTextField(_ sender: AnyObject) {
        print("Touch outside textfield")
        
        self.view.endEditing(true)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction func editingDidEnd(_ sender: AnyObject) {
        self.updateAllFields()
    }
    
/*       View manipulation code   */
    
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
    
    func setCurrentTipLevel(_ level:Int) {
        self.tipLevelSegmentControll.selectedSegmentIndex = level
    }
    
    
/*       Math calculation code can be extracted to other class if needed   */
    
    func updateAllFields() {
        let costDouble = Double(self.billLabel.text!) ?? 0
        
        let tip = self.caculateNewTipValue(costDouble)
        self.changeTipToValue(tip)
        
        let total = self.calculateNewTotalValue(costDouble: costDouble, tipDouble: tip)
        self.changeTotalToValue(total)
    }
    
    func caculateNewTipValue(_ costDouble:Double) ->Double {
        let tip = costDouble * self.currentTipLevel()
        return tip
    }
    
    func calculateNewTotalValue(costDouble:Double, tipDouble:Double) ->Double {
        let total = costDouble + tipDouble
        return total
    }
    

}

