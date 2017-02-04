//
//  BattingOrder6.swift
//  hamuouenka
//
//  Created by 島田裕 on 2016/09/10.
//  Copyright © 2016年 shimayu. All rights reserved.
//

import UIKit


class BattingOrder6: UIViewController {
    
    @IBOutlet weak var name6: UILabel!
    //@IBOutlet weak var songtext6: UITextView!
    @IBOutlet weak var songtext6: UILabel!
    
    override func viewDidLoad() {
        
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        name6.text = "\(appDelegate.playerdata[5][1]):背番号　\(appDelegate.playerdata[5][0])"
        songtext6.text = "\(appDelegate.playerdata[5][2])"
    }
}
