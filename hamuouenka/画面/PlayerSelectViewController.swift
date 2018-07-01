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

        //キャンセルボタンを透明化＆非活性化
        Cancel.isEnabled = false
        Cancel.alpha = 0.0
        //ボタンを作る
        let makeButton = MakeButton(base: self)
        makeButton.makeButton()
        
    }
    
    var escape = 0
    
    @IBOutlet weak var clear: UIButton!
    @IBOutlet weak var Enter: UIButton!
    @IBOutlet weak var Back: UIButton!
    @IBOutlet weak var debuglabel: UILabel!
    @IBOutlet weak var Border: UILabel!
    @IBOutlet weak var Cancel: UIButton!
    
    @IBAction func clear(_ sender:UIButton){
        self.clearCP()
    }
    
    @IBAction func Back(_ sender:UIButton){
        self.pushBuckButton()
    }
    
    @objc func pushPlayerButton(_ btn:UIButton){
        self.buttonCP(btn: btn)
    }
    
    @IBAction func Cancel(_ sender:UIButton){
        if Enter.isEnabled {
            self.pushCancelButton()
        }else{
            self.segueToAdViewController()
        }
    }
    
    //戻ってくる時の処理
    @IBAction func backToTop(segue: UIStoryboardSegue) {
        self.clearCP()
    }
    
    //交替する為に戻ってくる時の処理
    @IBAction func backToTopForChange(segue:UIStoryboard){
        Border.text = "交代選手を選択してください"
        debuglabel.text = "選手を選択してください"
        Back.isEnabled = false
        Back.alpha = 0.0
        Cancel.isEnabled = true
        Cancel.alpha = 1.0
        self.isEnabledEnterButton(flag: false)
    }
    
    func buttonCP(btn: UIButton){
        let sp = sheardPlayerData.playerRetainData
        //選択したボタンが9個以下なら配列に追加して選手ボタンを非活性にする
        if sp.order.count < 9{
            sp.order.append(btn.tag)
            if btn.tag < 100 {
            self.isEnabledPlayerButton(flag: false, tagNumber: btn.tag)
            self.isAlphaEnterButton(flag: false, tagNumber: btn.tag)
            }
            //追加した後まだ9個以下なら次の打順の選手を選ぶようにラベルを書き換える
            if sp.order.count < 9{
                self.updateBorderText(number:sp.order.count + 1)
                
            }else{
                //9個になったら決定ボタンを活性化して「決定ボタンを押してください」と表示する
                self.isEnabledEnterButton(flag: true)
                self.updateBorderText(number: 999)
                
                sp.participatedPlayer = sp.order
            }
        }else if sp.order.count > 8 && Enter.isEnabled == false{
            //選手交替の時の処理
            escape = sp.order[sp.index]
            sp.order[sp.index] = btn.tag
            sp.participatedPlayer.append(btn.tag)
            if btn.tag < 100 {
                self.isEnabledPlayerButton(flag: false, tagNumber: btn.tag)
                self.isAlphaEnterButton(flag: false, tagNumber: btn.tag)
            }
            self.isEnabledEnterButton(flag: true)
            
        }
        self.updateDebugLabel()
    }
    
    //Enterボタンをtrueだと活性化、falseだと不活性化する
    func isEnabledEnterButton(flag:Bool){
        Enter.isEnabled = flag
    }
    
    //選手ボタンをtrueだと活性化、falseだと不活性化する
    func isEnabledPlayerButton(flag:Bool,tagNumber:Int){
        let playerButton = self.view.viewWithTag(tagNumber) as! UIButton
        playerButton.isEnabled = flag
    }
    
    //選手ボタンを半透明にしたり戻したりする
    func isAlphaEnterButton(flag:Bool,tagNumber:Int){
        let playerButton = self.view.viewWithTag(tagNumber) as! UIButton
        if flag{
            playerButton.alpha = 1.0
        }else{
            playerButton.alpha = 0.3
        }
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
        
        //キャンセルボタンを非活性化＆透明化
        Cancel.isEnabled = false
        Cancel.alpha = 0.0
        
        //一人戻るボタンを活性化＆不透明化
        Back.isEnabled = true
        Back.alpha = 1.0
        
        //participatedPlayerに入っている非活性にしたボタンを活性化する
        for i in sheardPlayerData.playerRetainData.participatedPlayer{
            self.isEnabledPlayerButton(flag: true, tagNumber: i)
            self.isAlphaEnterButton(flag: true, tagNumber: i)
        }
        
        //orderに入っている非活性にしたボタンを活性化する(決定ボタン押す前にクリアを押した時に必要)
        for i in sheardPlayerData.playerRetainData.order{
            self.isEnabledPlayerButton(flag: true, tagNumber: i)
            self.isAlphaEnterButton(flag: true, tagNumber: i)
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
            self.clearCP()
        }else{
            //決定ボタンを非活性化する
            self.isEnabledEnterButton(flag: false)
            
            //配列の最後尾に格納されている番号のボタンを活性化する
            let lastelement:Int = sheardPlayerData.playerRetainData.order.last!
            self.isEnabledPlayerButton(flag: true, tagNumber: lastelement)
            self.isAlphaEnterButton(flag: true, tagNumber: lastelement)
            
            //配列の最後尾の要素を削除する
            sheardPlayerData.playerRetainData.order.removeLast()
            
            //「n番を選択してください」の表示を更新
            self.updateBorderText(number: sheardPlayerData.playerRetainData.order.count + 1)
            
            //debaglabelの表示を更新
            self.updateDebugLabel()
        }
    }
    
    //選手ボタン押した後のキャンセル処理
    func pushCancelButton(){
        let sp = sheardPlayerData.playerRetainData
        self.isEnabledPlayerButton(flag: true, tagNumber: sp.order[sp.index])
        self.isAlphaEnterButton(flag: true, tagNumber: sp.order[sp.index])
        self.isEnabledEnterButton(flag: false)
        sp.order[sp.index] = escape
        Border.text = "交代選手を選択してください"
        debuglabel.text = "選手を選択してください"
    }
    
    //前の画面に戻りたいキャンセル処理
    func segueToAdViewController() {
        self.performSegue(withIdentifier: "PushAdView", sender: nil)
    }
    
}
