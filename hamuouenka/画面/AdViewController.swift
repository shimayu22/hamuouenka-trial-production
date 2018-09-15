//
//  AdViewController.swift
//  hamuouenka
//
//  Created by 島田裕 on 2017/08/16.
//  Copyright © 2017年 shimayu. All rights reserved.
//

import UIKit

class AdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttonList:[UIButton] = [BackSelect,PlayerChange]
        buttonList.forEach{ operateButton in
            operateButton.layer.borderColor = UIColor.blue.cgColor
            operateButton.layer.borderWidth = 4.0
            operateButton.layer.cornerRadius = 10.0
        }

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var BackSelect: UIButton!
    @IBOutlet weak var PlayerChange: UIButton!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
