//
//  MKBXPScanThreeASensorCell.m
//  MKBeaconXPlus_Example
//
//  Created by aa on 2021/2/23.
//  Copyright © 2021 aadyx2007@163.com. All rights reserved.
//

#import "MKBXPScanThreeASensorCell.h"

#import "Masonry.h"

#import "MKMacroDefines.h"

#import "MKBXPBaseBeacon.h"

static CGFloat const msgLabelWidth = 60.f;
static CGFloat const offset_X = 10.f;
static CGFloat const offset_Y = 10.f;
static CGFloat const leftIconWidth = 7.f;
static CGFloat const leftIconHeight = 7.f;
#define msgFont MKFont(12.f)

@interface MKBXPScanThreeASensorCell ()

/**
 小蓝点
 */
@property (nonatomic, strong)UIImageView *leftIcon;

/**
 类型,T&H
 */
@property (nonatomic, strong)UILabel *typeLabel;

/**
 RSSI@0m
 */
@property (nonatomic, strong)UILabel *rssiLabel;

@property (nonatomic, strong)UILabel *rssiValueLabel;

/**
 发射功率
 */
@property (nonatomic, strong)UILabel *txPowerLabel;

@property (nonatomic, strong)UILabel *txPowerValueLabel;

@property (nonatomic, strong)UILabel *dataRateLabel;

@property (nonatomic, strong)UILabel *dateRateValueLabel;

@property (nonatomic, strong)UILabel *scaleLabel;

@property (nonatomic, strong)UILabel *scaleValueLabel;

@property (nonatomic, strong)UILabel *senLabel;

@property (nonatomic, strong)UILabel *senValueLabel;

@property (nonatomic, strong)UILabel *rawLabel;

@property (nonatomic, strong)UILabel *rawValueLabel;

@end

@implementation MKBXPScanThreeASensorCell

+ (MKBXPScanThreeASensorCell *)initCellWithTable:(UITableView *)tableView {
    MKBXPScanThreeASensorCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MKBXPScanThreeASensorCellIdenty"];
    if (!cell) {
        cell = [[MKBXPScanThreeASensorCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MKBXPScanThreeASensorCellIdenty"];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.leftIcon];
        [self.contentView addSubview:self.typeLabel];
        [self.contentView addSubview:self.rssiLabel];
        [self.contentView addSubview:self.rssiValueLabel];
        [self.contentView addSubview:self.txPowerLabel];
        [self.contentView addSubview:self.txPowerValueLabel];
        [self.contentView addSubview:self.dataRateLabel];
        [self.contentView addSubview:self.dateRateValueLabel];
        [self.contentView addSubview:self.scaleLabel];
        [self.contentView addSubview:self.scaleValueLabel];
        [self.contentView addSubview:self.senLabel];
        [self.contentView addSubview:self.senValueLabel];
        [self.contentView addSubview:self.rawLabel];
        [self.contentView addSubview:self.rawValueLabel];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.leftIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(offset_X);
        make.width.mas_equalTo(leftIconWidth);
        make.top.mas_equalTo(offset_Y);
        make.height.mas_equalTo(leftIconHeight);
    }];
    [self.typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.leftIcon.mas_right).mas_offset(5.f);
        make.right.mas_equalTo(-offset_X);
        make.centerY.mas_equalTo(self.leftIcon.mas_centerY);
        make.height.mas_equalTo(MKFont(15).lineHeight);
    }];
    [self.rssiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.typeLabel.mas_left);
        make.width.mas_equalTo(100.f);
        make.top.mas_equalTo(self.typeLabel.mas_bottom).mas_offset(5.f);
        make.height.mas_equalTo(msgFont.lineHeight);
    }];
    [self.rssiValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.rssiLabel.mas_right).mas_offset(25.f);
        make.right.mas_equalTo(-offset_X);
        make.centerY.mas_equalTo(self.rssiLabel.mas_centerY);
        make.height.mas_equalTo(msgFont.lineHeight);
    }];
    [self.txPowerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.typeLabel.mas_left);
        make.width.mas_equalTo(self.rssiLabel.mas_width);
        make.top.mas_equalTo(self.rssiLabel.mas_bottom).mas_offset(5.f);
        make.height.mas_equalTo(msgFont.lineHeight);
    }];
    [self.txPowerValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.rssiValueLabel.mas_left);
        make.right.mas_equalTo(-offset_X);
        make.centerY.mas_equalTo(self.txPowerLabel.mas_centerY);
        make.height.mas_equalTo(msgFont.lineHeight);
    }];
    [self.dataRateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.typeLabel.mas_left);
        make.width.mas_equalTo(self.rssiLabel.mas_width);
        make.top.mas_equalTo(self.txPowerLabel.mas_bottom).mas_offset(5.f);
        make.height.mas_equalTo(msgFont.lineHeight);
    }];
    [self.dateRateValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.rssiValueLabel.mas_left);
        make.right.mas_equalTo(-offset_X);
        make.centerY.mas_equalTo(self.dataRateLabel.mas_centerY);
        make.height.mas_equalTo(msgFont.lineHeight);
    }];
    [self.scaleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.typeLabel.mas_left);
        make.width.mas_equalTo(self.rssiLabel.mas_width);
        make.top.mas_equalTo(self.dataRateLabel.mas_bottom).mas_offset(5.f);
        make.height.mas_equalTo(msgFont.lineHeight);
    }];
    [self.scaleValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.rssiValueLabel.mas_left);
        make.right.mas_equalTo(-offset_X);
        make.centerY.mas_equalTo(self.scaleLabel.mas_centerY);
        make.height.mas_equalTo(msgFont.lineHeight);
    }];
    [self.senLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.typeLabel.mas_left);
        make.width.mas_equalTo(self.rssiLabel.mas_width);
        make.top.mas_equalTo(self.scaleLabel.mas_bottom).mas_offset(5.f);
        make.height.mas_equalTo(msgFont.lineHeight);
    }];
    [self.senValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.rssiValueLabel.mas_left);
        make.right.mas_equalTo(-offset_X);
        make.centerY.mas_equalTo(self.senLabel.mas_centerY);
        make.height.mas_equalTo(msgFont.lineHeight);
    }];
    [self.rawLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.typeLabel.mas_left);
        make.width.mas_equalTo(self.rssiLabel.mas_width);
        make.top.mas_equalTo(self.senLabel.mas_bottom).mas_offset(5.f);
        make.height.mas_equalTo(msgFont.lineHeight);
    }];
    [self.rawValueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.rssiValueLabel.mas_left);
        make.right.mas_equalTo(-offset_X);
        make.centerY.mas_equalTo(self.rawLabel.mas_centerY);
        make.height.mas_equalTo(msgFont.lineHeight);
    }];
}

