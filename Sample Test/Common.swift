//
//  Common.swift
//  Sample Test
//
//  Created by murugan on 13/08/17.
//  Copyright © 2017 murugan. All rights reserved.
//

import UIKit
import Alamofire
class Common: NSObject {
    
    func MakeGetRequest(urlString: String,parameterssss: Any,type:HTTPMethod, completionHandler: @escaping (_ JSON : Any,_ error : NSString) -> ())
    {
        let fileUrl = Foundation.URL(string: urlString)
        let params=parameterssss as Any as! [String : String]
        Alamofire.request(fileUrl!, method: type, parameters: params).responseJSON
            {
                response in
                let jsonData:Any
                let resultString = String(describing: response.result)
                if(resultString == "SUCCESS")
                {
                    jsonData = response.result.value!
                    completionHandler(jsonData, resultString as NSString)

                }
                else{
                    print(response.result.error!)
                    completionHandler({ return response.result.error}, resultString as NSString)
                    
                }
                


                
        }
    }
    

}
