//
//  profileCustomSC.swift
//  Youmee
//
//  Created by Wolfy on 06/02/2017.
//  Copyright © 2017 incrediApps. All rights reserved.
//

import UIKit

@IBDesignable class profileCustomSC: UIControl {
    private var labels = [UILabel]()
    var thumbView = UIView()
    var items: [String] = ["Youmee Socials", "Youmee Hobbies"] {
        didSet
        {
            setupLabels()
        }
    }
    
    var selectedIndex: Int = 0 {
        didSet {
            displayNewSelectedIndex()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder: NSCoder)
    {
        super.init(coder: coder)!
        setupView()
    }
    
    func setupView()
    {
        //layer.cornerRadius = frame.height/2
        layer.borderColor = UIColor.clear.cgColor
        layer.borderWidth = 2
        backgroundColor =  UIColor(red: 0.000, green: 0.576, blue: 0.918, alpha: 0.35)
        
        setupLabels()
        
        insertSubview(thumbView, at: 0)
    }

    
    func setupLabels()
    {
        for label in labels {
            label.removeFromSuperview()
        }
        
        labels.removeAll(keepingCapacity: true)
        
        for index in 1...items.count
        {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
            label.text = items[index-1]
            label.font = UIFont(name:"AvenirNext-Bold", size: 15)
            label.textAlignment = .center
            label.textColor = UIColor.white
            self.addSubview(label)
            labels.append(label)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        var selectFrame = self.bounds
        let newWidth = selectFrame.width/CGFloat(items.count)
        selectFrame.size.width = newWidth
        thumbView.frame = selectFrame
        thumbView.backgroundColor = UIColor(red: 0.000, green: 0.576, blue: 0.918, alpha: 1.0)
        //thumbView.layer.cornerRadius = thumbView.frame.height/2
        
        let labelHeiht = self.bounds.height
        let labelWidth = self.bounds.width / CGFloat(labels.count)
        
        for index in 0...labels.count - 1 {
            let label = labels[index]
            let xPosition = CGFloat(index) * labelWidth
            label.frame = CGRect(x: xPosition, y: 0, width: labelWidth, height: labelHeiht)
        }
        
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        let location = touch.location(in: self)
        var calculatedIndex : Int?
        for (index, item) in labels.enumerated() {
            if item.frame.contains(location) {
                calculatedIndex = index
            }
        }
        
        
        if calculatedIndex != nil {
            selectedIndex = calculatedIndex!
            sendActions(for: .valueChanged)
        }
        
        return false
    }
    
    func displayNewSelectedIndex()
    {
        let label = labels[selectedIndex]
        self.thumbView.frame = label.frame
    }
}
