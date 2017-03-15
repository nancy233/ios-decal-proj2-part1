//
//  ImageViewController.swift
//  snapChatProject
//
//  Created by nancy on 3/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import Foundation
import UIKit

class ImageViewController:UIViewController{
    
    var image:UIImage?
    @IBOutlet weak var finalImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let show = image{
            finalImage.image = show
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    

    
}
