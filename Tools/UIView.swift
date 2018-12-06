//
//  UIView.swift
//  YZTAILawyer
//
//  Created by 王树军 on 2018/12/3.
//  Copyright © 2018 王树军. All rights reserved.
//

import Foundation
import UIKit

extension JS where Base: UIView {
    
    /// 获取当前view所在的控制器
    func viewController()->UIViewController?{
        
        for view in sequence(first: base.superview, next: {$0?.superview}){
            
            if let responder = view?.next{
                
                if responder.isKind(of: UIViewController.self){
                    
                    return responder as? UIViewController
                }
            }
        }
        return nil
    }

}
