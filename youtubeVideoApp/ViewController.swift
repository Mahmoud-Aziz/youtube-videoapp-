//
//  ViewController.swift
//  youtubeVideoApp
//
//  Created by Mahmoud Aziz on 8/9/20.
//  Copyright © 2020 Mahmoud Aziz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos()
    }


}

