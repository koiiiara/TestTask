//
//  ContentCell.swift
//  TestTask
//
//  Created by Илья Миронов on 16.07.2020.
//  Copyright © 2020 Ilya Mironov. All rights reserved.
//

import UIKit

class ContentCell: UITableViewCell {

  
    @IBOutlet var cellNameLabel: UILabel!
    @IBOutlet var cellTextLabel: UILabel!
    @IBOutlet var cellImageView: UIImageView!
    @IBOutlet var segmentControlView: UISegmentedControl!
    
    
    override func awakeFromNib() {
       super.awakeFromNib()
    }

    func configure(for object: JSONObjects?) {
        
        cellNameLabel.text = object?.name
        
        switch object?.name {
        case "hz":
            cellTextLabel.text = object?.data?.text
            cellImageView.removeFromSuperview()
            segmentControlView.removeFromSuperview()
            
        case "picture":
            cellTextLabel.text = object?.data?.text
            cellImageView.isHidden = false
            cellImageView.downloadedFrom(link: (object?.data?.url)!)
            segmentControlView.removeFromSuperview()
            
        case "selector":
            segmentControlView.isHidden = false
            cellImageView.removeFromSuperview()
            cellTextLabel.removeFromSuperview()
            segmentControlView.selectedSegmentIndex = object!.data!.selectedId!
            segmentControlView.setTitle(object!.data!.variants?[0].text, forSegmentAt: 0)
            segmentControlView.setTitle(object!.data!.variants?[1].text, forSegmentAt: 1)
            segmentControlView.setTitle(object!.data!.variants?[2].text, forSegmentAt: 2)
            
        default:
            return
            
        }
    }
    
  
}
