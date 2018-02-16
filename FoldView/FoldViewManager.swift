import UIKit

extension UIFont {
  func sizeOfString (_ string: NSString, constrainedToWidth width: CGFloat) -> CGSize {
    return string.boundingRect(with: CGSize(width: width, height: 1024),
                               options: NSStringDrawingOptions.usesLineFragmentOrigin,
                               attributes: [NSFontAttributeName: self],
                               context: nil).size
  }
}

@objc(FoldViewManager)
open class FoldViewManager: RCTViewManager {
  var filpOperation: FlipOrientation = .vertical
  fileprivate var foldView: DJKFlipperView? = nil
  
  override open func view() -> UIView! {
    let ins = DJKFlipperView(flipOrientation: filpOperation)
    ins.dataSource = self
    foldView = ins
    return ins
  }
  
}

extension FoldViewManager: DJKFlipperDataSource {
  public func numberOfPages(_ flipper: DJKFlipperView) -> NSInteger {
    return 10
  }
  
  public func viewForPage(_ page: NSInteger, flipper: DJKFlipperView) -> UIView {
    let v = UIView(frame: flipper.bounds)
    v.backgroundColor = UIColor.randomColorArc4()
    return v
  }
}

//MARK: UIColor extension
extension UIColor {
  
  class func randomColorDrand() -> UIColor {
    
    let randomRed:CGFloat = CGFloat(drand48())
    let randomGreen:CGFloat = CGFloat(drand48())
    let randomBlue:CGFloat = CGFloat(drand48())
    
    return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: 1.0)
    
  }
  
  class func randomColorArc4(_ alpha:CGFloat=1.0) -> UIColor {
    let random = arc4random()
    let red = (random & 0xFF0000)>>16
    let green = (random & 0xFF00)>>8
    let blue = random & 0xFF
    
    return UIColor(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: alpha)
  }
  
}
