//
//  AlignBottomButtonExampleViewController.swift
//  SnapKitten
//
//  Created by Spring Wong on 28/2/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import SnapKitten

class AlignBottomButtonExampleViewController: UIViewController {

    lazy var sv = UIScrollView()
    lazy var btn = UIButton()
    
    lazy var lbl = UILabel()
    lazy var btnB = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sv.backgroundColor = UIColor.red
        btn.backgroundColor = UIColor.green
        btn.setTitle("Test Button", for: .normal)
        
        self.view.backgroundColor = UIColor.blue
        btn.addTarget(self, action: #selector(btnOnClick), for: .touchUpInside)
        _ = Kitten.create(.vertical).from(self)
            .isAlignDirectionEnd(true).defaultAlignment(.parent)
            .add(sv).fillParent()
            .add(btn)
            .build()
        
        _ = Kitten.create(.vertical).from(sv)
            .add(lbl).align(.center)
            .add(btnB).align(.end).itemOffset(20).sideEndPadding(50)
            .build()
        
        lbl.text = "ei fji jewiojweo jowe"
        btnB.setTitle("End Button", for: .normal)
        btnB.backgroundColor = UIColor.black
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func btnOnClick(){
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
