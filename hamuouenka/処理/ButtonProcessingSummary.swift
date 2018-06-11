//
//  ButtonProcessingSummary.swift
//  ButtonProcessingSummary
//
//  Created by Yutaka Shimada on 2018/04/08.
//  Copyright © 2018年 shimayu. All rights reserved.
//

import Foundation
import UIKit

class ButtonProcessingSummary{
    
    var sheardPlayerData:shaerdData = shaerdData.sharedInstance
    let playerSelectVC = PlayerSelectViewController()
    
    //ボタン共通処理
    func buttonCP(btn:UIButton){
        //選択したボタンが9個以下なら配列に追加して選手ボタンを非活性にする
        if sheardPlayerData.playerRetainData.order.count < 9{
            sheardPlayerData.playerRetainData.order.append(btn.tag)
            playerSelectVC.isEnabledEnterButton(flag: false, tagNumber: btn.tag)
            
            //追加した後まだ9個以下なら次の打順の選手を選ぶようにラベルを書き換える
            if sheardPlayerData.playerRetainData.order.count < 9{
                playerSelectVC.updateBorderText(number:sheardPlayerData.playerRetainData.order.count + 1)
                
            }else{
                //9個になったら決定ボタンを活性化して「決定ボタンを押してください」と表示する
                playerSelectVC.isEnabledEnterButton(flag: true)
                playerSelectVC.updateBorderText(number: 999)

                sheardPlayerData.playerRetainData.participatedPlayer = sheardPlayerData.playerRetainData.order
            }
        }
        playerSelectVC.updateDebugLabel()
    }
    
    //クリア共通処理
    func clearCP(){
        //決定ボタンを非活性化する
        playerSelectVC.isEnabledEnterButton(flag: false)
        
        //orderに入っている非活性にしたボタンを活性化する
        for i in sheardPlayerData.playerRetainData.order{
            playerSelectVC.isEnabledEnterButton(flag: true, tagNumber: i)
        }
        
        //orderの中身を空にする
        sheardPlayerData.playerRetainData.order.removeAll()
        
        //participatedPlayerの中身を空にする
        sheardPlayerData.playerRetainData.participatedPlayer.removeAll()
        
        //「1番を選択してください」と表示する
        playerSelectVC.updateBorderText(number: 1)
        
        //「選手を選択してください」と表示する
        playerSelectVC.updateDebugLabel()
    }
    
    func pushBuckButton(){
        //バックボタンを押した時に配列が空だったら「選手を選択してください」を表示
        if sheardPlayerData.playerRetainData.order.isEmpty {
            playerSelectVC.updateDebugLabel()
        }else{
            //決定ボタンを非活性化する
            playerSelectVC.isEnabledEnterButton(flag: false)
            
            //配列の最後尾に格納されている番号のボタンを活性化する
            let lastelement:Int = sheardPlayerData.playerRetainData.order.last!
            playerSelectVC.isEnabledEnterButton(flag: true, tagNumber: lastelement)

            //配列の最後尾の要素を削除する
            sheardPlayerData.playerRetainData.order.removeLast()

            //「n番を選択してください」の表示を更新
            playerSelectVC.updateBorderText(number: sheardPlayerData.playerRetainData.order.count + 1)
            
            //debaglabelの表示を更新
            playerSelectVC.updateDebugLabel()
        }
    }
}
