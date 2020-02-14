//
//  NetworkManager.swift
//  RADCompanionApp
//
//  Created by Juriel Garcia on 2020-02-04.
//  Copyright © 2020 Personal. All rights reserved.
//

import Foundation

class UDPNetworkManager
{
    static var networkManager: UDPNetworkManager?
    
    private init(){}
    
    func send(text: String, host: String, port: CUnsignedShort)
    {
        let sock = socket(AF_INET, SOCK_DGRAM, 0)
        
        var addr = sockaddr_in()
        addr.sin_len = __uint8_t(MemoryLayout<sockaddr_in>.size)
        addr.sin_family = sa_family_t(AF_INET)
        addr.sin_port = htons(port)
        inet_pton(AF_INET, host, &addr.sin_addr)
        
        let result = text.withCString { str -> Int in
            var tempAddr = addr
            let result = withUnsafePointer(to: &tempAddr) { ptr -> Int in
                let mem = UnsafeRawPointer(ptr).bindMemory(to: sockaddr.self, capacity: 1)
                let sent = sendto(sock, str, strlen(str), 0, mem, socklen_t(addr.sin_len))
                return sent
            }
            return result
        }
        
        if(result < 0)
        {
            print("Error Sending UDP packet")
        }
        
        close(sock)
    }
    

    
    static func Get() -> UDPNetworkManager
    {
        if(networkManager == nil)
        {
            networkManager = UDPNetworkManager()
        }
        return networkManager!;
    }
}

public func htons(_ value: CUnsignedShort) -> CUnsignedShort
{
    return (value << 8) + (value >> 8)
}
