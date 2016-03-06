//
//  NewsFeedViewController.swift
//  Facebook
//
//  Created by Timothy Lee on 8/3/14.
//  Copyright (c) 2014 codepath. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController {

    
    //outlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedImageView: UIImageView!
    
    
    //variables
    var lightboxTransition: LightboxTransition!
    var selectedImage: UIImageView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // content size of the scroll view
        scrollView.contentSize = CGSizeMake(320, feedImageView.image!.size.height)
        
        lightboxTransition = LightboxTransition()
        lightboxTransition.duration = 1
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //Actions
    
    @IBAction func didTapPhoto(sender: UITapGestureRecognizer) {
       
        selectedImage = sender.view as! UIImageView
        performSegueWithIdentifier("photoSegue", sender: self)

    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        
        let photoViewController = segue.destinationViewController as! PhotoViewController
        
        //Passing images
        photoViewController.image = self.selectedImage.image
        
        //Tell source VC to omit its own transition
        photoViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        //Transitioning into Lightbox
        photoViewController.transitioningDelegate = lightboxTransition
        lightboxTransition.duration = 0.3
        
        photoViewController.view.layoutIfNeeded()
    }
    
    
}
