//
//  FeedViewController.swift
//  snapChatProject
//
//  Created by nancy on 3/14/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import Foundation
import UIKit

class FeedViewController:UIViewController, UITableViewDelegate, UITableViewDataSource{

    
    
    @IBOutlet weak var FeedTableView: UITableView!
    
    var theFeed:String?
    var image: UIImage?
    var showImage:UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        FeedTableView.delegate = self
        FeedTableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return threads[threadNames[section]]!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FeedTableView.dequeueReusableCell(withIdentifier: "feedCell") as! FeedTableVieCell
        if cell.read{
            cell.ifRead.setImage(UIImage(named:"read"), for: UIControlState.normal)
        }else{
            cell.ifRead.setImage(UIImage(named:"unread"), for: UIControlState.normal)
        }
        cell.poster.text = "Nan"
        cell.timer.text = String(describing: Date(timeIntervalSinceNow: 60))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showImage = threads[theFeed!]?[indexPath.row]
        let cell = tableView.cellForRow(at: indexPath) as! FeedTableVieCell
        if cell.read==false{
            cell.read = true
            performSegue(withIdentifier: "ToFinalImage", sender: self)
            FeedTableView.reloadData()
        }
    }

    
    func numberOfSections(in tableView:UITableView) -> Int {
        return threadNames.count
    }
    func tableView(_ tableView: UITableView,
                   titleForHeaderInSection section:
        Int) -> String? {
        return threadNames[section]
    }
    
    @IBAction func unwindChooseFeed(segue:UIStoryboardSegue){
        if let index = theFeed {
            threads[index]?.append(image!)

        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToFinalImage"{
            if let dest = segue.destination as? ImageViewController{
                dest.image = showImage
            }
        }
    }

}
