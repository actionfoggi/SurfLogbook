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
    
/*
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("LabelCell", forIndexPath: indexPath)

        cell.textLabel?.text = " Section \(indexPath.section) Row \(indexPath.row)"

        return cell
    }
   
*/
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
