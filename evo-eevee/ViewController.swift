//
//  ViewController.swift
//  evo-eevee
//
//  Created by Howe on 2023/10/14.
//

// 引入 UIKit 和 SwiftyGif 庫
import UIKit
import SwiftyGif

// 定義 ViewController，並實現 UIPickerViewDelegate 和 UIPickerViewDataSource
class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    // 初始化一個名為 stoneImages 的 UIImage 陣列
    let stoneImages: [UIImage] = [
        UIImage(named: "dawn-stone")!,
        UIImage(named: "dusk-stone")!,
        UIImage(named: "fire-stone")!,
        UIImage(named: "ice-stone")!,
        UIImage(named: "leaf-stone")!,
        UIImage(named: "thunder-stone")!,
        UIImage(named: "water-stone")!
    ]

    // IBOutlet 定義，用於和 Interface Builder 連接
    @IBOutlet weak var eeveegifImageView: UIImageView!
    @IBOutlet weak var stonePickerView: UIPickerView!
    @IBOutlet weak var afterEVOBGImageView: UIImageView!
    @IBOutlet weak var afterEVOImageView: UIImageView!

    // viewDidLoad 方法，在視圖加載後自動執行
    override func viewDidLoad() {
        super.viewDidLoad()

        // 指定 stonePickerView 的 delegate 和 dataSource 為自己
        stonePickerView.delegate = self
        stonePickerView.dataSource = self

        // 嘗試加載 gif 圖像
        do {
            let gif = try UIImage(gifName: "eevee")
            let gif2 = try UIImage(gifName: "espeon")
            self.eeveegifImageView.setGifImage(gif)
            self.afterEVOImageView.setGifImage(gif2)
        } catch {
            print(error)
        }
    }

    // MARK: - UIPickerViewDelegate
    // 返回 pickerView 的組件數量，這裡只有一個
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    // 返回 pickerView 中的行數，即 stoneImages 的長度
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return stoneImages.count
    }

    // 自定義 pickerView 中的行視圖
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: stoneImages[row])
        imageView.contentMode = .scaleToFill
        return imageView
    }

    // 設置 pickerView 行的高度
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }

    // pickerView 選項選中後的操作
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // 根據選擇的行，調用 setGifAndBG 函數
        if row == 0 {
                    setGifAndBG(index: row)
                } else if row == 1 {
                    setGifAndBG(index: row)
                } else if row == 2 {
                    setGifAndBG(index: row)
                } else if row == 3 {
                    setGifAndBG(index: row)
                } else if row == 4 {
                    setGifAndBG(index: row)
                } else if row == 5 {
                    setGifAndBG(index: row)
                } else if row == 6 {
                    setGifAndBG(index: row)
                }
    }

    // MARK: - Function Section
    // 根據選擇的行，設置對應的 gif 和背景圖
    func setGifAndBG (index: Int) {
        // 嘗試加載對應的 gif 圖像
        do {
            let evoName: [UIImage?] = [
                try UIImage(gifName:"espeon" ),
                try UIImage(gifName:"umbreon"),
                try UIImage(gifName:"flareon"),
                try UIImage(gifName:"glaceon"),
                try UIImage(gifName:"leafeon"),
                try UIImage(gifName:"jolteon"),
                try UIImage(gifName:"vaporeon")
            ]
            afterEVOImageView.setGifImage(evoName[index]!)
        } catch {
            print(error)
        }
        
        // 設置對應的背景圖
        let evoBG: [UIImage] = [
            UIImage(named: "espeon-gr4")!,
            UIImage(named: "umbreon-gr4")!,
            UIImage(named: "flareon-gr4")!,
            UIImage(named: "glaceon-gr4")!,
            UIImage(named: "leafeon-gr4")!,
            UIImage(named: "jolteon-gr4")!,
            UIImage(named: "vaporeon-gr4")!
        ]
        afterEVOBGImageView.setImage(evoBG[index])
    }
}

