//
//  Image.swift
//  Tools-Swift
//
//  Created by 王树军 on 2018/11/26.
//  Copyright © 2018 王树军. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    public class js {// 加入调用命名空间js
        // 颜色渐变 默认左右方向
        public class func gradientImage(gradientColors: [UIColor],
                                        size: CGSize = CGSize.init(width: 10, height: 10),
                                        start: CGPoint = .zero,
                                        end: CGPoint?) ->  UIImage?
        {
            UIGraphicsBeginImageContextWithOptions(size, true, 0)
            let colorSpace = CGColorSpaceCreateDeviceRGB()
            var pEnd: CGPoint = CGPoint (x: size.width, y: 0)
            if let e:CGPoint = end {
                pEnd = e
            }
            let colors = gradientColors.map {(color: UIColor) -> AnyObject? in return color.cgColor  } as NSArray
            if let gradient = CGGradient(colorsSpace: colorSpace, colors: colors, locations: nil), let context = UIGraphicsGetCurrentContext()  {
                // 第二个参数是起始位置，第三个参数是终止位置
                context.drawLinearGradient(gradient, start: start, end: pEnd, options: CGGradientDrawingOptions(rawValue: 0));
            }
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return image
        }
    }
}
