//
//  UIImageViewExtension.swift
//  EngineeringChallenge
//
//  Created by MAC on 03/06/21.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImage(from item:Item) {
        ImageCache.publicCache.load(url: item.url, item: item) { (fetchedItem, image) in
            if let img = image, img != fetchedItem.image {
                self.image = img
            }
        }
    }
}
