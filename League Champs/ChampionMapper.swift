//
//  ChampionMapper.swift
//  League Champs
//
//  Created by Jason Scott on 4/22/17.
//  Copyright © 2017 Jason Scott. All rights reserved.
//

import Foundation
import ObjectMapper


public class ChampionList: Mappable{
    
    public var champs : [String : AnyObject]?
    var championInfo = [ChampionDetail]()
    
    init(){
        
    }
    
    required public init?(map: Map){
        champs  <- map["data"]
        
        /// Map data to ChampionDetail object and append array
        for champions in champs!{
            if let championData = Mapper<ChampionDetail>().map(JSON: champions.value as! [String : Any]) {
                ///Append Array
                championInfo.append(championData)
                
            }
            
        }
        
        ///Alphabetize Array
        championInfo.sort(by: {$0.name! < $1.name!})
        
        
        

    }
    
    
    //Mappable
    public func mapping(map: Map) {
        
    }
    
    
    
}
