//
//  ViewController.swift
//  StereoYoutube
//
//  Created by Shun on 2015/02/07.
//  Copyright (c) 2015年 Shun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let mainPlayerViewFrame: CGRect = CGRect(x: 0, y: 0, width: self.view.frame.width / 2, height: self.view.frame.height)
        let mainPlayerView: UIView = UIView(frame: mainPlayerViewFrame)
        self.view.addSubview(mainPlayerView)
        
        // https://www.youtube.com/watch?v=[videoIdentifier]
        let videoPlayer: XCDYouTubeVideoPlayerViewController = XCDYouTubeVideoPlayerViewController(videoIdentifier: "WIKqgE4BwAY")
        videoPlayer.presentInView(mainPlayerView)
        videoPlayer.moviePlayer.play()
        
        let replicatorLayer: CAReplicatorLayer = CAReplicatorLayer(layer: nil)
        replicatorLayer.anchorPoint = CGPoint(x: 0, y: 0)
        replicatorLayer.bounds = mainPlayerViewFrame
        replicatorLayer.position = CGPointMake(0, 0)
        replicatorLayer.instanceCount = 2
        
        let transform: CATransform3D = CATransform3DTranslate(CATransform3DIdentity, self.view.frame.width / 2, 0, 0)
        
        replicatorLayer.instanceTransform = transform
        replicatorLayer.addSublayer(mainPlayerView.layer)
        self.view.layer.addSublayer(replicatorLayer)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

