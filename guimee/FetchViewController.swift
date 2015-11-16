//
//  FetchViewController.swift
//  guimee
//
//  Created by Shunan Zhang on 11/12/15.
//  Copyright © 2015 Shunan Zhang. All rights reserved.
//

import UIKit
import Parse
import Bolts
import HTMLReader

class FetchViewController: UIViewController {

    @IBOutlet weak var productNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressFetchButton(sender: AnyObject) {
        let url = NSURL(string: "http://www.walmart.com/ip/Jordache-Pull-On-Denim-Jegging/41884300")!
        
        let session = NSURLSession.sharedSession()
        session.dataTaskWithURL(url) { (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            var contentType = ""
            if let response = response as? NSHTTPURLResponse {
                let headers = response.allHeaderFields
                contentType = headers["Content-Type"] as? String ?? ""
            }
            
            let home = HTMLDocument(data: data!, contentTypeHeader: contentType)
            
            let titleSpan = home.firstNodeMatchingSelector(".prod-title-section span")
            
            let priceDiv = home.firstNodeMatchingSelector(".price-display")
            print(priceDiv?.textContent.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()))
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.productNameLabel.text = titleSpan?.textContent.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
            })
            
            
            
            print("span: \(titleSpan?.textContent)")
        }.resume()
        
//        HTMLElement *div = [home firstNodeMatchingSelector:@".repository-description"];
//        NSCharacterSet *whitespace = [NSCharacterSet whitespaceAndNewlineCharacterSet];
//        NSLog(@"%@", [div.textContent stringByTrimmingCharactersInSet:whitespace]);
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
