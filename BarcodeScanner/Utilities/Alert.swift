//
//  Alert.swift
//  BarcodeScanner
//
//  Created by 近藤宏輝 on 2022/02/15.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: String
    let message: String
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidDeviceInput = AlertItem(title: "機能が正常では無い", message: "カメラ機能が何か不足していまっせ", dismissButton: .default(Text("OKでっせ")))
    
    static let invalidScannedType = AlertItem(title: "スキャンが正常では無い", message: "スキャンが読み取りできていませんで", dismissButton: .default(Text("OKどす")))
}
