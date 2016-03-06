//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Nathaniel Hajian on 3/3/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {

    //outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var lightboxTransition: LightboxTransition!
    var image: UIImage!
    var targetOriginalCenter: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = CGSize(width: 320, height: 1000)
        imageView.image = image
        scrollView.delegate = self
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapDone(sender: UIButton) {
        
        dismissViewControllerAnimated(true, completion: nil)

    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        print("begin dragging")
        
        UIView.animateWithDuration(0.05) { () -> Void in
           
        }
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        print("hallo")
        print(scrollView.contentOffset.y)
        
        if scrollView.contentOffset.y > 0 {
            scrollView.backgroundColor = UIColor(white: 0, alpha: 1-(scrollView.contentOffset.y * 0.01))
        } else if scrollView.contentOffset.y < 0 {
            scrollView.backgroundColor = UIColor(white: 0, alpha: 1-(scrollView.contentOffset.y * -0.01))
        }
        
    }
    
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("end dragging")
        if scrollView.contentOffset.y >= 70 {
            dismissViewControllerAnimated(true, completion: nil)
        } else if scrollView.contentOffset.y <= -70 {
            dismissViewControllerAnimated(true, completion: nil)
        } else if scrollView.contentOffset.y > 0 && scrollView.contentOffset.y < 70 {
            print("should animate back")
            UIView.animateWithDuration(0.2, animations: { () -> Void in
                self.scrollView.contentOffset.y = 0
                self.scrollView.backgroundColor = UIColor(white: 0, alpha: 1)
                
               
            })
        } else if scrollView.contentOffset.y < 0 && scrollView.contentOffset.y > -70 {
            
        }
    }

    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        print("end decelerating")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
