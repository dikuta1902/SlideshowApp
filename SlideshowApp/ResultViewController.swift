//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by daiki ikuta on 2020/11/21.
//  Copyright © 2020 daiki.ikuta. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var NekoImageView: UIImageView!
    
    let image0:UIImage! = UIImage(named:"neko1.jpg")
    let image1:UIImage! = UIImage(named:"neko2.jpeg")
    let image2:UIImage! = UIImage(named:"neko3.jpg")
    
    var a:Int=0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        if(a%3 == 1){
            NekoImageView.image = image0
        }
        else if(a%3 == 2){
            NekoImageView.image = image1
        }
        else if(a%3 == 0){
            NekoImageView.image = image2
        }
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
