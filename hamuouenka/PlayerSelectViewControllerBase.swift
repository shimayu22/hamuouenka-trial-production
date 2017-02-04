//
//  PlayerSelectViewControllerBase.swift
//  hamuouenka
//
//  Created by 島田裕 on 2016/08/10.
//  Copyright © 2016年 shimayu. All rights reserved.
//

import UIKit

class PlayerSelectViewControllerBase: UIPageViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    class TestPageViewController: UIPageViewController,UIPageViewControllerDataSource {
        
        let idList = ["GP1", "GP2", "P1","P2"]
        
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