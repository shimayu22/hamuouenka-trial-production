//
//  RetainData.swift
//  hamuouenka
//
//  Created by Yutaka Shimada on 2018/04/22.
//  Copyright © 2018年 shimayu. All rights reserved.
//

import Foundation

class PlayerRetainData{
    //表示する選手データ
    var playerData :[PlayerData]
    //オーダーを保存する
    var order :[Int]
    //出場選手を保存する（スタメン＋交代）
    var participatedPlayer :[Int]

    init(playerData:[PlayerData],order:[Int],participatedPlayer :[Int]){
        self.playerData = playerData
        self.order = order
        self.participatedPlayer = participatedPlayer
    }
}

class shaerdData:NSObject{

    var playerRetainData = PlayerRetainData(playerData: [], order: [], participatedPlayer: [])
    static let sharedInstance:shaerdData = shaerdData()//シングルトン
    private override init() {}
}
