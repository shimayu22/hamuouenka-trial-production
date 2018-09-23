//
//  AdViewController.swift
//  hamuouenka
//
//  Created by 島田裕 on 2017/08/16.
//  Copyright © 2017年 shimayu. All rights reserved.
//

import UIKit

class AdViewController: UIViewController,ChangeLabelDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttonList:[UIButton] = [BackSelect,PlayerChange]
        buttonList.forEach{ operateButton in
            operateButton.layer.borderColor = UIColor.blue.cgColor
            operateButton.layer.borderWidth = 4.0
            operateButton.layer.cornerRadius = 10.0
        }

        ButtingOrderNumberLabel.text = String(sheardPlayerData.playerRetainData.index + 1) + "番"
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var BackSelect: UIButton!
    @IBOutlet weak var PlayerChange: UIButton!
    @IBOutlet weak var ButtingOrderNumberLabel: UILabel!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Delegateを受ける準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DisplayViewSegue"{
            let nextViewController = segue.destination as! DisplayViewController
            nextViewController.delegate = self
        }
    }
    
    //LabelをDelegateで更新する
    func changeLabelText(buttingOrder:String) {
        ButtingOrderNumberLabel.text = buttingOrder
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
