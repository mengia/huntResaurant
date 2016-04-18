//
//  ReviewViewController.swift
//  HuntRestaurant
//
//  Created by Mengistayehu Mamo on 4/13/16.
//  Copyright © 2016 Mengistayehu Mamo. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    @IBOutlet var blurEffectBackgroudView: UIImageView!
    @IBOutlet var ratingAnnimation: UIStackView!
    var rating:String?
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.ratingAnnimation.transform = CGAffineTransformMakeScale(0.0, 0.0)
        
        let blurEffect = UIBlurEffect(style: .Dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectBackgroudView.addSubview(blurEffectView)
        
        

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(animated: Bool) {
        
        UIView.animateKeyframesWithDuration(0.7, delay: 0.0, options: [], animations: { () -> Void in
            self.ratingAnnimation.transform = CGAffineTransformIdentity
            }, completion: nil)
    }
    
    @IBAction func ratingSelected(sender: UIButton) {
        
        switch (sender.tag) {
        case 100:
            rating = "dislike"
        case 200:
            rating = "good"
        case 300:
            rating = "best"
        default:
            break;
        }
        performSegueWithIdentifier("unwindToDetailView", sender: sender)

    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
