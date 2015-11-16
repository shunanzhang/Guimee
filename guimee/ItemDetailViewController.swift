//
//  ItemDetailViewController.swift
//  guimee
//
//  Created by Shunan Zhang on 11/15/15.
//  Copyright © 2015 Shunan Zhang. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var itemImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.imageView.image = self.itemImage
        
        // Do any additional setup after loading the view.
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
