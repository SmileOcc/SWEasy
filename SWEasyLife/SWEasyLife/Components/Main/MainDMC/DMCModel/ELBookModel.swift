//
//  ELBookModel.swift
//  SWEasyLife
//
//  Created by occ on 16/7/26.
//  Copyright © 2016年 ox. All rights reserved.
//

import UIKit

class ELBookModel: BaseModel {

    var dict: NSDictionary?
    
    convenience init (dict: NSDictionary) {
        self.init()
        self.dict = dict
    }
    
    func coverImage () -> UIImage? {
        if let cover = dict?["cover"] as? String {
            return UIImage(named: cover)
        }
        return nil
    }
    
    func pageImage (index: Int) -> UIImage? {
        if let pages = dict?["pages"] as? NSArray {
            if let page = pages[index] as? String {
                return UIImage(named: page)
            }
        }
        
        return nil
    }
    
    func numberOfPages () -> Int {
        if let pages = dict?["pages"] as? NSArray {
            return pages.count
        }
        return 0
    }

}
