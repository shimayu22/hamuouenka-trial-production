//
//  ChangePlayerViewController.swift
//  hamuouenka
//
//  Created by 島田裕 on 2017/03/18.
//  Copyright © 2017年 shimayu. All rights reserved.
//

import UIKit

class ChangePlayerViewController: UIViewController {
    
    var retainData:RetainData = RetainData.sharedInstance
    var index = 0
    var pP :[Int] = []
    
    @IBOutlet weak var YODAIKAN: UIButton!
    @IBOutlet weak var SUGIYAKENSHI: UIButton!
    @IBOutlet weak var TANAKAKENSUKE: UIButton!
    @IBOutlet weak var LAIRD: UIButton!
    @IBOutlet weak var NAKATASYO: UIButton!
    @IBOutlet weak var NISHIKAWAHARUKI: UIButton!
    @IBOutlet weak var KONDOKENSUKE: UIButton!
    @IBOutlet weak var NAKASHIMATAKUYA: UIButton!
    @IBOutlet weak var OTANISYOHEI: UIButton!
    @IBOutlet weak var ASAMADAIKI: UIButton!
    @IBOutlet weak var OHNOSYOTA: UIButton!
    @IBOutlet weak var OKAHIROMI: UIButton!
    @IBOutlet weak var ISHIKAWASINGO: UIButton!
    @IBOutlet weak var ICHIKAWATOMOYA: UIButton!
    @IBOutlet weak var TANIGUCHIYUYA: UIButton!
    @IBOutlet weak var Enter: UIButton!
    @IBOutlet weak var Cancel: UIButton!
    @IBOutlet weak var Back: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        pP = retainData.participatedPlayer
        
        for _ in  pP{
            let tag:Int = pP[index]
            let tmpButton = self.view.viewWithTag(tag) as? UIButton
            tmpButton?.isEnabled = false
            index += 1
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
