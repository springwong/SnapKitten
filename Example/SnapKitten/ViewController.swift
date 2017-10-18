//
//  ViewController.swift
//  Kitten
//
//  Created by Spring Wong on 02/27/2017.
//  Copyright (c) 2017 Spring Wong. All rights reserved.
//

import UIKit
import SnapKitten

class ViewController: UIViewController {

    lazy var sv = UIScrollView()
    lazy var mainView = UIView()
    lazy var textViewA = UILabel()
    lazy var textViewB = UILabel()
    
    var kitten : Kitten?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateUI()
        
//        kitten = Kitten.create(.vertical).from(self)
//            .isAlignDirectionEnd(true)
//            .add(sv) as? Kitten
        
        self.view.addSubview(sv)
        sv.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
//        testingBugs(virtualView: self.view)
            kitten?.rebuild()
        
        
        let ivA = UIImageView()
        ivA.backgroundColor = UIColor.red
        
        let ivB = UIImageView()
        ivB.backgroundColor = UIColor.blue

        let lblA = UILabel()
        lblA.numberOfLines = 0
        lblA.textColor = UIColor.white
        lblA.text = "wekj voweijvew voiew voiwehoiewhvoiweh voiwehwehoiwehvi hweipv hweiuvbweiuvbweiuvbew iubewiu "
        
        let cub = Cub.create().from()
            .add(ivA).size(40, .equal).offset(10)
            .add(ivB).size(20, .equal).alignRight(ivA).alignParentBottom().rightOffset(-10)
            //.centerY(true).size(80, .equal)//.alignParentLeft()
//            .add(lblA).rightOf(ivA).alignParentTop().topOffset(0)
            .build()
        cub.backgroundColor = UIColor.black
        
//        let testImageView = UIImageView()
//        sv.addSubview(testImageView)
//        
//        let bug = bugExample()
//        sv.addSubview(bug)
//        
//        let btnContinue = UIButton()
//        sv.addSubview(btnContinue)
//        
//        testImageView.snp.makeConstraints { (make) in
//            make.top.left.right.equalToSuperview()
//            make.bottom.equalTo(bug.snp.top)
//            make.height.equalTo(22)
//        }
//        bug.snp.makeConstraints { (make) in
//            make.left.right.equalToSuperview()
//            make.bottom.equalTo(btnContinue.snp.top)
//        }
//        btnContinue.snp.makeConstraints { (make) in
//            make.left.right.bottom.equalToSuperview()
//            make.height.equalTo(44)
//        }
        
