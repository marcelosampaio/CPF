//
//  ViewController.m
//  CPF
//
//  Created by Marcelo Sampaio on 9/21/17.
//  Copyright © 2017 Marcelo Sampaio. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UITextField *txtCpf;




@end

@implementation ViewController


#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];

}


#pragma mark - UI Actions

- (IBAction)validateCpf:(id)sender {
    
    if ([self isValidCPF:_txtCpf.text]) {
        NSLog(@"CPF OK - VALIDO");
    }else{
        NSLog(@"CPF NAO OK - INVALIDO");
    }
    
}


#pragma mark - CPF Helper
- (BOOL) isValidCPF:(NSString *)cpf {
    //    NSLog(@"checking CPF    ***");
    
    NSUInteger i, firstSum, secondSum, firstDigit, secondDigit, firstDigitCheck, secondDigitCheck;
    if(cpf == nil) {
        return NO;
    }
    
    if ([cpf length] != 11) {
        return NO;
    }
    if (([cpf isEqual:@"00000000000"]) || ([cpf isEqual:@"11111111111"]) || ([cpf isEqual:@"22222222222"])|| ([cpf isEqual:@"33333333333"])|| ([cpf isEqual:@"44444444444"])|| ([cpf isEqual:@"55555555555"])|| ([cpf isEqual:@"66666666666"])|| ([cpf isEqual:@"77777777777"])|| ([cpf isEqual:@"88888888888"])|| ([cpf isEqual:@"99999999999"])) {
        return NO;
    }
    
    firstSum = 0;
    for (i = 0; i <= 8; i++) {
        firstSum += [[cpf substringWithRange:NSMakeRange(i, 1)] intValue] * (10 - i);
    }
    
    if (firstSum % 11 < 2) {
        firstDigit = 0;
    }
    else {
        firstDigit = 11 - (firstSum % 11);
    }
    
    secondSum = 0;
    for (i = 0; i <= 9; i++) {
        secondSum = secondSum + [[cpf substringWithRange:NSMakeRange(i, 1)] intValue] * (11 - i);
    }
    
    if (secondSum % 11 < 2) {
        secondDigit = 0;
    }
    else {
        secondDigit = 11 - (secondSum % 11);
    }
    
    firstDigitCheck = [[cpf substringWithRange:NSMakeRange(9, 1)] intValue];
    secondDigitCheck = [[cpf substringWithRange:NSMakeRange(10, 1)] intValue];
    
    if ((firstDigit == firstDigitCheck) && (secondDigit == secondDigitCheck)) {
        return YES;
    }
    
    return NO;
}

@end
