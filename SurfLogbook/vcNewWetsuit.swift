//
//  vcNewWetsuit.swift
//  SurfLogbook
//
//  Created by Sven Weiss on 02.09.15.
//  Copyright © 2015 W&K Druckluftanlagenbau GmbH. All rights reserved.
//

import UIKit


class vcNewWetsuit: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UINavigationControllerDelegate {
    
    
    var wetsuitName : String!
    var manufacturer : String!
    var wetsuitThickness : String!

    @IBOutlet weak var manufacturerTextField: UITextField!
    @IBOutlet weak var wetsuitNameTextField: UITextField!
    @IBOutlet weak var thicknessTextField: UITextField!
    let thicknessPickerView = UIPickerView()
    let thicknessOptions = WetsuitThickness.allValues
    
    @IBOutlet weak var saveButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()
        thicknessPickerView.delegate = self
        thicknessTextField.inputView = thicknessPickerView

        
        if let wetsuitName = wetsuitName {
            wetsuitNameTextField.text = wetsuitName
        }
        if let manufacturer = manufacturer {
            manufacturerTextField.text = manufacturer
        }
        if let wetsuitThickness = wetsuitThickness {
            thicknessTextField.text = wetsuitThickness
        }
        
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
    
    
    // MARK: - Navigation
    
    @IBAction func calcel(sender: UIBarButtonItem) {
        let isPresentingInAddWetsuitMode = presentingViewController is UINavigationController
        
        if isPresentingInAddWetsuitMode {
            dismissViewControllerAnimated(true, completion: nil)
        }else {
            navigationController!.popViewControllerAnimated(true)
        }
    }

    // This method lets you configure a view controller before it's presented.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if saveButton === sender {
            manufacturer = manufacturerTextField.text ?? ""
            wetsuitName = wetsuitNameTextField.text ?? ""
            wetsuitThickness = thicknessTextField.text ?? ""
        }
    }
    
    


}
