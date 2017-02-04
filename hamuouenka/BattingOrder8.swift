//
//  BattingOrder8.swift
//  hamuouenka
//
//  Created by 島田裕 on 2016/09/10.
//  Copyright © 2016年 shimayu. All rights reserved.
//

import UIKit


class BattingOrder8: UIViewController {
    
    @IBOutlet weak var name8: UILabel!
    //@IBOutlet weak var songtext8: UITextView!
    @IBOutlet weak var songtext8: UILabel!
    
    override func viewDidLoad() {
        
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        name8.text = "\(appDelegate.playerdata[7][1]):背番号　\(appDelegate.playerdata[7][0])"
        songtext8.text = "\(appDelegate.playerdata[7][2])"
    }
}
