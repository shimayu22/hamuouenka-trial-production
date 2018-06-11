//
//  MakeButton.swift
//  AutoButtonMake
//
//  Created by Yutaka Shimada on 2018/04/08.
//  Copyright © 2018年 shimayu. All rights reserved.
//

import Foundation
import UIKit

class MakeButton{
    var sheardPlayerData:shaerdData = shaerdData.sharedInstance
    let base:UIViewController
    
    init(base:UIViewController){
        self.base = base
    }
    
    func makeButton(){
        //UIScrollViewを作る
        let scrollView:UIScrollView = UIScrollView()
        scrollView.frame.size = CGSize(width: kViewWidth, height: kViewHeight)
        scrollView.center = base.view.center
        scrollView.backgroundColor = UIColor.lightGray
        
        let a:Int = sheardPlayerData.playerRetainData.playerData.count/3
        let h:Int = (a + 1) * (kButtonHeight + kViewMargin)
        
        scrollView.contentSize = CGSize(width: kViewWidth, height: h)
        
        //ボタンを作る
        for i in 0..<sheardPlayerData.playerRetainData.playerData.count {
            
            //応援歌がある選手のみボタンにする為の処理
            if (sheardPlayerData.playerRetainData.playerData[i].cheeringSongFlag != 1) {continue}
            
            //ボタンの初期化
            let simpleButton = UIButton()
            
            //表示する文字
            simpleButton.setTitle(sheardPlayerData.playerRetainData.playerData[i].fullName, for: .normal)
            
            //ボタンの文字色
            simpleButton.setTitleColor(UIColor.blue, for: .normal)
            
            //ボタンの色
            simpleButton.backgroundColor = UIColor.orange
            
            //タップした時の文字色
            simpleButton.setTitleColor(UIColor.white, for: .highlighted)
            
            //サイズ
            simpleButton.frame = CGRect(x: 0, y: 0, width: kButtonWidth, height: kButtonHeight)
            
            let b:Int = (i/3) * 3 //横位置の補正（3つ毎に折り返す）
            let x:Int = (i - b) * kPositionWidth + kButtonWidthMargin //ボタンの横位置
            let y:Int = (i/3) * kPositionHeight + kButtonHeightMargin//ボタンの縦位置
            
            //配置場所
            simpleButton.layer.position = CGPoint(x: x, y: y)
            
            //tagの番号
            simpleButton.tag = sheardPlayerData.playerRetainData.playerData[i].uniformNumber
            
            //角丸を設定
            simpleButton.layer.cornerRadius = 10
            
            //ボタンを押した時の挙動
            simpleButton.addTarget(self, action: #selector(PlayerSelectViewController.pushPlayerButton(_:)), for: .touchDown)
            
            //ボタン表示（Viewに追加）
            scrollView.addSubview(simpleButton)
        }
        
        base.view.addSubview(scrollView)
    }
}
