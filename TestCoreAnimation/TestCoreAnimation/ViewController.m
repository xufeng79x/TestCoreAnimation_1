//
//  ViewController.m
//  TestCoreAnimation
//
//  Created by apple on 16/4/22.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"
#import "BlueView.h"
#import "RedView.h"

@interface ViewController (){
//@property (strong,nonatomic) UIView *myView;
    UIImageView *imageView;
    CALayer *blueLayer;
    UIView *myView;
    
    // 测试zposition使得两个UIView
    UIView *blueView;
    UIView *redView;
    
    // 测试圆角
    UIView *radiusView;
    
    // 测试阴影
    UIView *shadowView;
    
    // 特定的阴影视图，用于解决剪切后无法显示阴影的问题、
    UIView *shadowViewBottom;
    
    //仿射变换view
    UIView *myTransformView;
    
    //3D变换view
    UIImageView *my3DView;
    
    // 测试sublayerTransform
    UIView *containerView;
    UIView *leftView;
    UIView *RightView;
    
    
    // 正方体的6个面
    NSArray *faces;
    UIView *containerViewForFace;
}


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    // 创建view
//    
//    myView = [[UIView alloc]initWithFrame:CGRectMake(50.0f, 200.0f, 100.0f, 100.0f)];
//    
//    myView.backgroundColor = [UIColor grayColor];
//    
//    [self.view addSubview:myView];
//    
//    //  创建图层
//    blueLayer = [CALayer layer];
//    
//    blueLayer.frame = CGRectMake(50.0f, 50.0f, 100.0f, 100.0f);
//    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
//    
//    //将图层加载到backing layer上
//    [self.view.layer addSublayer:blueLayer];
    
    // 测试zposition
    //[self drawZpositionTestView];
    
    // 测试圆角
    //[self radiusView];
    
    // 测试边框
    //[self shadowView];
    //[self radiusViewBorder];
    
    // 测试阴影
    //[self shadowAndRadiusView];
    
    // 测试shadowPath
    //[self shadowPathView];
    //[self affineTransformTest];
    
    // 测试3D变换
    //[self my3DViewTest];
    
    // 测试sublayerTransform
    //[self sublayerTransformTest];
    
    // 六面体
    [self createFace];
    
}

-(void)createFace
{
    // 容器view
    containerViewForFace = [[UIView alloc]initWithFrame:CGRectMake(50, 50, 150, 150)];
    containerViewForFace.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:containerViewForFace];
    
    //  从xib中加载六个面
    faces = [[NSBundle mainBundle] loadNibNamed:@"face" owner:nil options:nil];
    
    //set up the container sublayer transform
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = -1.0 / 500.0;
    perspective = CATransform3DRotate(perspective, -M_PI_4, 1, 0, 0);
    perspective = CATransform3DRotate(perspective, -M_PI_4, 0, 1, 0);
    
    containerViewForFace.layer.sublayerTransform = perspective;
    //add cube face 1
    CATransform3D transform = CATransform3DMakeTranslation(0, 0, 75);
    [self addFace:0 withTransform:transform];
    //add cube face 2
    transform = CATransform3DMakeTranslation(75, 0, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 0, 1, 0);
    [self addFace:1 withTransform:transform];
    //add cube face 3
    transform = CATransform3DMakeTranslation(0, -75, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 1, 0, 0);
    [self addFace:2 withTransform:transform];
    //add cube face 4
    transform = CATransform3DMakeTranslation(0, 75, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 1, 0, 0);
    [self addFace:3 withTransform:transform];
    //add cube face 5
    transform = CATransform3DMakeTranslation(-75, 0, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 0, 1, 0);
    [self addFace:4 withTransform:transform];
    //add cube face 6
    transform = CATransform3DMakeTranslation(0, 0, -75);
    transform = CATransform3DRotate(transform, M_PI, 0, 1, 0);
    [self addFace:5 withTransform:transform];
    
}

- (void)addFace:(NSInteger)index withTransform:(CATransform3D)transform
{
    //get the face view and add it to the container
    UIView *face = faces[index];
    if (index != 2) {
        face.userInteractionEnabled = NO;
    }
    [containerViewForFace addSubview:face];
    //center the face view within the container
    CGSize containerSize = containerViewForFace.bounds.size;
    face.center = CGPointMake(containerSize.width / 2.0, containerSize.height / 2.0);
    // apply the transform
    face.layer.transform = transform;
}




