import UIKit
import XCPlayground



enum WWViewControllerTransitionType {
    case present, dismiss
}

class RealWeddingLandingPageLayout: UICollectionViewFlowLayout {
    private var cache: [NSIndexPath: UICollectionViewLayoutAttributes] = [:]
    override func prepareLayout() {
        super.prepareLayout()
        guard let collectionView = collectionView else { return }
      
        for section in 0..<collectionView.numberOfSections() {
            for item in 0..<collectionView.numberOfItemsInSection(section) {
                
            }
        }

    }
    
    
    
}








import XCPlayground


private extension UIView {
    var snapshot: UIImage {
        UIGraphicsBeginImageContext(self.bounds.size)
        let context = UIGraphicsGetCurrentContext()!
        layer.renderInContext(context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}


protocol TransitionAnimatorDelegate: class {
    
    func transition(transition: TransitionAnimator,startingFrameForView targetView: UIView, relativeToView relativeView: UIView, fromVC: UIViewController, toVC: UIViewController) -> CGRect
    
    
    func transition(transition: TransitionAnimator,finishingFrameForView targetView: UIView, relativeToView relativeView: UIView, fromVC: UIViewController, toVC: UIViewController) -> CGRect
    
    

    func supplementaryViews(forTransition transition: TransitionAnimator) -> [UICollectionReusableView]
    
    func transition(transition: TransitionAnimator,frameForSupplementaryView supplementaryView: UIView, relativeToView relativeView: UIView) -> CGRect

}


class TransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    weak var delegate: TransitionAnimatorDelegate?
    let targetView: UIView
    var type:WWViewControllerTransitionType
    let duration: NSTimeInterval
    public var fadeColor: UIColor = .whiteColor()
   
    init(targetView: UIView,type: WWViewControllerTransitionType, duration: NSTimeInterval, delegate: TransitionAnimatorDelegate ) {
        self.delegate = delegate
        self.targetView = targetView
        self.type = type
        self.duration = duration
    }

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return duration
    }
   
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        guard let containerView = transitionContext.containerView(),
              let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey),
              let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey),
              let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey),
              let toView = transitionContext.viewForKey(UITransitionContextToViewKey) else { return }
        
        let backgroundView = UIView(frame: containerView.frame)
        backgroundView.backgroundColor = fadeColor
        containerView.addSubview(backgroundView)
        
        if type == .present {
            toView.setNeedsLayout()
            toViewController.view.layoutIfNeeded()
        }
        
        guard let startFrame = delegate?.transition(self, startingFrameForView: targetView, relativeToView:fromView, fromVC: fromViewController, toVC: toViewController), let finishingFrame = delegate?.transition(self, finishingFrameForView: targetView, relativeToView: toView, fromVC: fromViewController, toVC: toViewController)  else {
            return fatalError("delegate must return  starting and finishing frames for target view") }
        
        if type == .present {
            let fromControllerSnapshot = fromView.snapshotViewAfterScreenUpdates(false)
            let fadeView = UIView(frame: containerView.bounds)
            fadeView.backgroundColor = fadeColor
            fadeView.alpha = 0
            
            let targetSnapshot = targetView.snapshotViewAfterScreenUpdates(false)
            targetSnapshot.frame = startFrame
            
            let supplementaryContainer = UIView(frame: containerView.bounds)
            supplementaryContainer.backgroundColor = .clearColor()
            
            if let supplementaryViews = delegate?.supplementaryViews(forTransition: self) where supplementaryViews.count > 0 {

                for supplementaryView in supplementaryViews {
                    let supplementarySnapshot = supplementaryView.snapshotViewAfterScreenUpdates(false)
                    supplementarySnapshot.frame = delegate?.transition(self, frameForSupplementaryView: supplementaryView, relativeToView: fromView) ?? CGRectZero
                    supplementaryContainer.addSubview(supplementarySnapshot)
                }
            }
            
            containerView.addSubview(fromControllerSnapshot)
            containerView.addSubview(fadeView)
            containerView.addSubview(targetSnapshot)
            containerView.addSubview(supplementaryContainer)
            
            
            let scaleFactor = finishingFrame.size.width / startFrame.size.width
            
            let endPoint = CGPoint(x: (-startFrame.origin.x * scaleFactor) + finishingFrame.origin.x, y: (-startFrame.origin.y * scaleFactor) + finishingFrame.origin.y)
            
            UIView.animateWithDuration(duration, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: .CurveEaseInOut, animations: {
                
                
                fromControllerSnapshot.transform = CGAffineTransformMakeScale(scaleFactor, scaleFactor)
                fromControllerSnapshot.frame = CGRectMake(endPoint.x, endPoint.y, fromControllerSnapshot.frame.size.width, fromControllerSnapshot.frame.size.height)
    
                
                
                supplementaryContainer.transform = fromControllerSnapshot.transform
                supplementaryContainer.frame = fromControllerSnapshot.frame
                
                
                fadeView.alpha = 1.0
                supplementaryContainer.alpha = 0.0
                
                
                targetSnapshot.frame = finishingFrame
                
                }, completion: { (done) in
                    containerView.addSubview(toView)
                    backgroundView.removeFromSuperview()
                    fadeView.removeFromSuperview()
                    targetSnapshot.removeFromSuperview()
                    
                    transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
            })
        } else {
    
            let toControllerSnapshot = UIImageView(image: toView.snapshot)
     
            let fadeView = UIView(frame: containerView.bounds)
            fadeView.backgroundColor = fadeColor
            fadeView.alpha = 1.0
            
          
            let targetSnapshot = UIImageView(image: targetView.snapshot)
            targetSnapshot.frame = startFrame
            
            let supplementaryContainer = UIView(frame:containerView.bounds)
            supplementaryContainer.backgroundColor = .clearColor()
            if let supplementaryViews = delegate?.supplementaryViews(forTransition: self) {
                
                
             
                for supplementaryView in supplementaryViews {
                    
                    let supplementarySnapshot = UIImageView (image: supplementaryView.snapshot)
                    supplementarySnapshot.frame = delegate?.transition(self, frameForSupplementaryView: supplementarySnapshot, relativeToView: toView) ?? CGRectZero
                    
                    supplementaryContainer.addSubview(supplementarySnapshot)
                }
            }

            let scaleFactor = startFrame.size.width / finishingFrame.size.width
            let startPoint = CGPoint(x:(-finishingFrame.origin.x * scaleFactor) + startFrame.origin.x, y:(-finishingFrame.origin.y * scaleFactor) + startFrame.origin.y)
       
            
            
            
            toControllerSnapshot.transform = CGAffineTransformMakeScale(scaleFactor, scaleFactor)
            toControllerSnapshot.frame = CGRect(x: startPoint.x,y: startPoint.y, width: toControllerSnapshot.frame.size.width, height:toControllerSnapshot.frame.size.height)
        
            
            supplementaryContainer.transform = toControllerSnapshot.transform
            supplementaryContainer.frame = toControllerSnapshot.frame
            supplementaryContainer.alpha = 0.0
        
            
            
            containerView.addSubview(toControllerSnapshot)
            containerView.addSubview(fadeView)
            containerView.addSubview(targetSnapshot)
            containerView.addSubview(supplementaryContainer)
            
            UIView.animateWithDuration(duration, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: .CurveEaseInOut, animations: {
                
                toControllerSnapshot.transform = CGAffineTransformIdentity
                toControllerSnapshot.frame = toView.frame
                
                
                supplementaryContainer.transform = toControllerSnapshot.transform
                supplementaryContainer.frame = toControllerSnapshot.frame
                fadeView.alpha = 0
                supplementaryContainer.alpha = 1
                targetSnapshot.frame = finishingFrame
              
                }, completion: { (done) in
                      containerView.addSubview(toView)
                    backgroundView.removeFromSuperview()
                    toControllerSnapshot.removeFromSuperview()
                    fadeView.removeFromSuperview()
                    targetSnapshot.removeFromSuperview()
            })
        }
    }
}



