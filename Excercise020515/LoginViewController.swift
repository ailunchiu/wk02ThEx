//
//  LoginViewController.swift
//  Excercise020515
//
//  Created by Karen Chiu on 2/5/15.
//  Copyright (c) 2015 Karen Chiu. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var pressLoginView: UIView!
    @IBOutlet weak var inputTextView: UIView!
    @IBOutlet weak var pswView: UITextField!
    @IBOutlet weak var loginView: UITextField!
    
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    var loginAlarmView: UIAlertView?
    
    @IBOutlet weak var logoView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginBtn(sender: UIButton) {
        
        self.loadingView.startAnimating()
        delay(2,doCheck)
        
        self.loginAlarmView = UIAlertView (title: "Logging In", message: nil, delegate: self, cancelButtonTitle: nil)
        self.loginAlarmView!.show()

        
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    
        
    
    
    func doCheck()->(){
        
        self.loadingView.stopAnimating()
        
        var email = self.loginView.text
        var password = self.pswView.text
        
        self.loginAlarmView!.dismissWithClickedButtonIndex(0, animated: true)
        
        
        if email == "ai" && password == "po" {
        // ok
        
        performSegueWithIdentifier("linkToNextScreen", sender: self)
        
        } else {
            // Error
            UIAlertView(title: "Ew", message: "You are not Karen", delegate: self, cancelButtonTitle:"Ok").show()
        }

    }
    
    func alertView(alertView: UIAlertView!, clickedButtonAtIndex buttonIndex: Int) {
        // buttonIndex is 0 for Cancel
        // buttonIndex ranges from 1-n for the other buttons.
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        
        
        inputTextView.frame.origin.y = 150
        pressLoginView.frame.origin.y = 280
        
        
    }
    
        
        func keyboardWillHide(notification: NSNotification!) {
            var userInfo = notification.userInfo!
            
            // Get the keyboard height and width from the notification
            // Size varies depending on OS, language, orientation
            
            var kbSize = (userInfo[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue().size
            var durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey] as NSNumber
            var animationDuration = durationValue.doubleValue
            var curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey] as NSNumber
            var animationCurve = curveValue.integerValue
            
            UIView.animateWithDuration(animationDuration, delay: 0.0, options: UIViewAnimationOptions(UInt(animationCurve << 16)), animations: {
            
                // Set view properties in here that you want to match with the animation of the keyboard
                // If you need it, you can use the kbSize property above to get the keyboard width and height.
                }, completion: nil)
        }

        
        // Get the keyboard height and width from the notification
        // Size varies depending on OS, language, orientation

    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    

}
