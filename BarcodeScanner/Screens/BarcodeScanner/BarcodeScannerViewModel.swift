//
//  BarcodeScannerViewModel.swift
//  BarcodeScanner
//
//  Created by 近藤宏輝 on 2022/02/15.
//

import SwiftUI

final class BarcodeScannerViewModel: ObservableObject {
    @Published var scannedCode = ""
    @Published var alertItem: AlertItem?
    
    var statusText: String {
        return scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode
    }
    
    var statusTextColor: Color {
        return scannedCode.isEmpty ? .red: .green
    }
}
