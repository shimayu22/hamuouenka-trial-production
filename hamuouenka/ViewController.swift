//
//  ViewController.swift
//  hamuouenka
//
//  Created by 島田裕 on 2016/07/08.
//  Copyright © 2016年 shimayu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var playerJsonData:[String:[String]] = [:]//辞書型の用意をする
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "player",ofType: "json")!
        let jsondata = try! Data(contentsOf: URL(fileURLWithPath: path))
        let json = JSON(data:jsondata)//JSONデータ読み込み
        
        var index = 0//JSONを辞書型にする時に使うカウンタ

        //読み込んだJSONデータを辞書型にする
        //背番号:[背番号:名前:歌詞:呼び方:歌詞フラグ]の形で全選手分読み込む
        for _ in json{
            playerJsonData[json[index]["number"].string!] = [json[index]["number"].string!,json[index]["name"].string!,json[index]["lyrics"].string!,json[index]["called"].string!,json[index]["flag"].string!]
            index = index + 1
        }
        
        print(playerJsonData)

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! PlayerSelectViewController
        viewController.playerJsonData = playerJsonData
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

