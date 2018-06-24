//
//  PlayerSelectViewController.swift
//  hamuouenka
//
//  Created by Yutaka Shimada on 2016/07/17.
//  Copyright © 2016年 shimayu. All rights reserved.
//

import UIKit

class PlayerSelectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //ボタンを作る
        let makeButton = MakeButton(base: self)
        makeButton.makeButton()
        
    }
    
    @IBOutlet weak var clear: UIButton!
    @IBOutlet weak var Enter: UIButton!
    @IBOutlet weak var Back: UIButton!
    @IBOutlet weak var debuglabel: UILabel!
    @IBOutlet weak var Border: UILabel!
    
    @IBAction func clear(_ sender:UIButton){
        self.clearCP()
    }
    
    @IBAction func Back(_ sender:UIButton){
        self.pushBuckButton()
    }
    
    @objc func pushPlayerButton(_ btn:UIButton){
        //buttonPS.buttonCP(btn: btn)
        //選択したボタンが9個以下なら配列に追加して選手ボタンを非活性にする
        if sheardPlayerData.playerRetainData.order.count < 9{
            sheardPlayerData.playerRetainData.order.append(btn.tag)
            self.isEnabledEnterButton(flag: false, tagNumber: btn.tag)
            
            //追加した後まだ9個以下なら次の打順の選手を選ぶようにラベルを書き換える
            if sheardPlayerData.playerRetainData.order.count < 9{
                self.updateBorderText(number:sheardPlayerData.playerRetainData.order.count + 1)
                
            }else{
                //9個になったら決定ボタンを活性化して「決定ボタンを押してください」と表示する
                self.isEnabledEnterButton(flag: true)
                self.updateBorderText(number: 999)
                
                sheardPlayerData.playerRetainData.participatedPlayer = sheardPlayerData.playerRetainData.order
            }
        }
        self.updateDebugLabel()
        
    }
    
    //戻ってくる時の処理
    @IBAction func backToTop(segue: UIStoryboardSegue) {
        self.clearCP()
    }
    
    //Enterボタンをtrueだと活性化、falseだと不活性化する
    func isEnabledEnterButton(flag:Bool){
        Enter.isEnabled = flag
    }
    
    //選手ボタンをtrueだと活性化、falseだと不活性化する
    func isEnabledEnterButton(flag:Bool,tagNumber:Int){
        let playerButton = self.view.viewWithTag(tagNumber) as! UIButton
        playerButton.isEnabled = flag
    }
    
    //"○番を選択してください"の表記を変更する
    func updateBorderText(number:Int){
        if number == 999 {
            Border.text = "決定ボタンを押してください"
        }else{
            Border.text = "\(number)番を選んでください"
        }
    }
    
    //debuglabelに選択した背番号を表示する
    func updateDebugLabel(){
        if sheardPlayerData.playerRetainData.order.isEmpty {
            debuglabel.text = "選手を選択してください"
        }else{
        debuglabel.text = String(describing: sheardPlayerData.playerRetainData.order)
        }
    }
    
    func clearCP(){
        //決定ボタンを非活性化する
        self.isEnabledEnterButton(flag: false)
        
        //orderに入っている非活性にしたボタンを活性化する
        for i in sheardPlayerData.playerRetainData.order{
            self.isEnabledEnterButton(flag: true, tagNumber: i)
        }
        
        //orderの中身を空にする
        sheardPlayerData.playerRetainData.order.removeAll()
        
        //participatedPlayerの中身を空にする
        sheardPlayerData.playerRetainData.participatedPlayer.removeAll()
        
        //「1番を選択してください」と表示する
        self.updateBorderText(number: 1)
        
        //「選手を選択してください」と表示する
        self.updateDebugLabel()
    }
    
    func pushBuckButton(){
        //バックボタンを押した時に配列が空だったら「選手を選択してください」を表示
        if sheardPlayerData.playerRetainData.order.isEmpty {
            self.updateDebugLabel()
        }else{
            //決定ボタンを非活性化する
            self.isEnabledEnterButton(flag: false)
            
            //配列の最後尾に格納されている番号のボタンを活性化する
            let lastelement:Int = sheardPlayerData.playerRetainData.order.last!
            self.isEnabledEnterButton(flag: true, tagNumber: lastelement)
            
            //配列の最後尾の要素を削除する
            sheardPlayerData.playerRetainData.order.removeLast()
            
            //「n番を選択してください」の表示を更新
            self.updateBorderText(number: sheardPlayerData.playerRetainData.order.count + 1)
            
            //debaglabelの表示を更新
            self.updateDebugLabel()
        }
    }
    
}
