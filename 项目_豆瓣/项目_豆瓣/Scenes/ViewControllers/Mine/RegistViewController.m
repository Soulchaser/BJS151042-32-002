//
//  RegistViewController.m
//  豆瓣
//
//  Created by lanou3g on 15/12/5.
//  Copyright © 2015年 韩晓龙. All rights reserved.
//

#import "RegistViewController.h"

@interface RegistViewController ()<UITextFieldDelegate>

@end

@implementation RegistViewController
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
    {
        [self drawView];
    }
    return self;
}
-(void)drawView
{
    
    self.view.backgroundColor = [UIColor whiteColor];
    //用户名
    self.nameView = [[TLView alloc]initWithFrame:CGRectMake(0, 20, kScreenWidth, kScreenHeight/15+10)];
    
    self.nameView.label.text = @"用户名:";
    self.nameView.textField.placeholder = @"请输入用户名";
    self.nameView.textField.delegate = self;
    [self.view addSubview:self.nameView];
    //密码
    self.passwordView = [[TLView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.nameView.frame)+kScreenHeight/40, kScreenWidth, kScreenHeight/15+10)];
    
    self.passwordView.label.text = @"密码:";
    self.passwordView.textField.placeholder =@"请输入密码";
    self.passwordView.textField.secureTextEntry = YES;
    self.passwordView.textField.delegate =self;

    [self.view addSubview:self.passwordView];
    //确认密码
    self.affirmPasswordView = [[TLView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.passwordView.frame)+kScreenHeight/40, kScreenWidth, kScreenHeight/15+10)];
    
    self.affirmPasswordView.label.text = @"确认密码:";
    self.affirmPasswordView.textField.placeholder =@"再次输入密码";
    self.affirmPasswordView.textField.secureTextEntry = YES;
    self.affirmPasswordView.textField.delegate =self;
    
    [self.view addSubview:self.affirmPasswordView];
    
    //邮箱
    self.emailBoxView = [[TLView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.affirmPasswordView.frame)+kScreenHeight/40, kScreenWidth, kScreenHeight/15+10)];
    
    self.emailBoxView.label.text = @"邮箱:";
    self.emailBoxView.textField.placeholder =@"请输入邮箱";
    self.emailBoxView.textField.secureTextEntry = YES;
    self.emailBoxView.textField.delegate =self;
    
    [self.view addSubview:self.emailBoxView];
    
    //联系方式
    self.phoneNumView = [[TLView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.emailBoxView.frame)+kScreenHeight/40, kScreenWidth, kScreenHeight/15+10)];
    
    self.phoneNumView.label.text = @"联系方式:";
    self.phoneNumView.textField.placeholder =@"请输入联系方式";
    self.phoneNumView.textField.secureTextEntry = YES;
    self.phoneNumView.textField.delegate =self;
    
    [self.view addSubview:self.phoneNumView];
    

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"注册" style:UIBarButtonItemStyleDone target:self action:@selector(registAction)];
    
}

-(void)registAction
{
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor redColor]];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
