//
//  BattingOrder1.swift
//  hamuouenka
//
//  Created by Yutaka Shimada on 2016/09/10.
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
    
    override func viewDidLoad() {
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.battingOrder!.text = bo
        self.nameNumber!.text = name + " :背番号 " + String(number)
        self.songText!.text = sngtxt

    }
}
