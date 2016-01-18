# PAChartView-xib

## CocoaPods的注意点

里面用了一个第三方库Masonry，方便用代码加限制。要执行以下```pod install```才能编译通过

## 当时的想法

1. PAChartView这一级是按照xib来做组件的思路来实现的，坐标轴和画图组件PAPlotView之间用Autolayout来布局的
2. PAPlotView是一个画折线图的小组件，用CALayer实现的，用绝对布局的思想，要用frame，是代码写的
3. 加载是由系统自动加载xib实现的，UIController不需要写调用代码
4. 项目工程里要用到的图表也就两三种，所以没有做成通用组件，而是一个只显示两三种的特殊组件
