#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,strong) UIButton *startButton;
@property(nonatomic,strong) UIButton *stopButton;
@property(nonatomic,strong) UISlider *speedSlider;
@property(nonatomic,strong) UILabel *speedLabel;
@property(nonatomic,strong) UILabel *counterLabel;

@property(nonatomic,assign) NSInteger counter;
@property(nonatomic,strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = UIColor.blackColor;
    self.counter = 0;

    self.startButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.startButton.frame = CGRectMake(50, 120, 120, 50);
    [self.startButton setTitle:@"تشغيل" forState:UIControlStateNormal];
    [self.startButton addTarget:self
                         action:@selector(startPressed)
               forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.startButton];

    self.stopButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.stopButton.frame = CGRectMake(200, 120, 120, 50);
    [self.stopButton setTitle:@"إيقاف" forState:UIControlStateNormal];
    [self.stopButton addTarget:self
                        action:@selector(stopPressed)
              forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.stopButton];

    self.speedSlider = [[UISlider alloc] initWithFrame:CGRectMake(40,220,300,30)];
    self.speedSlider.minimumValue = 0.1;
    self.speedSlider.maximumValue = 5.0;
    self.speedSlider.value = 1.0;
    [self.speedSlider addTarget:self
                         action:@selector(speedChanged)
               forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.speedSlider];

    self.speedLabel = [[UILabel alloc] initWithFrame:CGRectMake(40,260,300,30)];
    self.speedLabel.textColor = UIColor.whiteColor;
    self.speedLabel.text = @"السرعة: 1.0";
    [self.view addSubview:self.speedLabel];

    self.counterLabel = [[UILabel alloc] initWithFrame:CGRectMake(40,320,300,30)];
    self.counterLabel.textColor = UIColor.whiteColor;
    self.counterLabel.text = @"عدد النقرات: 0";
    [self.view addSubview:self.counterLabel];
}

- (void)startPressed {
    double interval = self.speedSlider.value;

    self.timer = [NSTimer scheduledTimerWithTimeInterval:interval
                                                  target:self
                                                selector:@selector(doClick)
                                                userInfo:nil
                                                 repeats:YES];
}

- (void)stopPressed {
    [self.timer invalidate];
    self.timer = nil;
}

- (void)doClick {
    self.counter++;
    self.counterLabel.text =
    [NSString stringWithFormat:@"عدد النقرات: %ld",(long)self.counter];
}

- (void)speedChanged {
    self.speedLabel.text =
    [NSString stringWithFormat:@"السرعة: %.1f",self.speedSlider.value];
}

@end
