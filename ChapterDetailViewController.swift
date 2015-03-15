//
//  ChapterDetailViewController.swift
//  MyNSAChapter
//
//  Created by Stavros Ladeas on 3/12/15.
//  Copyright (c) 2015 Stavros Ladeas. All rights reserved.
//

import UIKit
import ParseUI
import Parse




class ChapterDetailViewController: UIViewController {
    
    @IBOutlet weak var venueLabel: UILabel!
    
    var chapter:PFObject?

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let object = chapter? { // not sure if I should use something else than currentObject
            
            let venue = object["venue"] as? String
            
            venueLabel.text = "Our meetings are held at \(venue!)"
            

        }
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
     func queryForTable() -> PFQuery! {
        
        if let NSAChapter = chapter {
            
            let relation = NSAChapter.relationForKey("Chapter")
         
        }
        return PFQuery()
    }
    
    required init (coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
  
        
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
