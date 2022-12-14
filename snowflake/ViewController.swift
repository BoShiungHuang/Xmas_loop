//
//  ViewController.swift
//  snowflake
//
//  Created by Bo-Shiung Huang on 2022/12/14.
//

import UIKit
import SpriteKit
import AVFoundation

class ViewController: UIViewController {
    
    var looper: AVPlayerLooper?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = Bundle.main.url(forResource: "Chestnuts Roasting on an Open Fire", withExtension:"mp3")
        {
            let player = AVQueuePlayer()
            let item = AVPlayerItem(url: url)
            looper = AVPlayerLooper(player: player, templateItem: item)
            player.play()
        }
        
        
        let snowImage = UIImage(named: "tree")
        let snowImageView = UIImageView(image: snowImage)
        snowImageView.frame = CGRect(x: 0, y: 0, width: 393, height: 852)
        snowImageView.contentMode = .scaleToFill
        snowImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(snowImageView)
        
        
        
        snowImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive=true
        snowImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive=true
        snowImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive=true
        snowImageView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive=true
        
        
        let skView = SKView(frame: view.frame)
        view.insertSubview(skView, at: 0)
        skView.backgroundColor = UIColor.clear
        
        let scene = SKScene(size: skView.frame.size)
        scene.anchorPoint = CGPoint(x: 0.5, y: 1)
        scene.backgroundColor = UIColor.clear
        
        
        let emitterNode = SKEmitterNode(fileNamed: "MyParticle")
        
        scene.addChild(emitterNode!)
        
        skView.presentScene(scene)
        
        snowImageView.addSubview(skView)
        
    }
}

