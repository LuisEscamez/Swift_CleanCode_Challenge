//
//  BaseCoordinator.swift
//  SwiftChallenge
//
//  Created by Luis on 19/10/2019.
//  Copyright © 2019 Luis Escamez Sánchez. All rights reserved.
//

import UIKit

class BaseCoordinator {
    
    // MARK: - Helper methods
    /**
     Check if Window variable from AppDelegate. If is not created will initialize it.
     
     - returns: Window from AppDelegate.
     */
    func getWindow() -> UIWindow {
        if let window = (UIApplication.shared.delegate as! AppDelegate).window {
            return window
        }else {
            let window = UIWindow(frame: UIScreen.main.bounds)
            window.backgroundColor = UIColor.white
            window.makeKeyAndVisible()
            (UIApplication.shared.delegate as! AppDelegate).window = window
            return window
        }
    }
    
    private func navigationControllerFromWindow() -> UINavigationController {
        if let navigationController = getWindow().rootViewController as? UINavigationController {
            return navigationController
        }else {
            return UINavigationController()
        }
    }
    
    /**
     Shows given viewController as root of the window application, using a NavigationViewController as parent.
     
     - parameter viewController: ViewController to show as root ViewController inside the NavigationViewController.
     */
    internal func showRootViewControllerWithNavigation(_ viewController: UIViewController) {
        let navigationVC = UINavigationController(rootViewController: viewController)
        navigationVC.viewControllers = [viewController]
        getWindow().rootViewController = navigationVC
    }
    
    /**
     Shows given viewController as root of the window application.
     
     - parameter viewController: ViewController to show as root ViewController.
     */
    internal func showRootViewController(_ viewController: UIViewController) {
        getWindow().rootViewController = viewController
    }
}

// MARK: - Main Base methods
extension BaseCoordinator {
    
    internal func pushViewController(_ viewController: UIViewController, animated: Bool) {
        viewController.hidesBottomBarWhenPushed = true
        let navigationVC = navigationControllerFromWindow()
        navigationVC.pushViewController(viewController, animated: animated)
    }
}
