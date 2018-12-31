//
//  SecondViewController.swift
//  KuKu
//
//  Created by 大江祥太郎 on 2018/12/26.
//  Copyright © 2018年 shotaro. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {

    var modeNum:Int = 0
    
     var audioPlayer:AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        do {
            let filePath = Bundle.main.path(forResource: "child1",ofType: "mp3")
            
            let musicPath = URL(fileURLWithPath: filePath!)
            audioPlayer = try AVAudioPlayer(contentsOf: musicPath)
            //roop
            audioPlayer.numberOfLoops = -1
            
        } catch {
            print("error")
        }
       
    }
    
    //UIButtonにするとsender.tagが使える
    @IBAction func tappedModeButton(_ sender: UIButton) {
        switch sender.tag {
       
        case 1:
            modeNum = 1
        case 2:
            modeNum = 2
        case 3:
            modeNum = 3
        case 4:
            modeNum = 4
        case 5:
            modeNum = 5
        case 6:
            modeNum = 6
        case 7:
            modeNum = 7
        case 8:
            modeNum = 8
        case 9:
            modeNum = 9
        default:
            break
        }
        self.performSegue(withIdentifier: "toThird", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toThird"{
            let thirdVC = segue.destination as! ThirdViewController
            //値渡し
            thirdVC.modeNum = modeNum
        }
    }
    
    @IBAction func back(_ sender: Any) {
        audioPlayer.stop()
        self.performSegue(withIdentifier: "toFirst", sender: nil)
    }
    

}
