//
//  LoginViewController.swift
//  guimee
//
//  Created by Shunan Zhang on 11/12/15.
//  Copyright © 2015 Shunan Zhang. All rights reserved.
//

import UIKit
import Parse
import Bolts
//import HTMLReader

class LoginViewController: UIViewController {

    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var thinkingIndicator: UIActivityIndicatorView!
    
    var initialY: CGFloat!
    let offset: CGFloat = -60
    
    func keyboardWillShow(notification: NSNotification!){
        self.loginView.frame.origin = CGPoint(x: self.loginView.frame.origin.x, y: self.initialY + self.offset)
    }
    
    func keyboardWillHide(notification: NSNotification!){
        self.loginView.frame.origin = CGPoint(x: self.loginView.frame.origin.x, y: self.initialY)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialY = loginView.frame.origin.y
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
        loginButton.enabled = false
        
        thinkingIndicator.stopAnimating()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func delay(delay:Double, closure:()->()){
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(),closure)
    }
    
    @IBAction func onTap(sender: AnyObject){
        view.endEditing(true)
    }
    
    @IBAction func onButton(sender: AnyObject){
        
        self.thinkingIndicator.startAnimating()
        
        loginButton.selected = true
        
        if emailField.text == "szhang" && passwordField.text == "password" {
            delay(2, closure:{()->() in
                self.performSegueWithIdentifier("loginSegue", sender: nil)
                self.thinkingIndicator.stopAnimating()
                self.emailField.text = ""
                self.passwordField.text = ""
                self.loginButton.selected = false
            })
        }else{
            delay(2, closure:{() -> () in
                let alertController = UIAlertController(title: "Access Denied", message: "Unfound email or wrong password", preferredStyle:.Alert)
                
                let cancelAction = UIAlertAction(title:"OK", style:.Cancel) {(action) in
                }
                
                alertController.addAction(cancelAction)
                
                self.presentViewController(alertController, animated: true, completion: nil)
                self.loginButton.selected = false
                self.thinkingIndicator.stopAnimating()
            })
        }
    }

    @IBAction func editingDidChange(sender: AnyObject) {
        if emailField.text!.isEmpty ||
            passwordField.text!.isEmpty {
                loginButton.enabled = false
                loginButton.selected = false
                loginButton.highlighted = false
        }else{
            loginButton.enabled = true
            loginButton.highlighted = true
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