class VC: UIViewController {
   lazy var topView = UIView(frame: CGRect(origin: CGPointZero, size: CGSize(width: 0, height: 300)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(topView)
        topView.backgroundColor = .lightGrayColor()
        view.backgroundColor = .whiteColor()
        topView.frame = CGRect(origin: CGPointZero, size: CGSize(width: view.bounds.width, height: 150))
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(dismiss))
        swipe.direction = .Down
        topView.addGestureRecognizer(swipe)
        let label =  UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFontOfSize(20)
        label.textAlignment = .Center
        label.textColor = .whiteColor()
        label.text = "Hello"
        label.sizeToFit()
        
        self.topView.addSubview(label)
        label.center = self.view.center
        
        label.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor).active = true
        label.centerYAnchor.constraintEqualToAnchor(self.topView.centerYAnchor).active = true
        

        
        
        UIView.animateWithDuration(2, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 10, options: .CurveEaseIn, animations: {
            label.center.y += 20
            }, completion: nil)
    }
    
    func dismiss() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}



class CollectionVCOne: UICollectionViewController, UICollectionViewDelegateFlowLayout, TransitionAnimatorDelegate {
    
    var data: [Int] = [1]
    var sections: [Int] = [1]
    
    let firstLayout: UICollectionViewFlowLayout
    
