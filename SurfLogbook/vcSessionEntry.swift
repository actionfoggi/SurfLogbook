//
//  vcSessionEntry.swift
//  SurfLogbook
//
//  Created by Sven Weiss on 24.08.15.
//  Copyright (c) 2015 W&K Druckluftanlagenbau GmbH. All rights reserved.
//

import UIKit

class vcSessionEntry: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UIScrollViewDelegate  {
    
    
    /** scroll content **/
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    /** day info **/
    @IBOutlet var dayTextField: UITextField!
    @IBOutlet var datePickerView  : UIDatePicker!
    
    @IBOutlet var startTimeTextField: UITextField!
    @IBOutlet var timePickerView  : UIDatePicker!
    
    @IBOutlet var durationTextField: UITextField!
    @IBOutlet var durationPickerView: UIDatePicker!
    
    /** weather info info **/
    @IBOutlet weak var airTempLabel: UILabel!
    @IBOutlet weak var airTempSlider: UISlider!
    
    @IBOutlet weak var waterTempLabel: UILabel!
    @IBOutlet weak var waterTempSlider: UISlider!
    
    @IBOutlet weak var avgPeopleLabel: UILabel!
    @IBOutlet weak var avgPeopleSlider: UISlider!
    
    @IBOutlet weak var skyConditionTextField: UITextField!
    let pickOption = SkyConditions.allValues
    
    /** common session info **/
    @IBOutlet weak var usedWetsuitTextField: UITextField!
    @IBOutlet weak var editWetsuitsButton: UIButton!
    
    
    
    @IBOutlet weak var commentTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pickerView = UIPickerView()
        pickerView.delegate = self
        skyConditionTextField.inputView = pickerView

 
    }
    
    /** handle scroll view **/
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.scrollView.layoutIfNeeded()
        self.scrollView.contentSize = self.contentView.bounds.size
    }
    
    
    /** handle picker view selections **/
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickOption.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickOption[row].simpleDescription()
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        skyConditionTextField.text = pickOption[row].simpleDescription()
    }
    
    
    /** handle day picker selection **/
    @IBAction func dayTextField(sender: UITextField) {
        datePickerView = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.Date
        datePickerView.locale = NSLocale(localeIdentifier: "de_DE")
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: Selector("handleDayPicker:"), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func handleDayPicker(sender: UIDatePicker) {
        let dayFormatter = NSDateFormatter()
        dayFormatter.dateStyle = NSDateFormatterStyle.FullStyle
        dayFormatter.locale = NSLocale(localeIdentifier: "de_DE")
        dayFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        dayTextField.text = dayFormatter.stringFromDate(sender.date)
    }
    
    /** handly start time picker selection **/
    @IBAction func startTimeTextField(sender: UITextField) {
        timePickerView = UIDatePicker()
        timePickerView.datePickerMode = UIDatePickerMode.Time
        timePickerView.locale = NSLocale(localeIdentifier: "de_DE")
        sender.inputView = timePickerView
        timePickerView.addTarget(self, action: Selector("handleTimePicker:"), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func handleTimePicker(sender: UIDatePicker) {
        let timeFormatter = NSDateFormatter()
        timeFormatter.locale = NSLocale(localeIdentifier: "de_DE")
        timeFormatter.dateStyle = NSDateFormatterStyle.NoStyle
        timeFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        startTimeTextField.text = timeFormatter.stringFromDate(sender.date)
    }
    
    
    /** handly end of selection **/
    @IBAction func editingDone(sender: UIButton) {
        dayTextField.resignFirstResponder()
        startTimeTextField.resignFirstResponder()
        skyConditionTextField.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
