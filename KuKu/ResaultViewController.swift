//
//  ResaultViewController.swift
//  KuKu
//
//  Created by 大江祥太郎 on 2018/12/26.
//  Copyright © 2018年 shotaro. All rights reserved.
//

import UIKit

class ResaultViewController: UIViewController {
    
    @IBOutlet weak var numTitleLabel: UILabel!
    @IBOutlet weak var secondTitleLabel: UILabel!
    
    @IBOutlet weak var lastQueTitleLabel: UILabel!
    @IBOutlet weak var lastQueNumLabel: UILabel!
    
   
    //数字を判別するフラグ
    var modeNum:Int = 0
    
    //秒数を判別するフラグ
    var modeSecond:Int = 0
    
    //最新の正解数を記録する変数
    var lastQuestionNum:Int = 0
    
    //これまでで一番高い正解数を記録する変数
    var highQuestionNum:Int = 0
    
    var highQuestionNumArray:Any!
    
    let ud = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        lastQueNumLabel.text = "\(lastQuestionNum)問"
        lastQueTitleLabel.text = "Last Score"
        secondTitleLabel.text = "\(modeSecond)+秒"
        numTitleLabel.text = "\(modeNum)の段"
        
    }
    
@IBAction func back(_ sender: Any) {
        self.performSegue(withIdentifier: "toFirst", sender: nil)
    }
    
    

}
