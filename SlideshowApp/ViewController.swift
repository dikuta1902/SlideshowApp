//
//  ViewController.swift
//  SlideshowApp
//
//  Created by daiki ikuta on 2020/11/17.
//  Copyright © 2020 daiki.ikuta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let image0:UIImage! = UIImage(named:"neko1.jpg")
    let image1:UIImage! = UIImage(named:"neko2.jpeg")
    let image2:UIImage! = UIImage(named:"neko3.jpg")
    
    
    @IBOutlet weak var slide: UIButton!
    @IBOutlet weak var MoveButton: UIButton!
    @IBOutlet weak var ReturnButton: UIButton!
    @IBOutlet weak var Play_StopButton: UIButton!
    
    var timer: Timer!
    var count=0
    var x:Int=3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        slide.setImage(image2, for: .normal)
        MoveButton.setTitle("進む",for:.normal)
        ReturnButton.setTitle("戻る",for: .normal)
        Play_StopButton.setTitle("再生",for: .normal)
        
        
    }
    
    @objc func slideTimer(_ timer: Timer){
        x += 1
        self.view()
    }
    
    @IBAction func UIButtonTextField(_ sender: Any) {
        self.view()
        if(count==0){
            Play_StopButton.setTitle("停止", for: .normal)
            count = 1
            MoveButton.isEnabled = false
            ReturnButton.isEnabled = false
            
            if (self.timer==nil) {
                self.timer=Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(slideTimer(_:)), userInfo: nil, repeats: true)

            }
        }else if(count==1){
            Play_StopButton.setTitle("再生", for: .normal)
            count = 0
            ReturnButton.isEnabled = true
            MoveButton.isEnabled = true
            
            if (self.timer != nil) {
                self.timer.invalidate()
                self.timer=nil
            }
        }
    }
    
    @IBAction func MoveOn(_ sender: Any) {
        x += 1
        self.view()
    }
    
    @IBAction func Stop(_ sender: Any) {
        if(x == 3){
         x = 5
        }else if(x > 3){
         x -= 1
        }
        self.view()
    }
    
     func view() {
        let result=x
        
        if(result%3 == 1){
            slide.setImage(image0, for: .normal)
        }
        else if(result%3 == 2){
            slide.setImage(image1, for: .normal)
        }
        else if(result%3 == 0){
            slide.setImage(image2, for: .normal)
        }
    }
    
    @IBAction func SlideShow(_ sender: Any) {
        
        Play_StopButton.setTitle("再生", for: .normal)
        count = 0
        ReturnButton.isEnabled = true
        MoveButton.isEnabled = true
        
        if (self.timer != nil) {
        self.timer.invalidate()
        self.timer=nil
        }
    }
    
    override func prepare(for segue:UIStoryboardSegue,sender: Any?){
        let resultViewController:ResultViewController=segue.destination as! ResultViewController
        
        resultViewController.a = x
    }
    
    @IBAction func unwind(_segue:UIStoryboardSegue)
    {
        
    }
}
