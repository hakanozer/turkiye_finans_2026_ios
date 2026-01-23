//
//  AppDelegate.swift
//  turkiye_finans_2026_ios
//
//  Created by HAKAN ÖZER on 19.01.2026.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    // 1. Uygulama ilk açıldığında (Launch) çalışır.
        // SDK başlatma, tema ayarları gibi bir defalık işlemler burada yapılır.
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            print("AppDelegate Uygulama Hazır!")
            return true
        }

        // 2. Uygulama 'Aktif' durumdan çıkarken (örneğin telefon gelince) çalışır.
        // Oyunlarda oyunu durdurmak, zamanlayıcıları askıya almak için kullanılır.
        func applicationWillResignActive(_ application: UIApplication) {
            print("AppDelegate Uygulama duraklatılıyor (Resign Active)...")
        }

        // 3. Uygulama tamamen arka plana geçtiğinde çalışır.
        // Kullanıcı verilerini kaydetmek ve hafızayı boşaltmak için kritik noktadır.
        func applicationDidEnterBackground(_ application: UIApplication) {
            print("AppDelegate Arka plana geçildi. Kaynaklar serbest bırakıldı.")
        }

        // 4. Uygulama arka plandan geri gelmek üzereyken çalışır.
        // Henüz kullanıcı UI görmez. Hazırlık aşamasıdır.
        func applicationWillEnterForeground(_ application: UIApplication) {
            print("AppDelegate Tekrar ön plana dönülüyor...")
        }

        // 5. Uygulama artık 'Aktif' ve kullanıcıyla etkileşimdedir.
        // Durdurulan animasyonlar veya ağ istekleri buradan devam ettirilir.
        func applicationDidBecomeActive(_ application: UIApplication) {
            print("AppDelegate Uygulama tamamen aktif!")
        }

        // 6. Uygulama tamamen kapatılmadan (Kill) hemen önce çalışır.
        // Kısa süreli son kayıtlar için kullanılır (Sadece uygulama arka planda değilse garantidir).
        func applicationWillTerminate(_ application: UIApplication) {
            print("AppDelegate Uygulama sonlandırılıyor.")
        }


}

