//
//  ContentView.swift
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

struct BarcodeScannerView: View {
    
    @State private var scannedCode = ""
    
    @State private var alertItem: AlertItem?
    
    var body: some View {
        NavigationView {
            VStack {
                ScannerView(scannedCode: $scannedCode, alertItem: $alertItem)
                    .frame(maxWidth: .infinity, maxHeight: 300)
                
                Spacer().frame(height: 60)
                
                Label("Scanned Barcode:", systemImage: "barcode.viewfinder")
                    .font(.title)
                
                Text(scannedCode.isEmpty ? "Not Yet Scanned" : scannedCode)
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(scannedCode.isEmpty ? .red: .green)
                    .padding()
                
             
            }
            .navigationTitle("Barcode Scanner")
            .alert(item: $alertItem) { alertItem in
                Alert(title: Text(alertItem.title), message: Text(alertItem.message), dismissButton: alertItem.dismissButton)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BarcodeScannerView()
    }
}
