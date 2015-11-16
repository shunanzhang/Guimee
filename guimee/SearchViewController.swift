//
//  SearchViewController.swift
//  guimee
//
//  Created by Shunan Zhang on 11/15/15.
//  Copyright © 2015 Shunan Zhang. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let itemNames = ["dress 1", "dress 2", "dress 3", "dress 4", "dress 5", "dress 6"]
    
    let imageArray = [UIImage(named: "Dress1_"), UIImage(named: "Dress2_"), UIImage(named: "Dress3_"), UIImage(named: "Dress4_"), UIImage(named: "Dress5_"), UIImage(named: "Dress6_")]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.itemNames.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ItemCell", forIndexPath: indexPath) as! ItemCell
        
        cell.titleLabel?.text = self.itemNames[indexPath.row]
        
        cell.imageView?.image = self.imageArray[indexPath.row]
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showDetailSegue", sender: self)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetailSegue" {
            
            let indexPaths = self.collectionView!.indexPathsForSelectedItems()!
            
            let indexPath = indexPaths[0] as NSIndexPath
            
            let vc = segue.destinationViewController as! ItemDetailViewController
            
            vc.itemImage = self.imageArray[indexPath.row]!
            vc.title = self.itemNames[indexPath.row]
            
            
        }
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
