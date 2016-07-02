//
//  ViewController.swift
//  TestChangeLayout
//
//  Created by Somnus on 16/7/2.
//  Copyright © 2016年 Somnus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let firstView = UIView()
    let secondView = UIView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.firstView.backgroundColor = UIColor(red: 0.75, green: 0.75, blue: 0.1, alpha: 1.0)
        self.secondView.backgroundColor = UIColor.redColor()

        self.createAutoLayoutForViews(firstView, view2: secondView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createAutoLayoutForViews(view1: UIView, view2: UIView) {
        view1.translatesAutoresizingMaskIntoConstraints = false
        view2.translatesAutoresizingMaskIntoConstraints = false
        
        //Add the views
        view.addSubview(view1)
        view.addSubview(view2)
        
        let viewsDictionary = [
            "view1":view1,
            "view2":view2 ]
        
        let metricsDictionary = [
            "view1Height": 50.0,
            "view2Height":40.0,
            "viewWidth":50.0 ]
        
        self.addViewOneConstraints(view1, viewsDictionary: viewsDictionary, metricsDictionary: metricsDictionary)
        self.addViewTwoConstraints(view2, viewsDictionary: viewsDictionary, metricsDictionary: metricsDictionary)
        self.addSuperViewConstraints(viewsDictionary, metricsDictionary: metricsDictionary)
    }
    
    func addViewOneConstraints(view1: UIView, viewsDictionary: [String:UIView], metricsDictionary: [String:Double]) {
        let view1_constraint_H = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[view1(viewWidth)]",
            options: NSLayoutFormatOptions(rawValue:0),
            metrics: metricsDictionary,
            views: viewsDictionary)
        let view1_constraint_V = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[view1(view1Height)]",
            options: NSLayoutFormatOptions(rawValue:0),
            metrics: metricsDictionary,
            views: viewsDictionary)
        view1.addConstraints(view1_constraint_H)
        view1.addConstraints(view1_constraint_V)
    }

    
    func addViewTwoConstraints(view2: UIView, viewsDictionary: [String:UIView], metricsDictionary: [String:Double]) {
        let view2_constraint_H = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[view2(viewWidth)]",
            options: NSLayoutFormatOptions(rawValue:0),
            metrics: metricsDictionary,
            views: viewsDictionary)
        let view2_constraint_V = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[view2(>=view2Height)]",
            options: NSLayoutFormatOptions(rawValue:0),
            metrics: metricsDictionary,
            views: viewsDictionary)
        
        view2.addConstraints(view2_constraint_H)
        view2.addConstraints(view2_constraint_V)
    }
    
    func addSuperViewConstraints(viewsDictionary: [String:UIView], metricsDictionary: [String:Double]) {
        let view_constraint_H = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-[view2]",
            options: NSLayoutFormatOptions(rawValue:0),
            metrics: nil, views: viewsDictionary)
        let view_constraint_V = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-36-[view1]-8-[view2]-200-|",
            options: NSLayoutFormatOptions.AlignAllLeading,
            metrics: nil, views: viewsDictionary)
        
        view.addConstraints(view_constraint_H)
        view.addConstraints(view_constraint_V)
    }

    @IBAction func change(sender: AnyObject) {
        // Remove existing constraints
        self.firstView.removeConstraints(self.firstView.constraints)
        self.secondView.removeConstraints(self.secondView.constraints)
        self.firstView.removeFromSuperview()
        self.secondView.removeFromSuperview()
        
        // Decide which view will recieve which constraints now based on their current sizes
        if firstView.frame.height == 50 {
            self.createAutoLayoutForViews(self.secondView, view2: self.firstView)
        } else {
            self.createAutoLayoutForViews(self.firstView, view2: self.secondView)
        }
    }
}

