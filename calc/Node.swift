//
//  Node.swift
//  calc
//
//  Created by Rhys Biddle on 26/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation


class Node{
    var data : String
    var left : Node
    var right : Node
    
    init(data: String, left: Node, right : Node){
        self.data = data
        self.left = left
        self.right = right
    }
}
