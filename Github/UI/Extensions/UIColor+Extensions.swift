import UIKit

extension UIColor {
    public convenience init(r:CGFloat, g:CGFloat, b:CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1.0)
    }
    
    static var githubDarkGray: UIColor {
        return UIColor(r: 36, g: 41, b: 46)
    }
    
    static var githubYellow: UIColor {
        return UIColor(r: 252, g: 170, b: 68)
    }
    
    static var githubBlue: UIColor {
        return UIColor(r: 3, g: 102, b: 214)
    }
}
