//
//  Handler.swift
//  Wild Fang
//
//  Created by Arthur Guiot on 15/9/18.
//  Copyright © 2018 Arthur Guiot. All rights reserved.
//

import UIKit
import Vision

extension ViewController {
    func handleClassification(request: VNRequest, error: Error?) {
        if let theError = error {
            print("Error: \(theError.localizedDescription)")
            return
        }
        guard let observations = request.results else {
            print("No results")
            return
        }
        
        let classifications = observations[0...4]
            .compactMap({ $0 as? VNClassificationObservation })
        let max = classifications.max { a, b in a.confidence < b.confidence }
        DispatchQueue.main.async {
            let text = max?.identifier
            // Do something
        }
    }
}
