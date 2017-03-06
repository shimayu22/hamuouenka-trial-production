
//
//  DisplayViewController.swift
//  hamuouenka
//
//  Created by 島田裕 on 2016/09/08.
//  Copyright © 2016年 shimayu. All rights reserved.
//

import UIKit

class DisplayViewController: UIPageViewController,UIPageViewControllerDataSource {
    
    //let idList = ["BO1", "BO2", "BO3","BO4","BO5","BO6","BO7","BO8","BO9"]
    //let idList = ["BO1", "BO1", "BO1","BO1","BO1","BO1","BO1","BO1","BO1"]
    
    var playerdata :[[String]] = [[],[],[],[],[],[],[],[],[]]//スタメン9人分の配列を用意をする
    var playerJsonData:[String:[String]] = [:]//辞書型の用意をする
    var order :[Int] = []//スタメンの背番号を保持す
    let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    let pageView = "BO1"
    
    //最初からあるメソッド
    override func viewDidLoad() {
        
        //辞書データからオーダー順に背番号をキーにして要素を取り出す
        //[0][0],[0][1],[0][2],[0][3],[0][4]
        //[1][0],[1][1],[1][2],[1][3],[1][4]
        //・
        //・
        //・
        //[8][0],[8][1],[8][2],[8][3],[8][4]
        //背番号,名前,歌詞,呼び方,フラグ
        for orderIndex in 0...8 {
            let numString:String = String(order[orderIndex])
            if let Array = (playerJsonData[numString]){
                playerdata[orderIndex] = Array
                //                print("---------DVC-----------")
                //                print(orderIndex + 1)
                //                print(playerdata[orderIndex][0])
                //                print(playerdata[orderIndex][1])
                //                print(playerdata[orderIndex][2])
                //                print(playerdata[orderIndex][3])
                //                print(playerdata[orderIndex][4])
                //                print("-----------------------")
                
            }
        }
        
        //AppDelegateへ値を送る
        appDelegate.playerdata = playerdata
        appDelegate.page = 0
        
        //最初のビューコントローラーを取得する。
        let controller = storyboard!.instantiateViewController(withIdentifier: pageView)
        
        //ビューコントローラーを表示する。
        self.setViewControllers([controller], direction: .forward, animated: true, completion:nil)
        
        //データ提供元に自分を設定する。
        self.dataSource = self
        
    }
    
    //右ドラッグ時の呼び出しメソッド
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        //現在のビューコントローラーのインデックス番号を取得する。
        //index = idList.index(of: viewController.restorationIdentifier!)!
        let index = appDelegate.page
        //前ページのビューコントローラーを返す。
        if (index == 0) {
            //appDelegate.page = index! + 8
            //return storyboard!.instantiateViewController(withIdentifier: pageView)
            return nil
        }else{
            appDelegate.page = index! - 1
            return storyboard!.instantiateViewController(withIdentifier: pageView)
        }
    }

    //左ドラッグ時の呼び出しメソッド
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        //現在のビューコントローラーのインデックス番号を取得する。
        //index = idList.index(of: viewController.restorationIdentifier!)!
        let index = appDelegate.page
        
        //次ページのビューコントローラーを返す。
        if (index! > 7) {
            //appDelegate.page = index! - 9
            //return storyboard!.instantiateViewController(withIdentifier: pageView)
            return nil
        }else{
            appDelegate.page = index! + 1
            return storyboard!.instantiateViewController(withIdentifier: pageView)
        }
    }
    
}