//
//  LoginViewController.m
//  豆瓣
//
//  Created by lanou3g on 15/12/5.
//  Copyright © 2015年 韩晓龙. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()<UITextFieldDelegate>

@property(strong,nonatomic)UIButton *loginButton;
@property(strong,nonatomic)UIButton *registerButton;


@end

@implementation LoginViewController


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
    self.userNameView = [[TLView alloc]initWithFrame:CGRectMake(0, 20, kScreenWidth, kScreenHeight/15+10)];
    
    self.userNameView.label.text = @"用户名:";
    self.userNameView.textField.placeholder = @"请输入用户名";
    self.userNameView.textField.delegate = self;
    [self.view addSubview:self.userNameView];
    //密码
    self.passwordView = [[TLView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.userNameView.frame)+kScreenHeight/40, kScreenWidth, kScreenHeight/15+10)];
    
    self.passwordView.label.text = @"密码:";
    self.passwordView.textField.placeholder =@"请输入密码";
    self.passwordView.textField.secureTextEntry = YES;
    self.passwordView.textField.delegate =self;
    //self.passwordView.textField.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.passwordView];
    //登录键
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    loginButton.frame = CGRectMake(CGRectGetMinX(self.userNameView.label.frame), CGRectGetMaxY(self.passwordView.frame)+kScreenHeight/20, kScreenWidth/3, kScreenHeight/10);
    loginButton.backgroundColor = [UIColor greenColor];
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [loginButton setTintColor:[UIColor whiteColor]];
    
    [self.view addSubview:loginButton];
    
    [loginButton addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
    
    //注册键
    UIButton *registButton = [UIButton buttonWithType:UIButtonTypeCustom];
    registButton.frame = CGRectMake(CGRectGetMaxX(loginButton.frame)+kScreenWidth/6, CGRectGetMinY(loginButton.frame), kScreenWidth/3, kScreenHeight/10);
    registButton.backgroundColor = [UIColor orangeColor];
    [registButton setTitle:@"注册" forState:UIControlStateNormal];
    [registButton setTintColor:[UIColor whiteColor]];
    [self.view addSubview:registButton];
    
    [registButton addTarget:self action:@selector(registAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(backAction)];
    
}
//登录事件
-(void)loginAction
{
    [self.navigationController popViewControllerAnimated:YES];
    
}
//注册事件
-(void)registAction
{
    RegistViewController *registVC = [[RegistViewController alloc]init];
    

    
    [self.navigationController pushViewController:registVC animated:YES];
    
    
    
    
}
//返回事件
-(void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.userNameView.textField)
    {
        [self.passwordView.textField becomeFirstResponder];
    }
    else
        [textField resignFirstResponder];
    return YES;
}




- (void)viewDidLoad {
    [super viewDidLoad];
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
