
//
//  DisplayViewController.swift
//  hamuouenka
//
//  Created by 島田裕 on 2016/09/08.
//  Copyright © 2016年 shimayu. All rights reserved.
//

import UIKit



class DisplayViewController: UIViewController, UIPageViewControllerDelegate {
    
    //class DisplayViewController: UIPageViewController,UIPageViewControllerDataSource {
    
    //let idList = ["BO1", "BO2", "BO3","BO4","BO5","BO6","BO7","BO8","BO9"]
    //let idList = ["BO1", "BO1", "BO1","BO1","BO1","BO1","BO1","BO1","BO1"]
    //let idList = ["1番","2番","3番","4番","5番","6番","7番","8番","9番"]
    
    //BattingOrder画面で表示するデータの準備
    var playerdata :[[String]] = [[],[],[],[],[],[],[],[],[]]//スタメン9人分の配列を用意をする
    var playerJsonData:[String:[String]] = [:]//辞書型の用意をする
    var order :[Int] = []//スタメンの背番号を保持する
    let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
    //let pageView = "BO1"
    
    //PageViewControllerのデータの準備
    var pageViewController: UIPageViewController?
    
    //最初からあるメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
        //表示用データを作成する処理
        order = appDelegate.order
        playerJsonData = appDelegate.playerJsonData
        
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
        //
        //
        //        //最初のビューコントローラーを取得する。
        //        let controller = storyboard!.instantiateViewController(withIdentifier: pageView)
        //
        //        //ビューコントローラーを表示する。
        //        self.setViewControllers([controller], direction: .forward, animated: true, completion:nil)
        //
        //        //データ提供元に自分を設定する。
        //        self.dataSource = self
        
        
        //以下、よく分からない
        // Do any additional setup after loading the view, typically from a nib.
        // Configure the page view controller and add it as a child view controller.
        //ページ遷移の設定、めくり方は「.scroll」か.「pageCurl」、方向は「.horizontal」か「.vertical」かになる
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.pageViewController!.delegate = self
        
        //startingViewController:の後に作成するクラス（か、StoryBoard ID？）を指定する
        let startingViewController: BattingOrder = self.modelController.viewControllerAtIndex(0, storyboard: self.storyboard!)!
        let viewControllers = [startingViewController]
        self.pageViewController!.setViewControllers(viewControllers, direction: .forward, animated: false, completion: {done in })
        
        self.pageViewController!.dataSource = self.modelController
        
        self.addChildViewController(self.pageViewController!)
        self.view.addSubview(self.pageViewController!.view)
        
        // Set the page view controller's bounds using an inset rect so that self's view is visible around the edges of the pages.
        var pageViewRect = self.view.bounds
        if UIDevice.current.userInterfaceIdiom == .pad {
            pageViewRect = pageViewRect.insetBy(dx: 40.0, dy: 40.0)
        }
        self.pageViewController!.view.frame = pageViewRect
        
        self.pageViewController!.didMove(toParentViewController: self)
        
        
    }
    
    var modelController: ModelController {
        // Return the model controller object, creating it if necessary.
        // In more complex implementations, the model controller may be passed to the view controller.
        if _modelController == nil {
            _modelController = ModelController()
        }
        return _modelController!
    }
    
    var _modelController: ModelController? = nil
    
    func pageViewController(_ pageViewController: UIPageViewController, spineLocationFor orientation: UIInterfaceOrientation) -> UIPageViewControllerSpineLocation {
        if (orientation == .portrait) || (orientation == .portraitUpsideDown) || (UIDevice.current.userInterfaceIdiom == .phone) {
            // In portrait orientation or on iPhone: Set the spine position to "min" and the page view controller's view controllers array to contain just one view controller. Setting the spine position to 'UIPageViewControllerSpineLocationMid' in landscape orientation sets the doubleSided property to true, so set it to false here.
            let currentViewController = self.pageViewController!.viewControllers![0]
            let viewControllers = [currentViewController]
            self.pageViewController!.setViewControllers(viewControllers, direction: .forward, animated: true, completion: {done in })
            
            self.pageViewController!.isDoubleSided = false
            return .min
        }
        
        // In landscape orientation: Set set the spine location to "mid" and the page view controller's view controllers array to contain two view controllers. If the current page is even, set it to contain the current and next view controllers; if it is odd, set the array to contain the previous and current view controllers.
        let currentViewController = self.pageViewController!.viewControllers![0] as! BattingOrder
        var viewControllers: [UIViewController]
        
        let indexOfCurrentViewController = self.modelController.indexOfViewController(currentViewController)
        if (indexOfCurrentViewController == 0) || (indexOfCurrentViewController % 2 == 0) {
            let nextViewController = self.modelController.pageViewController(self.pageViewController!, viewControllerAfter: currentViewController)
            viewControllers = [currentViewController, nextViewController!]
        } else {
            let previousViewController = self.modelController.pageViewController(self.pageViewController!, viewControllerBefore: currentViewController)
            viewControllers = [previousViewController!, currentViewController]
        }
        self.pageViewController!.setViewControllers(viewControllers, direction: .forward, animated: true, completion: {done in })
        
        return .mid
    }
    
    
    //    //右ドラッグ時の呼び出しメソッド
    //    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    //
    //        //現在のビューコントローラーのインデックス番号を取得する。
    //        //index = idList.index(of: viewController.restorationIdentifier!)!
    //        let index = appDelegate.page
    //        //前ページのビューコントローラーを返す。
    //        if (index == 0) {
    //            //appDelegate.page = index! + 8
    //            //return storyboard!.instantiateViewController(withIdentifier: pageView)
    //            return nil
    //        }else{
    //            appDelegate.page = index! - 1
    //            return storyboard!.instantiateViewController(withIdentifier: pageView)
    //        }
    //    }
    //
    //    //左ドラッグ時の呼び出しメソッド
    //    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    //
    //        //現在のビューコントローラーのインデックス番号を取得する。
    //        //index = idList.index(of: viewController.restorationIdentifier!)!
    //        let index = appDelegate.page
    //
    //        //次ページのビューコントローラーを返す。
    //        if (index! > 7) {
    //            //appDelegate.page = index! - 9
    //            //return storyboard!.instantiateViewController(withIdentifier: pageView)
    //            return nil
    //        }else{
    //            appDelegate.page = index! + 1
    //            return storyboard!.instantiateViewController(withIdentifier: pageView)
    //        }
    //    }
    
}
