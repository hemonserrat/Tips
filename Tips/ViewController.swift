//
//  ViewController.swift
//  Tips
//  XCode 7.2 Swift 2.0
//  Created by Hernan Monserrat on 1/21/16.
//  Copyright © 2016 Hernan Monserrat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onEditingChanged(sender: AnyObject) {
        let tipPercentages = [0.18, 0.20, 0.22]
        let billAmount = Double(billField.text!) ?? 0.0
        let tip = billAmount  * tipPercentages[tipControl.selectedSegmentIndex]
        let total = billAmount + tip
        
        tipLabel.text = String(format: "$%.2f",tip)
        totalLabel.text = String(format: "$%.2f", total)

    }
    
    @IBAction func onValueChanged(sender: AnyObject) {
        onEditingChanged(sender)
    }

    @IBAction func onTap(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let intValue = defaults.integerForKey("tipPerDefault")
        
        tipControl.selectedSegmentIndex = intValue
    }
    
}

