//
//  ViewController.swift
//  DiscoverMusic
//
//  Created by Shashwat Singh on 9/16/18.
//  Copyright © 2018 Shashwat Singh. All rights reserved.
//

import UIKit
import AVFoundation

class MainViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var player: AVPlayer?
    
    func playUsingAVPlayer(url: URL) {
        player = AVPlayer(url: url)
        player?.play()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        collectionView?.backgroundColor = UIColor(red:0.15, green:0.16, blue:0.18, alpha:1.0)
        collectionView?.register(CardCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.isPagingEnabled = true
        
        let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.scrollDirection = .horizontal
        layout?.minimumLineSpacing = 0
        
       
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! CardCell
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    var shown = true
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CardCell
        
        if shown {
            cell.frontCardView.isHidden = true
            cell.backCardView.isHidden = false
            shown = false
        }else{
            cell.frontCardView.isHidden = false
            cell.backCardView.isHidden = true
            shown = true
        }
        guard let url = URL(string: "https://www.sample-videos.com/audio/mp3/wave.mp3") else {
            print("Invalid URL")
            return
        }
        
        player = AVPlayer(url: url)
        player?.play()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