#pragma mark - setter
- (void)setBeacon:(MKBXPThreeASensorBeacon *)beacon {
    _beacon = beacon;
    if (!_beacon) {
        return;
    }
    self.rssiValueLabel.text = [NSString stringWithFormat:@"%ld%@",(long)[beacon.rssi0M integerValue],@"dBm"];
    self.txPowerValueLabel.text = [NSString stringWithFormat:@"%ld %@",(long)[beacon.txPower integerValue],@"dBm"];
    self.dateRateValueLabel.text = [self fetchDataRate:beacon.samplingRate];
    self.scaleValueLabel.text = [self fetchScaleData:beacon.accelerationOfGravity];
    self.senValueLabel.text = [NSString stringWithFormat:@"%.1f%@",[beacon.sensitivity integerValue] * 0.1,@"g"];
    NSString *rawString = [NSString stringWithFormat:@"X:0x%@ Y:0x%@ Z:0x%@",[beacon.xData uppercaseString],[beacon.yData uppercaseString],[beacon.zData uppercaseString]];
    self.rawValueLabel.text = rawString;
}

#pragma mark - private method

//@"00":1Hz,@"01":10Hz,@"02":25Hz,@"03":50Hz,@"04":100Hz,
//@"05":200Hz,@"06":400Hz,@"07":1344Hz,@"08":1620Hz,@"09":5376Hz
- (NSString *)fetchDataRate:(NSString *)rate {
    if ([rate isEqualToString:@"00"]) {
        return @"1 Hz";
    }
    if ([rate isEqualToString:@"01"]) {
        return @"10 Hz";
    }
    if ([rate isEqualToString:@"02"]) {
        return @"25 Hz";
    }
    if ([rate isEqualToString:@"03"]) {
        return @"50 Hz";
    }
    if ([rate isEqualToString:@"04"]) {
        return @"100 Hz";
    }
    if ([rate isEqualToString:@"05"]) {
        return @"200 Hz";
    }
    if ([rate isEqualToString:@"06"]) {
        return @"400 Hz";
    }
    if ([rate isEqualToString:@"07"]) {
        return @"1344 Hz";
    }
    if ([rate isEqualToString:@"08"]) {
        return @"1620 Hz";
    }
    if ([rate isEqualToString:@"09"]) {
        return @"5376 Hz";
    }
    return @"";
}
//@"00":±2g,@"01"":±4g,@"02":±8g,@"03":±16g
- (NSString *)fetchScaleData:(NSString *)scale {
    if ([scale isEqualToString:@"00"]) {
        return @"±2g";
    }
    if ([scale isEqualToString:@"01"]) {
        return @"±4g";
    }
    if ([scale isEqualToString:@"02"]) {
        return @"±8g";
    }
    if ([scale isEqualToString:@"03"]) {
        return @"±16g";
    }
    return @"";
}

