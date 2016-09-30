//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Developer on 9/21/16.
//  Copyright © 2016 Developer. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipLevelSegmentControll: UISegmentedControl!
    
    @IBOutlet weak var instructionPane: UIView!
    @IBOutlet weak var segmentView: UIView!
    @IBOutlet weak var secondPane: UIView!
    @IBOutlet weak var thirdPane: UIView!
    @IBOutlet weak var fifthPane: UIView!
    
    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var brownButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadDefualtSettings()
        // Do any additional setup after loading the view.
        self.secondPane.isHidden = false
        self.thirdPane.isHidden = false
//        self.fourthPane.isHidden = true
        self.fifthPane.isHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadDefualtSettings() {
        let userDefualts = UserDefaults.standard
        let defaultLevel = userDefualts.integer(forKey: "Defualt_Tip_Level")
        self.tipLevelSegmentControll.selectedSegmentIndex = defaultLevel
    }
    
    @IBAction func tipLevelSegmentChanged(_ sender: AnyObject) {
        let tipLevel = self.tipLevelSegmentControll.selectedSegmentIndex
        let userDefualts = UserDefaults.standard
        userDefualts.set(tipLevel, forKey: "Defualt_Tip_Level")
    }
    
    
    @IBAction func touchOnBlack(_ sender: AnyObject) {
        let userDefaults = UserDefaults.standard
        
        let billColor = UIColor(colorLiteralRed: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        let billColorData = NSKeyedArchiver.archivedData(withRootObject: billColor)
        userDefaults.set(billColorData, forKey: "Color_A")
        
        let tipTotalColor = UIColor(colorLiteralRed: 76/255, green: 76/255, blue: 76/255, alpha: 1)
        let tipTotalColorData = NSKeyedArchiver.archivedData(withRootObject: tipTotalColor)
        userDefaults.set(tipTotalColorData, forKey: "Color_B")
        
        let segmentColor = UIColor(colorLiteralRed: 102/255, green: 102/255, blue: 102/255, alpha: 1)
        let segmentColorData = NSKeyedArchiver.archivedData(withRootObject: segmentColor)
        userDefaults.set(segmentColorData, forKey: "Color_C")
    }
    
    
    @IBAction func touchOnBrown(_ sender: AnyObject) {
        let userDefaults = UserDefaults.standard
        
        let billColor = UIColor(colorLiteralRed: 161/255, green: 113/255, blue: 57/255, alpha: 1)
        let billColorData = NSKeyedArchiver.archivedData(withRootObject: billColor)
        userDefaults.set(billColorData, forKey: "Color_A")
        
        let tipTotalColor = UIColor(colorLiteralRed: 126/255, green: 81/255, blue: 40/255, alpha: 1)
        let tipTotalColorData = NSKeyedArchiver.archivedData(withRootObject: tipTotalColor)
        userDefaults.set(tipTotalColorData, forKey: "Color_B")
        
        let segmentColor = UIColor(colorLiteralRed: 104/255, green: 100/255, blue: 88/255, alpha: 1)
        let segmentColorData = NSKeyedArchiver.archivedData(withRootObject: segmentColor)
        userDefaults.set(segmentColorData, forKey: "Color_C")
    }
    
    func updateTheme() {
        
        let userDefaults = UserDefaults.standard
        
        //Set Instruction Pane
        var colorA = UIColor(colorLiteralRed: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        if let colorAData = userDefaults.data(forKey: "Color_A") {
            colorA = (NSKeyedUnarchiver.unarchiveObject(with: colorAData) as? UIColor)!
        }
        self.instructionPane.backgroundColor = colorA
        
        
        //Second Pane
        var colorB = UIColor(colorLiteralRed: 76/255, green: 76/255, blue: 76/255, alpha: 1)
        if let colorBData = userDefaults.data(forKey: "Color_B") {
            colorB = (NSKeyedUnarchiver.unarchiveObject(with: colorBData) as? UIColor)!
        }
        self.secondPane.backgroundColor = colorB
        
        
        //Set segment shade
        var colorC = UIColor(colorLiteralRed: 102/255, green: 102/255, blue: 102/255, alpha: 1)
        if let colorCData = userDefaults.data(forKey: "Color_C") {
            colorC = (NSKeyedUnarchiver.unarchiveObject(with: colorCData) as? UIColor)!
        }
        self.segmentView.backgroundColor = colorC
    }
    
    
    
    
}
