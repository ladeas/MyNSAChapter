//
//  TableViewController.swift
//  MyNSAChapter
//
//  Created by Stavros Ladeas on 3/10/15.
//  Copyright (c) 2015 Stavros Ladeas. All rights reserved.
//

import UIKit
import ParseUI
import Parse
import Foundation

//var currentObject: PFObject?



class TableViewController: PFQueryTableViewController {
    
//    @IBOutlet weak var regionImage: UIImageView!
    
    // Initialize the PFQueryTableViewController
    
    override init!(style: UITableViewStyle, className: String!) {
        
        super.init(style: style, className: className)
        
        
        
        
    }
    
    
    required init (coder aDecoder: NSCoder) {
        
        
        super.init(coder: aDecoder)
        
        // Configure the PFQueryTableView
        self.parseClassName = "Region"
        self.textKey = "name"
         self.imageKey = "image"
//        self.textKey = "lastName"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
        
        self.title = "NSA Regions"
        
       
        
//        self.textKey = "image"
        
//        self.regionImage.image = UIImage(named: "centralNorth.png")
    }
    
    
    // Define the query that will provide the data for the table view
    
    override func queryForTable() -> PFQuery! {
        var query = PFQuery(className: "Region")
        query.orderByAscending("name")
        //    query.orderByAscending("lastName")
        return query
    }
    
    //override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject) -> PFTableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as PFTableViewCell!
        if cell == nil {
            cell = PFTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        }
        
        // Extract values from the PFObject to display in the table cell
        cell?.textLabel?.text = object["name"] as String!
    
    

        cell?.imageView?.image = object["image"] as UIImage
    
//        cell?.detailTextLabel?.text = object["venue"] as String!
    
    //add the image
    
   
    
        return cell
    }
    
    
    
    
    
    
    var storedIndexPath: NSIndexPath!
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        storedIndexPath = indexPath
        var regionObject: AnyObject = self.objects[storedIndexPath.row]
        let statesViewController:StateViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("statesViewController") as StateViewController
        statesViewController.region = regionObject as? PFObject
        
        
        self.navigationController?.pushViewController(statesViewController, animated: true)
    }
    
//    
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        
//        var object: AnyObject = self.objects[storedIndexPath.row]
//        
//        println(object)
//        
//        //
//        
//        // Get the new view controller using [segue destinationViewController].
//        var detailScene = segue.destinationViewController as StateViewController
//        
//        // Pass the selected object to the destination view controller.
////        if let indexPath = self.tableView.indexPathForSelectedRow() {
////            let row = Int(indexPath.row)
////            detailScene.currentObject = objects[row] as? PFObject
////        }
////    
//   
//    }
    
    
    


}





























