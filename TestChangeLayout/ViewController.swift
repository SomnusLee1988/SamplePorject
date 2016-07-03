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
    @IBOutlet var view3: UIView!
    
    var viewArray:[UIView]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        viewArray = [view1,view2,view3]
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let views = ["v1":view1, "v2":view2, "v3":view3, "view":view]
        var allConstraints = [NSLayoutConstraint]()
        

//        
//        
//        let constraint1 = NSLayoutConstraint.constraintsWithVisualFormat("H:|-100-[v2(100)]-100-|", options: [], metrics: nil, views: views)
//        allConstraints += constraint1
//        
//        let constraint2 = NSLayoutConstraint.constraintsWithVisualFormat("V:|-200-[v2(==100)]-200-|", options: [], metrics: nil, views: views)
//        allConstraints += constraint2
//        
//        let constraint3 = NSLayoutConstraint.constraintsWithVisualFormat("V:[v1(==100)]-0-[v2(==100)]-0-[v3(==100)]", options: [.AlignAllCenterX], metrics: nil, views: views)
//        allConstraints += constraint3
//        
//        let constraint4 = NSLayoutConstraint.constraintsWithVisualFormat("H:[v1(==100)]", options: [], metrics: nil, views: views)
//        allConstraints += constraint4
//        
//        let constraint5 = NSLayoutConstraint.constraintsWithVisualFormat("H:[v3(==100)]", options: [], metrics: nil, views: views)
//        allConstraints += constraint5
//        
//        NSLayoutConstraint.activateConstraints(allConstraints)
//        self.view.addConstraints(allConstraints)
        
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func change(sender: AnyObject) {
        
        //assume exchange views' frame in a special order
        let v1 = viewArray![0]
        let v2 = viewArray![1]
        let v3 = viewArray![2]
        
        let frame = v1.frame
        v1.frame = v2.frame
        v2.frame = v3.frame
        v3.frame = frame
        
    }

    
    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
        if UIApplication.sharedApplication().statusBarOrientation == UIInterfaceOrientation.Portrait {
            //portraint -> landscape
            
            
            
        }
        else {
            //landscape -> portrait
            
            
            
        }
    }


}

