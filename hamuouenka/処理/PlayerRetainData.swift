//
//  RetainData.swift
//  hamuouenka
//
//  Created by Yutaka Shimada on 2018/04/22.
//  Copyright © 2018年 shimayu. All rights reserved.
//

import UIKit

class sheardPlayerData: NSObject {
    
    //表示する選手データ
    var playerData :[PlayerData]
    //オーダーを保存する
    var order :[Int]
    //出場選手を保存する（スタメン＋交代）
    var participatedPlayer :[Int]
    //選手交替の時のインデックス
    var index:Int
    
    class var playerRetainData: sheardPlayerData {
        struct Static {
            static let instance : sheardPlayerData = sheardPlayerData()
        }
        return Static.instance
        
    }
    
    private override init() {
        
        self.playerData = []
        self.order = []
        self.participatedPlayer = []
        self.index = 0
        
        super.init()
    }
}
