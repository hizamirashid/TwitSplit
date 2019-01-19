//
//  Extensions.swift
//  TwitSplit
//
//  Created by Massive Infinity on 17/1/19.
//  Copyright © 2019 Hizami Rashid. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Controllers

extension UINavigationController {
    
    // Hide navigation bar
    open override func viewDidLoad() {
//        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//        navigationBar.shadowImage = UIImage()
//        navigationBar.isTranslucent = true
//        view.backgroundColor = UIColor.clear
//        navigationBar.isHidden = true
    }
}

extension UIApplication {
    var statusBarView: UIView? {
        if responds(to: Selector(("statusBar"))) {
            return value(forKey: "statusBar") as? UIView
        }
        return nil
    }
}

extension UIViewController {
    
    // MARK: Activity indicator
    
//    func showLoadingIndicator(title: String) {
//        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
//        hud.label.text = title
//    }
//
//    func dismissLoadingIndicator() {
//        MBProgressHUD.hide(for: self.view, animated: true)
//    }
    
    // MARK: Alerts
    
    func showErrorAlert(message: String?, buttonTitle: String = Constants.Buttons.ok) {
        let alertController = UIAlertController(title: Constants.Titles.error, message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: buttonTitle, style: UIAlertAction.Style.default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
//        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func showInfoAlert(title: String = "", message: String?, buttonTitle: String = Constants.Buttons.ok) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: buttonTitle, style: UIAlertAction.Style.default, handler: nil)
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
//        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func showInfoAlert(title: String = "", message: String?, buttonTitle: String = Constants.Buttons.ok, completion: @escaping () -> Void = {}) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: buttonTitle, style: UIAlertAction.Style.default) {
            (result : UIAlertAction) -> Void in
            completion()
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
//        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    // MARK: Textfield Delegate
    
    @objc func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
        
    }
    
    // MARK: Keyboard
    
    func hideKeyboard(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
    }
}

@IBDesignable
class RoundedView: UIView {
    
    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
}

@IBDesignable
class RoundedTextView: UITextView {
    
    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
}

@IBDesignable
class RoundedButton: UIButton {
    
    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 1.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
}

@IBDesignable
class RoundedImageView: UIImageView {
    
    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 1.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
}

// For all TextFields but changes are not seen in Storyboard
extension UITextField{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
}

// MARK: - Elements

extension String {
    
    public func isValidEmail() -> Bool {
        let emailRegEx = "([A-Z0-9a-z._%+-]|\\p{Han})+@[A-Za-z0-9.-]+\\.[A-Za-z]{1,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    public func isValidAlphabet() -> Bool {
        let notAlphabets = NSCharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ ").inverted
        if self.rangeOfCharacter(from: notAlphabets) == nil {
            return true
        }
        else {
            return false
        }
    }
    
    public func isNumeric() -> Bool {
        let notDigits = NSCharacterSet(charactersIn: ".1234567890").inverted
        if self.rangeOfCharacter(from: notDigits) == nil {
            return true
        }
        else {
            return false
        }
    }
    
    func containsWhiteSpace() -> Bool {
        
        // check if there's a range for a whitespace
        let range = self.rangeOfCharacter(from: .whitespaces)
        
        // range will be nil if no whitespace is found
        if let _ = range {
            return true
        } else {
            return false
        }
    }
    
    func containsCapitalizedLetter() -> Bool {
        
        // check if there's a range for a capital letter
        let capitalLetterRegEx  = ".*[A-Z]+.*"
        let text = NSPredicate(format:"SELF MATCHES %@", capitalLetterRegEx)
        return text.evaluate(with: self)
    }
    
    func trim() -> String {
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
}

/// Extend UITextView and implemented UITextViewDelegate to listen for changes
extension UITextView: UITextViewDelegate {
    
    /// Resize the placeholder when the UITextView bounds change
    override open var bounds: CGRect {
        didSet {
            self.resizePlaceholder()
        }
    }
    
    /// The UITextView placeholder text
    public var placeholder: String? {
        get {
            var placeholderText: String?
            
            if let placeholderLabel = self.viewWithTag(100) as? UILabel {
                placeholderText = placeholderLabel.text
            }
            
            return placeholderText
        }
        set {
            if let placeholderLabel = self.viewWithTag(100) as! UILabel? {
                placeholderLabel.text = newValue
                placeholderLabel.sizeToFit()
            } else {
                self.addPlaceholder(newValue!)
            }
        }
    }
    
    /// When the UITextView did change, show or hide the label based on if the UITextView is empty or not
    ///
    /// - Parameter textView: The UITextView that got updated
    public func textViewDidChange(_ textView: UITextView) {
        if let placeholderLabel = self.viewWithTag(100) as? UILabel {
            placeholderLabel.isHidden = self.text.characters.count > 0
        }
    }
    
    /// Resize the placeholder UILabel to make sure it's in the same position as the UITextView text
    private func resizePlaceholder() {
        if let placeholderLabel = self.viewWithTag(100) as! UILabel? {
            let labelX = self.textContainer.lineFragmentPadding
            let labelY = self.textContainerInset.top - 2
            let labelWidth = self.frame.width - (labelX * 2)
            let labelHeight = placeholderLabel.frame.height
            
            placeholderLabel.frame = CGRect(x: labelX, y: labelY, width: labelWidth, height: labelHeight)
        }
    }
    
    /// Adds a placeholder UILabel to this UITextView
    private func addPlaceholder(_ placeholderText: String) {
        let placeholderLabel = UILabel()
        
        placeholderLabel.text = placeholderText
        placeholderLabel.sizeToFit()
        
        placeholderLabel.font = self.font
        placeholderLabel.textColor = UIColor.lightGray
        placeholderLabel.tag = 100
        
        placeholderLabel.isHidden = self.text.characters.count > 0
        
        self.addSubview(placeholderLabel)
        self.resizePlaceholder()
        self.delegate = self
    }
    
}
