//
//  WebViewExtensions.swift
//  swiftToHtmlPoc
//
//  Created by Quagnitia on 6/19/19.
//  Copyright © 2019 Quagnitia. All rights reserved.
//

import Foundation
import WebKit

extension WKWebView {

    /*Known issues
     1. Not entire HTML is visible
     2. CSS rendering is distorted
     3. Footer is messed up
     4. */

    func exportAsPdf() -> String {
        let pdfData = createPdfDataContent(printFormatter: self.viewPrintFormatter())
        return self.saveWebViewPdf(data: pdfData)
    }

    func createPdfDataContent(printFormatter: UIViewPrintFormatter) -> NSMutableData {
        let originalBounds = self.bounds
        self.bounds = CGRect(x: originalBounds.origin.x, y: bounds.origin.y, width: self.bounds.size.width, height: self.scrollView.contentSize.height)
        let pdfPageFrame = CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.scrollView.contentSize.height)

        let printPageRenderer = UIPrintPageRenderer()
        printPageRenderer.addPrintFormatter(printFormatter, startingAtPageAt: 0)
        printPageRenderer.setValue(NSValue(cgRect: UIScreen.main.bounds), forKey: "paperRect")
        printPageRenderer.setValue(NSValue(cgRect: pdfPageFrame), forKey: "printableRect")
        self.bounds = originalBounds //bring back the HTML to it's OG rect form
        return printPageRenderer.generatePdfData()
    }

    func saveWebViewPdf(data: NSMutableData) -> String {

        let docDirectoryPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let pdfPath = docDirectoryPath.appendingPathComponent("myReports.pdf")
        if data.write(to: pdfPath, atomically: true) {
            return pdfPath.path
        } else {
            return String()
        }
    }
}

extension UIPrintPageRenderer {

    func generatePdfData() -> NSMutableData {
        let pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, self.paperRect, nil)
        self.prepare(forDrawingPages: NSMakeRange(0, self.numberOfPages))
        let bounds = UIGraphicsGetPDFContextBounds()
        for i in 0..<self.numberOfPages {
            UIGraphicsBeginPDFPage();
            self.drawPage(at: i, in: bounds)
        }
        UIGraphicsEndPDFContext();
        return pdfData;
    }
}
