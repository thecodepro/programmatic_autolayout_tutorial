//
//  ViewController.swift
//  programmatic_constraints_tutorial
//
//  Created by Zephaniah Cohen on 1/15/17.
//  Copyright © 2017 CodePro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var constraintContainer : [NSLayoutConstraint] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //createConstraints()
        createVisualFormatStringConstraints()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createConstraints() {
        
      let subView = UIView()
      subView.backgroundColor = UIColor.blue
      subView.translatesAutoresizingMaskIntoConstraints = false
        
      view.addSubview(subView)
        
      //Apply Constraints 
        
        let horizontalCenter = NSLayoutConstraint(item: subView, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
        
        let verticalCenter = NSLayoutConstraint(item: subView, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0)
        
        let widthConstraint = NSLayoutConstraint(item: subView, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 200)
        
        let heightConstraint = NSLayoutConstraint(item: subView, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 200)
        
        constraintContainer.append(horizontalCenter)
        constraintContainer.append(verticalCenter)
        constraintContainer.append(widthConstraint)
        constraintContainer.append(heightConstraint)
        
        NSLayoutConstraint.activate(constraintContainer)
        
    
    }
    
    func createVisualFormatStringConstraints() {
        
        let subView = UIView()
        subView.backgroundColor = UIColor.red
        subView.translatesAutoresizingMaskIntoConstraints = false
        
        let subViewTwo = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        subViewTwo.backgroundColor = UIColor.green
        subViewTwo.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(subView)
        view.addSubview(subViewTwo)
        
        let viewsDict : [String:Any] = [
            "subView" : subView,
            "subViewTwo" : subViewTwo
        ]
        
        let metricsDict : [String:Any] = [
            "leftPadding" : NSNumber(integerLiteral: 15),
            "width" : NSNumber(integerLiteral: 75),
            "spacing" : NSNumber(integerLiteral: 15),
            "height" : NSNumber(integerLiteral: 100),
            "topPadding" : NSNumber(integerLiteral: 150)
        ]
        
        constraintContainer += NSLayoutConstraint.constraints(withVisualFormat: "H:|-leftPadding-[subView(width)]-spacing-[subViewTwo]-|", options: [], metrics: metricsDict, views: viewsDict)
        
        constraintContainer += NSLayoutConstraint.constraints(withVisualFormat: "V:|-topPadding-[subView(height)]", options: [], metrics: metricsDict, views: viewsDict)
        constraintContainer += NSLayoutConstraint.constraints(withVisualFormat: "V:|-topPadding-[subViewTwo(height)]", options: [], metrics: metricsDict, views: viewsDict)
        
        NSLayoutConstraint.activate(constraintContainer)
    }
}













