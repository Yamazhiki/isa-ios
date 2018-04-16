//
// Created by Yamazhiki on 21/03/2018.
// Copyright (c) 2018 ENT-LIVE. All rights reserved.
//

import Foundation
import Prelude
import RxSwift
import RxCocoa
import RxDataSources

class LiveListViewController: RxViewController {
    @IBOutlet weak var collectionView: UICollectionView!

    fileprivate var data = ["Yamazhiki", "ISA"]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.apply {
            $0.layer.cornerRadius =2
        }
    }
}
