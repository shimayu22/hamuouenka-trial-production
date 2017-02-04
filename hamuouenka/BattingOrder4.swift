//
//  BattingOrder4.swift
//  hamuouenka
//
//  Created by 島田裕 on 2016/09/10.
//  Copyright © 2016年 shimayu. All rights reserved.
//

import UIKit


class BattingOrder4: UIViewController {
    
    @IBOutlet weak var name4: UILabel!
    //@IBOutlet weak var songtext4: UITextView!
    @IBOutlet weak var songtext4: UILabel!
    
    override func viewDidLoad() {
        
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        name4.text = "\(appDelegate.playerdata[3][1]):背番号　\(appDelegate.playerdata[3][0])"
        songtext4.text = "\(appDelegate.playerdata[3][2])"
    }
}
