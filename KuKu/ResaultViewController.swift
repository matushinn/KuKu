//
//  ResaultViewController.swift
//  KuKu
//
//  Created by 大江祥太郎 on 2018/12/26.
//  Copyright © 2018年 shotaro. All rights reserved.
//

import UIKit
import LTMorphingLabel
import AVFoundation

class ResaultViewController: UIViewController {
    
    @IBOutlet weak var numTitleLabel: LTMorphingLabel!
    @IBOutlet weak var secondTitleLabel: LTMorphingLabel!
    
    @IBOutlet weak var lastQueTitleLabel: LTMorphingLabel!
    @IBOutlet weak var lastQueNumLabel: LTMorphingLabel!
    
   
    //数字を判別するフラグ
    var modeNum:Int = 0
    
    //秒数を判別するフラグ
    var modeSecond:Int = 0
    
    //問題数
    var questionNum:Int = 1
    //最新の正解数を記録する変数
    var correctQuestionNum:Int = 0
    
    //最新の不正解数を記録する変数
    var incorrectQuestionNum:Int = 0
    
    //これまでで一番高い正解数を記録する変数
    var highQuestionNum:Int = 0
    
    var highQuestionNumArray:Any!
    
    var audioPlayer:AVAudioPlayer!
    
    let ud = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            let filePath = Bundle.main.path(forResource: "goal",ofType: "mp3")
            
            let musicPath = URL(fileURLWithPath: filePath!)
            audioPlayer = try AVAudioPlayer(contentsOf: musicPath)
           
            
        } catch {
            print("error")
        }

        lastQueNumLabel.text = "\(correctQuestionNum)問"
        lastQueTitleLabel.text = "Last Score"
        secondTitleLabel.text = "\(modeSecond)秒"
        numTitleLabel.text = "\(modeNum)の段"
        
        lastQueNumLabel.morphingEffect = .burn
        
        //図形のイメージを作る
        let drawImage = drawLine()
        //イメージビューに設定する
        let drawView = UIImageView(image: drawImage)
        //画面に表示する
        view.addSubview(drawView)
    }
    override func viewWillAppear(_ animated: Bool) {
        audioPlayer.play()
    }
    @IBAction func back(_ sender: Any) {
        self.performSegue(withIdentifier: "toFirst", sender: nil)
    }
    
    //パーセントの円弧のパスを作る
    func arcPercent(_ radius:CGFloat, _ percent:Double) -> UIBezierPath {
        //パーセントの最終角度に換算します
        let endAngle = 2*Double.pi*percent/100-Double.pi/2
        
        let path = UIBezierPath(arcCenter: CGPoint(x: 0, y: 0), radius: radius, startAngle: CGFloat(-Double.pi/2), endAngle: CGFloat(endAngle), clockwise: percent > 0
        )
        return path
    }
    func drawLine() -> UIImage {
        //イメージ処理の開始
        let size = view.bounds.size
        UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
        let ratio = round(Double(correctQuestionNum/questionNum)) * 100
        
        let percent = ratio
        //円弧のパスを作る
        UIColor.red.setStroke()
        let arcpath = arcPercent(80, Double(percent))
        arcpath.lineWidth = 60
        arcpath.lineCapStyle = .butt
        //パスを平行移動する
        let tf = CGAffineTransform(translationX: view.center.x, y: view.center.y)
        arcpath.apply(tf)
        //円弧を描画
        arcpath.stroke()
        
        //『何パーセント』の数字を書く
        let font = UIFont.boldSystemFont(ofSize: 28)
        let textFontAttributes = [NSAttributedString.Key.font:font,NSAttributedString.Key.foregroundColor:UIColor.gray]
        let drawString = String(percent) + "%"
        let posX = view.center.x-45
        let posY = view.center.y-15
        let rect = CGRect(x: posX, y: posY, width: 90, height: 30)
        //テキストを描く
        drawString.draw(in:rect,withAttributes:textFontAttributes)
        
        //イメージコンテキストからUIImageを作る
        let image = UIGraphicsGetImageFromCurrentImageContext()
        //イメージ処理の終了
        UIGraphicsEndImageContext()
        
        return image!
        
        
    }
    
    
    
}
