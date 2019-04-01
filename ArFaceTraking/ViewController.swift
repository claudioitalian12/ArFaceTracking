//
//  ViewController.swift
//  ArFaceTraking
//
//  Created by Cavalli Claudio on 29/03/2019.
//  Copyright © 2019 Cavalli Claudio. All rights reserved.
//

import UIKit
import ARKit
import SceneKit
class ViewController: UIViewController {
    @IBOutlet weak var arScene: ARSCNView!
    let url = Bundle.main.url(forResource: "ironManHead", withExtension: "scn", subdirectory: "Models.scnassets")!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard ARFaceTrackingConfiguration.isSupported else { return }
        let configuration = ARFaceTrackingConfiguration()
        arScene.session.run(configuration, options: [])
        arScene.delegate = self
    }
}

extension ViewController: ARSCNViewDelegate{
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        guard anchor is ARFaceAnchor else { return nil }
        
        let contentNode = SCNReferenceNode(url: url)
        contentNode?.load()
        arScene.scene.rootNode.addChildNode(contentNode!)

        return contentNode
    }
}
