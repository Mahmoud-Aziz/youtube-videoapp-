//
//  ViewController.swift
//  youtubeApp-CWC
//
//  Created by Justin Huang on 6/9/20.
//  Copyright © 2020 Justin Huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate{
      
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set it self as the data source and delegate.
        tableView.dataSource = self
        tableView.delegate = self
        
        //set it self as the delegate of the model
        model.delegate = self
        
        // Do any additional setup after loading the view.
        model.getVideos()
    }
    
    // MARK: - Model delegate methods
    func videosFetched(_ videos: [Video]) {
        //set the return videos to our video property
        self.videos = videos
        //refresh tableview
        self.tableView.reloadData()

    }

    
    // MARK: - TableView Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath)
        
        //customize the cell with the data
        //get the tiel for the video in question
        let title = self.videos[indexPath.row].title
        cell.textLabel?.text = title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

