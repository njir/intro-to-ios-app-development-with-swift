//
//  ViewController.swift
//  TappingImage
//
//  Created by 진형탁 on 2017. 1. 7..
//  Copyright © 2017년 Boostcamp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var isFirst: Bool = true
    
    @IBAction func touchImage(_ sender: Any) {
        if(isFirst) {
            imageView.image = UIImage(named: "2")
            isFirst = false
        } else {
            imageView.image = UIImage(named: "1")
            isFirst = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "1")
        isFirst = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

