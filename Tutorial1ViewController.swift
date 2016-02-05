//
//  Tutorial1ViewController.swift
//  appCelularRegistrado
//
//  Created by renanjunior on 05/02/16.
//  Copyright © 2016 celularegistrado.com.br. All rights reserved.
//


import UIKit
import AVFoundation

class Tutorial1ViewController : UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func cancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
}