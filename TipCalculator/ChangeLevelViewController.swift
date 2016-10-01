//
//  ChangeLevelViewController.swift
//  TipCalculator
//
//  Created by Developer on 9/30/16.
//  Copyright © 2016 Developer. All rights reserved.
//

import UIKit

class ChangeLevelViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tipLevelSegmentControll: UISegmentedControl!
    @IBOutlet weak var textField: UITextField!
    var tipAmountArray = [0.15,0.20,0.25]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.loadLevels()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.saveNewLevels()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func loadLevels() {
        //load default tip levels
        let userDefaults = UserDefaults.standard
        if let fetchedLevel = userDefaults.object(forKey: "Levels") {
            self.tipAmountArray = fetchedLevel as! [Double]
        }
        
        self.tipLevelSegmentControll.removeAllSegments()
        
        //Make strings from tipLevel's Double for segmentControl
        for (index, level) in self.tipAmountArray.enumerated() {
            let tipLevelInt = Int(level*100)
            let tipLevelString = "\(tipLevelInt)%"
            self.tipLevelSegmentControll.insertSegment(withTitle: tipLevelString, at: index, animated: false)
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let lastSelected = self.tipLevelSegmentControll.selectedSegmentIndex
        if textField.text != "" {
            self.tipLevelSegmentControll.setTitle("\(textField.text!)%", forSegmentAt: lastSelected)
            print("textField.text \(textField.text)")
            let newDouble = Double("0.\(textField.text!)")!
            self.tipAmountArray[lastSelected] = newDouble
            
            print(self.tipAmountArray)
        }
    }
    
    func saveNewLevels() {
        let userDefaults = UserDefaults.standard
        userDefaults.set(self.tipAmountArray, forKey: "Levels")
        let saved = userDefaults.object(forKey: "Levels") as! [Double]
        print(saved)

    }
    @IBAction func touchOnDone(_ sender: AnyObject) {
        self.view.endEditing(true)
        
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }

    @IBAction func tapOutside(_ sender: AnyObject) {
        
        self.view.endEditing(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
