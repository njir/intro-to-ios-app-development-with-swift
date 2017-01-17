//
//  ViewController.swift
//  ClickCounter
//
//  Created by 진형탁 on 2017. 1. 17..
//  Copyright © 2017년 Boostcamp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var globalCount: Int = 0
    var globalLabel: UILabel!
    var globalView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Label
        let label = UILabel()
        label.frame = CGRect.init(x: 150, y: 150, width: 60, height: 60)
        label.text = "0"
        self.view.addSubview(label)
        
        // connect
        self.globalLabel = label
        
        
        // Increment Button
        let incrementButton = UIButton()
        incrementButton.frame = CGRect.init(x: 150, y: 250, width: 100, height: 60)
        incrementButton.setTitle("Increment", for: .normal)
        incrementButton.setTitleColor(UIColor.blue, for: .normal)
        // target: self, action: incrementCount, action: TouchUpInside
        incrementButton.addTarget(self, action: #selector(ViewController.incrementCount), for: UIControlEvents.touchUpInside)
        self.view.addSubview(incrementButton)
        
        // Decrement Button
        let decrementButton = UIButton()
        decrementButton.frame = CGRect.init(x: 150, y: 300, width: 100, height: 60)
        decrementButton.setTitle("Decrement", for: .normal)
        decrementButton.setTitleColor(UIColor.green, for: .normal)
        decrementButton.addTarget(self, action: #selector(ViewController.decrementCount), for: UIControlEvents.touchUpInside)
        self.view.addSubview(decrementButton)
        
        // View
        let gesture = UITapGestureRecognizer(target: self, action:  #selector (self.changeBackgroundColor (_:)))
        self.view.addGestureRecognizer(gesture)
        
        
        // Alert
        let alertButton = UIButton()
        alertButton.frame = CGRect.init(x: 150, y: 400, width: 100, height: 60)
        alertButton.setTitle("Show Alert", for: .normal)
        alertButton.setTitleColor(UIColor.purple, for: .normal)
        alertButton.addTarget(self, action: #selector(ViewController.showAlert), for: UIControlEvents.touchUpInside)
        self.view.addSubview(alertButton)
        
        // ActivityView
        let activityButton = UIButton()
        activityButton.frame = CGRect.init(x: 150, y: 450, width: 100, height: 60)
        activityButton.setTitle("Activity view", for: .normal)
        activityButton.setTitleColor(UIColor.purple, for: .normal)
        activityButton.addTarget(self, action: #selector(ViewController.showActivityView), for: UIControlEvents.touchUpInside)
        self.view.addSubview(activityButton)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func incrementCount() {
        self.globalCount = self.globalCount + 1
        self.globalLabel.text = "\(self.globalCount)"
    }
    
    func decrementCount() {
        self.globalCount = self.globalCount - 1
        self.globalLabel.text = "\(self.globalCount)"
    }
    
    func changeBackgroundColor(_ sender: UITapGestureRecognizer){
        if (self.view.backgroundColor == UIColor.brown) {
            self.view.backgroundColor = UIColor.gray
        } else {
            self.view.backgroundColor = UIColor.brown
        }
    }
    
    func showActivityView() {
        let image = UIImage()
        let imageController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        self.present(imageController, animated: true, completion: nil)
    }
    
    func showAlert() {
        let alertController = UIAlertController()
        alertController.title = "Test Title"
        alertController.message = "Test message"
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            action in self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

