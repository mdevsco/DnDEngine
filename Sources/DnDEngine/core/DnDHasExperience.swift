//
//  DnDExperience.swift
//  
//
//  Created by Rodney Aiglstorfer on 8/22/22.
//

import Foundation

protocol DnDHasExperience {
    var xp: Int { get }
}

extension DnDHasExperience {
    var level: Int {
        get {
            if (xp < 300) {
                return 1;
            } else if (xp < 900) {
                return 2;
            } else if (xp < 2700) {
                return 3;
            } else if (xp < 6500) {
                return 4;
            } else if (xp < 14000) {
                return 5;
            } else if (xp < 23000) {
                return 6;
            } else if (xp < 34000) {
                return 7;
            } else if (xp < 48000) {
                return 8;
            } else if (xp < 64000) {
                return 9;
            } else if (xp < 85000) {
                return 10;
            } else if (xp < 100000) {
                return 11;
            } else if (xp < 120000) {
                return 12;
            } else if (xp < 140000) {
                return 13;
            } else if (xp < 165000) {
                return 14;
            } else if (xp < 195000) {
                return 15;
            } else if (xp < 225000) {
                return 16;
            } else if (xp < 265000) {
                return 17;
            } else if (xp < 305000) {
                return 18;
            } else if (xp < 355000) {
                return 19;
            } else {
                return 20;
            }
        }
    }
}
