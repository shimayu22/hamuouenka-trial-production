//
//  PlayerSelectViewController.swift
//  hamuouenka
//
//  Created by 島田裕 on 2016/07/17.
//  Copyright © 2016年 shimayu. All rights reserved.
//

import UIKit

class PlayerSelectViewController: UIViewController {
    
    
    var playerJsonData:[String:[String]] = [:]//辞書型の用意をする
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
    
    
    
    @IBAction func clear(_ sender:AnyObject){
        order.removeAll()
        
        Enter.isEnabled = false;
        YODAIKAN.isEnabled = true;
        SUGIYAKENSHI.isEnabled = true;
        TANAKAKENSUKE.isEnabled = true;
        LAIRD.isEnabled = true;
        NAKATASYO.isEnabled = true;
        NISHIKAWAHARUKI.isEnabled = true;
        KONDOKENSUKE.isEnabled = true;
        NAKASHIMATAKUYA.isEnabled = true;
        OTANISYOHEI.isEnabled = true;
        ASAMADAIKI.isEnabled = true;
        OHNOSYOTA.isEnabled = true;
        OKAHIROMI.isEnabled = true;
        ISHIKAWASINGO.isEnabled = true;
        ICHIKAWATOMOYA.isEnabled = true;
        TANIGUCHIYUYA.isEnabled = true;
        Border.text = "1番を選んでください"
        
    }
    
    @IBAction func Back(_ sender:AnyObject){
        if order.isEmpty {
            debuglabel.text = "選手を選択してください"
            
        }else{
            let lastelement:Int = order.last!
            Enter.isEnabled = false;
            
            switch lastelement {
            case 1:
                YODAIKAN.isEnabled = true;
            case 2:
                SUGIYAKENSHI.isEnabled = true;
            case 3:
                TANAKAKENSUKE.isEnabled = true;
            case 5:
                LAIRD.isEnabled = true;
            case 6:
                NAKATASYO.isEnabled = true;
            case 7:
                NISHIKAWAHARUKI.isEnabled = true;
            case 8:
                KONDOKENSUKE.isEnabled = true;
            case 9:
                NAKASHIMATAKUYA.isEnabled = true;
            case 11:
                OTANISYOHEI.isEnabled = true;
            case 26:
                ASAMADAIKI.isEnabled = true;
            case 27:
                OHNOSYOTA.isEnabled = true;
            case 31:
                OKAHIROMI.isEnabled = true;
            case 49:
                ISHIKAWASINGO.isEnabled = true;
            case 56:
                ICHIKAWATOMOYA.isEnabled = true;
            case 64:
                TANIGUCHIYUYA.isEnabled = true;
                
            default:
                debuglabel.text = "エラーです"
            }
            
            order.removeLast()
            Border.text = "\(order.count + 1)番を選んでください"
            debuglabel.text = String(describing: order)
        }
    }
    
    @IBAction func YODAIKAN(_ sender:AnyObject){
        ButtonCP(1, button: YODAIKAN)
    }
    
    @IBAction func SUGIYAKENSHI(_ sender:AnyObject){
        ButtonCP(2, button: SUGIYAKENSHI)
    }
    
    @IBAction func TANAKAKENSUKE(_ sender:AnyObject){
        ButtonCP(3, button: TANAKAKENSUKE)
    }
    
    @IBAction func LAIRD(_ sender:AnyObject){
        ButtonCP(5, button: LAIRD)
    }
    
    @IBAction func NAKATASYO(_ sender:AnyObject){
        ButtonCP(6, button: NAKATASYO)
    }
    
    @IBAction func NISHIKAWAHARUKI(_ sender:AnyObject){
        ButtonCP(7, button: NISHIKAWAHARUKI)
    }
    
    @IBAction func KONDOKENSUKE(_ sender:AnyObject){
        ButtonCP(8, button: KONDOKENSUKE)
    }
    
    @IBAction func NAKASHIMATAKUYA(_ sender:AnyObject){
        ButtonCP(9, button: NAKASHIMATAKUYA)
    }
    
    @IBAction func OTANISYOHEI(_ sender:AnyObject){
        ButtonCP(11, button: OTANISYOHEI)
    }
    
    @IBAction func ASAMADAIKI(_ sender:AnyObject){
        ButtonCP(26, button: ASAMADAIKI)
    }
    
    @IBAction func OHNOSYOTA(_ sender:AnyObject){
        ButtonCP(27, button: OHNOSYOTA)
    }
    
    @IBAction func OKAHIROMI(_ sender:AnyObject){
        ButtonCP(31, button: OKAHIROMI)
    }
    
    @IBAction func ISHIKAWASINGO(_ sender:AnyObject){
        ButtonCP(49, button: ISHIKAWASINGO)
    }
    
    @IBAction func ICHIKAWATOMOYA(_ sender:AnyObject){
        ButtonCP(56, button: ICHIKAWATOMOYA)
    }
    
    @IBAction func TANIGUTCHIYUYA(_ sender:AnyObject){
        ButtonCP(64, button: TANIGUCHIYUYA)
    }
    
    
    @IBOutlet weak var debuglabel: UILabel!
    
    @IBOutlet weak var Border: UILabel!
    
    //次の画面へデータを送る処理
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let playerselectviewController = segue.destination as! DisplayViewController
        playerselectviewController.order = order
        playerselectviewController.playerJsonData = playerJsonData
        
    }
    
    //ボタン共通処理
    func ButtonCP(_ number: Int,button:UIButton){
        if order.count < 9{
            order.append(number)
            button.isEnabled = false;
            if order.count < 9{
                Border.text = "\(order.count + 1)番を選んでください"
            }else{
                Enter.isEnabled = true;
                Border.text = "決定ボタンを押してください"
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
    
}
