//
//  CameraProtocol.swift
//  ReactNativeCameraKit
//

import AVFoundation

protocol CameraProtocol: AnyObject, FocusInterfaceViewDelegate {
    var previewView: UIView { get }

    func setup(cameraType: CameraType, supportedBarcodeType: [AVMetadataObject.ObjectType])
    func cameraRemovedFromSuperview()

    func update(torchMode: TorchMode)
    func update(flashMode: FlashMode)
    func update(cameraType: CameraType)
    func update(onOrientationChange: RCTDirectEventBlock?)
    func update(onZoom: RCTDirectEventBlock?)
    func update(zoom: Double?)
    func update(maxZoom: Double?)

    func zoomPinchStart()
    func zoomPinchChange(pinchScale: CGFloat)

    func isBarcodeScannerEnabled(_ isEnabled: Bool,
                                 supportedBarcodeTypes: [AVMetadataObject.ObjectType],
                                 onBarcodeRead: ((_ barcode: String, _ codeFormat: CodeFormat) -> Void)?)

    func update(scannerFrameSize: CGRect?)

    func capturePicture(onWillCapture: @escaping () -> Void,
                        onSuccess: @escaping (_ imageData: Data, _ thumbnailData: Data?) -> (),
                        onError: @escaping (_ message: String) -> ())
}
