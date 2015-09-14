//
//  vcSessionEntry.swift
//  SurfLogbook
//
//  Created by Sven Weiss on 24.08.15.
//  Copyright (c) 2015 W&K Druckluftanlagenbau GmbH. All rights reserved.
//

import UIKit
import CoreData

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
    let skyconditionsPickOption = SkyConditions.allValues
    
    /** common session info **/
    @IBOutlet weak var usedWetsuitTextField: UITextField!
    var wetsuitPickOption:Array<Wetsuits> = []
    @IBOutlet weak var editWetsuitsButton: UIButton!
    
    
    
    @IBOutlet weak var commentTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /** sky conditions **/
        let skyconditionsPickerView = UIPickerView()
        skyconditionsPickerView.delegate = self
        skyConditionTextField.inputView = skyconditionsPickerView
        skyconditionsPickerView.tag=0
        
        /** used wetsuit **/
        let wetsuitPickerView = UIPickerView()
        wetsuitPickerView.delegate = self
        usedWetsuitTextField.inputView = wetsuitPickerView
        wetsuitPickerView.tag = 1
        
        
        /** load content from coredata **/
        let appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext!
        let request = NSFetchRequest(entityName: "Wetsuits")
        request.returnsObjectsAsFaults = false

        do{
            let result : NSArray =  try  context.executeFetchRequest(request)
            if result.count > 0{
                
                for wetsuit in result {
                    let thisWetsuit = wetsuit as! Wetsuits
                    wetsuitPickOption.append(thisWetsuit)
                }
            }
        }catch{
            print("error in core data fetch request - wetsuits")
        }
        
    }
    
    /** handle scroll view **/
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.scrollView.layoutIfNeeded()
        self.scrollView.contentSize = self.contentView.bounds.size
    }
    
    /** Air Temp Slinder **/
    @IBAction func slinderValueChanged(sender: UISlider) {
        let selectedValue = Float(sender.value)
        airTempLabel.text  = String.localizedStringWithFormat("%.1f", selectedValue)
    }
    
    /** water temp slider **/
    @IBAction func waterTempSliderValueChanged(sender: UISlider) {
        let selectedValue = Float(sender.value)
        waterTempLabel.text  = String.localizedStringWithFormat("%.1f", selectedValue)
    }
    
    /** avg people slider **/
    @IBAction func avgPeopleSliderValueChanged(sender: UISlider) {
        let selectedValue = Int(sender.value)
        avgPeopleLabel.text  = String.localizedStringWithFormat("%i", selectedValue)
    }
    
    
    /** handle picker view selections wetsuit **/
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch pickerView.tag {
        case 0: return skyconditionsPickOption.count
        case 1: return wetsuitPickOption.count
        default: return -1
        }
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch pickerView.tag{
        case 0: return skyconditionsPickOption[row].simpleDescription()
        case 1: return wetsuitPickOption[row].simpleDescription()
        default: return "error"
        }
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch pickerView.tag {
        case 0: skyConditionTextField.text = skyconditionsPickOption[row].simpleDescription()
        case 1: usedWetsuitTextField.text = wetsuitPickOption[row].simpleDescription()
        default: "do nothing here"
        }
        
        
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
        usedWetsuitTextField.resignFirstResponder()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
