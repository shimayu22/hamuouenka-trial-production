//
//  BattingOrder2.swift
//  hamuouenka
//
//  Created by 島田裕 on 2016/09/10.
//  Copyright © 2016年 shimayu. All rights reserved.
//

import UIKit


class BattingOrder2: UIViewController {
    
    @IBOutlet weak var name2: UILabel!
    //@IBOutlet weak var songtext2: UITextView!
    @IBOutlet weak var songtext2: UILabel!
    
    override func viewDidLoad() {
        
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        name2.text = "\(appDelegate.playerdata[1][1]):背番号　\(appDelegate.playerdata[1][0])"
        songtext2.text = "\(appDelegate.playerdata[1][2])"
    }
}
