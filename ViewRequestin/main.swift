import AVFoundation
import CoreAudioKit

let manager = AVAudioUnitComponentManager.shared()

let res = manager.components { (desc, _) in
    desc.name.contains("Surge")
}

let unit = AVAudioUnit.instantiate(with: res[0].audioComponentDescription, options: []) { (unit, err) in
    print("instantiated")
    guard let unit = unit else { fatalError() }
    DispatchQueue.main.async {
        unit.auAudioUnit.requestViewController(completionHandler: { (vc) in
            print("vc \(vc)")
        })
    }
}


RunLoop.current.run()

