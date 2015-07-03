//
//  ViewController.swift
//  tipApp
//
//  Created by Dennis Gokman on 6/28/15.
//  Copyright (c) 2015 Dennis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var steakText: UITextField!
    
    @IBOutlet weak var potatoText: UITextField!
    
    @IBOutlet weak var milkText: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var taxLabel: UILabel!
    
    @IBOutlet weak var foodLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var steakQuantity: UILabel!
    
    @IBOutlet weak var potatoQuantity: UILabel!
    
    @IBOutlet weak var milkQuantity: UILabel!
    
    let serviceLevels = ["Poor", "Good", "Excellent"]
    let tax = 7
    var tip = 15
    
    enum ServiceLevel: Int {
        case Poor = 8
        case Good = 15
        case Excellent = 22
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return serviceLevels.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return serviceLevels[row]
        
    }
    
    func changeVariables() {
        var steakAmount = steakText.text.toInt()! * steakQuantity.text!.toInt()!
        var potatoAmount = potatoText.text!.toInt()! * potatoQuantity.text!.toInt()!
        var milkAmount = milkText.text!.toInt()! * milkQuantity.text!.toInt()!
        
        foodLabel.text = "\(steakAmount + potatoAmount + milkAmount)"
        tipLabel.text = toString(foodLabel.text!.toInt()! * tip/100)
        taxLabel.text! = toString(foodLabel.text!.toInt()! * tax/100)
        totalLabel.text! = toString(foodLabel.text!.toInt()! + taxLabel.text!.toInt()! + tipLabel.text!.toInt()!)
    }
    
    @IBOutlet weak var serviceLevel: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       steakText.text = "0"
       potatoText.text = "0"
       milkText.text = "0"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onSteakChange(sender: AnyObject) {
        changeVariables()
    }

    @IBAction func onPotatoEnd(sender: AnyObject) {
        changeVariables()
    }
    
    @IBAction func onMilkEnd(sender: AnyObject) {
        changeVariables()
    }
    
    @IBAction func steakAdd(sender: AnyObject) {
        steakQuantity.text! = toString(steakQuantity.text!.toInt()! + 1)
        changeVariables()
    }
    
    @IBAction func steakSub(sender: AnyObject) {
        steakQuantity.text! = toString(steakQuantity.text!.toInt()! - 1)
        changeVariables()
    }
    
    @IBAction func potatoAdd(sender: AnyObject) {
        potatoQuantity.text! = toString(potatoQuantity.text!.toInt()! + 1)
        changeVariables()
    }
    
    @IBAction func potatoSub(sender: AnyObject) {
        potatoQuantity.text! = toString(potatoQuantity.text!.toInt()! - 1)
        changeVariables()
    }
    
    @IBAction func milkAdd(sender: AnyObject) {
        milkQuantity.text! = toString(milkQuantity.text!.toInt()! + 1)
        changeVariables()
    }
    
    @IBAction func milkSub(sender: AnyObject) {
        milkQuantity.text! =
            toString(milkQuantity.text!.toInt()! - 1)
        changeVariables()
    }
    
    
}

