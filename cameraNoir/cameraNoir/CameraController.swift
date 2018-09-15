//
//  CameraController.swift
//  cameraNoir
//
//  Created by Vagner Oliveira on 9/15/18.
//  Copyright © 2018 Vagner Oliveira. All rights reserved.
//

import AVFoundation

class CameraController {
	
	var captureSession: AVCaptureSession?
	
	func prepare(completionHandler: @escaping (Error?) -> Void) {
		func createCaptureSession() {
			self.captureSession = AVCaptureSession()
		}
		func configureCaptureDevices() throws { }
		func configureDeviceInputs() throws { }
		func configurePhotoOutput() throws { }
		
		DispatchQueue(label: "prepare").async {
			do {
				createCaptureSession()
				try configureCaptureDevices()
				try configureDeviceInputs()
				try configurePhotoOutput()
			}
				
			catch {
				DispatchQueue.main.async {
					completionHandler(error)
				}
				
				return
			}
			
			DispatchQueue.main.async {
				completionHandler(nil)
			}
		}
	}
}
