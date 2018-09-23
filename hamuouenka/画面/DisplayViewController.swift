
//
//  DisplayViewController.swift
//  hamuouenka
//
//  Created by Yutaka Shimada on 2016/09/08.
//  Copyright © 2016年 shimayu. All rights reserved.
//

import UIKit

protocol ChangeLabelDelegate: class{
    func changeLabelText(buttingOrder:String)
}

class DisplayViewController: UIViewController, UIPageViewControllerDelegate {

    //PageViewControllerのデータの準備
    var pageViewController: UIPageViewController?
    //AdViewControllerにあるLabelを更新するためのDelegateの準備
    var delegate:ChangeLabelDelegate?
    
    //最初からあるメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //以下、よく分からない
        // Do any additional setup after loading the view, typically from a nib.
        // Configure the page view controller and add it as a child view controller.
        //ページ遷移の設定、めくり方は「.scroll」か.「pageCurl」、方向は「.horizontal」か「.vertical」かになる
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.pageViewController!.delegate = self
        
        //startingViewController:の後に作成するクラス（か、StoryBoard ID？）を指定する
        //最初に表示するページは、スタメンを選んだ後は1番から、交代する場合は交代した打順から表示するようにした
        let startingViewController: BattingOrder = self.modelController.viewControllerAtIndex(sheardPlayerData.playerRetainData.playerCahngeFlag ?  sheardPlayerData.playerRetainData.index : 0, storyboard: self.storyboard!)!
        
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
    
    //スワイプが完了したら呼び出されるメソッド
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if completed {
            let currentViewController = self.pageViewController!.viewControllers![0] as! BattingOrder
            let indexOfCurrentViewController = self.modelController.indexOfViewController(currentViewController) + 1
            delegate?.changeLabelText(buttingOrder: String(indexOfCurrentViewController) + "番")
        }
    }
    
}
