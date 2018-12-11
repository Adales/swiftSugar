// UIScreen+.swift [SwiftSugar] created by: Adas Lesniak on: 07/11/2018
import Foundation


//UIScreen is as stupid name as you can get - of coruse there are >no UI< screens... like for example... antielectrostatic screens
@objc public class Screen : NSObject {
    public static var size: CGSize {
        return UIScreen.main.bounds.size
    }
    public static var scale: CGFloat {
        return UIScreen.main.scale
    }
    public static var resolution: CGSize {
        return UIScreen.main.bounds.size * UIScreen.main.scale
    }
    @objc public static var width: CGFloat {
        return UIScreen.main.bounds.size.width
    }
    @objc public static var height: CGFloat {
        return UIScreen.main.bounds.size.height
    }
    //need some simple way to differentiate screens with notch which needs to have different UI around this crappy thingie
    @objc public static var hasNotch: Bool {
        if #available(iOS 11.0, *) {
            let safeInsets = UIApplication.shared.windows[0].safeAreaInsets
            let notchMargin: CGFloat = 20
            switch (UIApplication.shared.statusBarOrientation) {
            case .portrait:
                return safeInsets.top > notchMargin
            case .landscapeLeft:
                return safeInsets.left > notchMargin
            case .landscapeRight:
                return safeInsets.right > notchMargin
            case .portraitUpsideDown:
                return safeInsets.bottom > notchMargin
            default:
                return safeInsets.top > notchMargin
            }
        } else {
            return false;
        }
    }
}
