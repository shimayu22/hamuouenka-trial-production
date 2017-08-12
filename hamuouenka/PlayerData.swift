//
//  PlayerData.swift
//  hamuouenka
//
//  Created by 島田裕 on 2017/08/10.
//  Copyright © 2017年 shimayu. All rights reserved.
//

import UIKit

class PlayerData: NSObject {
    
    //背番号
    var uniformNumber:Int
    
    //フルネーム
    var fullName:String
    
    //呼び方
    var calledName:String
    
    //応援歌フラグ
    var cheeringSongFlag:Int
    
    //応援歌
    var cheeringSong:String
    
    // イニシャライザ
    init(uniformNumber:Int,fullName:String,calledName:String,cheeringSongFlag:Int,cheeringSong:String) {
        self.uniformNumber = uniformNumber
        self.fullName = fullName
        self.calledName = calledName
        self.cheeringSongFlag = cheeringSongFlag
        self.cheeringSong = cheeringSong
    }
    
}

class RetainData: NSObject{
    
    static let sharedInstance = RetainData()
    
    //全選手のJSONデータ
    var playerJsonData:[Int:[String]] = [:]
    
    //表示する選手データ
    var playerData :[PlayerData] = []
    
    //オーダーを保存する
    var order :[Int] = []
    
    //出場選手を保存する（スタメン＋交代）
    var participatedPlayer :[Int] = []
}
