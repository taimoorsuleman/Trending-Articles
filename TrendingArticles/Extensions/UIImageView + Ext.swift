//
//  UIImageView.swift
//  TrendingArticles
//
//  Created by Taimoor Suleman on 18/11/2024.
//

import UIKit

private var imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    
    func loadImage(from url: URL, placeholder: UIImage? = nil) {
        // Set placeholder image
        self.image = placeholder
        
        // Check if image is cached
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            self.image = cachedImage
            return
        }
        
        // Download the image
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            // Handle error
            if let error = error {
                print("Error loading image: \(error.localizedDescription)")
                return
            }
            
            // Ensure there is data
            guard let data = data, let downloadedImage = UIImage(data: data) else { return }
            
            // Cache the image
            imageCache.setObject(downloadedImage, forKey: url.absoluteString as NSString)
            
            // Update the image on the main thread
            DispatchQueue.main.async {
                self.image = downloadedImage
            }
        }
        
        task.resume()
    }
    
    func makeRound() {
            self.layer.cornerRadius = self.bounds.size.width / 2
            self.layer.masksToBounds = true
    }
}