-(void) sublayerTransformTest
{
    // 容器view
    containerView = [[UIView alloc]initWithFrame:CGRectMake(50, 50, 200, 200)];
    containerView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:containerView];
    
    //子视图
    leftView = [[UIView alloc]initWithFrame:CGRectMake(5, 5, 85, 180)];
    leftView.backgroundColor = [UIColor blueColor];
    [containerView addSubview:leftView];
    
    // 子视图
    RightView = [[UIView alloc]initWithFrame:CGRectMake(10, 5, 50, 50)];
    RightView.backgroundColor = [UIColor brownColor];
    [containerView addSubview:RightView];
    
}

-(void)sublayerTransformTestTouch_1
{
    //初始化一个3D变换
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = -1.0 / 500;
    transform = CATransform3DRotate(transform, M_PI_4, 0, 1, 0);
    
     // 设置与transform
    //containerView.layer.transform = transform;
    
    // 设定了
    containerView.layer.sublayerTransform = transform;
    
    //  某个子图层单独变换
    leftView.layer.transform = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
    RightView.layer.transform = CATransform3DMakeRotation(M_PI_4, 0, 1, 0);
    
}

-(void)my3DViewTest
{
    my3DView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    my3DView.layer.contents = (__bridge id)[UIImage imageNamed:@"haitun.png"].CGImage;
    my3DView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:my3DView];
    
}

-(void)my3DViewTestTouch
{
    //初始化一个3D变换
    CATransform3D transform = CATransform3DIdentity;
    
    // 设定透视距离
    transform.m34 = -1.0 / 500;
    
    // 进行以Y轴旋转变换
    transform = CATransform3DRotate(transform, M_PI_4, 0, 1, 0);
    
    // 赋值
    my3DView.layer.transform = transform;
}


-(void)affineTransformTest
{
    myTransformView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    myTransformView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:myTransformView];
}

-(void)affineTransformTestTouch
{
    CGAffineTransform transform = CGAffineTransformMakeRotation(M_PI_4);
    myTransformView.layer.affineTransform = transform;
}


-(void)mixAffineTransformTestTouch
{
    CGAffineTransform transform = CGAffineTransformIdentity;
    transform = CGAffineTransformScale(transform, 0.5, 0.5);//scale by 50%
    transform = CGAffineTransformRotate(transform, M_PI / 180.0 * 30.0);//rotate by 30 degrees
    transform = CGAffineTransformTranslate(transform, 200, 0);//translate by 200 points
    //apply transform to layer
    myTransformView.layer.affineTransform = transform;
}


-(void)shadowView
{
    
    shadowView  = [[UIView alloc]initWithFrame:CGRectMake(100.0f, 50.0f, 100.0f, 100.0f)];
    shadowView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:shadowView];
    
    // 设定阴影
    shadowView.layer.shadowOpacity = 1.0f;
    shadowView.layer.shadowOffset = CGSizeMake(0.0, 5.0);
    shadowView.layer.shadowRadius = 5;
    
    
    // 1. 设定圆角半径,如果视图本身是一个正方形，此时如果设定半径为其边长一半的时候将会哟圆形效果
    shadowView.layer.cornerRadius = 20.0f;
    
    
    // 2. 剪切掉子视图超出父视图的部分
    //shadowView.layer.masksToBounds = YES;
    
}

-(void)shadowPathView
{
    
    shadowView  = [[UIView alloc]initWithFrame:CGRectMake(100.0f, 50.0f, 100.0f, 100.0f)];
    shadowView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:shadowView];

    // 阴影的透明度是必须制定的
    shadowView.layer.shadowOpacity = 1.0f;
    
    // 创建一个矩形的阴影，除了矩形阴影，还可以创建其他形状的阴影，比如圆形等
    CGMutablePathRef squarePath = CGPathCreateMutable();
    
    CGPathAddRect(squarePath, NULL, CGRectMake(0,0,shadowView.bounds.size.width*2, shadowView.bounds.size.height*2));
    shadowView.layer.shadowPath = squarePath;
    CGPathRelease(squarePath);
    
}

-(void)shadowAndRadiusView
{
    // 在创建一个空的阴影视图或者图层在shadowView下方，其他参数不重要最主要的是要形状一致即可
    shadowViewBottom  = [[UIView alloc]initWithFrame:CGRectMake(100.0f, 50.0f, 100.0f, 100.0f)];
    shadowViewBottom.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:shadowViewBottom];
    
    // 设定阴影
    shadowViewBottom.layer.shadowOpacity = 1.0f;
    shadowViewBottom.layer.shadowOffset = CGSizeMake(0.0, 5.0);
    shadowViewBottom.layer.shadowRadius = 5;
    shadowViewBottom.layer.cornerRadius = 20.0f;
    
    shadowView  = [[UIView alloc]initWithFrame:CGRectMake(100.0f, 50.0f, 100.0f, 100.0f)];
    shadowView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:shadowView];
    
    // 设定阴影
    shadowView.layer.shadowOpacity = 1.0f;
    shadowView.layer.shadowOffset = CGSizeMake(0.0, 5.0);
    shadowView.layer.shadowRadius = 5;
    // 1. 设定圆角半径,如果视图本身是一个正方形，此时如果设定半径为其边长一半的时候将会哟圆形效果
    shadowView.layer.cornerRadius = 20.0f;
    // 2. 剪切掉子视图超出父视图的部分
    shadowView.layer.masksToBounds = YES;
    
}


