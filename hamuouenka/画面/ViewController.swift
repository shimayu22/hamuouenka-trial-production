//
//  ViewController.swift
//  hamuouenka
//
//  Created by Yutaka Shimada on 2016/07/08.
//  Copyright © 2016年 shimayu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var OK: UIButton!
    let parse = ParseJSON()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        OK.layer.borderColor = UIColor.blue.cgColor
        OK.layer.borderWidth = 4.0
        OK.layer.cornerRadius = 10.0
        
        //選手情報が入っているJSONをパースする
        parse.parseJSON()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

