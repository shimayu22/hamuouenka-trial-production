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
    
    let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        
        let playerdata = appDelegate.playerdata
        let page = appDelegate.page
        let number = page! + 1
        
        battingOrder.text = "\(number)番"
        name1.text = "\(playerdata[page!][1]):背番号　\(playerdata[page!][0])"
        songtext1.text = "\(playerdata[page!][2])"
    }
}
