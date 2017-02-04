//
//  BO1.swift
//  hamuouenka
//
//  Created by 島田裕 on 2016/09/08.
//  Copyright © 2016年 shimayu. All rights reserved.
//

//import Foundation
import UIKit

class BO1: UIViewController {
    
    
    
    @IBOutlet weak var name1: UILabel!
    @IBOutlet weak var name2: UILabel!
    @IBOutlet weak var name3: UILabel!
    @IBOutlet weak var name4: UILabel!
    @IBOutlet weak var name5: UILabel!
    @IBOutlet weak var name6: UILabel!
    @IBOutlet weak var name7: UILabel!
    @IBOutlet weak var name8: UILabel!
    @IBOutlet weak var name9: UILabel!
    
    @IBOutlet weak var songtext1: UITextView!
    @IBOutlet weak var songtext2: UITextView!
    @IBOutlet weak var songtext3: UITextView!
    @IBOutlet weak var songtext4: UITextView!
    @IBOutlet weak var songtext5: UITextView!
    @IBOutlet weak var songtext6: UITextView!
    @IBOutlet weak var songtext7: UITextView!
    @IBOutlet weak var songtext8: UITextView!
    @IBOutlet weak var songtext9: UITextView!
    
    
    override func viewDidLoad() {
        let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let pageindex:Int = appDelegate.pageindex
        
        switch pageindex {
        case 0:
            display(name1,songtext: songtext1,pageindex: pageindex)
        case 1:
            display(name2,songtext: songtext2,pageindex: pageindex)
        case 2:
            display(name3,songtext: songtext3,pageindex: pageindex)
        case 3:
            display(name4,songtext: songtext4,pageindex: pageindex)
        case 4:
            display(name5,songtext: songtext5,pageindex: pageindex)
        case 5:
            display(name6,songtext: songtext6,pageindex: pageindex)
        case 6:
            display(name7,songtext: songtext7,pageindex: pageindex)
        case 7:
            display(name8,songtext: songtext8,pageindex: pageindex)
        case 8:
            display(name9,songtext: songtext9,pageindex: pageindex)
        default:
            print("エラーです")
        }
        
    }
    
    func display(labelname:UILabel,songtext:UITextView,pageindex:Int){
        let appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        labelname.text = appDelegate.playerdata[pageindex][1]+":背番号　"+appDelegate.playerdata[pageindex][0]
        
        songtext.text = appDelegate.playerdata[pageindex][2]
    }
    
    
}