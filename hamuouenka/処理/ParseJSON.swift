//
//  ParseJSON.swift
//  hamuouenka
//
//  Created by Yutaka Shimada on 2018/06/12.
//  Copyright © 2018年 shimayu. All rights reserved.
//

import UIKit

class ParseJSON {

    var sheardPlayerData:shaerdData = shaerdData.sharedInstance
    
    func parseJSON(){
    
        let path = Bundle.main.path(forResource: "player",ofType: "json")!
        let jsondata = try! Data(contentsOf: URL(fileURLWithPath: path))
        let json = JSON(data:jsondata)//JSONデータ読み込み
        
        var index = 0//JSONを辞書型にする時に使うカウンタ
        
        //読み込んだJSONデータをsheardPlayerData.playerRetainData.playerDataに格納する
        for _ in json{
            
            let tmp = PlayerData.init(uniformNumber: json[index]["number"].int!,
                                      fullName: json[index]["name"].stringValue,
                                      calledName: json[index]["called"].stringValue,
                                      cheeringSongFlag: json[index]["flag"].int!,
                                      cheeringSong: json[index]["lyrics"].stringValue)
            
            sheardPlayerData.playerRetainData.playerData.append(tmp)

            index += 1
        }
    }
}

