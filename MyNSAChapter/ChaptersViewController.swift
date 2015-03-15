//
//  ChaptersViewController.swift
//  MyNSAChapter
//
//  Created by Stavros Ladeas on 3/12/15.
//  Copyright (c) 2015 Stavros Ladeas. All rights reserved.
//

import UIKit
import ParseUI
import Parse

class ChaptersViewController: PFQueryTableViewController {
    
    var state:PFObject?
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func queryForTable() -> PFQuery! {
        
        if let NSAState = state {
            
            let relation = NSAState.relationForKey("chapters")
            return relation.query().orderByAscending("chapters")
        }
        return PFQuery()
    }
    
    required init (coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
        if let object = currentObject? { // not sure if I should use something else than currentObject
            self.parseClassName = "State"
            self.textKey = "name"
            self.pullToRefreshEnabled = true
            self.paginationEnabled = false
            
            
        }
    
    }
    
    
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
        let chapterDetailViewController:ChapterDetailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("chapterDetailViewController") as ChapterDetailViewController
        chapterDetailViewController.chapter = regionObject as? PFObject
        
        
        self.navigationController?.pushViewController(chapterDetailViewController, animated: true)
    }
    
    
//     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Get the new view controller using [segue destinationViewController].
        var detailScene = segue.destinationViewController as ChapterDetailViewController
        
        // Pass the selected object to the destination view controller.
        if let indexPath = self.tableView.indexPathForSelectedRow() {
            let row = Int(indexPath.row)
            detailScene.chapter = objects[row] as? PFObject
        }
        
        
    }
    
}
