//
//  BattingOrder1.swift
//  hamuouenka
//
//  Created by 島田裕 on 2016/09/10.
//  Copyright © 2016年 shimayu. All rights reserved.
//

import UIKit


class BattingOrder: UIViewController {
    
    @IBOutlet weak var battingOrder: UILabel!
    @IBOutlet weak var nameNumber: UILabel!
    @IBOutlet weak var songText: UILabel!
    
    
    var bo:String = ""
    var name: String = ""
    var number:Int = 0
    var sngtxt = ""
    
    //@IBOutlet weak var songtext1: UITextView!
    
    //let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        
        //        let playerdata = appDelegate.playerdata
        //        let page = appDelegate.page
        //        let number = page! + 1
        //
        //        battingOrder.text = "\(number)番"
        //        name1.text = "\(playerdata[page!][1]):背番号　\(playerdata[page!][0])"
        //        songtext1.text = "\(playerdata[page!][2])"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.battingOrder!.text = bo
        self.nameNumber!.text = name + " :背番号 " + String(number)
        self.songText!.text = sngtxt
    }
    
    
}
