//
//  BattingOrder1.swift
//  hamuouenka
//
//  Created by 島田裕 on 2016/09/10.
//  Copyright © 2016年 shimayu. All rights reserved.
//

import UIKit


class BattingOrder1: UIViewController {
    
    @IBOutlet weak var name1: UILabel!
    @IBOutlet weak var songtext1: UILabel!
    @IBOutlet weak var battingOrder: UILabel!
    
    //@IBOutlet weak var songtext1: UITextView!
    
    override func viewDidLoad() {
        
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        
        
        //battingOrder.text = "1番"
        name1.text = "\(appDelegate.playerdata[appDelegate.page][1]):背番号　\(appDelegate.playerdata[appDelegate.page][0])"
        songtext1.text = "\(appDelegate.playerdata[appDelegate.page][2])"
    }
}
