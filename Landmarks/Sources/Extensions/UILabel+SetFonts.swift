import UIKit

extension UILabel {
    
    func setFontAndSize(size: CGFloat) -> UILabel {
        self.font = UIFont(name: "Lao Sangam MN", size: size)
        self.numberOfLines = 1
        self.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        return self
    }
    
}
