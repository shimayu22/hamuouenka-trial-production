//
//  PlayerSelectViewController.swift
//  hamuouenka
//
//  Created by 島田裕 on 2016/07/17.
//  Copyright © 2016年 shimayu. All rights reserved.
//

import UIKit

class PlayerSelectViewController: UIViewController {
    
    
    //var playerJsonData:[String:[String]] = [:]//辞書型の用意をする
    let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    var order :[Int] = []//スタメンの背番号を保持する
    
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
        
//        Enter.isEnabled = false;
//        
//        for(_,element) in order.enumerated(){
//            let tmpButton = self.view.viewWithTag(element) as? UIButton
//            tmpButton?.isEnabled = true;
//        }
//        
//        order.removeAll()
//        Border.text = "1番を選んでください"
//        debuglabel.text = "選手を選択してください"
        
//        YODAIKAN.isEnabled = true;
//        SUGIYAKENSHI.isEnabled = true;
//        TANAKAKENSUKE.isEnabled = true;
//        LAIRD.isEnabled = true;
//        NAKATASYO.isEnabled = true;
//        NISHIKAWAHARUKI.isEnabled = true;
//        KONDOKENSUKE.isEnabled = true;
//        NAKASHIMATAKUYA.isEnabled = true;
//        OTANISYOHEI.isEnabled = true;
//        ASAMADAIKI.isEnabled = true;
//        OHNOSYOTA.isEnabled = true;
//        OKAHIROMI.isEnabled = true;
//        ISHIKAWASINGO.isEnabled = true;
//        ICHIKAWATOMOYA.isEnabled = true;
//        TANIGUCHIYUYA.isEnabled = true;
        
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
            
//            switch lastelement {
//            case 1:
//                YODAIKAN.isEnabled = true;
//            case 2:
//                SUGIYAKENSHI.isEnabled = true;
//            case 3:
//                TANAKAKENSUKE.isEnabled = true;
//            case 5:
//                LAIRD.isEnabled = true;
//            case 6:
//                NAKATASYO.isEnabled = true;
//            case 7:
//                NISHIKAWAHARUKI.isEnabled = true;
//            case 8:
//                KONDOKENSUKE.isEnabled = true;
//            case 9:
//                NAKASHIMATAKUYA.isEnabled = true;
//            case 11:
//                OTANISYOHEI.isEnabled = true;
//            case 26:
//                ASAMADAIKI.isEnabled = true;
//            case 27:
//                OHNOSYOTA.isEnabled = true;
//            case 31:
//                OKAHIROMI.isEnabled = true;
//            case 49:
//                ISHIKAWASINGO.isEnabled = true;
//            case 56:
//                ICHIKAWATOMOYA.isEnabled = true;
//            case 64:
//                TANIGUCHIYUYA.isEnabled = true;
            
//            default:
//                debuglabel.text = "エラーです"
//            }
            
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
    
    
    //次の画面へデータを送る処理
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let playerselectviewController = segue.destination as! DisplayViewController
//        playerselectviewController.order = order
//        playerselectviewController.playerJsonData = playerJsonData
//        
//    }
    
    //ボタン共通処理
    //func buttonCP(_ number: Int,button:UIButton){
    func buttonCP(button:UIButton){
        if order.count < 9{
            order.append(button.tag)
            button.isEnabled = false;
            
            if order.count < 9{
                Border.text = "\(order.count + 1)番を選んでください"
            }else{
                Enter.isEnabled = true;
                Border.text = "決定ボタンを押してください"
                appDelegate.order = order
            }
        }
        debuglabel.text = String(describing: order)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    //クリア共通処理
    func clearCP(arr:[Int]){
        Enter.isEnabled = false;
        
        for(_,element) in arr.enumerated(){
            let tmpButton = self.view.viewWithTag(element) as? UIButton
            tmpButton?.isEnabled = true;
        }
        
        order.removeAll()
        appDelegate.order = order
        Border.text = "1番を選んでください"
        debuglabel.text = "選手を選択してください"
    }
    
    
    //戻ってくる時の処理
    @IBAction func backToTop(segue: UIStoryboardSegue) {
        clearCP(arr: order)
    }
    
    //選手交代で戻ってきた時の処理
    
    
}
