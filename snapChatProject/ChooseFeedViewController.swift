//
//  ChooseFeedViewController.swift
//  snapChatProject
//
//  Created by nancy on 3/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import Foundation
import UIKit

class ChooseFeedViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{
    
    var selectedName: String?
    var image: UIImage?

    @IBOutlet weak var ChooseTableView: UITableView!
    
    @IBOutlet weak var ChosenFeed: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ChooseTableView.delegate = self
        ChooseTableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return threadNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ChooseTableView.dequeueReusableCell(withIdentifier: "chooseCell") as! ChooseTableVieCell
        cell.name.text = threadNames[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedName = threadNames[indexPath.row]
        ChosenFeed.text = selectedName
    }
    
    @IBAction func BackToFeed(_ sender: Any) {
        performSegue(withIdentifier: "unwindSegueToFeed", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unwindSegueToFeed"{
            if let dest = segue.destination as? FeedViewController{
                dest.image = image
                dest.theFeed = selectedName
            }
        }
    }
}
