//
//  ViewController.m
//  WristbandSH
//
//  Created by  on 2017/1/6.
//  Copyright © 2017年 Het. All rights reserved.
//

#import "ViewController.h"
#import "SHBLEManager.h"

static NSString * const DataAnalysisSetTimeDayMode = @"81";
static NSString * const DataAnalysisSetAlarm = @"83";
static NSString * const DataAnalysisSetWriteReadTarget = @"8b";
static NSString * const DataAnalysisSetBody = @"8c";
static NSString * const DataAnalysisSetHour = @"8d";
static NSString * const DataAnalysisGetActivity = @"90";
static NSString * const DataAnalysisGetSleep = @"91";
static NSString * const DataAnalysisGetWalk = @"93";
static NSString * const DataAnalysisGetElectricity = @"b0";
static NSString * const DataAnalysisGetZone = @"c1";
static NSString * const DataAnalysisSetBandShake = @"d4";
static NSString * const DataAnalysisSetWriteReadM_E_Switch = @"55";
static NSString * const DataAnalysisCtrlHR = @"d6";
static NSString * const DataAnalysisCtrlBP = @"d7";
static NSString * const DataAnalysisGetDeviceVersion = @"f0";

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{
    SHBLEManager *_BLEManager;
}
@property (weak, nonatomic) IBOutlet UITextView *logView;
@property (weak, nonatomic) IBOutlet UITextView *logViewB;
@property (weak, nonatomic) IBOutlet UILabel *commentLB;
@property (weak, nonatomic) IBOutlet UITableView *commentTB;

@property (strong, nonatomic) __block UILabel *bleState;
@property (nonatomic,copy) NSArray *comments;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.commentTB.delegate = self;
    self.commentTB.dataSource = self;
    
    self.comments = @[@"OK-设置日期时间和白天模式时间(8~20)",@"OK-设置闹钟",@"OK-读目标设置",@"OK-写目标设置",
                      @"OK-写身高体重性别",@"OK-写12/24小时制",@"OK-获取活动数量",@"OK-获取睡眠",@"OK-获取活动",
                      @"OK-获取电量",@"OK-读防丢ZONE",@"用不上-读写手环屏幕",@"用不上-读写手环按键",@"用不上-读写手环横竖屏",
                      @"OK-读手环触摸震动",@"OK-但无效果-写手环触摸震动",@"OK-工厂测试指令-开关手环震动",@"OK-读手环公制英制切换",
                      @"OK-写手环公制英制切换",@"OK-开启终端持续心率模式",@"OK-关闭终端持续心率模式",@"OK-读取心率",@"无回应-读心率模式、状态、预警设置",
                      @"写心率预警设置",@"无回应-终端血压控制指令",@"OK-版本组命令"];
    
    self.logView.editable = NO;
    self.logView.layer.borderWidth = 0.5;
    self.logView.layer.borderColor = [UIColor blackColor].CGColor;
    
    self.logViewB.editable = NO;
    self.logViewB.layer.borderWidth = 0.5;
    self.logViewB.layer.borderColor = [UIColor blackColor].CGColor;
    //4c2ad500 00897124
    //fd29d50000897124
    [self BLEManagerSetupWithMac:@"4c2ad50000897124" scanTime:10.0];
}

