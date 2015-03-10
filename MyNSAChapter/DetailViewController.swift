//
//  DetailViewController.swift
//  MyNSAChapter
//
//  Created by Stavros Ladeas on 3/10/15.
//  Copyright (c) 2015 Stavros Ladeas. All rights reserved.
//

import UIKit
import Parse




class DetailViewController: UIViewController {

    @IBOutlet weak var venueLabel: UILabel!
    var currentObject : PFObject?

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Unwrap the current object object
        if let object = currentObject? {
            venueLabel.text = object["venue"] as String!
          
        }
        
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
