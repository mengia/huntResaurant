//
//  DetailViewController.swift
//  HuntRestaurant
//
//  Created by Mengistayehu Mamo on 4/9/16.
//  Copyright © 2016 Mengistayehu Mamo. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource,UITableViewDelegate{
    @IBOutlet weak var restuarntImageNew: UIImageView!
    var resturantNew:Restuarant!
   
    @IBOutlet weak var tableview: UITableView!
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.estimatedRowHeight = 36.0
        tableview.rowHeight = UITableViewAutomaticDimension
        
        restuarntImageNew.image = UIImage(named:resturantNew.image)
        
        tableview.backgroundColor = UIColor(red: 240.0/255, green: 240.0/255, blue: 240.0/255, alpha: 0.2)
        tableview.separatorColor  = UIColor(red: 240.0/255, green: 240.0/255, blue: 240.0/255, alpha: 0.8)
        tableview.tableFooterView = UIView(frame:CGRectZero)
        title = resturantNew.name
        


        // Do any additional setup after loading the view.
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath:indexPath) as! detailViewTableViewCell
        switch indexPath.row{
        case 0 :
            cell.nameLabel.text = "Name"
            cell.valueLabel.text = resturantNew.name
        case 1 :
            cell.nameLabel.text = "Type"
            cell.valueLabel.text = resturantNew.type
        case 2 :
            cell.nameLabel.text = "location"
            cell.valueLabel.text = resturantNew.location
        case 3 :
            cell.nameLabel.text = "Been here"
            cell.valueLabel.text = (resturantNew.isVisited) ? "yes i have been here" : "No"
        case 4:
            cell.nameLabel.text = "Phone Number"
            cell.valueLabel.text = resturantNew.phoneNumber
        default:
            cell.nameLabel.text = ""
            cell.valueLabel.text = ""
            
            
        }
        cell.backgroundColor = (UIColor.clearColor())
        return cell
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
