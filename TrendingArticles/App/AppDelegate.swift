//
//  AppDelegate.swift
//  TrendingArticles
//
//  Created by Taimoor Suleman on 18/11/2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupInitialViewController()
        return true
    }


    ///  Setup Initial Screen
    private func setupInitialViewController() {
        let articleListVC = ArticleListBuilder.build()
        let navVC = UINavigationController(rootViewController: articleListVC)
        navVC.hidesBarsWhenVerticallyCompact = true
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navVC
        self.window?.makeKeyAndVisible()
    }
}

