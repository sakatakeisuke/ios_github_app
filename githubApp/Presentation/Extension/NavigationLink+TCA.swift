//
//  NavigationLink+TCA.swift
//  githubApp
//
//  Created by Sakata Keisuke on 2024/08/18.
//

import SwiftUI
import ComposableArchitecture

/// ListでこのNavigationLinkを使う時、itemからどの要素がタップされたのかの判別がつかず、isActiveが全てtrueになり予期せぬ動作を行うため、
/// タップした要素だけisActive=trueになるようにcheckを外部から注入し参照する
@available(iOS, introduced: 13, deprecated: 16)
extension NavigationLink {
  public init<D, C: View>(
    item: Binding<D?>,
    check: @escaping () -> Bool,
    onNavigate: @escaping (_ isActive: Bool) -> Void,
    @ViewBuilder destination: (D) -> C,
    @ViewBuilder label: () -> Label
  ) where Destination == C? {
    self.init(
      destination: item.wrappedValue.map(destination),
      isActive: Binding(
        get: { item.wrappedValue != nil && check() },
        set: { isActive, transaction in
          if isActive {
              onNavigate(true)
          } else {
            item.transaction(transaction).wrappedValue = nil
          }
        }
      ),
      label: label
    )
  }
}
