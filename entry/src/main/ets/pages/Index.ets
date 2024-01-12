import router from '@ohos.router';


@Entry
@Component
struct TabsExample {
  @State currentIndex: number = 0;
  private tabsController: TabsController = new TabsController();

  @Builder TabBuilder(targetIndex: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg)
        .size({ width: 25, height: 25 })
      // Text(title)
      //   .fontColor(this.currentIndex === targetIndex ? '#1698CE' : '#6B6B6B')
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
    .onClick(() => {
      this.currentIndex = targetIndex;
      this.tabsController.changeIndex(this.currentIndex);
    })
  }

  build() {
    Tabs({ barPosition: BarPosition.End, controller: this.tabsController }) {
      TabContent() {
        Column().width('100%').height('100%').backgroundColor('#ffffff')
      }
      .tabBar(this.TabBuilder( 0, $r('app.media.todo_selected'), $r('app.media.todo_normal')))

      TabContent() {
        Column().width('100%').height('100%').backgroundColor('#ffffff')
      }
      .tabBar(this.TabBuilder( 1, $r('app.media.calendar_selected'), $r('app.media.calendar_normal')))

      TabContent() {
        Column().width('100%').height('100%').backgroundColor('#ffffff')
      }
      .tabBar(this.TabBuilder( 2, $r('app.media.settings_selected'), $r('app.media.settings_normal')))
    }
    .barWidth('100%')
    .barHeight(50)
    .onChange((index: number) => {
      this.currentIndex = index;
    })
  }
}