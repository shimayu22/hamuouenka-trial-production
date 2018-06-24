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
    
    let base:UIViewController
    
    init(base:UIViewController){
        self.base = base
    }
    
    func makeButton(){
        //UIScrollViewを作る
        let scrollView:UIScrollView = UIScrollView()
        scrollView.frame = CGRect(x:((self.base.view.bounds.width - CGFloat(kViewWidth))/2), y: 100, width: CGFloat(kViewWidth), height: CGFloat(kViewHeight))
        scrollView.backgroundColor = UIColor.lightGray
        
        var a:Int = 0
        //スクロールの全長を指定する
        for i in 0..<sheardPlayerData.playerRetainData.playerData.count {
            if (sheardPlayerData.playerRetainData.playerData[i].cheeringSongFlag == 1) {
                a += 1
            }
        }
        
        a /= 3
        
        let h:Int = a * (kButtonHeight + kViewMargin)
        
        scrollView.contentSize = CGSize(width: kViewWidth, height: h)
        
        var column = -1
        var row = 1
        var b = 1
        
        //ボタンを作る
        for i in 0..<sheardPlayerData.playerRetainData.playerData.count {
            
            //応援歌がある選手のみボタンにする為の処理
            if (sheardPlayerData.playerRetainData.playerData[i].cheeringSongFlag != 1) {
                continue
            }
            
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
            
            if b%3 == 1 {
                column += 1
                row = 0
            }else if b%3 == 2{
                row = 1
            }else if b%3 == 0{
                row = 2
            }
            
            let x:Int = row * kPositionWidth + kButtonWidthMargin //ボタンの横位置
            let y:Int = column * kPositionHeight + kButtonHeightMargin//ボタンの縦位置
            
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
            
            b += 1
        }
        
        base.view.addSubview(scrollView)
    }
}
