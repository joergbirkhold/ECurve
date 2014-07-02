//
//  FiniteField.swift
//  Crypto Coin Swift
//
//  Created by Sjors Provoost on 26-06-14.
//

import UInt256

enum FiniteField : Printable {
    case PrimeField(p: UInt256)
    
    func intWithDec(dec: String) -> FFInt {
        return FFInt(value: UInt256(decimalStringValue: dec), field: self)
    }
    
    func int(val: UInt256) -> FFInt {
        return FFInt(value: val, field: self)
    }

    var description: String {
        switch self {
        case let .PrimeField(p):
            return "Prime field p = \( p ) "
        }
    }
}

func == (lhs: FiniteField, rhs: FiniteField) -> Bool {
    switch lhs {
    case let .PrimeField(p1):
        switch(rhs) {
        case let .PrimeField(p2):
            return p1 == p2
        }
    }
}