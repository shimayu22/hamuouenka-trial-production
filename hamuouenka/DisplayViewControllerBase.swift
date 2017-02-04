//
//  DisplayViewController.swift
//  hamuouenka
//
//  Created by 島田裕 on 2016/07/17.
//  Copyright © 2016年 shimayu. All rights reserved.
//

import UIKit

class DisplayViewControllerBase: UIViewController {
    
    var playerdata :[[String]] = [[],[],[],[],[],[],[],[],[]]//スタメン9人分の配列を用意をする
    var playerJsonData:[String:[String]] = [:]//辞書型の用意をする
    var order :[Int] = []//スタメンの背番号を保持する
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //辞書データからオーダー順に背番号をキーにして要素を取り出す
        //[0][0],[0][1],[0][2],[0][3],[0][4]
        //[1][0],[1][1],[1][2],[1][3],[1][4]
        //・
        //・
        //・
        //[9][0],[9][1],[9][2],[9][3],[9][4]
        //背番号,名前,歌詞,呼び方,フラグ
        for orderIndex in 0...8 {
            let numString:String = String(order[orderIndex])
            if let Array = (playerJsonData[numString]){
                playerdata[orderIndex] = Array
                
                print(orderIndex + 1)
                print(playerdata[orderIndex][0])
                print(playerdata[orderIndex][1])
                print(playerdata[orderIndex][2])
                print(playerdata[orderIndex][3])
                print(playerdata[orderIndex][4])
                print("-----------------------")
                
            }
            
        }
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    class TestPageViewController: UIPageViewController,UIPageViewControllerDataSource {
        
        let idList = ["BO1", "BO2", "BO3","BO4","BO5","BO6","BO7","BO8","BO9"]
        
        //最初からあるメソッド
        override func viewDidLoad() {
            
            //最初のビューコントローラーを取得する。
            let controller = storyboard!.instantiateViewControllerWithIdentifier(idList.first!)
            
            //ビューコントローラーを表示する。
            self.setViewControllers([controller], direction: .Forward, animated: true, completion:nil)
            
            //データ提供元に自分を設定する。
            self.dataSource = self
        }
        
        
        
        //右ドラッグ時の呼び出しメソッド
        func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
            
            //現在のビューコントローラーのインデックス番号を取得する。
            let index = idList.indexOf(viewController.restorationIdentifier!)!
            if (index > 0) {
                //前ページのビューコントローラーを返す。
                return storyboard!.instantiateViewControllerWithIdentifier(idList[index-1])
            }
            return nil
        }
        
        
        
        //左ドラッグ時の呼び出しメソッド
        func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
            
            //現在のビューコントローラーのインデックス番号を取得する。
            let index = idList.indexOf(viewController.restorationIdentifier!)!
            if (index < idList.count-1) {
                //次ページのビューコントローラーを返す。
                return storyboard!.instantiateViewControllerWithIdentifier(idList[index+1])
            }
            return nil
        }
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
         // Get the new view controller using segue.destinationViewController.
         // Pass the selected object to the new view controller.
         }
         */
        
    }
}