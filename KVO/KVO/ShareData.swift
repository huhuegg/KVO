//
//  ShareData.swift
//  KVO
//
//  Created by zhangminjie on 15/3/6.
//  Copyright (c) 2015年 zhangminjie. All rights reserved.
//

import UIKit

let shareInstance = ShareData()

//被观察属性
enum ShareDataObserved:String {
    case key1 = "key1",
         key2 = "key2"
    
    static let allValues = [key1,key2]
}

//观察者上下文
enum ShareDataObserverContext: Int {
    case First = 1, Second
}

class ShareData: NSObject {
   
    //对要视察的对象的属性加上dynamic关键字
    dynamic var key1 = "label1"
    dynamic var key2 = "label2"
    
    class func share() -> ShareData {
        return shareInstance
    }

    
    //MARK: - KVO
    func addClassObservers(observer:NSObject,context:UnsafeMutablePointer<Void>) {
        for keyPath in ShareDataObserved.allValues {
            addObserver(observer, forKeyPath: keyPath.rawValue, options: NSKeyValueObservingOptions.New, context: context)
        }
    }
    
    func removeClassObservers(observer:NSObject) {
        for keyPath in ShareDataObserved.allValues {
            removeObserver(observer, forKeyPath: keyPath.rawValue)
        }
    }
    
}
