//
//  UIView+extensions.swift
//  Near
//
//  Created by Behran Kankul on 3.02.2018.
//  Copyright © 2018 Be Mobile. All rights reserved.
//

import UIKit
import Foundation
import QuartzCore
import Alamofire
import CoreImage


struct Platform {
    
    static var isSimulator: Bool {
        return TARGET_OS_SIMULATOR != 0
    }
    
}
extension Array {
    func isEmpty() -> Bool {
        return self.count > 0
    }
}

extension UIViewController
{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}
protocol ModelType { }
extension UIViewController : ModelType { }
extension ModelType where Self : UIViewController {
    static func fromNib(_ nibName : String = String(describing: Self.self)) -> Self {
        return Self(nibName: nibName, bundle: nil)
    }
    
    static func fromStoryboard(_ type : Storyboard.Identifier) -> Self {
        let storyboard : UIStoryboard = UIStoryboard(name: type.storyboardName.rawValue, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: type.rawValue) as! Self
    }
}
extension UIView : ModelType { }
extension ModelType where Self : UIView {
    static func fromNib(_ nibName : String = String(describing: Self.self)) -> Self {
        return Self.create(with: nibName) as! Self
    }
}
@IBDesignable
class DesignableView: UIView {
}

@IBDesignable
class DesignableButton: UIButton {
}

@IBDesignable
class DesignableLabel: UILabel {
}

extension UIView {
    
    open class func create() -> UIView {
        return UIView.create(with: String(describing: self))
    }
    
    open class func create(with nibName:String) -> UIView {
        return Bundle.main.loadNibNamed(nibName, owner: nil, options: nil)?.first as! UIView
    }
    
    func layoutIfNeededAnimated(_ duration : TimeInterval = 0.3) {
        UIView.animate(withDuration: duration) { [weak self] in
            self?.layoutIfNeeded()
        }
    }
    public var x: CGFloat {
        get {
            return self.frame.origin.x
        } set(value) {
            self.frame = CGRect(x: value, y: self.y, width: self.w, height: self.h)
        }
    }
    
    public var y: CGFloat {
        get {
            return self.frame.origin.y
        } set(value) {
            self.frame = CGRect(x: self.x, y: value, width: self.w, height: self.h)
        }
    }
    public var w: CGFloat {
        get {
            return self.frame.size.width
        } set(value) {
            self.frame = CGRect(x: self.x, y: self.y, width: value, height: self.h)
        }
    }
    public var h: CGFloat {
        get {
            return self.frame.size.height
        } set(value) {
            self.frame = CGRect(x: self.x, y: self.y, width: self.w, height: value)
        }
    }
    func origin (_ point : CGPoint){
        frame.origin.x = point.x
        frame.origin.y = point.y
    }
    
    class func initFromNib() -> UIView {
        let mainBundle = Bundle.main
        let className  = NSStringFromClass(self).components(separatedBy: ".").last ?? ""
        
        if ( mainBundle.path(forResource: className, ofType: "nib") != nil ) {
            let objects = mainBundle.loadNibNamed(className, owner: self, options: [:])
            
            for object in objects! {
                if let view = object as? UIView {
                    return view
                }
            }
        }
        
        return UIView(frame: CGRect.zero)
    }
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.borderColor = color.cgColor
            } else {
                layer.borderColor = nil
            }
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

extension UITableView {
    func moveToTop(){
        self.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
    }
    func reloadData(completion: @escaping ()->()) {
        UIView.animate(withDuration: 0, animations: { self.reloadData() })
        { _ in completion() }
    }
}

