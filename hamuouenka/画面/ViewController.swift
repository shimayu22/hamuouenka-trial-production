//
//  ViewController.swift
//  hamuouenka
//
//  Created by Yutaka Shimada on 2016/07/08.
//  Copyright © 2016年 shimayu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let parse = ParseJSON()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //選手情報が入っているJSONをパースする
        parse.parseJSON()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

