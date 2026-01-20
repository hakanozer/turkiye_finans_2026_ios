//
//  ViewController.swift
//  turkiye_finans_2026_ios
//
//  Created by HAKAN ÖZER on 19.01.2026.
//

import UIKit
import CoreApp


class ViewController: UIViewController {

       // 1. Görünüm belleğe yüklendiğinde çalışır (Sadece 1 kez).
        // UI hazırlıkları, delegasyon atamaları ve bir kez yapılacak kurulumlar burada olur.
        override func viewDidLoad() {
            super.viewDidLoad()
            print("viewDidLoad: View belleğe yüklendi.")
            
            let user = User(name: "Ali", email: "ali@mail.com")
            _ = user.dbConnect()
            
            let addDolar = "100".withDollar()
            print(addDolar)
            
            
            enableKeyboardDismissOnSwipeUp()
        }

        // 2. Görünüm ekrana gelmeden hemen önce çalışır.
        // Verileri her seferinde güncellemek veya UI'ı gizlemek/göstermek için kullanılır.
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            print("viewWillAppear: View ekrana gelmek üzere.")
        }

        // 3. Görünüm ekrana tamamen yerleştiğinde çalışır.
        // Animasyonları başlatmak veya API isteklerini tetiklemek için idealdir.
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            print("viewDidAppear: View artık ekranda.")
        }

        // 4. Görünüm ekrandan kaybolmadan hemen önce çalışır.
        // Veri kaydetme, klavyeyi kapatma veya ağ isteklerini iptal etme yeridir.
        override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            print("viewWillDisappear: Kullanıcı sayfadan ayrılıyor.")
        }

        // 5. Görünüm ekrandan tamamen gittiğinde çalışır.
        // Bildirim gözlemcilerini (observers) kaldırmak için kullanılır.
        override func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
            print("viewDidDisappear: Sayfa tamamen kapandı.")
        }

        // 6. Bellek uyarısı alındığında çalışır.
        // Önbellekteki (cache) gereksiz büyük verileri temizlemek için kullanılır.
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            print("Uyarı: Bellek doluyor, gereksiz verileri temizle!")
        }


}

