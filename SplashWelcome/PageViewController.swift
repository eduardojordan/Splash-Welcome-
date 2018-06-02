//
//  PageViewController.swift
//  SplashWelcome
//
//  Created by Eduardo on 2/6/18.
//  Copyright © 2018 Eduardo Jordan Muñoz. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController , UIPageViewControllerDataSource, UIPageViewControllerDelegate {
  
    
    lazy var subViewControllers: [UIViewController] = {
        return[
            UIStoryboard (name: "Main", bundle: nil).instantiateViewController (withIdentifier: "ViewControllerOne") as! ViewControllerOne,
            UIStoryboard (name: "Main", bundle: nil).instantiateViewController (withIdentifier: "ViewControllerTwo") as! ViewControllerTwo,
            UIStoryboard (name: "Main", bundle: nil).instantiateViewController (withIdentifier: "ViewControllerThree") as! ViewControllerThree
        
        
        
        ]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.dataSource = self
        
        
        //Adicional ajuste
        setViewControllers([subViewControllers[0]], direction: .forward, animated: true, completion: nil)
    }
    
    
    // Con esta linea de codigo queda una transision mas Flat, más básica
        /*
        required init?(coder: NSCoder){
            super.init (transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        }
        
       */
        func presentationCount (for pageViewController: UIPageViewController) -> Int {
            return subViewControllers.count
        }
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
            let currentIndex:Int = subViewControllers.index (of: viewController) ?? 0
            if (currentIndex <= 0){
                return nil
            }
            return subViewControllers[currentIndex-1]
        }
        
        
        func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
            let currentIndex:Int = subViewControllers.index (of: viewController) ?? 0
            if (currentIndex >= subViewControllers.count-1){
                return nil
    }
            return subViewControllers[currentIndex+1]
 

}



}