- (void)loadView{
    [super loadView];
    self.bleState = [[UILabel alloc] initWithFrame:self.commentLB.frame];
    self.bleState.textAlignment = NSTextAlignmentCenter;
    self.bleState.font = [UIFont systemFontOfSize:18];
    self.bleState.text = @"手环未连接";
    self.bleState.textColor = [UIColor orangeColor];
    [self.view addSubview:self.bleState];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - SHBLEManager
/**
 启动BLE服务
 
 @param timeInterval 扫描时间
 */
- (void)BLEManagerSetupWithMac:(NSString *) mac scanTime:(NSTimeInterval) timeInterval{
    if (!_BLEManager) {
        _BLEManager = [SHBLEManager sharedInstance];
    }
    [_BLEManager BleSetupWithBleMac:mac scanTime:timeInterval];
    __weak typeof(self) weakSelf = self;

    //设备连接状态变化
    _BLEManager.bleStateChangedCallback = ^(BOOL isConnected){
        if (isConnected) {
            NSLog(@"SHO9U设备已连接");
            weakSelf.bleState.text = @"手环已连接";
        }else{
            NSLog(@"SHO9U设备已断开");
            weakSelf.bleState.text = @"手环已断开";
        }
    };
    
    _BLEManager.tranDataCallback = ^(NSData *tranData){
//        NSLog(@"下行发送: %@",tranData);
        [weakSelf log:weakSelf.logView data:tranData];
    };
    
    _BLEManager.recDataCallback = ^(NSData *recData){
//        NSLog(@"上行接收: %@",recData);
        [weakSelf log:weakSelf.logViewB data:recData];
        [weakSelf dataAnalysis:recData];
    };
}

- (void)log:(UITextView *) view data:(NSData *) data{
    view.text = data.description;
}

#pragma mark - UITableViewDataSource UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.comments.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIndef = @"commentsCellIndef";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndef];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndef];
    }
    cell.textLabel.text = self.comments[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];

    switch (indexPath.row) {
        case 0:
            [_BLEManager syncWithDayStart_Hour:8 DayEnd_Hour:20];
            break;
        case 1:
            [_BLEManager syncAlarmHour:17 Minute1:32 Repeat1:0x3e Hour2:10 Minute2:44 Repeat2:0x3e Hour3:20 Minute3:0 Repeat3:0x3e];
            break;
        case 2:
            [_BLEManager getWalkTarget];
            break;
        case 3:
            [_BLEManager setWalkTarget:34080];
            break;
        case 4:
            [_BLEManager syncUserSexHeightWeight:70 height:172 sex:1 age:23];
            break;
        case 5:
            [_BLEManager setHourFormat:0];
            break;
        case 6:
            [_BLEManager syncActivity];
            break;
        case 7:
            [_BLEManager getSleepBySn:0 start_hour:20];
            break;
        case 8:
            [_BLEManager getActivityBySn:0 hour:8];
            break;
        case 9:
            [_BLEManager getBATT_LVL];
            break;
        case 10:
            [_BLEManager getBEACON_ZONE];
            break;
        case 14:
            [_BLEManager getCTRL_TOUCH_VB];
            break;
        case 15:
            [_BLEManager setCTRL_TOUCH_VBWithVb_Time:5];
            break;
        case 16:
            [_BLEManager setCTRL_TOUCH_ShakeState:1];
            break;
        case 17:
            [_BLEManager getCTRL_M_E_SWITCH];
            break;
        case 18:    
            [_BLEManager setCTRL_M_E_SWITCH:0];
            break;
        case 19:
            [_BLEManager syncAutoHRMode:0];
            break;
        case 20:
            [_BLEManager syncAutoHRMode:1];
            break;
        case 21:
            [_BLEManager getHR];
        case 22:
            [_BLEManager getHRMode_Status];
            break;
        case 23:
            
            break;
        case 24:
            [_BLEManager set_SBP_DBP:80 DBP:120];
            break;
        case 25:
            [_BLEManager checkVersion];
            break;
        default:
            break;
    }
}

