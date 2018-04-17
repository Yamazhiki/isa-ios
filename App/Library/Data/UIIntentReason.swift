//
// Created by Yamazhiki on 30/03/2018.
// Copyright (c) 2018 ISA. All rights reserved.
//

import Foundation
import UIKit

private enum TransitionType {
    case push
    case present
}

protocol UIControllerTaskType: UIContinuableTaskType {
    var controller: UIViewController { get }
    /*目标Controller*/
    var targetController: UIViewController? { get }
    /*当前Controller引用*/
    var block: (UIViewController) -> Void { get }
}

extension UIViewController {

    fileprivate struct OpenStrobeAssociatedKeys {
        static var openStrobe = "openStrobe"
    }

    fileprivate var openStrobe: (() -> Void)? {
        get {
            return objc_getAssociatedObject(self, &OpenStrobeAssociatedKeys.openStrobe) as? () -> Void
        }
        set {
            objc_setAssociatedObject(self,
                    &OpenStrobeAssociatedKeys.openStrobe,
                    newValue,
                    .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }

    final func prepareIntent(intent: UIControllerTaskType) {
        let block = {
            if let vc = intent.targetController {
                self.present(vc, animated: true)
            }
        }
        if intent.condition {
            block()
        } else {
            let vc = intent.controller
            vc.openStrobe = {
                intent.block(vc)
                block()
            }
            self.present(vc, animated: true, completion: nil)
        }
    }

    /// 当状态发生变化的时候
    final func updateTaskStatus() {
        openStrobe?()
    }
}

extension UIViewController {
}

/*用户登录意图*/
enum UILoginReason: UIControllerTaskType {

    case live_prepare
    var condition: Bool {
        return AppEnvironment.current.currentUser.id != 0
    }

    var controller: UIViewController {
        return AppControllerRouter.Login.controller
    }
    var targetController: UIViewController? {
        switch self {
        case .live_prepare: return AppControllerRouter.PrepareLive.controller
        }
    }
    var block: (UIViewController) -> Void {
        return { vc in
            vc.dismiss(animated: true, completion: nil)
        }
    }
}
