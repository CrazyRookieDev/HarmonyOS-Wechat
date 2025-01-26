import window from '@ohos.window';

export class WindowManager {
  static statusBarHeight: number = 0
  static navBarHeight: number = 0
  /**
   * 沉浸式状态栏颜色和状态栏icon
   */
  static async immerseColor(color?: string, light?: boolean) {
    // 获取当前应用窗口
    let windowClass: window.Window = await window.getLastWindow(getContext())
    // 将状态栏和导航栏的背景色设置为跟应用窗口相同的颜色
    await windowClass.setWindowSystemBarProperties({
      navigationBarColor: color,
      statusBarColor: color,
      navigationBarContentColor: color,
      statusBarContentColor: color,
      isStatusBarLightIcon: light,
      isNavigationBarLightIcon: light
    })
  }

  /**
   * 沉浸式全屏(全屏屏幕，且显示状态栏、导航栏)
   */
  static async immerseFullScreenAsync(windowStage: window.WindowStage) {
    let windowClass: window.Window = await windowStage.getMainWindow()
    // 获取状态栏和导航栏的高度
    windowClass.on("avoidAreaChange", async data => {
      if (data.type == window.AvoidAreaType.TYPE_SYSTEM) {
        // 将值保存到静态变量中，以便后续使用
        WindowManager.statusBarHeight = px2vp(data.area.topRect.height)
        WindowManager.navBarHeight = px2vp(data.area.bottomRect.height)
      }
      if (data.type == window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR) {
        // 这里直接覆盖底部三键导航栏的高度，因为两者显示是互斥的
        WindowManager.navBarHeight = px2vp(data.area.bottomRect.height)
      }
    })
    // 设置窗口布局为沉浸式布局
    windowClass.setWindowLayoutFullScreen(true)
    // 设置状态栏和导航栏可用
    windowClass.setWindowSystemBarEnable(["status", "navigation"])
    // 设置状态栏和导航栏的背景为透明
    windowClass.setWindowSystemBarProperties({
      navigationBarColor: "#00000000",
      statusBarColor: "#00000000",
    })
  }

  /**
   * 沉浸式全屏(全屏屏幕，且显示状态栏、导航栏)
   */
  static immerseFullScreenSync(windowStage: window.WindowStage) {
    // 同步获取一个主窗口实例
    let windowClass: window.Window = windowStage.getMainWindowSync()
    let area = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR);
    let navBar = px2vp(area.bottomRect.height)
    area = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM);
    // 状态栏高度
    const statusBar = px2vp(area.topRect.height)
    if (!navBar) {
      // 优先获取底部指示器导航栏高度，如果没有值得再尝试获取常规导航栏(鸿蒙5.0以下的传统底部三键导航栏)高度，两者显示是互斥的
      navBar = px2vp(area.bottomRect.height)
    }

    // 将值保存到静态变量中，以便后续使用
    WindowManager.statusBarHeight = statusBar
    WindowManager.navBarHeight = navBar

    // 设置窗口布局为沉浸式布局
    windowClass.setWindowLayoutFullScreen(true)
    windowClass.setWindowSystemBarEnable(["status", "navigation"])
    // 设置状态栏和导航栏的背景为透明
    windowClass.setWindowSystemBarProperties({
      navigationBarColor: "#00000000",
      statusBarColor: "#00000000",
    })
  }

  /**
   * 完全全屏（全铺屏幕，且隐藏状态栏、导航栏）
   */
  static async fullScreen() {
    let windowClass = await window.getLastWindow(getContext())
    //设置导航栏，状态栏不可见
    await windowClass.setWindowSystemBarEnable([])
  }
}

export default WindowManager

