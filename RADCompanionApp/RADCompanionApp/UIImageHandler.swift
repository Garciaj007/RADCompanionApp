//
//  UIImageHandler.swift
//  RADCompanionApp
//
//  Created by Beyond Help on 2020-02-10.
//  Copyright © 2020 Personal. All rights reserved.
//

import UIKit

class UIImageHandler
{
    private static var imageHandler:UIImageHandler?
    private var imageBank: [String: UIImage] = [:]
    
    private init(){}
    
    func AddImage(nickname: String, assetname: String? = nil)
    {
        if imageBank[nickname] == nil
        {
            if(assetname == nil)
            {
                imageBank[nickname] = UIImage(named: nickname)
            } else
            {
                imageBank[nickname] = UIImage(named: assetname!)
            }
        }
    }
    
    func GetImage(nickname: String) -> UIImage
    {
        return imageBank[nickname]!
    }
    
    func GetImages(nicknames: [String]) -> [UIImage]
    {
        var images: [UIImage] = []
        
        for name in nicknames
        {
            images.append(GetImage(nickname: name))
        }
        return images;
    }
    
    func Clear()
    {
        imageBank.removeAll()
    }
    
    //  Returns An Instance of Texture Handler
    static func Get() -> UIImageHandler
    {
        if(imageHandler == nil)
        {
            imageHandler = UIImageHandler()
        }
        return imageHandler!
    }
}