    init() {
        firstLayout = UICollectionViewFlowLayout()
        firstLayout.itemSize = CGSize(width: 150, height: 150)
        firstLayout.scrollDirection = .Horizontal
        firstLayout.sectionInset = UIEdgeInsets(top: 30, left: 10, bottom: 10, right: 10)
        super.init(collectionViewLayout:firstLayout)
        collectionView?.backgroundColor = .whiteColor()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return sections.count
    }
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    override func viewDidLoad() {
        collectionView?.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "reuse")
        collectionView?.registerClass(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "reuse")
        super.viewDidLoad()
    }
    
    func addData(newData: [Int]) {
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 100, options:.LayoutSubviews, animations: {
            
        self.collectionView?.performBatchUpdates({

        let ips = newData.enumerate().map({ (index,i) in
            return NSIndexPath(forItem: index, inSection: 0)
        })
        ips.forEach({ (ip) in
        self.collectionView?.insertItemsAtIndexPaths([ip])
        self.data.insert(newData[ip.item], atIndex: 0)
        })
            }, completion: { (done) in
                    
            })
            
            
            
            }) { (done) in
                
        }
      
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("reuse", forIndexPath: indexPath)
        cell.backgroundColor = .lightGrayColor()
        let attr = collectionView.collectionViewLayout.initialLayoutAttributesForAppearingItemAtIndexPath(indexPath)!
        cell.applyLayoutAttributes(attr)
        return cell
    }
    
    
    
    
    lazy var newLayout: UICollectionViewFlowLayout = {
        let newLayout = UICollectionViewFlowLayout()
        newLayout.itemSize = CGSize(width: 300, height: 300)
        newLayout.scrollDirection = .Horizontal
        newLayout.sectionHeadersPinToVisibleBounds = true
        newLayout.sectionInset = UIEdgeInsets(top: 70, left: 70, bottom: 70, right: 70)
        return newLayout
    }()
    
    var selectedRect = CGRectZero
    
    var animator: TransitionAnimator?
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        addData([1])
        selectedRect = collectionView.cellForItemAtIndexPath(indexPath)?.frame ?? CGRectZero
        let destVC = VC()
        
        animator = TransitionAnimator(targetView: destVC.topView, type: .present, duration: 2, delegate: self)
        
        presentViewController(destVC, animated: true, completion: nil)

        collectionView.setCollectionViewLayout(collectionView.collectionViewLayout == firstLayout ? newLayout : firstLayout, animated: true, completion: nil)
    }
    
    //transitioning
    func transition(transition: TransitionAnimator,startingFrameForView targetView: UIView, relativeToView relativeView: UIView, fromVC: UIViewController, toVC: UIViewController) -> CGRect {
        return selectedRect
    }
    
    
    func transition(transition: TransitionAnimator,finishingFrameForView targetView: UIView, relativeToView relativeView: UIView, fromVC: UIViewController, toVC: UIViewController) -> CGRect {
        return CGRect(origin: CGPointZero, size: CGSize(width: 200, height: 150))
    }
    
    
    
    func supplementaryViews(forTransition transition: TransitionAnimator) -> [UICollectionReusableView] {
        return []
    }
    
    func transition(transition: TransitionAnimator,frameForSupplementaryView supplementaryView: UIView, relativeToView relativeView: UIView) -> CGRect {
        return CGRectZero
    }
    
    
}

let vc = CollectionVCOne()
let nav = UINavigationController(rootViewController: vc)



XCPlaygroundPage.currentPage.liveView = nav













