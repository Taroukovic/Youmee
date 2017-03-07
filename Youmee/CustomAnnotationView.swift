//
//  AnnotationView.swift
//  Youmee
//
//  Created by Wolfy on 12/02/2017.
//  Copyright © 2017 incrediApps. All rights reserved.
//

import Mapbox

class CustomAnnotationView: MGLAnnotationView {
    
    override func layoutSubviews() {
    super.layoutSubviews()
            
    // Force the annotation view to maintain a constant size when the map is tilted.
    scalesWithViewingDistance = false
            
    // Use CALayer’s corner radius to turn this view into a circle.
    layer.cornerRadius = frame.width / 2
    layer.borderWidth = 2
    layer.borderColor = UIColor.white.cgColor
    }
        
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
            
        // Animate the border width in/out, creating an iris effect.
        let animation = CABasicAnimation(keyPath: "borderWidth")
        animation.duration = 0.1
        layer.borderWidth = selected ? frame.width / 4 : 2
        layer.add(animation, forKey: "borderWidth")
    }
}
