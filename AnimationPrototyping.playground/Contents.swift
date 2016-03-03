//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

let containerView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
containerView.backgroundColor = UIColor.whiteColor()

XCPlaygroundPage.currentPage.liveView = containerView

let circle = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
circle.center = containerView.center
circle.layer.cornerRadius = 25

circle.backgroundColor = UIColor.cyanColor()


containerView.addSubview(circle)
let label = UILabel(frame: CGRect(x:0, y: 0, width: 20, height: 20))

label.text = "Hello, WeddingWire!"
label.sizeToFit()


UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 50, initialSpringVelocity: 50, options: .CurveEaseIn, animations: {
    
    let scaleTransform = CGAffineTransformMakeScale(2, 2)

    circle.transform = scaleTransform
    
    containerView.addSubview(label)
    
    label.center = CGPoint(x: containerView.center.x, y: circle.frame.maxY + 20)
    

    }) { _ in
        
        

        UIView.animateWithDuration(2, animations: {
            let scaleTransform = CGAffineTransformMakeScale(1, 1)
            circle.transform = scaleTransform
            
            

           
        }) { _ in
          
            let w = UILabel()
            w.text = "W"
            w.textColor = UIColor.whiteColor()
            w.font = UIFont.boldSystemFontOfSize(12)
            w.sizeToFit()
            w.center = CGPoint(x: circle.bounds.midX, y: circle.bounds.midY)

            UIView.animateWithDuration(1) {
                
                circle.addSubview(w)
                let scaleTransform = CGAffineTransformMakeScale(1.5, 1.5)
                w.transform = scaleTransform
                w.textColor =  UIColor.cyanColor()
                circle.backgroundColor = UIColor.whiteColor()
                
                containerView.backgroundColor = UIColor.lightGrayColor()
                
                label.textColor = UIColor.whiteColor()

            }

        }
        
       
}
