//
//  vcNewWetsuit.swift
//  SurfLogbook
//
//  Created by Sven Weiss on 02.09.15.
//  Copyright © 2015 W&K Druckluftanlagenbau GmbH. All rights reserved.
//

import UIKit

class vcNewWetsuit: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var manufacturerTextField: UITextField!
    @IBOutlet weak var wetsuitNameTextField: UITextField!
    @IBOutlet weak var thicknessTextField: UITextField!
    let thicknessPickerView = UIPickerView()
    let thicknessOptions = Thickness.allValues
    
    
    @IBOutlet weak var saveButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        thicknessPickerView.delegate = self
        thicknessTextField.inputView = thicknessPickerView
        
    }
    
    
    /** handle picker view selections **/
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return thicknessOptions.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return thicknessOptions[row].simpleDescription()
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        thicknessTextField.text = thicknessOptions[row].simpleDescription()
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}
