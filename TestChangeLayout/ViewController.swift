//
//  ViewController.swift
//  TestChangeLayout
//
//  Created by Somnus on 16/7/2.
//  Copyright © 2016年 Somnus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var view1: UIView!
    @IBOutlet var view2: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("view1.frame = \(self.view1.frame)")
        print("view2.frame = \(self.view2.frame)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func change(sender: AnyObject) {
        
        let frame = view1.frame
        view1.frame = view2.frame
        view2.frame = frame
    }

    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        
    }


}

