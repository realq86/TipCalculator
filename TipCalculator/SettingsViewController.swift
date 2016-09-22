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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadDefualtSettings()
        // Do any additional setup after loading the view.
        self.secondPane.isHidden = true
        self.thirdPane.isHidden = true
//        self.fourthPane.isHidden = true
        self.fifthPane.isHidden = true
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
}
