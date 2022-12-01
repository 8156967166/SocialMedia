//
//  FaceBookLabelSetViewController.swift
//  SocialMediaAppProject
//
//  Created by Bimal@AppStation on 05/09/22.
//

import UIKit

class FaceBookLabelSetViewController: UIViewController {
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelId: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    
    var setName = String()
    var setId = String()
    var setEmail = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        labelName.text = setName
        labelId.text = setId
        labelEmail.text = setEmail
    }
    

}
