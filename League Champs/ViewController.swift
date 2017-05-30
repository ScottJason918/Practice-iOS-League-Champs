//
//  ViewController.swift
//  League Champs
//
//  Created by Jason Scott on 4/21/17.
//  Copyright © 2017 Jason Scott. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import Kingfisher
import SVProgressHUD


class CollectionViewController: UICollectionViewController {
    
    ///Accessing Array in ChampionMapper
    var champList = ChampionList()
    
    ///API URL to obtain correct Version
    var versionURL = "https://global.api.riotgames.com/api/lol/static-data/NA/v1.2/realm?api_key=feec407a-94fe-4886-a8ed-3cc889a15c66"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        versionAPI(url: versionURL)
        
    }
    
    ///AlamoFire internet calls
    func versionAPI(url : String){
        print("test Start")
        SVProgressHUD.show();
        Alamofire.request(url).responseJSON(completionHandler: {
            response in
            
            let result = response.result
            if let res = result.value{
                if Mapper<VersionFinder>().map(JSONObject: res as! [String : AnyObject]) != nil{
                    
                }
            }
        })
        SVProgressHUD.dismiss()
        
        print("test end")
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

