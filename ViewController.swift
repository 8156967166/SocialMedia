////
////  ViewController.swift
////  SocialMediaAppProject
////
////  Created by Bimal@AppStation on 05/09/22.
////
//
//import UIKit
//
//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }
//}
//


import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonActionFaceBook(sender: UIButton) {
        self.performSegue(withIdentifier: "ContinueWithFaceBookViewController", sender: nil)
    }
    @IBAction func buttonActionApple(sender: UIButton) {
        self.performSegue(withIdentifier: "ContinueWithAppleViewController", sender: nil)
    }
    @IBAction func buttonActionGoogle(sender: UIButton) {
        self.performSegue(withIdentifier: "ContinueWithGoogleViewController", sender: nil)
    }
    @IBAction func buttonActionMicrosoft(sender: UIButton) {
        self.performSegue(withIdentifier: "ContinueWithMicrosoftViewController", sender: nil)
    }

}
