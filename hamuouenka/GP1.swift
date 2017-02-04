//
//  GP1.swift
//  hamuouenka
//
//  Created by 島田裕 on 2016/08/10.
//  Copyright © 2016年 shimayu. All rights reserved.
//

import Foundation




@IBAction func YODAIKAN(sender: AnyObject){
    if order.count < 9 {
        order.append(1)
        debuglabel.text = String(order)
        YODAIKAN.enabled = false;
        
    }
}

@IBAction func SUGIYAKENSHI(sender: AnyObject){
    if order.count < 9 {
        order.append(2)
        debuglabel.text = String(order)
        SUGIYAKENSHI.enabled = false;
    }
}
@IBAction func TANAKAKENSUKE(sender: AnyObject){
    if order.count < 9 {
        order.append(3)
        debuglabel.text = String(order)
        TANAKAKENSUKE.enabled = false;
    }
}

@IBAction func LAIRD(sender: AnyObject){
    if order.count < 9 {
        order.append(5)
        debuglabel.text = String(order)
        LAIRD.enabled = false;
    }
}
@IBAction func NAKATASYO(sender: AnyObject){
    if order.count < 9 {
        order.append(6)
        debuglabel.text = String(order)
        NAKATASYO.enabled = false;
    }
}
@IBAction func NISHIKAWAHARUKI(sender: AnyObject){
    if order.count < 9 {
        order.append(7)
        debuglabel.text = String(order)
        NISHIKAWAHARUKI.enabled = false;
    }
}
@IBAction func KONDOKENSUKE(sender: AnyObject){
    if order.count < 9 {
        order.append(8)
        debuglabel.text = String(order)
        KONDOKENSUKE.enabled = false;
    }
}
@IBAction func NAKASHIMATAKUYA(sender: AnyObject){
    if order.count < 9 {
        order.append(9)
        debuglabel.text = String(order)
        NAKASHIMATAKUYA.enabled = false;
    }
}

@IBAction func OTANISYOHEI(sender: AnyObject){
    if order.count < 9 {
        order.append(11)
        debuglabel.text = String(order)
        OTANISYOHEI.enabled = false;
    }
}

@IBAction func ASAMADAIKI(sender: AnyObject){
    if order.count < 9 {
        order.append(26)
        debuglabel.text = String(order)
        ASAMADAIKI.enabled = false;
    }
    
}

@IBAction func OHNOSYOTA(sender: AnyObject){
    if order.count < 9 {
        order.append(27)
        debuglabel.text = String(order)
        OHNOSYOTA.enabled = false;
    }
    
}

@IBAction func OKAHIROMI(sender: AnyObject){
    if order.count < 9 {
        order.append(31)
        debuglabel.text = String(order)
        OKAHIROMI.enabled = false;
    }
    
}

@IBAction func ISHIKAWASHINGO(sender: AnyObject){
    if order.count < 9 {
        order.append(49)
        debuglabel.text = String(order)
        ISHIKAWASINGO.enabled = false;
    }
    
}

@IBAction func ICHIKAWAYUYA(sender: AnyObject){
    if order.count < 9 {
        order.append(56)
        debuglabel.text = String(order)
        ICHIKAWAYUYA.enabled = false;
    }
    
}

@IBAction func TANIGUCHIYUYA(sender: AnyObject){
    if order.count < 9 {
        order.append(64)
        debuglabel.text = String(order)
        TANIGUCHIYUYA.enabled = false;
    }
    
}