extension UIScrollView {
    var currentPage:Int{
        return Int((self.contentOffset.x+(0.5*self.frame.size.width))/self.frame.width)+1
    }
}
extension UITextView {
    func numberOfLines() -> Int{
        if let fontUnwrapped = self.font{
            return Int(self.contentSize.height / fontUnwrapped.lineHeight)
        }
        return 0
    }
}
extension UILabel {
    func animateToFont(_ font: UIFont, withDuration duration: TimeInterval,withColor color:UIColor) {
        let oldFont = self.font
        self.font = font
        // let oldOrigin = frame.origin
        let labelScale = oldFont!.pointSize / font.pointSize
        let oldTransform = transform
        transform = transform.scaledBy(x: labelScale, y: labelScale)
        // let newOrigin = frame.origin
        // frame.origin = oldOrigin
        setNeedsUpdateConstraints()
        UIView.animate(withDuration: duration) {
            //    self.frame.origin = newOrigin
            self.textColor = color
            self.transform = oldTransform
            self.layoutIfNeeded()
        }
    }

}
extension UIImage {
    func areaAverage() -> UIColor {
        
        var bitmap = [UInt8](repeating: 0, count: 4)
        
        let context = CIContext(options: nil)
        let cgImg = context.createCGImage(CoreImage.CIImage(cgImage: self.cgImage!), from: CoreImage.CIImage(cgImage: self.cgImage!).extent)
        
        let inputImage = CIImage(cgImage: cgImg!)
        let extent = inputImage.extent
        let inputExtent = CIVector(x: extent.origin.x, y: extent.origin.y, z: extent.size.width, w: extent.size.height)
        let filter = CIFilter(name: "CIAreaAverage", withInputParameters: [kCIInputImageKey: inputImage, kCIInputExtentKey: inputExtent])!
        let outputImage = filter.outputImage!
        let outputExtent = outputImage.extent
        assert(outputExtent.size.width == 1 && outputExtent.size.height == 1)
        
        // Render to bitmap.
        context.render(outputImage, toBitmap: &bitmap, rowBytes: 4, bounds: CGRect(x: 0, y: 0, width: 1, height: 1), format: kCIFormatRGBA8, colorSpace: CGColorSpaceCreateDeviceRGB())
        
        // Compute result.
        let result = UIColor(red: CGFloat(bitmap[0]) / 255.0, green: CGFloat(bitmap[1]) / 255.0, blue: CGFloat(bitmap[2]) / 255.0, alpha: CGFloat(bitmap[3]) / 255.0)
        return result
    }
}
extension UIImageView {
    func changeImage(with secondImage:UIImage)
    {
        let fadeAnim:CABasicAnimation = CABasicAnimation(keyPath: "contents");
        fadeAnim.fromValue = self.image
        fadeAnim.toValue   = secondImage
        fadeAnim.duration  = 0.2
        
        self.layer.add(fadeAnim, forKey: "contents");
        self.image = secondImage;
    }
}
extension String {
    func makeDateStringReadable() -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = "dd MMMM hh:mm" //25 november saturday, 17.00
        return "• " +  dateFormatter.string(from: date!)
    }
    
    func checkDateStringExpring() -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = dateFormatter.date(from: self)
        
        let calendar = Calendar.current
        var comparison = (calendar as NSCalendar).components(.day, from: Date(), to: date!, options: [])
        if comparison.day! < -28
        {
            return self.makeDateStringReadable()
        }
        else if comparison.day! > -21 && comparison.day! < -29
        {
            return "• 3 hafta"
        }
        else if comparison.day! < -14 && comparison.day! > -22
        {
            return "• 2 hafta"
        }
        else if comparison.day! < -7 && comparison.day! > -14
        {
            return "• 1 hafta"
        }
        else if comparison.day! <= -1 && comparison.day! > -8
        {
            return "• \(comparison.day! * -1) gün"
        }
        else if comparison.day! > -1 {
            comparison = (calendar as NSCalendar).components(.hour, from: Date(), to: date!, options: [])
            
            if comparison.hour! > -1 {
                comparison = (calendar as NSCalendar).components(.minute, from: Date(), to: date!, options: [])
                
                return "• \(comparison.minute!  * -1) dakika"
            }
            else {
                return "• \(comparison.hour! * -1) saat"
            }
        }
        else{
            return self.makeDateStringReadable()
        }
    }
    static func compareDateByHour(_ text:String) -> Int
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = dateFormatter.date(from: text)
        
        let calendar = Calendar.current
        print("Hour Diff: \(String(describing: (calendar as NSCalendar).components(.day, from: Date(), to: date!, options: []).hour))")
        
        return (calendar as NSCalendar).components(.day, from: Date(), to: date!, options: []).hour!
    }
    func removeRepeaterHashtags() -> String{
        var returnStr = ""
        var tmpArr = [String]()
        let words = self.split{$0 == ","}.map(String.init)
        
        for x:String in words {
            if tmpArr.contains(String(x)){
                
            }else{
                tmpArr.append(x)
            }
        }
        for y:String in tmpArr {
            if returnStr == "" {
                returnStr = y + ","
            }
            else if tmpArr.index(of: y) == tmpArr.count - 1 {
                returnStr = returnStr + y
            }
            else{
                returnStr = returnStr + y + ","
            }
        }
        return returnStr
    }
}
public extension UIDevice {
    
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        case "iPod5,1":                                 return "iPod Touch 5"
        case "iPod7,1":                                 return "iPod Touch 6"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
        case "iPhone4,1":                               return "iPhone 4s"
        case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
        case "iPhone7,2":                               return "iPhone 6"
        case "iPhone7,1":                               return "iPhone 6 Plus"
        case "iPhone8,1":                               return "iPhone 6s"
        case "iPhone8,2":                               return "iPhone 6s Plus"
        case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
        case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
        case "iPhone8,4":                               return "iPhone SE"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
        case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
        case "iPad6,3", "iPad6,4", "iPad6,7", "iPad6,8":return "iPad Pro"
        case "AppleTV5,3":                              return "Apple TV"
        case "i386", "x86_64":                          return "Simulator"
        default:                                        return identifier
        }
    }
}
extension UICollectionView{
    //    var currentIndexPath : NSIndexPath{
    //    get{
    //        return objc_getAssociatedObject(self,kIndexPathPointer) as NSIndexPath
    //    }set{
    //        objc_setAssociatedObject(self, kIndexPathPointer, newValue, objc_AssociationPolicy(OBJC_ASSOCIATION_RETAIN_NONATOMIC))
    //    }} WTF! error when building, it's a bug
    //    http://stackoverflow.com/questions/24021291/import-extension-file-in-swift
    
    func setToIndexPath (_ indexPath : IndexPath){
        objc_setAssociatedObject(self, &kIndexPathPointer, indexPath, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    
    func toIndexPath () -> IndexPath {
        let index = self.contentOffset.x/self.frame.size.width
        if index > 0{
            return IndexPath(row: Int(index), section: 0)
        }else if let indexPath = objc_getAssociatedObject(self,&kIndexPathPointer) as? IndexPath {
            return indexPath
        }else{
            return IndexPath(row: 0, section: 0)
        }
    }
    
    func fromPageIndexPath () -> IndexPath{
        let index : Int = Int(self.contentOffset.x/self.frame.size.width)
        return IndexPath(row: index, section: 0)
    }
}
