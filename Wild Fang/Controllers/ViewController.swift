//
//  ViewController.swift
//  Wild Fang
//
//  Created by Arthur Guiot on 15/9/18.
//  Copyright © 2018 Arthur Guiot. All rights reserved.
//

import UIKit
import AVFoundation
import Vision

class ViewController: UIViewController {
    // Model
    let model = SqueezeNet().model
    
    
    // video capture session
    let session = AVCaptureSession()
    // preview layer
    var previewLayer: AVCaptureVideoPreviewLayer!
    // queue for processing video frames
    let captureQueue = DispatchQueue(label: "captureQueue")
    // overlay layer
    var gradientLayer: CAGradientLayer!
    // vision request
    var visionRequests = [VNRequest]()
    var recognitionThreshold : Float = 0.25
    
    @IBOutlet weak var previewView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        previewLayer.frame = self.previewView.bounds;
        gradientLayer.frame = self.previewView.bounds;
        
        previewLayer?.connection?.videoOrientation = .portrait
    }

}

