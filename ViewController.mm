#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong) UILabel *label;
@property(nonatomic,strong) UIButton *btn;
@property(nonatomic,assign) int count;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = UIColor.blackColor;

    self.count = 0;

    self.label = [[UILabel alloc] initWithFrame:CGRectMake(50,150,300,50)];
    self.label.textColor = UIColor.whiteColor;
    self.label.text = @"0";
    [self.view addSubview:self.label];

    self.btn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.btn.frame = CGRectMake(50,250,150,50);
    [self.btn setTitle:@"اضغط" forState:UIControlStateNormal];
    [self.btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn];
}

- (void)click {
    self.count++;
    self.label.text = [NSString stringWithFormat:@"%d", self.count];
}

@end
