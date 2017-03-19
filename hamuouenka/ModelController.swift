//
//  ModelController.swift
//  Swift_PageView_test
//
//  Created by SHIMADA Yutaka on 2017/03/07.
//  Copyright © 2017年 SHIMADA Yutaka. All rights reserved.
//

import UIKit

/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */


class ModelController: NSObject, UIPageViewControllerDataSource {
    
    var pageData: [String] = []
    let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    //初期化
    override init() {
        super.init()
        // Create the data model.
        //この配列でページ数とか表示内容とか制御してる
        //どこかで作った配列を代入すれば可変ページになるかな
        pageData = ["1番","2番","3番","4番","5番","6番","7番","8番","9番"]
    }
    
    //新しいビューコントローラーを作っている
    func viewControllerAtIndex(_ index: Int, storyboard: UIStoryboard) -> BattingOrder? {
        // Return the data view controller for the given index.
        //この条件はないはずだけど一応弾く
        if (self.pageData.count == 0) || (index >= self.pageData.count) {
            return nil
        }
        
        // Create a new view controller and pass suitable data.
        //新しいview controllerを作成する
        //（withIdentifier: "ストーリーボードID名")
        let BattingOrder = storyboard.instantiateViewController(withIdentifier: "BattingOrder") as! BattingOrder
        //BattingOrderのdataObjectにラベルに表示する文字列を渡している
        //BattingOrder.dataObject = self.pageData[index]
        BattingOrder.bo = self.pageData[index]
        BattingOrder.index = index
        let num:String = appDelegate.playerdata[index][0]
        BattingOrder.number = Int(num)!
        BattingOrder.name = appDelegate.playerdata[index][1]
        BattingOrder.sngtxt = appDelegate.playerdata[index][2]
        
        return BattingOrder
    }
    
    //現在のページ数を取得する
    func indexOfViewController(_ viewController: BattingOrder) -> Int {
        // Return the index of the given data view controller.
        // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.

        return pageData.index(of: viewController.bo) ?? NSNotFound
    }
    
    // MARK: - Page View Controller Data Source
    
    //ページを戻る処理
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        //現在のページを取得
        var index = self.indexOfViewController(viewController as! BattingOrder)
        //取得できないorページ位置が0=最初のページの場合は何もしない
        //        if (index == 0) || (index == NSNotFound) {
        //            return nil
        //        }
        
        //取得できないときは何もしない
        if (index == NSNotFound){
            return nil
        }
        
        //ループする為の処理
        //最初のページであれば一番最後のページを無理やり指定する、最初のページ以外であれば一つ前のページを指定する（swift3では--を使えない）
        if(index == 0){
            //pageData.countは個数（月の場合は12）、indexには添え字を入れる（月の場合は11）
            index = self.pageData.count - 1
        }else{
            index -= 1
        }
        
        //上の処理で指定したindexを元にviewcontrollerを作成する
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }
    
    //ページを進む処理
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        //現在のページを取得
        var index = self.indexOfViewController(viewController as! BattingOrder)
        //取得できなければnilを返す
        if index == NSNotFound {
            return nil
        }
        //取得できれば、インクリメントする（swift3では++が使えない）
        index += 1
        //インクリメントしたindexとページ数が同じ=最終ページの場合は最初のページを指定する
        if index == self.pageData.count {
            index = 0
        }
        //上の処理で指定したindexを元にviewcontrollerを作成する
        return self.viewControllerAtIndex(index, storyboard: viewController.storyboard!)
    }
    
}

