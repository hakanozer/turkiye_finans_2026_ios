//
//  NotificationExtension.swift
//  CoreApp
//
//  Created by HAKAN ÖZER on 21.01.2026.
//

import Foundation

extension Notification.Name {
    public static let didReceiveUnauthorized = Notification.Name("didReceiveUnauthorized")
    public static let didReceiveForbidden = Notification.Name("didReceiveForbidden")
    public static let didReceiveServerError = Notification.Name("didReceiveServerError")
}
