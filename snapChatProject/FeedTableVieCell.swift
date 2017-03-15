//
//  FeedTableVieCell.swift
//  snapChatProject
//
//  Created by nancy on 3/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import Foundation
import UIKit

class FeedTableVieCell:UITableViewCell{
    
    @IBOutlet weak var ifRead: UIButton!
    
    @IBOutlet weak var poster: UILabel!
    
    @IBOutlet weak var timer: UILabel!
    
    var read:Bool = false
    
}
