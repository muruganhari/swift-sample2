//
//  ViewController.swift
//  Sample Test
//
//  Created by murugan on 10/08/17.
//  Copyright © 2017 murugan. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    var timer:Timer?
    var activityIndicator:UIActivityIndicatorView?
    override func viewDidLoad() {
        super.viewDidLoad()
//       timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        
        // Do any additional setup after loading the view, typically from a nib.
        
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activityIndicator?.frame = CGRect(x:0.0,y: 0.0,width: 40.0, height: 40.0)
        activityIndicator?.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.whiteLarge
        activityIndicator?.color=UIColor.red
        activityIndicator?.center = CGPoint(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 2)
        
        activityIndicator?.startAnimating()
        self.view.addSubview((activityIndicator)!)
        
         self.update()
        
       // let params :NSDictionary = ["foo":"murugan"]
           }
    func update()
    {
        Common().MakeGetRequest(urlString: "https://httpbin.org/post",parameterssss: ["foo":"murugan"] as Dictionary,type: .post) { (data: Any, result: NSString) in
            if(result == "SUCCESS")
            {
                var list:NSDictionary=NSDictionary();
                list=data as! NSDictionary
                print(list)
                self.activityIndicator?.stopAnimating()
            }
            
        }

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

}

