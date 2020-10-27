import UIKit
extension NSMutableAttributedString {
    
    func addStarToFavourite(string: String, isFav: Bool) -> NSMutableAttributedString {
        
        let attributedString = NSMutableAttributedString(string: string)
        guard let starImage = UIImage(systemName: "star.fill") else { return attributedString }
        let attachment = NSTextAttachment(image: starImage)
        let imageString = NSAttributedString(attachment:attachment)
        
        if isFav {
            attributedString.append(imageString)
            attributedString.addAttribute(.foregroundColor,
                                          value: UIColor.orange,
                                          range: NSRange(location: attributedString.length - 1, length: 1))
        }
        
        return attributedString
    }
}
