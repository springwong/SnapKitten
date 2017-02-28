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

    lazy var sv = UIButton()
    lazy var btn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sv.backgroundColor = UIColor.red
        btn.backgroundColor = UIColor.green
        btn.setTitle("Test Button", for: .normal)
        
        self.view.backgroundColor = UIColor.blue
        btn.addTarget(self, action: #selector(btnOnClick), for: .touchUpInside)
        _ = Kitten.create(.vertical).from(self)
            .isAlignDirectionEnd(true).defaultAlignment(.parent)
            //        .add(sv).fillParent()
            .add(btn)//.fillParent()
            //            .priority(.high)
            .build()
        
        
        // Do any additional setup after loading the view.
//        self.view.addSubview(btn)
//        btn.snp.makeConstraints { (make) in
////            make.left.top.right.bottom.equalToSuperview()
//            make.left.equalTo(self.view.snp.left)
//            make.right.equalTo(self.view.snp.right)
//            make.top.equalTo(self.view.snp.top)
//            make.bottom.equalTo(self.view.snp.bottom)
//        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        _ = Kitten.create(.vertical).from(self)
//            .isAlignDirectionEnd(true).defaultAlignment(.parent)
//            //        .add(sv).fillParent()
//            .add(btn)//.fillParent()
//            //            .priority(.high)
//            .build()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func btnOnClick(){
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
