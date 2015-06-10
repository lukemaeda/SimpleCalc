//
//  ViewController.m
//  SimpleCalc
//
//  Created by kunren10 on 2014/02/25.
//  Copyright (c) 2014年 Hajime Maeda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

// 値1テキストフィールド
@property (weak, nonatomic) IBOutlet UITextField *tfValue01;

// 値2テキストフィールド
@property (weak, nonatomic) IBOutlet UITextField *tfValue02;

// ラベルテキスト
@property (weak, nonatomic) IBOutlet UILabel *laResult;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// [足し算]アクションボタン
- (IBAction)doTasu:(id)sender
{
    // [足し算]引数:1
    [self calcAll:1];
    
    // キーボードを隠す
    [self.tfValue01 resignFirstResponder];
    [self.tfValue02 resignFirstResponder];
    
    // 要素値の取得 (別記）
//    NSString *str01;
//    *str01 = self.tfValue01.text;
    
}

// [引き算]アクションボタン
- (IBAction)doSubtrac:(id)sender
{
    // [引き算]引数:2
    [self calcAll:2];

}

// [掛け算]アクションボタン
- (IBAction)doMulti:(id)sender
{
    // [掛け算]引数:3
    [self calcAll:3];
}

// [割り算]アクションボタン
- (IBAction)doDivi:(id)sender{
    
    // [割り算]引数:4
    [self calcAll:4];
    
}

// [クリア]ボタンアクションボタン
- (IBAction)ClearValue:(id)sender
{
    // 値1テキストクリア
    self.tfValue01.text = @"";
    // 値2テキストクリア
    self.tfValue02.text = @"";
    // ラベルクリア
    self.laResult.text = @"";
}

// 値1 キーボードを隠す Did End On Exit と併用している
//- (IBAction)didEndValue01:(id)sender
//{
//    
//}

// 値1 キーボードを隠す Did End On Exit と併用している
//- (IBAction)didEndValue02:(id)sender
//{
//    
//}

// 計算処理
- (void)calcAll:(int)markCalc {
    
    NSLog(@"計算処理引数%d",markCalc);
    
    // 要素値の取得 NSString:文字列の値 テキストから文字列に代入
    NSString *str01 = self.tfValue01.text;
    NSString *str02 = self.tfValue02.text;
    
    // 要素値のintValue 文字→数字 型変換 int:数値を扱う値
    int val01 = [str01 intValue];
    int val02 = [str02 intValue];

    
    int res = 0;
    
    // switch構文
    switch(markCalc){
        case 1:
            // 足し算計算
            res = val01 + val02;
            break;
        case 2:
            // 引き算計算
            res = val01 - val02;
            break;
        case 3:
            // 掛け算計算
            res = val01 * val02;
            break;
        case 4:
            if (val02 == 0) {
                self.laResult.text = @"0で割れません。";
                // return:メソッド終了で抜ける
                return;
            } else {
                // 割り算計算
                res = val01 / val02;
            }
            
            break;
            
        default:
            // 上記の処理をbreakで抜けない限り常に処理
            break;
    }
    
    
    // 計算結果 数字 → 文字列 型変換
    // stringWithFormat 書式の設定
    NSString *strRes = [NSString stringWithFormat:@"%d", res];
    
    // ラベルに表示
    self.laResult.text = strRes;
  
}

@end
