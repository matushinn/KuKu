//
//  ThirdViewController.swift
//  KuKu
//
//  Created by 大江祥太郎 on 2018/12/26.
//  Copyright © 2018年 shotaro. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    //数字を判別するフラグ
    var modeNum:Int = 0
    
    //秒数を判別するフラグ
    var modeSecond:Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func modeButton(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            modeSecond = 30
        case 1:
            modeSecond = 60
        case 2:
            modeSecond = 90
        default:
            break
        }
        self.performSegue(withIdentifier: "toQuestion", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toQuestion"{
            let questionVC = segue.destination as! QuestionViewController
            //値渡し
            questionVC.modeNum = modeNum
            questionVC.modeSecond = modeSecond
        }
    }
    
    @IBAction func back(_ sender: Any) {
        self.performSegue(withIdentifier: "toFirst", sender: nil)
    }
    
   

}
