//
//  Event.swift
//  Events
//
//  Created by ANDREW VARVEL on 1/09/2014.
//  Copyright (c) 2014 Andrew Varvel. All rights reserved.
//

import Foundation

import Realm

class Event:RLMObject {
    dynamic var eventTitle = ""
    dynamic var eventSubtitle = ""
    dynamic var position = 0
}