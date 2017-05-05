## CLTagView
- 高仿微信标签页，快速创建标签页，可多标签组  
- 视图主要分为上下两个部分，和微信标签页一样，上部分为<font color = "red">输入标签展示框</font>，下部分为<font color = "red">历史标签展示框</font>

### 使用方式
- 只需将**CLTagView**文件夹拖入工程，按照以下方式初始化即可
- **CLTools.h**中有对标签视图相关属性的设置，如颜色，大小等

#### 初始化并显示

```
// ----- 一个模型就是一个标签组
CLTagsModel *model = [[CLTagsModel alloc] init];
model.title = @"所有标签";
model.tagsArray = _recentTagsM.copy;
    
CLTagsModel *model1 = [[CLTagsModel alloc] init];
model1.title = @"第一印象";
model1.tagsArray = @[@"牛B", @"霸气", @"杜甫", @"李白", @"asdadadasd", @"1231313131", @"sdksalkjfalkjfaj", @"zvkzknmncmalkjdsfkljaskldf"];
    
CLTagsModel *model2 = [[CLTagsModel alloc] init];
model2.title = @"我最与众不同的是";
model2.tagsArray = @[@"确实不同", @"很不同", @"这有什么不同",@"大哥。真的不同", @"sccscasdfaf", @"adf345sdg", @"sadfl;k90808098", @"🌹,💔", @"择力", @"啫喱"];

// -----

// 创建并初始化标签控制器
CLTagViewController *tagVC = [[CLTagViewController alloc] init];
tagVC.tagsDelegate = self;

// 设置下半部分显示的标签组
//    tagVC.tagsModelArray = @[model];
tagVC.tagsModelArray = @[model, model1, model2];  // 传入多个模型，显示多个标签组

// 设置上部分默认显示的标签, 不传则只显示标签的输入框
tagVC.tagsDisplayArray = @[@"呵呵", @"我是打酱油的"];

// 下部分是否高亮上部分共有的标签
tagVC.highlightTag = YES;

// 跳转
[self.navigationController pushViewController:tagVC animated:YES];
```

```
#pragma mark - CLTagViewControllerDelegate 点击保存,返回贴上的标签
- (void)tagViewController:(CLTagViewController *)tagController tags:(NSArray<NSString *> *)tags {
    // 此代理方法中获取到贴上的标签，并做相关处理
    NSLog(@"%@", tags);
}

```

#### CLTagViewController.h中初始化属性
```
@interface CLTagViewController : UIViewController

/**
 标签展示页默认显示标签
 */
@property (nonatomic, strong) NSArray<NSString *> *tagsDisplayArray;

/**
 最近标签页默认显示的标签
 */
@property (nonatomic, strong) NSArray<CLTagsModel *> *tagsModelArray;

/**
 最近标签页是否高亮展示页中相同的标签
 */
@property (assign, nonatomic, getter=isHighlightTag) BOOL highlightTag;

/**
 设置标签的圆角(不设置值则默认是控件高度的一半)
 */
@property (assign, nonatomic) CGFloat cornerRadius;

/**
 设置输入框中输入时标签的文字颜色(默认黑色)
 */
@property (strong, nonatomic) UIColor *normalTextColor;

/**
 设置输入框中输入时标签的边框颜色(默认灰色)
 */
@property (strong, nonatomic) UIColor *textFieldBorderColor;

/**
 限制单个标签最大输入的字符个数（默认是10）
 */
@property (assign, nonatomic) NSInteger maxStringAmount;

/**
 最多显示标签的行数(默认是3)
 */
@property (assign, nonatomic) NSInteger maxRows;
```


#### 效果如下
![Markdown](http://i2.muimg.com/583177/60989174db92d0a5.gif)
