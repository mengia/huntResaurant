//
//  ReasuarantTableViewController.swift
//  HuntRestaurant
//
//  Created by Mengistayehu Mamo on 4/9/16.
//  Copyright © 2016 Mengistayehu Mamo. All rights reserved.
//

import UIKit
import CoreData

class ReasuarantTableViewController: UITableViewController, UISearchResultsUpdating,NSFetchedResultsControllerDelegate {

    @IBOutlet var tabelview: UITableView!
    var searchController: UISearchController!
    var searchResults:[Restuarant] = []

    
//    
//    var restaurantImages = ["cafedeadend.jpg", "homei.jpg", "teakha.jpg",
//        "cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg",
//        "bourkestreetbakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg",
//        "upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg", "wafflewolf.jpg",
//        "fiveleaves.jpg", "cafelore.jpg", "confessional.jpg", "barrafina.jpg",
//        "donostia.jpg", "royaloak.jpg", "thaicafe.jpg"]
//    
//    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "PetitOyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh'sChocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats","Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina","Donostia", "Royal Oak", "Thai Cafe"]
//    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New york",  "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
//    
//    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American /Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
//    var restaurantIsVisited = [false, false, false, false, false, false, false,false, false, false, false, false, false, false, false, false, false, false,false, false, false]
//    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController = UISearchController(searchResultsController: nil)
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        
        tableView.estimatedRowHeight = 81.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style: .Plain, target: nil, action: nil)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
       func filterContentForSearchText(searchText: String) {
           searchResults = restaurants.filter({ (restaurant:Restuarant) -> Bool in
             let nameMatch = restaurant.name.rangeOfString(searchText, options:
               NSStringCompareOptions.CaseInsensitiveSearch)
             return nameMatch != nil
    })
    }
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        if let searchText = searchController.searchBar.text{
            filterContentForSearchText(searchText)
            tableView.reloadData()
        }
    }
    //MARK: -close button on the new Resturant
    
     @IBAction func close(segue:UIStoryboardSegue) {
        
    }
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
    
    if searchController.active {
            return searchResults.count
        } else{
            return restaurants.count
    }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! RestuarantTableViewcCell
        tableView.estimatedRowHeight = 36
        tableView.rowHeight = UITableViewAutomaticDimension
    
    cell.imageShow.layer.cornerRadius = 30
    cell.imageShow.clipsToBounds = true
        
        let restuarantYNfilter = (searchController.active) ? searchResults[indexPath.row] : restaurants[indexPath.row]
        
    cell.name.text = restuarantYNfilter.name
    cell.imageShow.image = UIImage (named: restuarantYNfilter.image)
    cell.location.text = restuarantYNfilter.location
    cell.type.text = restuarantYNfilter.type
    cell.accessoryType = .DisclosureIndicator
        
        
        
//        if (restaurants[indexPath.row].isVisited){
//           cell.accessoryType = .Checkmark
//        } else{
//        cell.accessoryType = .None
//        }
   
        // Configure the cell...

        return cell
    }
    
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let optionalValue  = UIAlertController(title: nil, message: "What do you wanna do ? ", preferredStyle: .Alert)
//        let alertAction = UIAlertAction(title:"Cancel", style: .Cancel, handler: nil)
//        optionalValue.addAction(alertAction)
//        self.presentViewController(optionalValue, animated: true, completion: nil)
//        
//        
//        let alerctCallaction  = { (action:UIAlertAction!) -> Void in
//            let actionAlertController = UIAlertController(title: "Sorry Not Available", message: "please try later", preferredStyle: .Alert)
//        
//            actionAlertController.addAction (UIAlertAction(title: "Okay", style: .Default, handler:nil))
//        
//            self.presentViewController(actionAlertController, animated: true, completion: nil)
//        }
//        
//        let callhandeler =  UIAlertAction(title: "call " + "123 - 000 - \(indexPath.row)", style: .Default, handler: alerctCallaction)
//            optionalValue.addAction(callhandeler)
//        
//       let isVisitedHere = UIAlertAction(title: "i have been here", style: .Default) { (UIAlertAction) -> Void in
//                let cell = tableView.cellForRowAtIndexPath(indexPath)
//                cell!.accessoryType = .Checkmark
//             restaurants[indexPath.row].isVisited = true
//                
//            }
//        
//        optionalValue.addAction(isVisitedHere)
//    }
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    if searchController.active{
            return false
       } else{
            return true
    }

    }
       // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            restaurants.removeAtIndex(indexPath.row)
            
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
        
            }
   override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
                let shareaction = UITableViewRowAction(style: .Default, title: "Share", handler: { (UITableViewRowAction, NSIndexPath) -> Void in
          let defaultString = "Just check in " + restaurants[indexPath.row].name
                if let imageShare = UIImage(named: restaurants[indexPath.row].image) {
        let activityController = UIActivityViewController(activityItems: [defaultString, imageShare], applicationActivities: nil)
       self.presentViewController (activityController, animated: true, completion: nil)
                }
                    
                })
                
            let deleteAction = UITableViewRowAction(style: .Default, title: "delete",  handler: { (UITableViewRowAction, NSIndexPath) -> Void in
                
            restaurants.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
                })
                shareaction.backgroundColor = (UIColor.blueColor())
                deleteAction.backgroundColor = (UIColor.redColor())
                 return [deleteAction,shareaction]
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "showDetail"{
            if let indexPath = tableView.indexPathForSelectedRow {
                let distinationViewController = segue.destinationViewController as! DetailViewController
                //distinationViewController.resturantNew = restaurants[indexPath.row]
                distinationViewController.resturantNew = (searchController.active) ? searchResults[indexPath.row]:restaurants[indexPath.row]
                
            }
            
        }
    }
    
}
