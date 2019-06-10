//
//  NavigationViewPage.swift
//  Example
//
//  Created by 晋先森 on 2019/6/10.
//  Copyright © 2019 晋先森. All rights reserved.
//

import SwiftUI

struct NavigationViewPage : View {
    var body: some View {
        NavigationView {
            Text("🧚‍♂️🧚‍♀️🧜‍♂️🧜‍♀️🧞‍♂️🧞‍♀️").blur(radius: 5)
            Text("Swifter Swifter").bold().color(.orange).font(.largeTitle)
        }.navigationBarTitle(Text("NavigationView"))
    }
}

#if DEBUG
struct SpacerPage_Previews : PreviewProvider {
    static var previews: some View {
        NavigationViewPage()
    }
}
#endif
