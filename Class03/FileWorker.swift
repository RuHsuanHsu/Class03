//
//  FileWorker.swift
//  Class03
//
//  Created by L20102 on 2019/5/27.
//  Copyright © 2019 L20102-02. All rights reserved.
//

import Foundation

protocol FileWorkerDelegate {
    func fileWorkWriteCompleted(_ sender:FileWorker, fileName : String, tag : Int)
    func fileWorkReadCompleted(_ sender:FileWorker, content : String, tag : Int)
}

class FileWorker {
    
    var fileWorkerDelegate : FileWorkerDelegate?
    
    
    func writeToFile(content:String, fileName:String, tag:Int)  {
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let fileURL  = dir.appendingPathComponent(fileName)
            
            do{
                try content.write(to: fileURL, atomically: false, encoding: .utf8)
                
                self.fileWorkerDelegate?.fileWorkWriteCompleted( self, fileName: fileURL.absoluteString , tag: tag)
            }
            catch{ print(error) }
            
        }
        
        
    }
    
    
    func readFromFile(fileName:String, tag:Int) -> String  {
        var result : String = ""
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let fileURL  = dir.appendingPathComponent(fileName)
            
            do{
                let content = try String(contentsOf: fileURL, encoding: .utf8 )
                
                self.fileWorkerDelegate?.fileWorkReadCompleted(self, content: content, tag: tag)
                
                result = content
            }
            catch{ print(error) }
            
        }
        
        return result
    }
    
    
}
