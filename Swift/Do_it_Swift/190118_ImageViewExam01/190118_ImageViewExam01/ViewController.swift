//
//  ViewController.swift
//  190118_ImageViewExam01
//
//  Created by 김회인 on 18/01/2019.
//  Copyright © 2019 HOEINN. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var buttonBefore: UIButton!
    @IBOutlet var buttonAfter: UIButton!
    var imageName = ["1.jpeg", "2.jpeg", "3.jpg", "4.jpeg", "5.jpg", "6.jpeg",]
    var count: Int = 0;

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgView.image = UIImage(named: imageName[count])
    }

    
    @IBAction func imageBefore(_ sender: UIButton) {
        if(count==0){
            buttonBefore.setTitle("이전 사진 없음", for: .normal)
        } else {
            buttonBefore.setTitle("이전", for: .normal)
            buttonAfter.setTitle("다음", for: .normal)
            count -= 1;
            imgView.image = UIImage(named: imageName[count])
        }
    }
 
    @IBAction func imageAfter(_ sender: UIButton) {
        if(count==5){
            buttonAfter.setTitle("다음 사진 없음", for: .normal)
        } else {
            buttonBefore.setTitle("이전", for: .normal)
            buttonAfter.setTitle("다음", for: .normal)
            count += 1;
            imgView.image = UIImage(named: imageName[count])
        }
    }
}