#pragma data-analysis
- (void)dataAnalysis:(NSData *)originalData {
    NSString *analysisString = [self convertDataToHexStr:originalData];
//    NSLog(@"解析的字符串是：%@",analysisString);
    NSString *analysisStringHead = [analysisString substringWithRange:NSMakeRange(0, 2)];
//    NSLog(@"解析字符串的头部信息是：%@",analysisStringHead);
    NSArray *items = @[DataAnalysisSetTimeDayMode,DataAnalysisSetAlarm,DataAnalysisSetWriteReadTarget,DataAnalysisSetBody,DataAnalysisSetHour,DataAnalysisGetActivity,DataAnalysisGetSleep,DataAnalysisGetWalk,DataAnalysisGetElectricity,DataAnalysisGetZone,DataAnalysisSetBandShake,DataAnalysisSetWriteReadM_E_Switch,DataAnalysisCtrlHR,DataAnalysisCtrlBP,DataAnalysisGetDeviceVersion];
    int item = [items indexOfObject:analysisStringHead];
    switch (item) {
        case 0:
            [self commenDataAnalysisJudgeSuccessLog:@"设置时间和白天模式成功" failedLog:@"设置时间和白天模式失败" originalData:analysisString];
            break;
        case 1:
            [self commenDataAnalysisJudgeSuccessLog:@"设置闹钟成功" failedLog:@"设置闹钟失败" originalData:analysisString];
            break;
        case 2:
            if ([[analysisString substringWithRange:NSMakeRange(2, 4)] isEqualToString:@"0000"]) {
                NSString *temp10 = [NSString stringWithFormat:@"%lu",strtoul([[analysisString substringWithRange:NSMakeRange(6, 4)] UTF8String],0,16)];
                int walkNumber = [temp10 intValue];
                [self showDataAnalysisResult:[NSString stringWithFormat:@"读取目标的步数：%d",walkNumber]];
            } else if ([[analysisString substringWithRange:NSMakeRange(2, 4)] isEqualToString:@"0100"]) {
                [self showDataAnalysisResult:@"写入目标的步数成功"];
            } else if ([[analysisString substringWithRange:NSMakeRange(2, 4)] isEqualToString:@"0101"]) {
                [self showDataAnalysisResult:@"写入目标的步数失败"];
            } else {
                [self showDataAnalysisResult:@"读取目标的步数失败"];
            }
            break;
        case 3:
            [self commenDataAnalysisJudgeSuccessLog:@"设置身高体重成功" failedLog:@"设置身高体重失败" originalData:analysisString];
            break;
        case 4:
            [self commenDataAnalysisJudgeSuccessLog:@"设置12/24小时制成功" failedLog:@"设置12/24小时制失败" originalData:analysisString];
            break;
        case 5:
            {
                NSString *yy1 = [NSString stringWithFormat:@"%lu",strtoul([[analysisString substringWithRange:NSMakeRange(6, 2)] UTF8String],0,16)];
                NSString *yy2 = [NSString stringWithFormat:@"%lu",strtoul([[analysisString substringWithRange:NSMakeRange(8, 2)] UTF8String],0,16)];
                NSString *mm = [NSString stringWithFormat:@"%lu",strtoul([[analysisString substringWithRange:NSMakeRange(10, 2)] UTF8String],0,16)];
                NSString *dd = [NSString stringWithFormat:@"%lu",strtoul([[analysisString substringWithRange:NSMakeRange(12, 2)] UTF8String],0,16)];
                NSString *saveTime = [NSString stringWithFormat:@"%@%@年%@月%@日",yy1,yy2,mm,dd];
                [self showDataAnalysisResult:[NSString stringWithFormat:@"手环存储了自%@起至今的睡眠和步行数据",saveTime]];
            }
            break;
        case 6:
            {
                NSString *yy1 = [NSString stringWithFormat:@"%lu",strtoul([[analysisString substringWithRange:NSMakeRange(2, 2)] UTF8String],0,16)];
                NSString *yy2 = [NSString stringWithFormat:@"%lu",strtoul([[analysisString substringWithRange:NSMakeRange(4, 2)] UTF8String],0,16)];
                NSString *mm = [NSString stringWithFormat:@"%lu",strtoul([[analysisString substringWithRange:NSMakeRange(6, 2)] UTF8String],0,16)];
                NSString *dd = [NSString stringWithFormat:@"%lu",strtoul([[analysisString substringWithRange:NSMakeRange(8, 2)] UTF8String],0,16)];
                NSString *saveTime = [NSString stringWithFormat:@"%@%@年%@月%@日",yy1,yy2,mm,dd];
                NSString *hh = [NSString stringWithFormat:@"%lu",strtoul([[analysisString substringWithRange:NSMakeRange(10, 2)] UTF8String],0,16)];
                NSString *score = [analysisString substringWithRange:NSMakeRange(12, 24)];
                [self showDataAnalysisResult:[NSString stringWithFormat:@"%@%@点记录的6小时睡眠得分为：%@",saveTime,hh,score]];
            }
            break;
        case 7:
            {
                NSString *yy1 = [NSString stringWithFormat:@"%lu",strtoul([[analysisString substringWithRange:NSMakeRange(2, 2)] UTF8String],0,16)];
                NSString *yy2 = [NSString stringWithFormat:@"%lu",strtoul([[analysisString substringWithRange:NSMakeRange(4, 2)] UTF8String],0,16)];
                NSString *mm = [NSString stringWithFormat:@"%lu",strtoul([[analysisString substringWithRange:NSMakeRange(6, 2)] UTF8String],0,16)];
                NSString *dd = [NSString stringWithFormat:@"%lu",strtoul([[analysisString substringWithRange:NSMakeRange(8, 2)] UTF8String],0,16)];
                NSString *saveTime = [NSString stringWithFormat:@"%@%@年%@月%@日",yy1,yy2,mm,dd];
                NSString *hh = [NSString stringWithFormat:@"%lu",strtoul([[analysisString substringWithRange:NSMakeRange(10, 2)] UTF8String],0,16)];
                NSString *score = [analysisString substringWithRange:NSMakeRange(12, 24)];
                [self showDataAnalysisResult:[NSString stringWithFormat:@"%@%@点记录的6小时步行得分为：%@",saveTime,hh,score]];
            }
            break;
        case 8:
            {
                NSString *power = [analysisString substringWithRange:NSMakeRange(2, 2)];
                [self showDataAnalysisResult:[NSString stringWithFormat:@"当前还有%@格电量",power]];
            }
            break;
        case 9:
            if ([[analysisString substringWithRange:NSMakeRange(2, 2)] isEqualToString:@"00"]) {
                NSString *listNum = [analysisString substringWithRange:NSMakeRange(4, 8)];
                [self showDataAnalysisResult:[NSString stringWithFormat:@"当前手环的序列号：%@",listNum]];
            } else {
                [self showDataAnalysisResult:@"获取手环序列号失败"];
            }
            break;
        case 10:
            if ([[analysisString substringWithRange:NSMakeRange(2, 2)] isEqualToString:@"00"]) {
                NSString *shakeLevel = [analysisString substringWithRange:NSMakeRange(4, 2)];
                [self showDataAnalysisResult:[NSString stringWithFormat:@"当前手环震动等级%@",shakeLevel]];
            } else if ([[analysisString substringWithRange:NSMakeRange(2, 4)] isEqualToString:@"0100"]) {
                [self showDataAnalysisResult:@"当前手环震动设置成功"];
            } else {
                [self showDataAnalysisResult:@"手环震动设置失败"];
            }
            break;
        case 11:
            if ([[analysisString substringWithRange:NSMakeRange(2, 2)] isEqualToString:@"00"]) {
                NSString *meSwitch = [[analysisString substringWithRange:NSMakeRange(4, 2)] isEqualToString:@"00"] ? @"公制" : @"英制";
                [self showDataAnalysisResult:[NSString stringWithFormat:@"当前手环单位是%@",meSwitch]];
            } else if ([[analysisString substringWithRange:NSMakeRange(2, 4)] isEqualToString:@"0100"]) {
                [self showDataAnalysisResult:@"当前手环公制英制切换成功"];
            } else {
                [self showDataAnalysisResult:@"当前手环公制英制切换失败"];
            }
            break;
        case 12:
            if ([[analysisString substringWithRange:NSMakeRange(2, 4)] isEqualToString:@"0000"]) {
                [self showDataAnalysisResult:@"开启终端持续心率模式成功"];
            } else if ([[analysisString substringWithRange:NSMakeRange(2, 4)] isEqualToString:@"0001"]) {
                [self showDataAnalysisResult:@"开启终端持续心率模式失败"];
            } else if ([[analysisString substringWithRange:NSMakeRange(2, 4)] isEqualToString:@"0100"]) {
                [self showDataAnalysisResult:@"关闭终端持续心率模式成功"];
            } else if ([[analysisString substringWithRange:NSMakeRange(2, 4)] isEqualToString:@"0101"]) {
                [self showDataAnalysisResult:@"关闭终端持续心率模式失败"];
            } else if ([[analysisString substringWithRange:NSMakeRange(2, 2)] isEqualToString:@"02"]) {
                NSString *hr = [NSString stringWithFormat:@"%lu",strtoul([[analysisString substringWithRange:NSMakeRange(4,2)] UTF8String],0,16)];
                [self showDataAnalysisResult:[NSString stringWithFormat:@"当前心率是：%@",hr]];
            }
            break;
        case 13:
            //血压控制无返回数据
            break;
        case 14:
            {
                NSArray *deviceVersion = [analysisString componentsSeparatedByString:@"2e"];
                NSString *deviceProduceTime = [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@",[deviceVersion[0] substringWithRange:NSMakeRange(3,1)],[deviceVersion[0] substringWithRange:NSMakeRange(5,1)],[deviceVersion[0] substringWithRange:NSMakeRange(7,1)],[deviceVersion[0] substringWithRange:NSMakeRange(9,1)],[deviceVersion[0] substringWithRange:NSMakeRange(11,1)],[deviceVersion[0] substringWithRange:NSMakeRange(13,1)],[deviceVersion[0] substringWithRange:NSMakeRange(15,1)],[deviceVersion[0] substringWithRange:NSMakeRange(17,1)]];
                NSString *devicetype = [[deviceVersion[1] substringWithRange:NSMakeRange(0, 2)] isEqualToString:@"53"] ? @"sh06" : @"h01";
                NSString *deviceVersionNum = [deviceVersion[2] substringWithRange:NSMakeRange(1,1)];
                [self showDataAnalysisResult:[NSString stringWithFormat:@"当前版本是：%@.%@.%@",deviceProduceTime,devicetype,deviceVersionNum]];
            }
            break;
        default:
            break;
    }
    
}


- (NSString *)convertDataToHexStr:(NSData *)data {
    if (!data || [data length] == 0) {
        return @"";
    }
    NSMutableString *string = [[NSMutableString alloc] initWithCapacity:[data length]];
    
    [data enumerateByteRangesUsingBlock:^(const void *bytes, NSRange byteRange, BOOL *stop) {
        unsigned char *dataBytes = (unsigned char*)bytes;
        for (NSInteger i = 0; i < byteRange.length; i++) {
            NSString *hexStr = [NSString stringWithFormat:@"%x", (dataBytes[i]) & 0xff];
            if ([hexStr length] == 2) {
                [string appendString:hexStr];
            } else {
                [string appendFormat:@"0%@", hexStr];
            }
        }
    }];
    
    return string;
}

- (NSData *)convertHexStrToData:(NSString *)str
{
    if (!str || [str length] == 0) {
        return nil;
    }
    
    NSMutableData *hexData = [[NSMutableData alloc] initWithCapacity:20];
    NSRange range;
    if ([str length] % 2 == 0) {
        range = NSMakeRange(0, 2);
    } else {
        range = NSMakeRange(0, 1);
    }
    for (NSInteger i = range.location; i < [str length]; i += 2) {
        unsigned int anInt;
        NSString *hexCharStr = [str substringWithRange:range];
        NSScanner *scanner = [[NSScanner alloc] initWithString:hexCharStr];
        
        [scanner scanHexInt:&anInt];
        NSData *entity = [[NSData alloc] initWithBytes:&anInt length:1];
        [hexData appendData:entity];
        
        range.location += range.length;
        range.length = 2;
    }
    return hexData;
}

- (void)commenDataAnalysisJudgeSuccessLog:(NSString *)successMsg failedLog:(NSString *)failedMsg originalData:(NSString *)data {
    if ([[data substringWithRange:NSMakeRange(2, 2)] isEqualToString:@"00"]) {
        [self showDataAnalysisResult:successMsg];
    } else {
        [self showDataAnalysisResult:failedMsg];
    }
}

- (void)showDataAnalysisResult:(NSString *)result {
    NSLog(@"result : %@",result);
}

@end
