//
//  SecondViewController.swift
//  KVO
//
//  Created by zhangminjie on 15/3/6.
//  Copyright (c) 2015年 zhangminjie. All rights reserved.
//

import UIKit

private var myContext = ShareDataObserverContext.Second


class SecondViewController: UIViewController {
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!

    var share = ShareData.share()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        share.addClassObservers(self, context: &myContext)
    }

    deinit {
        share.removeClassObservers(self, context: &myContext)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    func configView() {
        label1.text = share.key1
        label2.text = share.key2
    }
    

    @IBAction func changeLabel1ButtonClicked(sender: AnyObject) {
        share.setValue("Second key1", forKey: ShareDataObserved.key1.rawValue)
    }
    @IBAction func changeLabel2ButtonClicked(sender: AnyObject) {
        share.setValue("Second key2", forKey: ShareDataObserved.key2.rawValue)
    }
    

    //MARK: - KVO
    override func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        if context == &myContext {
            switch keyPath {
            case ShareDataObserved.key1.rawValue:
                configView()
            case ShareDataObserved.key2.rawValue:
                configView()
            default:
                println("unknow keyPath:\(keyPath)")
            }
        }
    }
}
