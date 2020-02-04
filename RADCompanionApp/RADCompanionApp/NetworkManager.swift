//
//  NetworkManager.swift
//  RADCompanionApp
//
//  Created by Beyond Help on 2020-02-04.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation
import Network

class NetworkManager
{
    var connection: NWConnection?
    
    func connectUDP(ip4 host: NWEndpoint.Host, _ port: NWEndpoint.Port)
    {
        self.connection = NWConnection(host: host, port: port, using: .tcp)
        
        self.connection?.stateUpdateHandler = { (state) in
            switch state {
            case .ready:
                print("Ready...")
                self.sendUDP("This is Some Message")
                let response = String(decoding:(self.recieveUDP()!), as: UTF8.self)
                print(response)
                break
            case .setup:
                break
            case .cancelled:
                break
            case .preparing:
                break
            default:
                print("Error: State Not Defined!\n")
            }
        }
    }
    
    func sendUDP(_ content:Data)
    {
        self.connection?.send(content: content, completion: NWConnection.SendCompletion.contentProcessed(({ (NWError) in
            if(NWError == nil)
            {
                print("Data sent!")
            }
            else
            {
                print("Error: Data Not Sent!\tNWError: \(NWError!)")
            }
            
        })))
    }
    
    func sendUDP(_ content:String)
    {
        let data = content.data(using: .ascii)
        sendUDP(data!);
    }
    
    func recieveUDP() -> Data?
    {
        var recievedData: Data?;
        self.connection?.receiveMessage{ (data, ctx, isComplete, error) in
            if(isComplete)
            {
                print("Data Recieved!")
                if(data != nil)
                {
                    recievedData = data;
                }
            }
        }
        return recievedData;
    }
}
