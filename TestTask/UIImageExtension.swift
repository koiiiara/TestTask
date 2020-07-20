//
//  UIImageExtension.swift
//  TestTask
//
//  Created by Илья Миронов on 17.07.2020.
//  Copyright © 2020 Ilya Mironov. All rights reserved.
//

import Foundation
import UIKit

 extension UIImageView {
   
   func downloadedFrom(link:String) {
    guard let url = URL(string: link) else { return }
    URLSession.shared.dataTask(with: url, completionHandler: { (data, _, error) -> Void in
      guard let data = data , error == nil, let image = UIImage(data: data) else { return }
      DispatchQueue.main.async { () -> Void in
        self.image = image
      }
    }).resume()
  }
  
}
