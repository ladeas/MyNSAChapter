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


class TableViewController: PFQueryTableViewController {
    
    
    // Initialize the PFQueryTableViewController
    
    override init!(style: UITableViewStyle, className: String!) {
        
        super.init(style: style, className: className)
        
        
    }
    
    
    required init (coder aDecoder: NSCoder) {
        
        
        super.init(coder: aDecoder)
        
        // Configure the PFQueryTableView
        self.parseClassName = "Chapter"
        self.textKey = "name"
//        self.textKey = "lastName"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
    }
    
    
    // Define the query that will provide the data for the table view
    
    override func queryForTable() -> PFQuery! {
        var query = PFQuery(className: "Chapter")
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
        cell?.detailTextLabel?.text = object["venue"] as String!
        
        return cell
    }
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Get the new view controller using [segue destinationViewController].
        var detailScene = segue.destinationViewController as DetailViewController
        
        // Pass the selected object to the destination view controller.
        if let indexPath = self.tableView.indexPathForSelectedRow() {
            let row = Int(indexPath.row)
            detailScene.currentObject = objects[row] as? PFObject
        }
    
   
}
    
}





























