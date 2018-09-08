//
//  ViewController.swift
//  TiffanyBalcarcel-Lab3
//
//  Created by Tiffany Balcarcel on 7/1/18.
//  Copyright © 2018 Tiffany Balcarcel. All rights reserved.
//

import UIKit

class ViewController: UIViewController { //added in UIControl
    
//    var currentCircleCenter = CGPoint.zero
    var currentPath: Path = Path(points: [], width: 0, color: UIColor.white, shape: "Circle")
//    var currentPath:PathView!
    var pathCanvas: PathView!
    var currentWidth: CGFloat = 10
//    var paths: [PathView] = []
    var currentColor = UIColor.black
    var lastDrawn: [Path?] = []
    var currentShape = "Circle"
    
    var myRect = CGRect()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        pathView.thePath = Path(points: [], width: 0, color: UIColor.white)
//        myRect = CGRect(x:0, y:0, width:pathView.frame.width, height: (pathView.frame.height - 40))
        myRect = CGRect(x:0, y:0, width:pathView.frame.width, height: (pathView.frame.height - 40))
        pathCanvas = PathView(frame: myRect)
        pathView.addSubview(pathCanvas)
        updateButtonColors()
        print("view loaded")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var clearButton: UIBarButtonItem!
    @IBOutlet weak var undoButton: UIBarButtonItem!
    @IBOutlet weak var redoButton: UIBarButtonItem!
    // Icons made by Smashicons" from https://www.flaticon.com/ is licensed by Creative Commons BY 3.0
    
    @IBAction func clearScreen(_ sender: UIBarButtonItem) {
        pathCanvas.thePath = nil
        pathCanvas.paths = []
        lastDrawn = []
        updateButtonColors()
        print("screen was cleared")
    }
    
    @IBAction func undoPrevious(_ sender: Any) {
        if pathCanvas.paths.count == 0 {
            return
        }
        lastDrawn.append(pathCanvas.paths.last)
        pathCanvas.paths.removeLast()
        updateButtonColors()
    }
    @IBAction func redoDraw(_ sender: UIBarButtonItem) {
        if lastDrawn.count == 0 {
            return
        }
        pathCanvas.paths.append(lastDrawn[lastDrawn.count - 1]!)
        lastDrawn.removeLast()
        updateButtonColors()
    }
    
    @IBOutlet weak var sliderOG: UISlider!
    
    @IBAction func radiusSlider(_ sender: UISlider) {
        //Slider value can go from 0 to 40
        currentWidth = CGFloat(sliderOG.value)
        print("new width is \(currentWidth)")
    }
    
    @IBOutlet var pathView: PathView!
    
    @IBOutlet weak var redColor: ColorButton!
    @IBOutlet weak var orangeColor: ColorButton!
    @IBOutlet weak var yellowColor: ColorButton!
    @IBOutlet weak var greenColor: ColorButton!
    @IBOutlet weak var blueColor: ColorButton!
    @IBOutlet weak var purpleColor: ColorButton!
    @IBOutlet weak var blackColor: ColorButton!
    @IBOutlet weak var eraser: UIButton!
    //Icon made by bqlqn from Flaticon is licensed by Creative Commons BY 3.0
    @IBOutlet weak var customColor: ColorButton!
    @IBOutlet weak var saveButton: UIButton!
    
    
    
    @IBAction func redChosen(_ sender: ColorButton) {
        currentColor = UIColor.red
    }
    @IBAction func orangeChosen(_ sender: ColorButton) {
        currentColor = UIColor.orange
    }
    @IBAction func yellowChosen(_ sender: ColorButton) {
        currentColor = UIColor.yellow
    }
    @IBAction func greenChosen(_ sender: ColorButton) {
        currentColor = UIColor.green
    }
    @IBAction func blueChosen(_ sender: ColorButton) {
        currentColor = UIColor.blue
    }
    @IBAction func purpleChosen(_ sender: ColorButton) {
        currentColor = UIColor.purple
    }
    @IBAction func blackChosen(_ sender: ColorButton) {
        currentColor = UIColor.black
    }
    @IBAction func eraserChosen(_ sender: UIButton) {
        if pathCanvas.paths.count == 0 {
            return
        }
        currentColor = UIColor.white
    }
    
