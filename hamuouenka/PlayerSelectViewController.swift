//
//  PlayerSelectViewController.swift
//  hamuouenka
//
//  Created by 島田裕 on 2016/07/17.
//  Copyright © 2016年 shimayu. All rights reserved.
//

import UIKit

class PlayerSelectViewController: UIViewController {
    
    var order :[Int] = []//スタメンの背番号を保持する
    var retainData:RetainData = RetainData.sharedInstance
    
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
    @IBOutlet weak var clear: UIButton!
    @IBOutlet weak var Enter: UIButton!
    @IBOutlet weak var Back: UIButton!
    @IBOutlet weak var debuglabel: UILabel!
    @IBOutlet weak var Border: UILabel!
    
    @IBAction func clear(_ sender:AnyObject){
        clearCP(arr: order)
    }
    
    @IBAction func Back(_ sender:AnyObject){
        if order.isEmpty {
            debuglabel.text = "選手を選択してください"
            
        }else{
            let lastelement:Int = order.last!
            Enter.isEnabled = false;
            
            let tmpButton = self.view.viewWithTag(lastelement) as? UIButton
            tmpButton?.isEnabled = true;
            
            order.removeLast()
            if order.isEmpty{
                debuglabel.text = "選手を選択してください"
            }else{
                debuglabel.text = String(describing: order)
            }
            Border.text = "\(order.count + 1)番を選んでください"
        }
    }
    
    @IBAction func YODAIKAN(_ sender:AnyObject){
        buttonCP(button: sender as! UIButton)
    }
    
    @IBAction func SUGIYAKENSHI(_ sender:AnyObject){
        buttonCP(button: sender as! UIButton)
    }
    
    @IBAction func TANAKAKENSUKE(_ sender:AnyObject){
        buttonCP(button: sender as! UIButton)
    }
    
    @IBAction func LAIRD(_ sender:AnyObject){
        buttonCP(button: sender as! UIButton)
    }
    
    @IBAction func NAKATASYO(_ sender:AnyObject){
        buttonCP(button: sender as! UIButton)
    }
    
    @IBAction func NISHIKAWAHARUKI(_ sender:AnyObject){
        buttonCP(button: sender as! UIButton)
    }
    
    @IBAction func KONDOKENSUKE(_ sender:AnyObject){
        buttonCP(button: sender as! UIButton)
    }
    
    @IBAction func NAKASHIMATAKUYA(_ sender:AnyObject){
        buttonCP(button: sender as! UIButton)
    }
    
    @IBAction func OTANISYOHEI(_ sender:AnyObject){
        buttonCP(button: sender as! UIButton)
    }
    
    @IBAction func ASAMADAIKI(_ sender:AnyObject){
        buttonCP(button: sender as! UIButton)
    }
    
    @IBAction func OHNOSYOTA(_ sender:AnyObject){
        buttonCP(button: sender as! UIButton)
    }
    
    @IBAction func OKAHIROMI(_ sender:AnyObject){
        buttonCP(button: sender as! UIButton)
    }
    
    @IBAction func ISHIKAWASINGO(_ sender:AnyObject){
        buttonCP(button: sender as! UIButton)
    }
    
    @IBAction func ICHIKAWATOMOYA(_ sender:AnyObject){
        buttonCP(button: sender as! UIButton)
    }
    
    @IBAction func TANIGUTCHIYUYA(_ sender:AnyObject){
        buttonCP(button: sender as! UIButton)
    }
    
    
    //ボタン共通処理
    func buttonCP(button:UIButton){
        if order.count < 9{
            order.append(button.tag)
            button.isEnabled = false;
            
            if order.count < 9{
                Border.text = "\(order.count + 1)番を選んでください"
            }else{
                Enter.isEnabled = true;
                Border.text = "決定ボタンを押してください"
                retainData.order = order
                retainData.participatedPlayer = order
            }
        }
        debuglabel.text = String(describing: order)
    }
    
    //クリア共通処理
    func clearCP(arr:[Int]){
        Enter.isEnabled = false;
        
        for(_,element) in arr.enumerated(){
            let tmpButton = self.view.viewWithTag(element) as? UIButton
            tmpButton?.isEnabled = true;
        }
        
        order.removeAll()
        retainData.order = order
        Border.text = "1番を選んでください"
        debuglabel.text = "選手を選択してください"
    }
    
    
    //戻ってくる時の処理
    @IBAction func backToTop(segue: UIStoryboardSegue) {
        clearCP(arr: order)
        retainData.participatedPlayer.removeAll()
    }
    
    
}
