//
//  ButtonProcessingSummary.swift
//  ButtonProcessingSummary
//
//  Created by 島田裕 on 2018/04/08.
//  Copyright © 2018年 shimayu. All rights reserved.
//

import Foundation
import UIKit

class ButtonProcessingSummary{
    
    var sheardPlayerData:shaerdData = shaerdData.sharedInstance
    let playerSelectVC = PlayerSelectViewController()
    
    //ボタン共通処理
    func buttonCP(btn:UIButton){
        if sheardPlayerData.playerRetainData.order.count < 9{
            sheardPlayerData.playerRetainData.order.append(btn.tag)
            btn.isEnabled = false;
            
            if sheardPlayerData.playerRetainData.order.count < 9{
                playerSelectVC.updateBorderText(number:sheardPlayerData.playerRetainData.order.count + 1)
                
            }else{
                playerSelectVC.isEnabledEnterButton(flag: true)
                playerSelectVC.Enter.isEnabled = true
                //gamen.Border.text = "決定ボタンを押してください"

                sheardPlayerData.playerRetainData.participatedPlayer = sheardPlayerData.playerRetainData.order
            }
        }
        //gamen.debuglabel.text = String(describing: order)
    }
    
    //クリア共通処理
    func clearCP(arr:[Int],button:UIButton,order:Int){
        button.isEnabled = false;
        
        for(_,_) in arr.enumerated(){
            //let tmpButton = self.view.viewWithTag(element) as? UIButton
            //tmpButton?.isEnabled = true;
        }
        
        sheardPlayerData.playerRetainData.order.removeAll()
        //Border.text = "1番を選んでください"
        //debuglabel.text = "選手を選択してください"
    }
    
//    func pushBuckButton(btn:UIButton){
//        if retainData.order.isEmpty {
//            debuglabel.text = "選手を選択してください"
//        }else{
//            let lastelement:Int = order.last!
//            Enter.isEnabled = false;
//
//            btn.isEnabled = true;
//
//            order.removeLast()
//            if order.isEmpty{
//                debuglabel.text = "選手を選択してください"
//            }else{
//                debuglabel.text = String(describing: order)
//            }
//            Border.text = "\(order.count + 1)番を選んでください"
//        }
//    }
}
