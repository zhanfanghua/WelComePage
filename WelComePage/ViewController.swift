//
//  ViewController.swift
//  WelComePage
//
//  Created by rain on 9/16/15.
//  Copyright © 2015 rain. All rights reserved.
//

import UIKit //第一次使用github在线修改功能／继续用客户端修改2015.10.12 3:22 /上传成功

class ViewController: UIViewController , UIScrollViewDelegate{
    var scrollView = UIScrollView()
    var pageControl = UIPageControl()
    var goMainViewButton : UIButton!
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        goMainViewButton = UIButton()
        goMainViewButton.backgroundColor = UIColor(red: 240/255.0, green: 10/255.0, blue: 10/255.0, alpha: 0.7)
    
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.center = CGPointMake(self.view.frame.width/2, self.view.frame.height-35)
        pageControl.currentPageIndicatorTintColor = UIColor.redColor()
        pageControl.pageIndicatorTintColor = UIColor.whiteColor()
        pageControl.numberOfPages = 3
        pageControl.addTarget(self, action: "scrollViewDidEndDecelerating", forControlEvents: UIControlEvents.ValueChanged)
        
        
        scrollView = UIScrollView(frame:CGRectMake(0, 0, self.view.frame.width, self.view.frame.height))
        scrollView.contentSize = CGSizeMake(self.view.frame.width * 3.0, 0)
        scrollView.pagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = false
        scrollView.delegate = self
        
        for i in 0...2{
            var imageView = UIImageView()
            imageView = UIImageView(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height))
            let image = UIImage(named: "pic\(i)")
            imageView.image = image
            imageView.frame.origin.x = self.view.frame.width * CGFloat(i)
            scrollView.addSubview(imageView)
            
       
        }
        self.view.addSubview(scrollView)
        self.view.addSubview(pageControl)
        //goMainViewButton!.backgroundColor = UIColor.redColor()
        self.scrollView.addSubview(goMainViewButton!)
        
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x / self.view.frame.width)
        print(index,scrollView.contentOffset.x,self.view.frame.width)
        pageControl.currentPage = index
        if index == 2{
            goMainViewButton.frame =  CGRectMake(self.view.frame.size.width * 2 + 40 , self.view.frame.height, self.view.frame.width-80, 50)
            goMainViewButton.layer.cornerRadius = 10
            goMainViewButton.setTitle("SWIFT", forState: UIControlState.Normal)
            goMainViewButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            goMainViewButton.titleLabel?.font = UIFont.systemFontOfSize(40)
            goMainViewButton.addTarget(self, action: "gotoStartView:", forControlEvents: UIControlEvents.TouchUpInside)
            
            UIView.animateWithDuration(2, delay: 0.5, options:UIViewAnimationOptions.BeginFromCurrentState, animations: { () -> Void in
                self.goMainViewButton.frame =  CGRectOffset(self.goMainViewButton.frame, 0, -150)
                }, completion: nil)
        }

    }
    func gotoStartView(button:UIButton){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let startView = sb.instantiateViewControllerWithIdentifier("startView") as UIViewController
        self.presentViewController(startView, animated: false, completion: nil)
    }

}

