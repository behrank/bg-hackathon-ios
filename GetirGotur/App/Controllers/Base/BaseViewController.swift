//
//  BaseViewController.swift
//  Near
//
//  Created by Behran Kankul on 3.02.2018.
//  Copyright © 2018. All rights reserved.
//

import UIKit
import Marshal

class BaseViewController: UIViewController {
    
    fileprivate let loadingView = LoadingView.fromNib()
    
    private var activityCount = 0 {
        didSet {
            DispatchQueue.main.async { [unowned self] in
                UIApplication.shared.isNetworkActivityIndicatorVisible = self.activityCount > 0
            }
        }
    }
    
    private var loadingCount = 0 {
        didSet {
            DispatchQueue.main.async { [unowned self] in
                self.loadingView.isOnFire = self.loadingCount > 0
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if shouldListenKeyboardNotification() {
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShownNotif(_:)), name: .UIKeyboardWillShow, object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHideNotif(_:)), name: .UIKeyboardWillHide, object: nil)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handleNavbarTitleView()

    }
    func pushNetworkActivity() {
        activityCount += 1
    }
    
    func popNetworkActivity() {
        if activityCount > 0 { activityCount -= 1 }
    }
    
    func toggleLoading()
    {
        if loadingCount > 0 { loadingCount -= 1 }
        else {
            loadingCount += 1
        }
        
    }
    
    func showNotReachablePopup() {
        
        let alert = UIAlertController(title: "Hata", message: "İnternet erişimi yok.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
        
        DispatchQueue.main.async { [weak self] in
            self?.present(alert, animated: true)
        }
    }
    
    func showAlert(for title:String, and message:String,isQuestion:Bool,buttonTitles:[String],completion:@escaping (Bool) ->Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: buttonTitles[0], style: .default, handler: { action in
            completion(true)
        }))
        
        if isQuestion {
            alert.addAction(UIAlertAction(title: buttonTitles[1], style: .cancel,handler: { action in
                completion(false)
            }))
        }
        DispatchQueue.main.async { [weak self] in
            self?.present(alert, animated: true)
        }
    }
    // MARK: Helpers
    internal func shouldListenKeyboardNotification() -> Bool {
        return false
    }
    
    internal func keyboardNotification(willShow:Bool,endFrame:CGRect) {
        
    }
    
    
    internal func tsTitle() -> String? {
        return nil
    }
    
    internal func tsSubTitle() -> String? {
        return nil
    }
    
    // MARK: DeInit
    deinit {
        #if DEBUG
            debugPrint("\(NSStringFromClass(self.classForCoder)) deinitialized")
        #endif
        if shouldListenKeyboardNotification() {
            NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
            NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
        }
    }
}
fileprivate extension BaseViewController {
    func handleNavbarTitleView() {
        guard let title = tsTitle(), let subtitle = tsSubTitle() else {
            self.navigationItem.titleView = titleImage
            return
        }
        let tsTitleNavbar = TSTitleView.fromNib()
        tsTitleNavbar.setup(title, subtitle: subtitle)
        self.navigationItem.titleView = tsTitleNavbar
    }
    
    var titleImage : UIImageView {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "rocket_small"))
        return imageView
    }
    @objc func keyboardWillShownNotif(_ notification:Notification) {
        self.handleKeyboardNotif(notification: notification, willShow: true)
    }
    
    @objc func keyboardWillHideNotif(_ notification:Notification) {
        self.handleKeyboardNotif(notification: notification, willShow: false)
    }
    
    func handleKeyboardNotif(notification:Notification, willShow:Bool) {
        if let userInfo = notification.userInfo {
            let endFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            let duration:TimeInterval = (userInfo[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
            let animationCurveRawNSN = userInfo[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber
            let animationCurveRaw = animationCurveRawNSN?.uintValue ?? UIViewAnimationOptions.curveEaseInOut.rawValue
            let animationCurve:UIViewKeyframeAnimationOptions = UIViewKeyframeAnimationOptions(rawValue: animationCurveRaw)
            self.keyboardNotification(willShow: willShow, endFrame: endFrame!)
            UIView.animateKeyframes(withDuration: duration, delay: 0, options: animationCurve, animations: {
                self.view.layoutIfNeeded()
            }, completion: { (finished) in })
        }
    }
}

