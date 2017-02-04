//
//  BattingOrder9.swift
//  hamuouenka
//
//  Created by 島田裕 on 2016/09/10.
//  Copyright © 2016年 shimayu. All rights reserved.
//

import UIKit


class BattingOrder9: UIViewController {
    
    @IBOutlet weak var name9: UILabel!
    //@IBOutlet weak var songtext9: UITextView!
    @IBOutlet weak var songtext9: UILabel!
    
    override func viewDidLoad() {
        
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        name9.text = "\(appDelegate.playerdata[8][1]):背番号　\(appDelegate.playerdata[8][0])"
        songtext9.text = "\(appDelegate.playerdata[8][2])"
    }
}
