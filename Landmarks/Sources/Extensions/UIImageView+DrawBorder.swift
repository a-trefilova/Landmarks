import  UIKit

extension UIImageView {

    func drawBorder() {

        self.layer.borderWidth = 5
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.white.cgColor
        self.clipsToBounds = true
    }
}
