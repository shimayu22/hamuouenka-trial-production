//
//  BattingOrder5.swift
//  hamuouenka
//
//  Created by 島田裕 on 2016/09/10.
//  Copyright © 2016年 shimayu. All rights reserved.
//

import UIKit


class BattingOrder5: UIViewController {
    
    @IBOutlet weak var name5: UILabel!
    //@IBOutlet weak var songtext5: UITextView!
    @IBOutlet weak var songtext5: UILabel!
    
    override func viewDidLoad() {
        
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        name5.text = "\(appDelegate.playerdata[4][1]):背番号　\(appDelegate.playerdata[4][0])"
        songtext5.text = "\(appDelegate.playerdata[4][2])"
    }
}