#pragma mark - getter
- (UIImageView *)leftIcon{
    if (!_leftIcon) {
        _leftIcon = [[UIImageView alloc] init];
        _leftIcon.image = LOADICON(@"MKBeaconXPlus", @"MKBXPScanThreeASensorCell", @"bxp_littleBluePoint.png");
    }
    return _leftIcon;
}

- (UILabel *)typeLabel{
    if (!_typeLabel) {
        _typeLabel = [self createLabelWithFont:MKFont(15.f)];
        _typeLabel.textColor = DEFAULT_TEXT_COLOR;
        _typeLabel.text = @"3-axis Acceleration";
    }
    return _typeLabel;
}

- (UILabel *)rssiLabel{
    if (!_rssiLabel) {
        _rssiLabel = [self createLabelWithFont:msgFont];
        _rssiLabel.text = @"RSSI@0m";
    }
    return _rssiLabel;
}

- (UILabel *)rssiValueLabel {
    if (!_rssiValueLabel) {
        _rssiValueLabel = [self createLabelWithFont:msgFont];
    }
    return _rssiValueLabel;
}

- (UILabel *)txPowerLabel {
    if (!_txPowerLabel) {
        _txPowerLabel = [self createLabelWithFont:msgFont];
        _txPowerLabel.text = @"Tx Power";
    }
    return _txPowerLabel;
}

- (UILabel *)txPowerValueLabel {
    if (!_txPowerValueLabel) {
        _txPowerValueLabel = [self createLabelWithFont:msgFont];
    }
    return _txPowerValueLabel;
}

- (UILabel *)dataRateLabel {
    if (!_dataRateLabel) {
        _dataRateLabel = [self createLabelWithFont:msgFont];
        _dataRateLabel.text = @"Sampling rate";
    }
    return _dataRateLabel;
}

- (UILabel *)dateRateValueLabel {
    if (!_dateRateValueLabel) {
        _dateRateValueLabel = [self createLabelWithFont:msgFont];
    }
    return _dateRateValueLabel;
}

- (UILabel *)scaleLabel {
    if (!_scaleLabel) {
        _scaleLabel = [self createLabelWithFont:msgFont];
        _scaleLabel.text = @"Scale";
    }
    return _scaleLabel;
}

- (UILabel *)scaleValueLabel {
    if (!_scaleValueLabel) {
        _scaleValueLabel = [self createLabelWithFont:msgFont];
    }
    return _scaleValueLabel;
}

- (UILabel *)senLabel {
    if (!_senLabel) {
        _senLabel = [self createLabelWithFont:msgFont];
        _senLabel.text = @"Sensitivity";
    }
    return _senLabel;
}

- (UILabel *)senValueLabel {
    if (!_senValueLabel) {
        _senValueLabel = [self createLabelWithFont:msgFont];
    }
    return _senValueLabel;
}

- (UILabel *)rawLabel {
    if (!_rawLabel) {
        _rawLabel = [self createLabelWithFont:msgFont];
        _rawLabel.text = @"Acceleration";
    }
    return _rawLabel;
}

- (UILabel *)rawValueLabel {
    if (!_rawValueLabel) {
        _rawValueLabel = [self createLabelWithFont:msgFont];
    }
    return _rawValueLabel;
}

- (UILabel *)createLabelWithFont:(UIFont *)font{
    UILabel *label = [[UILabel alloc] init];
    label.textColor = RGBCOLOR(184, 184, 184);
    label.textAlignment = NSTextAlignmentLeft;
    label.font = font;
    return label;
}

@end
