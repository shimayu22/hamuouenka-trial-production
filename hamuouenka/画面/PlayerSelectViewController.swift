//
//  PlayerSelectViewController.swift
//  hamuouenka
//
//  Created by Yutaka Shimada on 2016/07/17.
//  Copyright © 2016年 shimayu. All rights reserved.
//

import UIKit

class PlayerSelectViewController: UIViewController {
    
    let buttonPS = ButtonProcessingSummary()
    
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
        buttonPS.clearCP()
    }
    
    @IBAction func Back(_ sender:UIButton){
        buttonPS.pushBuckButton()
    }
    
    @objc func pushPlayerButton(_ btn:UIButton){
        buttonPS.buttonCP(btn: btn)
    }
    
    //戻ってくる時の処理
    @IBAction func backToTop(segue: UIStoryboardSegue) {
        buttonPS.clearCP()
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
}
