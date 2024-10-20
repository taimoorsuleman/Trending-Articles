//
//  UINavigationBar + Ext.swift
//  TrendingArticles
//
//  Created by Taimoor Suleman on 19/10/2024.
//
import UIKit

extension UINavigationBar {
    
    func setCustomAppearance(backgroundColor: UIColor, titleColor: UIColor) {
        barTintColor = backgroundColor
        tintColor = titleColor
        self.titleTextAttributes = [
            .foregroundColor: titleColor,
            .font: UIFont.boldSystemFont(ofSize: 18)
        ]
    }
}
