//
//  WetsuitTableViewController.swift
//  SurfLogbook
//
//  Created by Sven Weiss on 02.09.15.
//  Copyright © 2015 W&K Druckluftanlagenbau GmbH. All rights reserved.
//

import UIKit
import CoreData

class WetsuitTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    let managedObjectContext: NSManagedObjectContext? = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext
    var fetchedResultsController: NSFetchedResultsController?


    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: allWetsuitsFetchRequest(), managedObjectContext: managedObjectContext!, sectionNameKeyPath: nil, cacheName: nil)
        fetchedResultsController?.delegate = self
        
        do{
            try fetchedResultsController?.performFetch()
        }
        catch{
            print("Error during fetsh request")
        }
        
        tableView.reloadData()

        
    }
    
    func allWetsuitsFetchRequest() -> NSFetchRequest {
        let fetchRequest = NSFetchRequest(entityName: "Wetsuits")
        let sortDescriptor = NSSortDescriptor(key: "manufacturer", ascending: true)
        
        fetchRequest.predicate = nil
        fetchRequest.sortDescriptors = [sortDescriptor]
        fetchRequest.fetchBatchSize = 20
        
        return fetchRequest
    }

    



    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return fetchedResultsController?.sections?.count ?? 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultsController?.sections?[section].numberOfObjects ?? 0
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("LabelCell", forIndexPath: indexPath) as UITableViewCell
        
        if let cellContact = fetchedResultsController?.objectAtIndexPath(indexPath) as? Wetsuits {
            cell.textLabel?.text = "\(cellContact.manufacturer), \(cellContact.name), \(cellContact.wetsuitThickness)"
        }
        return cell
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func unwindToWetsuitList(sender: UIStoryboardSegue) {
        
        if let sourceViewController = sender.sourceViewController as? vcNewWetsuit{
            
            //Check whether ther is a new wetsuit or update one
            if let selectedIndexPath = tableView.indexPathForSelectedRow{
                /** update an existing wetsuit **/
                
                let fetchRequest = NSFetchRequest(entityName: "Wetsuits")
                let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
                fetchRequest.sortDescriptors = [sortDescriptor]
                
                // Create a new predicate that filters out any object that
                // doesn't have a title of "Best Language" exactly.
                let namePredicate = NSPredicate(format: "name == %@", sourceViewController.wetsuitName)
                let manufacturerPredicate = NSPredicate(format: "manufacturer == %@", sourceViewController.manufacturer)
                let thicknessPredicate = NSPredicate(format: "wetsuitThickness == %@", sourceViewController.wetsuitThickness)
                
                
                let predicate = NSCompoundPredicate(type: NSCompoundPredicateType.OrPredicateType, subpredicates: [namePredicate, manufacturerPredicate, thicknessPredicate])
                
                
                // Set the predicate on the fetch request
                fetchRequest.predicate = predicate
                
                do{
                
                    if let fetchResults = try managedObjectContext!.executeFetchRequest(fetchRequest) as? [Wetsuits] {
                        
                        /** set new properties **/
                        
                        fetchResults.first?.name = sourceViewController.wetsuitNameTextField.text ?? ""
                        
                        fetchResults.first?.manufacturer = sourceViewController.manufacturerTextField.text ?? ""
                        
                        fetchResults.first?.wetsuitThickness = sourceViewController.thicknessTextField.text ?? ""
                        
                        /** save updated data to coredate database **/
                        try managedObjectContext?.save()
                        
                    }
                    
                }catch{
                    
                }
                
                //update tableviews
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
                
            }else{
                /** add a new wetsuit **/
            
                let wetsuitName = sourceViewController.wetsuitName
                let manufacturer = sourceViewController.manufacturer
                let wetsuitThickness = sourceViewController.wetsuitThickness
            
                let newWetsuit =  NSEntityDescription.insertNewObjectForEntityForName("Wetsuits", inManagedObjectContext: managedObjectContext!) as! Wetsuits
                newWetsuit.name = wetsuitName
                newWetsuit.manufacturer = manufacturer
                newWetsuit.wetsuitThickness = wetsuitThickness
            
                do{
                    try managedObjectContext?.save()
                }catch{
                    print("error while saving")
                }
                self.viewDidLoad()
            }
        }
    }
    
    
    // This method lets you configure a view controller before it's presented.
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "ShowDetail" {
            let wetsuitDetailViewController = segue.destinationViewController as! vcNewWetsuit
            
            if let selectedWetsuitCell = sender as? UITableViewCell {
                
                let indexPath = tableView.indexPathForCell(selectedWetsuitCell)!
                
                /** get data from coredata **/
                let selectedWetsuit = fetchedResultsController?.objectAtIndexPath(indexPath) as? Wetsuits
                
                wetsuitDetailViewController.wetsuitName = selectedWetsuit?.name
                wetsuitDetailViewController.manufacturer = selectedWetsuit?.manufacturer
                wetsuitDetailViewController.wetsuitThickness = selectedWetsuit?.wetsuitThickness
                
            }
            
        }
        else if segue.identifier == "AddItem" {
            
            print("add new item")
        }
        
    }
    
    
}