    @IBAction func customChosen(_ sender: Any) {
        let ac = UIAlertController(title: "Enter Red, Blue, and Green RBG values between 0 and 240", message: nil, preferredStyle: .alert)
        ac.addTextField()
        ac.addTextField()
        ac.addTextField()
        let submitAction = UIAlertAction(title: "Enter", style: .default) { [unowned ac] _ in
            let red = ac.textFields![0]
            let green = ac.textFields![1]
            let blue = ac.textFields![2]
            //do something with answer here
            if let redValue = Float(red.text!) {
                if redValue >= 0 && redValue <= 240 {
                    if let greenValue = Float(green.text!) {
                        if greenValue >= 0 && greenValue <= 240 {
                            if let blueValue = Float(blue.text!) {
                                if blueValue >= 0 && blueValue <= 240 {
                                    self.currentColor = UIColor(red: CGFloat(redValue), green: CGFloat(greenValue), blue: CGFloat(blueValue), alpha: 1)
                                }
                                else {
                                    return
                                }
                            }
                        }
                        else {
                            return
                        }
                    }
                }
                else {
                    return
                }
            }
            else {
                return
            }
        }
        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    
    @IBAction func saveChosen(_ sender: Any) {
        takeScreenshot()
    }
    
    func takeScreenshot() {
        UIGraphicsBeginImageContext(myRect.size)
        let screenShot = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        print("screenshot complete")
        UIImageWriteToSavedPhotosAlbum(screenShot!, nil, nil, nil)
        print("image saved to photos album")
    }
    
    
    @IBAction func shapeOpen(_ sender: Any) {
        let ac = UIAlertController(title: "Change Shape", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Circle", style: .default, handler: changeToCircle))
        ac.addAction(UIAlertAction(title: "Square", style: .default, handler: changeToSquare))
        ac.addAction(UIAlertAction(title: "Thickening Line", style: .default, handler: changeToThicker))
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(ac, animated: true, completion: nil)
    }
    
    func changeToCircle(action: UIAlertAction!) {
        currentShape = "Circle"
        print("\(currentShape) has been chosen")
    }
    func changeToSquare(action: UIAlertAction!) {
        currentShape = "Square"
        print("\(currentShape) has been chosen")
    }
    func changeToThicker(action: UIAlertAction!) {
        currentShape = "Thick"
        print("\(currentShape) has been chosen")
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchPoint = touches.first?.location(in: view) else { return }
        print("point is \(touchPoint)")
        currentPath.color = currentColor
        currentPath.width = currentWidth
        currentPath.shape = currentShape
        currentPath.points.append(touchPoint)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchPoint = touches.first?.location(in: view) else { return }
        print("moved to \(touchPoint)")
        currentPath.points.append(touchPoint)
        pathCanvas.thePath = currentPath
        updateButtonColors()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchPoint = touches.first?.location(in: view) else { return }
        print("ended at \(touchPoint)")
        /* 
        pathView.thePath?.points.append(touchPoint)
//        currentPath.points.append(touchPoint)
        pathView.paths.append(currentPath)
 */
        if currentPath.points.count != 0 {
            pathCanvas.thePath = nil
            pathCanvas.paths.append(currentPath)
            print("current number of paths: \(pathCanvas.paths.count)")
            currentPath.points = []
        }
        updateButtonColors()
    }
    
    func updateButtonColors() {
        //change color to light gray or alpha = 1
        if pathCanvas.paths.count == 0 {
            undoButton.tintColor = UIColor.lightGray
            clearButton.tintColor = UIColor.lightGray
            eraser.alpha = 0.2
        }
        if lastDrawn.count == 0 {
            redoButton.tintColor = UIColor.lightGray
        }
        //change color to aqua blue or alpha = 0.2
        if pathCanvas.paths.count > 0 {
            undoButton.tintColor = UIColor.blue
            clearButton.tintColor = UIColor.blue
            eraser.alpha = 1
        }
        if lastDrawn.count != 0 {
            redoButton.tintColor = UIColor.blue
        }
    }

}