        Kitten.vertical()
            .from(sv).isAlignDirectionEnd(false)
//            .add(bugExample())
            .add(example())
            .add(cub).align(.start)
            .add(fillParentExample()).alignSideCenter()
            .add(itemVerticals()).height(300)
            .add(priorityExample())
            .add(alignLeftItems())
            .add(anotherExample())
            .addChilds(textViewA, textViewB)
            .add(alignParentCard())
            .add(buttonAlignRightCase())
            .build();
    }
    
    func testingBugs(virtualView : UIView){
        let lblA = UILabel()
        let lblB = UILabel()
        let lblC = UILabel()
        let lblD = UILabel()
        lblB.numberOfLines = 0
        lblA.text = "Hello"
        lblB.text = "!! gberi beribv ierbviernv ioernviorv ioerniovnerioreio nrv ierbiuehiuvb euieurv ueve h"
        lblC.text = "World"
        lblD.text = "testing"

        let v1 = Kitten.create(.horizontal).from().defaultAlignment(.start)
            .allPadding(10)
            .add(lblA).build()
        let v2 = Kitten.create(.vertical).from().endPadding(20)
            .add(lblB).align(.start).sideEndPadding(150)
            .add(lblD)
            .build()
        let v3 = Kitten.create(.vertical).from()
            .allPadding(10)
            .add(lblC).build()
        
        v1.backgroundColor = UIColor.red
        v2.backgroundColor = UIColor.green
        v3.backgroundColor = UIColor.blue
        
        Kitten.create(.vertical).from(virtualView).isAlignDirectionEnd(true).startPadding(50).endPadding(100)
            .add(v1)//.height(100, .max)
            .add(v2)//.fillParent()
            .add(v3).fillParent()
            .build()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func updateUI(){
        textViewA.numberOfLines = 0
        textViewB.numberOfLines = 0
        
        textViewA.backgroundColor = UIColor.red
        textViewB.backgroundColor = UIColor.blue
        
        textViewA.text =                 "Lorem ipsum is a pseudo-Latin text used in web design, typography, layout, and printing in place of English to emphasise design elements over content. It's also called placeholder (or filler) text. It's a convenient tool for mock-ups. It helps to outline the visual elements of a document or presentation, eg typography, font, or layout. Lorem ipsum is mostly a part of a Latin text by the classical author and philosopher Cicero. Its words and letters have been changed by addition or removal, so to deliberately render its content nonsensical; it's not genuine, correct, or comprehensible Latin anymore. While lorem ipsum's still resembles classical Latin, it actually has no meaning whatsoever. As Cicero's text doesn't contain the letters K, W, or Z, alien to latin, these, and others are often inserted randomly to mimic the typographic appearence of European languages, as are digraphs not to be found in the original. In a professional context it often happens that private or corporate clients corder a publication to be made and presented with the actual content still not being ready. Think of a news blog that's filled with content hourly on the day of going live. However, reviewers tend to be distracted by comprehensible content, say, a random text copied from a newspaper or the internet. The are likely to focus on the text, disregarding the layout and its elements. Besides, random text risks to be unintendedly humorous or offensive, an unacceptable risk in corporate environments. Lorem ipsum and its many variants have been employed since the early 1960ies, and quite likely since the sixteenth century."
        textViewB.text = "Most of its text is made up from sections 1.10.32–3 of Cicero's De finibus bonorum et malorum (On the Boundaries of Goods and Evils; finibus may also be translated as purposes). Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit is the first known version (\"Neither is there anyone who loves grief itself since it is grief and thus wants to obtain it\"). It was found by Richard McClintock, a philologist, director of publications at Hampden-Sydney College in Virginia; he searched for citings of consectetur in classical Latin literature, a term of remarkably low frequency in that literary corpus. Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit amet, consectetur, adipisci[ng] velit, sed quia non numquam [do] eius modi tempora inci[di]dunt, ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit, qui in ea voluptate velit esse, quam nihil molestiae consequatur, vel illum, qui dolorem eum fugiat, quo voluptas nulla pariatur?"
    }
    private func alignParentCard() -> UIView{
        let ivProfile = UIImageView()
        let textView = UILabel()
        textView.numberOfLines = 0
        ivProfile.image = UIImage(named: "kitten.jpeg")
        textView.text = "Most text editors like MS Word or Lotus Notes generate random lorem text when needed, either as pre-installed module or plug-in to be added. Word selection or sequence don't necessarily match the original, which is intended to add variety. Presentation software like Keynote or Pages use it as a samples for screenplay layout. Content management software as Joomla, Drupal, Mambo, PHP-Nuke, WordPress, or Movable Type offer Lorem Ipsum plug-ins with the same functionality."
        let textView1 = UILabel()
        textView1.numberOfLines = 0
        textView1.text = "Most text editors like MS Word or Lotus Notes generate random lorem text when needed, either as pre-installed module or plug-in to be added. Word selection or sequence don't necessarily match the original, which is intended to add variety. Presentation software like Keynote or Pages use it as a samples for screenplay layout. Content management software as Joomla, Drupal, Mambo, PHP-Nuke, WordPress, or Movable Type offer Lorem Ipsum plug-ins with the same functionality."
        
        return Kitten.create(KittenOrientation.horizontal)
            .from()
            .defaultAlignment(KittenAlignment.start)
            .itemDefaultSideStartPadding(10)
            .itemDefaultSideEndPadding(10)
            .isAlignDirectionEnd(true)
            .startPadding(15)
            .endPadding(15)
            .add(ivProfile).size(60, KittenSign.equal).priority(KittenPriority.high)
            .add(textView)
//            .height(60, KittenSign.max)
            //            .add(textView1)
            .build();
    }
    
    private func alignLeftItems() -> UIView{
        let textView = UILabel()
        let imageView = UIImageView()
        textView.numberOfLines = 0
        textView.text = "test 123"
        imageView.backgroundColor = UIColor.green
        textView.backgroundColor = UIColor.blue
        return Kitten.create(KittenOrientation.horizontal)
            .from().isAlignDirectionEnd(true)
            .defaultAlignment(KittenAlignment.center)
            .add(imageView).size(60, KittenSign.equal).priority(KittenPriority.high)
            .add(textView).itemOffset(40).fillParent().align(.start)
            .build();
    }
    
    private func anotherExample() -> UIView{
        let textView = UILabel()
        let imageView = UIImageView()
        textView.numberOfLines = 0
        textView.text = "test 123"
        imageView.backgroundColor = UIColor.green
        
        let container = UIView()
        container.addSubview(textView)
        container.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview()
            make.bottom.lessThanOrEqualToSuperview()
            make.height.width.equalTo(60)
        }
        textView.snp.makeConstraints { (make) in
            make.right.top.equalToSuperview()
            make.bottom.lessThanOrEqualToSuperview()
            make.left.equalTo(imageView.snp.right)
        }
        return container
    }
    
    let viewA = UIButton()
    let viewB = UIView()
    let viewC = UIView()
    private func priorityExample() -> UIView{
        viewA.backgroundColor = UIColor.red
        viewB.backgroundColor = UIColor.green
        viewC.backgroundColor = UIColor.brown
        
        viewA.addTarget(self, action: #selector(btnOnClick), for: .touchUpInside)
        
        return Kitten.create(.horizontal).from()
            .weightMode(true).itemDefaultOffset(10).startPadding(20).endPadding(20)
            .add(viewA).weight(3)
            .add(viewB).weight(2)
            .add(viewC).weight(1)
            .build()
    }
    
    func buttonAlignRightCase() -> UIView{
        let btn = UIButton()
        let lbl = UILabel()
        lbl.text = "123 "
        btn.backgroundColor = UIColor.red
        btn.setTitle("Testing Lenght of button", for: .normal)
        return Kitten.create(.horizontal).from().startPadding(10).endPadding(10)
        .isAlignDirectionEnd(true)
        .add(lbl).fillParent()
        .add(btn)
        .build()
    }
    
    func itemVerticals() -> UIView{
        let ivBanner = UIImageView()
        let lblPlanName = UILabel()
        let lblDesc = UILabel()
        let lblPrice = UILabel()
        let btnAction = UIButton()
//        self.backgroundColor = UIColor.white
        ivBanner.contentMode = .scaleAspectFit
        lblPlanName.text = "123"
        lblDesc.text = "12421"
        lblPrice.text = "12321"
        btnAction.setTitle("Test", for: .normal)
        btnAction.backgroundColor = UIColor.blue
        let container = Kitten.create(.vertical).from().defaultAlignment(.center).isAlignDirectionEnd(true)
            .itemDefaultSideStartPadding(5).itemDefaultSideEndPadding(5).endPadding(5)
            .add(ivBanner).sideEndPadding(0).sideStartPadding(0).align(.parent).height(80, .equal)
            .add(lblPlanName).itemOffset(5)
            .add(lblDesc)
            .add(lblPrice).itemOffset(5)
            .add(UIView()).fillParent()
            .add(btnAction)
            .build()
        container.backgroundColor = UIColor.green
        return container
    }
    @objc func btnOnClick(){
//        let nv = UINavigationController(rootViewController: AlignBottomButtonExampleViewController())
//        self.present(nv, animated: true, completion: nil)
        textViewA.text = ("Hello ew nwevwevj envkwekj vwekjbvewjkbv wjekbvweb jwbekbvjwekb wkebvwke bkwb wke")
        kitten?.rebuild()
    }
    
    func fillParentExample() -> UIView{
        let lblA = UILabel()
        let lblB = UILabel()
        let lblC = UILabel()
        lblA.text = "viewA";
        lblB.text = "viewB svsdnlvsdlkvlkvnklvnewlk nkernreklnvelrn lrenlre nlrenler lk ";
        lblC.text = "viewC";
        lblA.backgroundColor = UIColor.red
        lblB.backgroundColor = UIColor.green
        lblC.backgroundColor = UIColor.blue
        return Kitten.create(.horizontal).from()//.isAlignDirectionEnd(true)
        .add(lblA)
        .add(lblB).fillParent()
        .add(lblC).importanceHigh()
        .build()
    }
    
    func example() -> UIView {
        let lblA = UILabel()
        let lblB = UILabel()
        let lblC = UILabel()
        lblA.text = "viewA";
        lblB.text = "viewB svsdnlvsdlkvlkvnklvnewlk nkernreklnvelrn lrenlre nlrenler lk ";
        lblC.text = "viewC";
        lblA.backgroundColor = UIColor.blue
        let view = Kitten.vertical().from().startPadding(10).endPadding(50).itemDefaultOffset(20)
            .add(lblA)
            .add(lblB)
            .add(lblC)
            .build()
        view.backgroundColor = UIColor.gray
//        return view
        return Kitten.vertical().from()
            .add(view).build()
    }
    
    func bugExample() -> UIView {
        let lblTitle = UILabel()
        let lblName = UILabel()
        let tfContactPerson = UITextField()
        let lblPhone = UILabel()
        let tfTel = UITextField()
        let lblAddress = UILabel()
        let tfFlat = UITextField()
        let tfBlock = UITextField()
        let tfStreet = UITextField()
        let tfFloor = UITextField()
        let tfBuilding = UITextField()
        let sbDistrict = UIButton()
        let sbCity = UIButton()
        lblTitle.text = "sdivh idsh is"
        lblName.text = "sfsd "
        tfContactPerson.placeholder = "sd s"
        lblPhone.text = "sdfdsf"
        lblAddress.text = "sdfdsf"
        tfTel.placeholder = "sd s"
        tfFlat.placeholder = "sd s"
        tfBlock.placeholder = "sd s"
        tfStreet.placeholder = "sd s"
        tfFloor.placeholder = "sd s"
        tfBuilding.placeholder = "sd s"
        sbDistrict.setTitle("sg owejoew", for: .normal)
        sbCity.setTitle("sdf s", for: .normal)
        let kitten = Kitten.create(.vertical).from(UIView()).itemDefaultOffset(10)
        return kitten
            .add(lblTitle)
            .add(
                Kitten.create(.vertical).from().itemDefaultOffset(10)
                    .add(lblName).itemOffset(15)
                    .add(tfContactPerson)
                    .add(lblPhone).itemOffset(15)
                    .add(tfTel)
                    .add(lblAddress).itemOffset(15)
                    .add(tfFlat)
                    .add(tfFloor)
                    .add(tfBlock)
                    .add(tfStreet)
                    .add(tfBuilding)
                    .add(sbDistrict)
                    .add(sbCity)
                    .build()
            )
            .build()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
}

