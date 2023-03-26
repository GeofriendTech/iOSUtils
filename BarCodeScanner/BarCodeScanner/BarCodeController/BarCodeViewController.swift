//
//  BarCodeViewController.swift
//  BarCodeScanner
//
//  Created by SHASHANK SINGH on 18/03/23.
//
import Foundation
import UIKit
import AVFoundation

// Delegate callback for the QRScannerView.
public protocol QRScannerViewDelegate: AnyObject {
    func qrScanningDidFail()
    func qrScannSucceededWithCode(_ code: String?)
}

class BarCodeViewController: UIViewController {
    var delegate: QRScannerViewDelegate?
    
    var captureSession = AVCaptureSession()
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var qrCodeFrameView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }

    func initialSetup() {
        // Get the back-facing camera for capturing videos
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { delegate?.qrScanningDidFail()
            return }

        do {
            // Get an instance of the AVCaptureDeviceInput class using the previous device object.
            let input = try AVCaptureDeviceInput(device: videoCaptureDevice)

            // Set the input device on the capture session.
            captureSession.addInput(input)
            
            // Initialize a AVCaptureMetadataOutput object and set it as the output device to the capture session.
            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureSession.addOutput(captureMetadataOutput)
            
            // Set delegate and use the default dispatch queue to execute the call back
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            captureMetadataOutput.metadataObjectTypes = [.qr, .ean8, .ean13, .pdf417]
            
            // Initialize the video preview layer and add it as a sublayer to the viewPreview view's layer.
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
            videoPreviewLayer?.frame = view.frame
            view.layer.addSublayer(videoPreviewLayer!)
            
            // Start video capture.
            captureSession.startRunning()

        } catch {
            // If any error occurs, simply print it out and don't continue any more.
            print(error)
            return
        }
    }
}

extension BarCodeViewController: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        // Check if the metadataObjects array is not nil and it contains at least one object.
        if metadataObjects.count == 0 {
            qrCodeFrameView?.frame = CGRect.zero
            delegate?.qrScanningDidFail()
            return
        }

        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            guard let stringValue = readableObject.stringValue else { return }
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            captureSession.stopRunning()
            delegate?.qrScannSucceededWithCode(stringValue)
        }
    }
}
