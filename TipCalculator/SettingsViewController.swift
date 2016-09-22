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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadDefualtSettings()
        // Do any additional setup after loading the view.
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
