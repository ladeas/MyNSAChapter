//
//  StateViewController.swift
//  MyNSAChapter
//
//  Created by Stavros Ladeas on 3/10/15.
//  Copyright (c) 2015 Stavros Ladeas. All rights reserved.
//



import UIKit
import ParseUI
import Parse


var currentObject : PFObject?


class StateViewController: PFQueryTableViewController {
    
    
    var region:PFObject?
    // Initialize the PFQueryTableViewController
    
    override init!(style: UITableViewStyle, className: String!) {
        
        super.init(style: style, className: className)
    }
    
    
    override func queryForTable() -> PFQuery! {
        
        if let NSARegion = region {
            let relation = NSARegion.relationForKey("states")
            return relation.query().orderByAscending("states")
            
        }
        
        return PFQuery()
    }
    
    
    required init (coder aDecoder: NSCoder) {
        
        
        super.init(coder: aDecoder)
        if let object = currentObject? {
            // Configure the PFQueryTableView
            self.parseClassName = "State"
            self.textKey = "name"
            self.pullToRefreshEnabled = true
            self.paginationEnabled = false
                        
                        
            
            
//            self.title = self.parseClassName(State)
            
            
            
            
        }
      
    }
    
    
    
    
    // Define the query that will provide the data for the table view
    
//    override func queryForTable() -> PFQuery! {
//        var query = PFQuery(className: "Region")
//        query.orderByAscending("name")
//        //    query.orderByAscending("lastName")
//        return query
//    }
    
    //override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath, object: PFObject) -> PFTableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("Cell") as PFTableViewCell!
        if cell == nil {
            cell = PFTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        }

        
        cell?.textLabel?.text  = object["name"] as String!

        
        // Extract values from the PFObject to display in the table cell
//        cell?.textLabel?.text = object["name"] as String!
//        cell?.detailTextLabel?.text = object["venue"] as String!
        
        return cell
    }
    

    
    
    // stavro moved
    
    var storedIndexPath: NSIndexPath!
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        storedIndexPath = indexPath
        var regionObject: AnyObject = self.objects[storedIndexPath.row]
        let chaptersViewController:ChaptersViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("chaptersViewController") as ChaptersViewController
        chaptersViewController.state = regionObject as? PFObject
        
        
        self.navigationController?.pushViewController(chaptersViewController, animated: true)
    }
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        
//        // Get the new view controller using [segue destinationViewController].
//        var detailScene = segue.destinationViewController as DetailViewController
//        
//        // Pass the selected object to the destination view controller.
//        if let indexPath = self.tableView.indexPathForSelectedRow() {
//            let row = Int(indexPath.row)
//            detailScene.currentObject = objects[row] as? PFObject
//        }
//        
//        
//    }
    
}
































