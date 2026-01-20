import UIKit

extension UIViewController {
    
    public func enableKeyboardDismissOnSwipeUp() {
        // Parmağını yukarı kaydırdığında klavye kapansın
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(_handleKeyboardDismissSwipe(_:)))
        swipeUp.direction = .up
        swipeUp.cancelsTouchesInView = false
        view.addGestureRecognizer(swipeUp)
    }

    @objc private func _handleKeyboardDismissSwipe(_ sender: UISwipeGestureRecognizer) {
        // Klavyeyi kapat
        view.endEditing(true)
    }
}
