//
//  ViewController.swift
//  BLEScanner
//
//  Created by Aljoscha Schnider on 03.05.22.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController, CBCentralManagerDelegate {
    private var centralManager: CBCentralManager!
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            print("Bluetooth is On")
            centralManager.scanForPeripherals(withServices: nil, options: nil)
        } else {
            print("Bluetooth is not active")
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        centralManager = CBCentralManager(delegate: self, queue: nil, options: nil)
        // dont do anything
        // Do any additional setup after loading the view.
    }
    
    public func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        print("\nName   : \(peripheral.name ?? "(No name)")")
        print("RSSI   : \(RSSI)")
        for ad in advertisementData {
            print("AD Data: \(ad)")
        }
    }


}

