//
//  QRCodeView.swift
//  inocul8
//
//  Created by Kris Reid on 11/11/2022.
//

import SwiftUI
import CoreImage.CIFilterBuiltins


struct QRCodeView: View {
    
    let context = CIContext()
    let filter = CIFilter.qrCodeGenerator()
    
    func generateQRCode(from string: String) -> UIImage {
        let data = Data(string.utf8)
        filter.setValue(data, forKey: "inputMessage")

        if let outputImage = filter.outputImage {
            if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgimg)
            }
        }
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
    
    var body: some View {
        Image(uiImage: generateQRCode(from: "https://github.com/KrisReid"))
            .interpolation(.none)
            .resizable()
            .scaledToFill()
            .frame(width: 120, height: 120)
    }
}

struct QRCodeView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeView()
    }
}
