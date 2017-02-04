//
//  BattingOrder7.swift
//  hamuouenka
//
//  Created by 島田裕 on 2016/09/10.
//  Copyright © 2016年 shimayu. All rights reserved.
//

import UIKit


class BattingOrder7: UIViewController {
    
    @IBOutlet weak var name7: UILabel!
    //@IBOutlet weak var songtext7: UITextView!
    @IBOutlet weak var songtext7: UILabel!
    
    override func viewDidLoad() {
        
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        name7.text = "\(appDelegate.playerdata[6][1]):背番号　\(appDelegate.playerdata[6][0])"
        songtext7.text = "\(appDelegate.playerdata[6][2])"
    }
}