-(void)radiusView
{
    radiusView  = [[UIView alloc]initWithFrame:CGRectMake(100.0f, 50.0f, 100.0f, 100.0f)];
    radiusView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:radiusView];
    
    
    CALayer *layer = [CALayer layer];
    
    layer.frame = CGRectMake(80.0f, 30.0f, 100.0f, 100.0f);
    layer.backgroundColor = [UIColor blueColor].CGColor;
    
    [radiusView.layer addSublayer:layer];
    
    
    // 作用于视图的图层
    
    // 1. 设定圆角半径,如果视图本身是一个正方形，此时如果设定半径为其边长一半的时候将会哟圆形效果
    radiusView.layer.cornerRadius = 20.0f;
    
    // 2. 剪切掉子视图超出父视图的部分
    radiusView.layer.masksToBounds = YES;
    
}

-(void)radiusViewBorder
{
    radiusView  = [[UIView alloc]initWithFrame:CGRectMake(100.0f, 50.0f, 100.0f, 100.0f)];
    radiusView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:radiusView];
    
    
    CALayer *layer = [CALayer layer];
    
    layer.frame = CGRectMake(80.0f, 30.0f, 100.0f, 100.0f);
    layer.backgroundColor = [UIColor blueColor].CGColor;
    
    [radiusView.layer addSublayer:layer];
    
    
    // 作用于视图的图层
    
    // 1. 设定圆角半径,如果视图本身是一个正方形，此时如果设定半径为其边长一半的时候将会哟圆形效果
    radiusView.layer.cornerRadius = 20.0f;
    
    // 2. 剪切掉子视图超出父视图的部分
    radiusView.layer.masksToBounds = NO;
    
    radiusView.layer.borderWidth = 5.0f;
    radiusView.layer.borderColor = [UIColor blackColor].CGColor;
    
}


-(void)drawZpositionTestView
{
    blueView = [[BlueView alloc]initWithFrame:CGRectMake(200.0f, 50.0f, 100.0f, 100.0f)];
    redView = [[RedView alloc]initWithFrame:CGRectMake(200.0f, 120.0f, 100.0f, 100.0f)];
    
    [self.view addSubview:blueView];
    [self.view addSubview:redView];
    
    // 修改zposition值，越大越靠前（越靠近观察者）
    blueView.layer.zPosition = 1.0;
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    //[self changeColor];
//    [self anchorPointRotateLeftUp];
    
    //[self affineTransformTestTouch];
    
    //[self mixAffineTransformTestTouch];
    
    //[self my3DViewTestTouch];
    
    [self sublayerTransformTestTouch_1];
    
}


-(void) changeColor
{
    blueLayer.backgroundColor = [UIColor redColor].CGColor;
    
    self.view.layer.backgroundColor = [UIColor redColor].CGColor;
}

-(void) anchorPointRotateCenter
{
    myView.transform = CGAffineTransformRotate(myView.transform, 1.0);
}

#pragma mark - 哈哈哈哈哈啊哈哈哈啊哈哈
-(void) anchorPointRotateLeftUp
{
    myView.layer.anchorPoint = CGPointMake(0.0f, 0.0f);
     myView.transform = CGAffineTransformRotate(myView.transform, 1.0);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    //创建图像显示控件
//    imageView=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"boll.png"]];
//    imageView.center=CGPointMake(160, 50);
//    [self.view addSubview:imageView];
//}
//
//#pragma mark 点击事件
//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    UITouch *touch=touches.anyObject;
//    CGPoint location= [touch locationInView:self.view];
//    /*创建弹性动画
//     damping:阻尼，范围0-1，阻尼越接近于0，弹性效果越明显
//     velocity:弹性复位的速度
//     */
//    [UIView animateWithDuration:5.0 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:1.0 options:UIViewAnimationOptionCurveLinear animations:^{
//        imageView.center=location; //CGPointMake(160, 284);
//    } completion:nil];
//}

@end
