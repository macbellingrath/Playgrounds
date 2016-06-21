import UIKit


public class DetailViewController: UIViewController, TransitionAnimatorProtocol {
    
    lazy var headerView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 200))
        view.backgroundColor = .cyanColor()
        return view
    }()
    private let dismissSelector = #selector(dismiss)
    public init() {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .whiteColor()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(headerView)
        view.updateConstraintsIfNeeded()
        headerView.updateConstraintsIfNeeded()
        headerView.layoutIfNeeded()
        
        addDismissGesture()
    }
    
    func addDismissGesture() {
        let dismissGesture = UISwipeGestureRecognizer(target: self, action: dismissSelector)
        dismissGesture.direction = .Down
        view.addGestureRecognizer(dismissGesture)
    }
    
    func dismiss(sender: UISwipeGestureRecognizer){
        navigationController!.dismissViewControllerAnimated(true, completion: nil)
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func updateViewConstraints() {
        
        headerView.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor).active = true
        headerView.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor).active = true
        headerView.topAnchor.constraintEqualToAnchor(view.topAnchor).active = true
        headerView.heightAnchor.constraintEqualToConstant(200).active = true
        
        super.updateViewConstraints()
    }
    public func viewForTransition(presenting: Bool) -> UIView {
        return headerView
    }
}