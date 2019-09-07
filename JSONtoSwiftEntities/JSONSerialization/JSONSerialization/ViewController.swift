//
//  ViewController.swift
//  JSONSerialization
//
//  Created by Dayton Steffeny on 9/6/19.
//  Copyright © 2019 Dayton Steffeny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
let urlString = "https://dalemusser.com/code/examples/data/nocaltrip/photos.json"

override func viewDidLoad() {
    super.viewDidLoad()
    
    PicsLoad.load(urlString: urlString) {
        (vaca, error) in
        
        if let error = error {
            print("Error: \(error)")
            return
        }
        
        guard let vaca = vaca else {
            print("Not able to open.")
            return
        }
        
        print("status: \(vaca.status)")
        print("photosPath: \(vaca.photosPath)")
        print("count of photos: \(vaca.photos.count)")
        for photo in vaca.photos {
            print("--------------------------------------")
            print("image: \(photo.image)")
            print("title: \(photo.title)")
            print("description: \(photo.description)")
            print("latitude: \(photo.latitude)")
            print("longitude: \(photo.longitude)")
            print("date: \(photo.date)")
        }
    }
}

}

