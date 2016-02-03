//
//  QRCodeViewController.swift
//  AppInesQRCode
//
//  Created by renanjunior on 15/10/15.
//  Copyright © 2015 acerp. All rights reserved.
//

import UIKit
import AVFoundation
import Alamofire

class QRCodeViewController : UIViewController, AVCaptureMetadataOutputObjectsDelegate{
    
    
    @IBOutlet weak var messageLabel:UILabel!
    var captureSession:AVCaptureSession?
    var videoPreviewLayer:AVCaptureVideoPreviewLayer?
    @IBOutlet weak var qrCodeFrameView:UIView?
    @IBOutlet weak var viewBorder:UIView?
    var qrCodeNameScan:String?
    var a : JSON = JSON.null
    
    let supportedBarCodes = [AVMetadataObjectTypeQRCode, AVMetadataObjectTypeCode128Code, AVMetadataObjectTypeCode39Code, AVMetadataObjectTypeCode93Code, AVMetadataObjectTypeUPCECode, AVMetadataObjectTypePDF417Code, AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeAztecCode]
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let captureDevice = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        
        do{
            // Get an instance of the AVCaptureDeviceInput class using the previous device object.
            let input = try AVCaptureDeviceInput(device: captureDevice)
            
            // Initialize the captureSession object.
            captureSession = AVCaptureSession()
            // Set the input device on the capture session.
            captureSession?.addInput(input)
            
            // Initialize a AVCaptureMetadataOutput object and set it as the output device to the capture session.
            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureSession?.addOutput(captureMetadataOutput)
            
            // Set delegate and use the default dispatch queue to execute the call back
            captureMetadataOutput.setMetadataObjectsDelegate(self, queue: dispatch_get_main_queue())
            
            // Detect all the supported bar code
            captureMetadataOutput.metadataObjectTypes = supportedBarCodes
            
            // Initialize the video preview layer and add it as a sublayer to the viewPreview view's layer.
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            videoPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
            
            print(qrCodeFrameView!.layer.bounds)
            print(viewBorder!.layer.bounds)
            print(viewBorder!.frame.height)
            print(viewBorder!.frame.width)
            
            Alamofire.request(.GET, "https://celularregistradows.herokuapp.com/cad_celular/qrcode/909646")
                .responseString { response in
                    print("Response String: \(response.result.value)")
                    print("Response String: \(response.result.error)")
                }
                .responseJSON { response in
                    print("Response JSON: \(response.result.value)")
                    print("Response String: \(response.result.error)")
            }
            
            ws.getCelularQRCode(
                {retorno in
                    self.a = retorno!
                    return
                }, tipo: ("909646"))
            
        
            
        } catch {
            
            print(error)
            return
        }
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        print(qrCodeFrameView!.layer.bounds)
        print(viewBorder!.layer.bounds)
        print(viewBorder!.frame.height)
        print(viewBorder!.frame.width)

        videoPreviewLayer?.frame = qrCodeFrameView!.layer.bounds
        if((videoPreviewLayer) != nil){
            qrCodeFrameView?.layer.addSublayer(videoPreviewLayer!)
            // Start video capture
            captureSession?.startRunning()
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func captureOutput(captureOutput: AVCaptureOutput!, didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection connection: AVCaptureConnection!) {
        
        // Check if the metadataObjects array is not nil and it contains at least one object.
        if metadataObjects == nil || metadataObjects.count == 0 {
            //qrCodeFrameView?.frame = CGRectZero
            return
        }
        
        // Get the metadata object.
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        // Here we use filter method to check if the type of metadataObj is supported
        // Instead of hardcoding the AVMetadataObjectTypeQRCode, we check if the type
        // can be found in the array of supported bar codes.
        if supportedBarCodes.contains(metadataObj.type) {
            
            if metadataObj.stringValue != nil {
                qrCodeNameScan = metadataObj.stringValue
                print(qrCodeNameScan)
                captureSession?.stopRunning()
                // self.performSegueWithIdentifier("goPlayer", sender: self)
               
                
                
            }
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        /*
        if segue.identifier == "goPlayer" {
            let childViewController = segue.destinationViewController as! PlayerViewController
            childViewController.qrCodeName = qrCodeNameScan
        }
        */
    }
    
    
}