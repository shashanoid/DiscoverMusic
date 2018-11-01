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
    
    let songsarray = [Songs(url: "https://p.scdn.co/mp3-preview/d7624ec5f93b6d92c1836a95c40ecce463584f6e?cid=774b29d4f13844c495f206cafdad9c86"), Songs(url: "https://p.scdn.co/mp3-preview/d5d48190dacabe9e45e2e1fe7616c4e411b28b53?cid=774b29d4f13844c495f206cafdad9c86"), Songs(url: "https://p.scdn.co/mp3-preview/a8a087eb48e18fc6f671e10f0147a2102ac0cb34?cid=774b29d4f13844c495f206cafdad9c86"), Songs(url: "http://www.hochmuth.com/mp3/Tchaikovsky_Nocturne__orch.mp3"), Songs(url: "http://www.hochmuth.com/mp3/Vivaldi_Sonata_eminor_.mp3")]
    

    
    func playUsingAVPlayer(url: URL) {
        player = AVPlayer(url: url)
        player?.play()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        collectionView?.backgroundColor = UIColor(red:0.15, green:0.16, blue:0.18, alpha:1.0)
        collectionView?.register(CardCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView?.isPagingEnabled = true
        
        let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.scrollDirection = .horizontal
        layout?.minimumLineSpacing = 0
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return songsarray.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CardCell
        return cell
        
    }
    
    
    // Takes cell indexpath and gets/plays song from the array
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
                if let songurl = URL(string: songsarray[indexPath.item].url) {
                    player = AVPlayer(url: songurl)
                    
                   player?.play()
                    
        
                }
        
        print("0", songsarray[indexPath.item].url)
        
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
        
        player?.replaceCurrentItem(with: nil)
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

