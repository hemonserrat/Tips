//
//  SettingsViewController.swift
//  Tips
//
//  Created by Hernan Monserrat on 1/24/16.
//  Copyright © 2016 Hernan Monserrat. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let intValue = defaults.integerForKey("tipPerDefault")
        
        tipControl.selectedSegmentIndex = intValue
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onOkButton(sender: AnyObject) {
        
        
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger( tipControl.selectedSegmentIndex, forKey: "tipPerDefault")
        defaults.synchronize()
        
        dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
