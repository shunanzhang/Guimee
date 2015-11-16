//
//  HomeViewController.swift
//  guimee
//
//  Created by Shunan Zhang on 11/15/15.
//  Copyright © 2015 Shunan Zhang. All rights reserved.
//

import Parse
import Bolts
import UIKit
import HTMLReader

class HomeViewController: UIViewController {
    @IBOutlet weak var homeScrollView: UIScrollView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        homeScrollView.contentSize = CGSize(width: 320, height: 485)
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
