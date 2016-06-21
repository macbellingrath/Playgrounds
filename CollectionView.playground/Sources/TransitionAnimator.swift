import UIKit


public protocol TransitionAnimatorProtocol: class  {
    func viewForTransition(presenting: Bool) -> UIView
}


public class TransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    weak var delegate: TransitionAnimatorProtocol?
    public var presenting = true
    public var duration: NSTimeInterval = 0.8
    
    public func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return duration
    }
    
    public func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
       
        guard let toView = transitionContext.viewForKey(UITransitionContextToViewKey),
        let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey),
        let container = transitionContext.containerView(),
        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey),
        let fromDelegate = fromViewController as? TransitionAnimatorProtocol,
        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey),
        let toDelegate = toViewController as? TransitionAnimatorProtocol
            else { return }
       
        
        print("fromVC  : \(fromViewController), toVC: \(toViewController)")
        container.backgroundColor = .whiteColor()
        
        //hide toView
        toView.alpha = 0
        
        // add toView to container
        container.addSubview(toView)
        
        
        let fromSnapshot = fromDelegate.viewForTransition(true).snapshotViewAfterScreenUpdates(false)
       container.addSubview(fromSnapshot)
        
        
        let toSnapShot = toDelegate.viewForTransition(true).snapshotViewAfterScreenUpdates(true)
        toSnapShot.alpha = 0
        toSnapShot.frame = fromViewController.view.convertRect(fromView.frame, toView: toSnapShot)
        
        container.addSubview(toSnapShot)
        UIView.animateWithDuration(transitionDuration(transitionContext), delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 10, options: .CurveEaseIn, animations: {
            
            fromView.alpha = 0
            fromSnapshot.alpha = 0
            
            toSnapShot.alpha = 1
            toView.alpha = 1
            toSnapShot.frame = toDelegate.viewForTransition(true).frame
            
            toView.transform = CGAffineTransformIdentity
            toSnapShot.transform = CGAffineTransformIdentity
            
        }) { (done) in
            
            fromView.removeFromSuperview()
            
            toSnapShot.removeFromSuperview()
            fromSnapshot.removeFromSuperview()
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
        }
    }
}