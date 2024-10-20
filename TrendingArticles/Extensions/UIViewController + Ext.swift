//
//  UIViewController + Ext.swift
//  TrendingArticles
//
//  Created by Taimoor Suleman on 18/11/2024.
//

import UIKit

extension UIViewController {
    
    //MARK: - Activity Indicator Methods
    
    func startActivityIndicator(style: UIActivityIndicatorView.Style = .large, color: UIColor? = .secondaryLabel) {
        DispatchQueue.main.async {
            let activityIndicator = UIActivityIndicatorView(style: style)
            activityIndicator.center = self.view.center
            activityIndicator.color = color
           
            // Add a unique tag to identify the activity indicator
            activityIndicator.tag = 100
            activityIndicator.hidesWhenStopped = true
            self.view.addSubview(activityIndicator)
            activityIndicator.startAnimating()
        }
    }
    
    func stopActivityIndicator() {
        DispatchQueue.main.async {
            if let activityIndicator = self.view.viewWithTag(100) as? UIActivityIndicatorView {
                activityIndicator.stopAnimating()
                activityIndicator.removeFromSuperview()
            }
        }
    }
    
    
}







