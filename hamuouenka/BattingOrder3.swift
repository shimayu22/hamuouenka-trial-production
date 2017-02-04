//
//  BattingOrder3.swift
//  hamuouenka
//
//  Created by 島田裕 on 2016/09/10.
//  Copyright © 2016年 shimayu. All rights reserved.
//

import UIKit


class BattingOrder3: UIViewController {
    
    @IBOutlet weak var name3: UILabel!
    //@IBOutlet weak var songtext3: UITextView!
    @IBOutlet weak var songtext3: UILabel!
    
    override func viewDidLoad() {
        
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        name3.text = "\(appDelegate.playerdata[2][1]):背番号　\(appDelegate.playerdata[2][0])"
        songtext3.text = "\(appDelegate.playerdata[2][2])"
    }
}
