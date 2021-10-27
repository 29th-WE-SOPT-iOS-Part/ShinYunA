//
//  YoutubeIcon.swift
//  Youtube-Clone
//
//  Created by SHIN YOON AH on 2021/10/28.
//

import UIKit

public enum YoutubeIcon {
    public static var logo: UIImage { .load(name: "logo")}
    public static var ggamju1: UIImage { .load(name: "ggamju1")}
    public static var ggamju2: UIImage { .load(name: "ggamju2")}
    public static var ggamju3: UIImage { .load(name: "ggamju3")}
    public static var ggamju4: UIImage { .load(name: "ggamju4")}
    public static var ggamju5: UIImage { .load(name: "ggamju5")}
    public static var ggamju6: UIImage { .load(name: "ggamju6")}
    public static var ggamju7: UIImage { .load(name: "ggamju7")}
    public static var ggamju8: UIImage { .load(name: "ggamju8")}
    public static var homeIconFill: UIImage { .load(name: "homeIconFill")}
    public static var LibraryIcon: UIImage { .load(name: "LibraryIcon")}
    public static var LibraryIconFill: UIImage { .load(name: "LibraryIconFill")}
    public static var moreMenuIcon: UIImage { .load(name: "moreMenuIcon")}
    public static var notificationIcon: UIImage { .load(name: "notificationIcon")}
    public static var plueCircleIcon: UIImage { .load(name: "plueCircleIcon")}
    public static var premiumLogo: UIImage { .load(name: "premiumLogo")}
    public static var SearchIcon: UIImage { .load(name: "SearchIcon")}
    public static var shortsIconFill: UIImage { .load(name: "shortsIconFill")}
    public static var subscriptionsIcon: UIImage { .load(name: "subscriptionsIcon")}
    public static var subscriptionsIconFill: UIImage { .load(name: "subscriptionsIconFill")}
    public static var wesoptAndroidpart: UIImage { .load(name: "wesoptAndroidpart")}
    public static var wesoptDesignPart: UIImage { .load(name: "wesoptDesignPart")}
    public static var wesoptPlanPart: UIImage { .load(name: "wesoptPlanPart")}
    public static var wesoptProfile: UIImage { .load(name: "wesoptProfile")}
    public static var wesoptServerPart: UIImage { .load(name: "wesoptServerPart")}
    public static var wesoptWebPart: UIImage { .load(name: "wesoptWebPart")}
    public static var windowSharingIcon: UIImage { .load(name: "windowSharingIcon")}
}

extension UIImage {
    fileprivate static func load(name: String) -> UIImage {
        guard let image = UIImage(named: name, in: nil, compatibleWith: nil) else {
            return UIImage()
        }
        image.accessibilityIdentifier = name
        return image
    }
}
