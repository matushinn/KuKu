//
//  FirstViewController.swift
//  KuKu
//
//  Created by 大江祥太郎 on 2018/12/26.
//  Copyright © 2018年 shotaro. All rights reserved.
//

import UIKit
import LTMorphingLabel

class FirstViewController: UIViewController {

    @IBOutlet weak var titleLabel: LTMorphingLabel!
    
    private var effectTimer: Timer?
    var index = 0
    
    let textList = ["KuKu!!","KUKU!!","kuku!!"]
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.morphingEffect = .sparkle

       
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        effectTimer = Timer.scheduledTimer(timeInterval: 2.0,
                                           target: self,
                                           selector: #selector(updateLabel(timer:)), userInfo: nil,
                                           repeats: true)
        effectTimer?.fire()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        effectTimer?.invalidate()
    }
    @objc func updateLabel(timer: Timer) {
        titleLabel.text = textList[index]
       
        index += 1
        if index >= textList.count {
            index = 0
        }
        
    }
    @IBAction func go(_ sender: Any) {
        self.performSegue(withIdentifier: "toNext", sender: nil)
    }
    
    

    
}
extension FirstViewController: LTMorphingLabelDelegate {
    
    func morphingDidStart(_ label: LTMorphingLabel) {
        print("morphingDidStart")
    }
    
    func morphingDidComplete(_ label: LTMorphingLabel) {
        print("morphingDidComplete")
    }
    
    func morphingOnProgress(_ label: LTMorphingLabel, progress: Float) {
        print("morphingOnProgress", progress)
    }
}


