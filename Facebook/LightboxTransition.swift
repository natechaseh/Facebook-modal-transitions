//
//  LightboxTransition.swift
//  Facebook
//
//  Created by Nathaniel Hajian on 3/3/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class LightboxTransition: BaseTransition {
    
    var backgroundView: UIView!
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let newsFeedViewController = fromViewController as! NewsFeedViewController
        let photoViewController = toViewController as! PhotoViewController

        
        //Clone the selected image
        let movingImageView = UIImageView()
        movingImageView.frame = newsFeedViewController.selectedImage.frame
        movingImageView.image = newsFeedViewController.selectedImage.image
        movingImageView.clipsToBounds = newsFeedViewController.selectedImage.clipsToBounds
        movingImageView.contentMode = newsFeedViewController.selectedImage.contentMode
        
        movingImageView.frame.origin.y = newsFeedViewController.scrollView.contentOffset.y
        
        containerView.addSubview(movingImageView)
        
        photoViewController.imageView.alpha = 0
        
        newsFeedViewController.selectedImage.alpha = 0
        
        toViewController.view.alpha = 0
        
        UIView.animateWithDuration(duration, animations: {
            toViewController.view.alpha = 1
            movingImageView.frame = photoViewController.imageView.frame
            movingImageView.contentMode = photoViewController.imageView.contentMode
            }) { (finished: Bool) -> Void in
                photoViewController.imageView.alpha = 1
                movingImageView.alpha = 0
                self.finish()
        }

        
//        fromViewController.view.addSubview(backgroundView)
//        
//        toViewController.view.alpha = 0
//        toViewController.view.transform = CGAffineTransformMakeScale(0, 0)
//        UIView.animateWithDuration(duration, animations: {
//            self.backgroundView.alpha = 1
//            toViewController.view.alpha = 1
//            toViewController.view.transform = CGAffineTransformMakeScale(1, 1)
//            }) { (finished: Bool) -> Void in
//                self.finish()
//        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        //Cast the VCS
        let newsFeedViewController = toViewController as! NewsFeedViewController
        let photoViewController = fromViewController as! PhotoViewController
        
        //Clone the selected image
        let movingImageView = UIImageView()
        movingImageView.frame = photoViewController.imageView.frame
        movingImageView.image = photoViewController.imageView.image
        movingImageView.clipsToBounds = photoViewController.imageView.clipsToBounds
        movingImageView.contentMode = photoViewController.imageView.contentMode
        
        //Set the origin of the cloned image according to photoVC scroll
        movingImageView.frame.origin.y -= photoViewController.scrollView.contentOffset.y
   
        containerView.addSubview(movingImageView)
        newsFeedViewController.selectedImage.alpha = 0
        photoViewController.imageView.alpha = 0
        fromViewController.view.alpha = 1
        
       
        UIView.animateWithDuration(duration, animations: {
            fromViewController.view.alpha = 0
            movingImageView.frame = newsFeedViewController.selectedImage.frame
            movingImageView.frame.origin.y = newsFeedViewController.selectedImage.frame.origin.y
            }) { (finished: Bool) -> Void in
                newsFeedViewController.selectedImage.alpha = 1
                movingImageView.alpha = 0
                self.finish()
        }
    }


}
