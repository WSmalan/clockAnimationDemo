//
//  ViewController.swift
//  WSClockDemo
//
//  Created by SongLan on 2017/3/9.
//  Copyright © 2017年 Asong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ssss = WSAnimationClockView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        ssss.center = self.view.center
        self.view.addSubview(ssss)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

