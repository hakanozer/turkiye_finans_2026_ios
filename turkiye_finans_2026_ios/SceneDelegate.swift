//
//  SceneDelegate.swift
//  turkiye_finans_2026_ios
//
//  Created by HAKAN ÖZER on 19.01.2026.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


        // 1. Sahne (Scene) uygulamaya bağlandığında çalışır.
        // Storyboard kullanılıyorsa pencere otomatik oluşturulur, ancak kodla UI oluşturmak için burası kalbidir.
        func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
            print("Scene bağlandı: Pencere (Window) oluşturuluyor.")
            guard let _ = (scene as? UIWindowScene) else { return }
        }

        // 2. Kullanıcı uygulamayı ekrandan tamamen ayırdığında (pencereyi kapattığında) çalışır.
        // Bellekte tutulmasına gerek olmayan büyük kaynakları burada serbest bırakın.
        func sceneDidDisconnect(_ scene: UIScene) {
            print("Scene bağlantısı kesildi. Kaynakları temizle.")
        }

        // 3. Sahne aktif hale geldiğinde ve kullanıcıyla etkileşime hazır olduğunda çalışır.
        // Uygulama açıldığında veya arka plandan gelindiğinde UI güncellemesi için kullanılır.
        func sceneDidBecomeActive(_ scene: UIScene) {
            print("Sahne aktif: Kullanıcı etkileşimi başladı.")
        }

        // 4. Sahne aktiflikten çıkmak üzereyken çalışır (Örn: Kontrol Merkezi'nin açılması).
        // Hassas verileri gizlemek veya geçici durdurmalar için idealdir.
        func sceneWillResignActive(_ scene: UIScene) {
            print("Sahne pasifleşiyor: UI etkileşimi kesildi.")
            window?.viewWithTag(1)?.removeFromSuperview()
        }

        // 5. Sahne ön plana (Foreground) geçiş yaptığında çalışır.
        func sceneWillEnterForeground(_ scene: UIScene) {
            print("Sahne ön plana dönüyor.")
        }

        // 6. Sahne tamamen arka plana (Background) geçtiğinde çalışır.
        // Uygulama durumunu kaydetmek (Save State) için en kritik metottur.
        func sceneDidEnterBackground(_ scene: UIScene) {
            print("Sahne arka planda: Verileri kaydet.")
            // Örnek: CoreData kaydı veya kullanıcı session bilgisi saklama
        }


}

