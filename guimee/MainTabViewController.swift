//
//  MainTabViewController.swift
//  guimee
//
//  Created by Shunan Zhang on 11/13/15.
//  Copyright © 2015 Shunan Zhang. All rights reserved.
//
import Parse
import Bolts
import UIKit
import HTMLReader

class MainTabViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var homeViewController: UIViewController!
    var watchlistViewController: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let storyboard = UIStoryboard(name: "Main", bundle:
            nil)
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("navigationHomeViewController")
        watchlistViewController = storyboard.instantiateViewControllerWithIdentifier("watchlistViewController")
        scrollView.contentSize = CGSize(width:
            320*2, height:containerView.frame.size.height)
        
        homeViewController.view.frame = scrollView.frame
        scrollView.addSubview(homeViewController.view)
        
        
        watchlistViewController.view.frame = scrollView.frame
        watchlistViewController.view.frame.origin.x = 320
        scrollView.addSubview(watchlistViewController.view)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onHomeTab(sender: AnyObject) {
        
        scrollView.setContentOffset(CGPoint(x:0, y: 0), animated:true)
        
    }
    
    @IBAction func onStarTab(sender: AnyObject) {
        
        scrollView.setContentOffset(CGPoint(x:containerView.frame.size.width, y: 0), animated:true)
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
