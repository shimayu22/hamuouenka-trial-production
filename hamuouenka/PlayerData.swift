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
    var cheeringSongFlag:Bool
    
    //応援歌
    var cheeringSong:String
    
    // イニシャライザ
    init(uniformNumber:Int,fullName:String,calledName:String,cheeringSongFlag:Bool,cheeringSong:String) {
        self.uniformNumber = uniformNumber
        self.fullName = fullName
        self.calledName = calledName
        self.cheeringSongFlag = cheeringSongFlag
        self.cheeringSong = cheeringSong
    }
    
}
