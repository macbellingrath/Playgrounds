//: [Previous](@previous)

import UIKit

let view = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
view.backgroundColor = .cyanColor()


import XCPlayground


XCPlaygroundPage.currentPage.liveView  = view


UIView.animateWithDuration(3, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 10, options: .CurveEaseIn, animations: { 
    
    view.transform = CGAffineTransformMakeRotation(-90)
    
    
    }) { (done) in
        print("done")
}

//: [Next](@next)
displayData = data

UIView.transitionWithView(self.collectionView!,
                          duration: 1.0,
                          options: [.CurveEaseInOut],
                          animations: { () -> Void in
                            self.collectionView?.reloadItemsAtIndexPaths(self.collectionView!.indexPathsForVisibleItems())
                            self.headerController.collectionView?.reloadData()
    }, completion: nil)

        