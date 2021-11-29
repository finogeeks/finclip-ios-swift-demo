//
//  ViewController.swift
//  SwfitDemo
//
//  Created by 胡健辉 on 2021/11/19.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        FATClient.shared().startRemoteApplet("60c5bbf99e094f00015079ee", startParams: nil, inParentViewController: self, completion: nil)

    }


}

