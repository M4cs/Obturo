#import "PoAppRootViewController.h"
#import <UIKit/UIKit.h>

#import "UIButton+BackgroundColor.h"
#import "UIColor+ColorExtensions.h"

#import <spawn.h>
#import <signal.h>
#import <objc/runtime.h>

@interface FBSystemService : NSObject
+(id)sharedInstance;
-(void)exitAndRelaunch:(bool)arg1;
-(void)shutdownAndReboot:(bool)arg1;
@end

@implementation PoAppRootViewController {
}

- (void)loadView {
	[super loadView];

	//UIImage (Fun)
	NSArray *imageNames = @[@"fun/logo_01.png", @"fun/logo_02.png", @"fun/logo_03.png", @"fun/logo_04.png",
                        @"fun/logo_05.png", @"fun/logo_06.png", @"fun/logo_07.png", @"fun/logo_08.png",
												@"fun/logo_09.png", @"fun/logo_10.png", @"fun/logo_11.png", @"fun/logo_12.png",
												@"fun/logo_13.png", @"fun/logo_14.png", @"fun/logo_15.png", @"fun/logo_16.png",
												@"fun/logo_17.png", @"fun/logo_18.png", @"fun/logo_19.png", @"fun/logo_20.png",
												@"fun/logo_21.png", @"fun/logo_22.png", @"fun/logo_23.png", @"fun/logo_24.png",
												@"fun/logo_25.png", @"fun/logo_26.png", @"fun/logo_27.png", @"fun/logo_28.png",
												@"fun/logo_29.png", @"fun/logo_30.png", @"fun/logo_31.png", @"fun/logo_32.png",
												@"fun/logo_33.png", @"fun/logo_34.png", @"fun/logo_35.png", @"fun/logo_36.png",
												@"fun/logo_37.png", @"fun/logo_38.png", @"fun/logo_39.png", @"fun/logo_40.png",
												@"fun/logo_41.png", @"fun/logo_42.png", @"fun/logo_43.png", @"fun/logo_44.png",
												@"fun/logo_45.png", @"fun/logo_46.png", @"fun/logo_47.png", @"fun/logo_48.png",
												@"fun/logo_49.png", @"fun/logo_50.png", @"fun/logo_51.png", @"fun/logo_52.png",
												@"fun/logo_53.png", @"fun/logo_54.png"];

  NSMutableArray *images = [[NSMutableArray alloc] init];
  for (int i = 0; i < imageNames.count; i++) {
      [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
  }

  UIImageView *animationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.frame.origin.x + 20, self.view.frame.origin.y + 115, 60, 60)];
	animationImageView.image = [UIImage imageNamed:@"fun/logo_52.png"];
	animationImageView.animationImages = images;
  animationImageView.animationDuration = 1.25;
	animationImageView.animationRepeatCount = 1;
  [self.view addSubview:animationImageView];
  [animationImageView startAnimating];
	[images removeAllObjects];
	[images release];

	//Statusbar
	UIApplication.sharedApplication.statusBarStyle = UIStatusBarStyleLightContent;
	UIApplication.sharedApplication.statusBarHidden = NO;

	//rootViewController properties
	self.title = @"Obturo";
	//UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backgrounds/background-iPhone.png"]];

	UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:nil];
	backgroundImage.tag = 1989;

	if([[UIDevice currentDevice]userInterfaceIdiom]==UIUserInterfaceIdiomPhone) {
				switch ((int)[[UIScreen mainScreen] nativeBounds].size.height) {
						case 1136:
								printf("iPhone 5 or 5S or 5C");
								UIImageView *backgroundImage5 = (UIImageView *)[self.view viewWithTag:1989];
								backgroundImage5 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backgrounds/background-iPhone.png"]];
								[self.view addSubview:backgroundImage5];
								[self.view sendSubviewToBack:backgroundImage5];
								[backgroundImage5 release];
								break;
						case 1334:
								printf("iPhone 6/6S/7/8");
								UIImageView *backgroundImage6 = (UIImageView *)[self.view viewWithTag:1989];
								backgroundImage6 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backgrounds/background-iPhone.png"]];
								[self.view addSubview:backgroundImage6];
								[self.view sendSubviewToBack:backgroundImage6];
								[backgroundImage6 release];
								break;
						case 2208:
								printf("iPhone 6+/6S+/7+/8+");
								UIImageView *backgroundImage6P = (UIImageView *)[self.view viewWithTag:1989];
								backgroundImage6P = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backgrounds/background-iPhoneX.png"]];
								[self.view addSubview:backgroundImage6P];
								[self.view sendSubviewToBack:backgroundImage6P];
								[backgroundImage6P release];
								break;
						case 2436:
								printf("iPhone X");
								UIImageView *backgroundImageX = (UIImageView *)[self.view viewWithTag:1989];
								backgroundImageX = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backgrounds/background-iPhoneX.png"]];
								[self.view addSubview:backgroundImageX];
								[self.view sendSubviewToBack:backgroundImageX];
								[backgroundImageX release];
								break;
						default:
								printf("unknown");
								UIImageView *backgroundImageU = (UIImageView *)[self.view viewWithTag:1989];
								backgroundImageU = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backgrounds/background-iPhone.png"]];
								[self.view addSubview:backgroundImageU];
								[self.view sendSubviewToBack:backgroundImageU];
								[backgroundImageU release];
								break;
				}
		}

	[self.navigationController setNavigationBarHidden:YES animated:NO];

	//UILabel (label_Title) properties
	UILabel *label_Title = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.origin.x + 20, self.view.frame.origin.y + 185, 200, 37)];
	[label_Title setBackgroundColor:[UIColor clearColor]];
	[label_Title setText:@"Obturo"];
	[label_Title setTextColor:[UIColor whiteColor]];
	[label_Title setFont:[UIFont fontWithName:@".SFUIDisplay-Bold" size:31]];
	//label_Title.center = CGPointMake(self.view.frame.origin.x + 100, self.view.frame.size.height / 3 - 80);
	[label_Title sizeToFit];
	[label_Title setTextAlignment:NSTextAlignmentLeft];
	[[self view] addSubview:label_Title];
	[label_Title release];

	//UILabel (label_Description) properties
	UILabel *label_Description = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.origin.x + 20, self.view.frame.origin.y + 225, self.view.frame.size.width - 20, 50)];
	[label_Description setBackgroundColor:[UIColor clearColor]];
	[label_Description setText:@"Easily access power options for your device with Obturo."];
	[label_Description setTextColor:[UIColor whiteColor]];
	[label_Description setFont:[UIFont fontWithName:@".SFUIText-Semibold" size:18]];
	//label_Description.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 3 - 18);
	label_Description.lineBreakMode = NSLineBreakByWordWrapping;
	label_Description.numberOfLines = 0;
	label_Description.tag = 10;
	[label_Description sizeToFit];
	[label_Description setTextAlignment:NSTextAlignmentLeft];
	[[self view] addSubview:label_Description];
	[label_Description release];

	//UILabel (label_Thanks) properties
	UILabel *label_Thanks = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.origin.x + 20, self.view.frame.size.height - 80, self.view.frame.size.width - 20, 45)];
	[label_Thanks setBackgroundColor:[UIColor clearColor]];
	[label_Thanks setText:@"Design & Programming by Simalary \nAssistance by TheComputerWhisperer"];
	[label_Thanks setTextColor:[UIColor whiteColor]];
	[label_Thanks setFont:[UIFont fontWithName:@".SFUIText-Medium" size:15]];
	//label_Thanks.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height - 65);
	label_Thanks.lineBreakMode = NSLineBreakByWordWrapping;
	label_Thanks.numberOfLines = 0;
	[label_Thanks sizeToFit];
	[label_Thanks setTextAlignment:NSTextAlignmentLeft];
	[[self view] addSubview:label_Thanks];
	[label_Thanks release];

	//UIButton (button_Reboot) properties
	UIButton *button_Reboot = [UIButton buttonWithType:UIButtonTypeSystem];
	[button_Reboot addTarget:self action:@selector(process_Reboot) forControlEvents:UIControlEventTouchUpInside];
	[button_Reboot setTitle:@"Restart Device" forState:UIControlStateNormal];
	[button_Reboot setBackgroundColor:[UIColor whiteColor] forState:UIControlStateNormal];
	//[button_Reboot setBackgroundColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
	[button_Reboot setTitleColor:[UIColor aquaGreenColor] forState:UIControlStateNormal];
	button_Reboot.titleLabel.font = [UIFont fontWithName:@".SFUIText-Medium" size:17];
	button_Reboot.frame = CGRectMake(self.view.frame.origin.x + 20, self.view.frame.size.height - 350, self.view.frame.size.width - 40, 50);
	button_Reboot.layer.cornerRadius = 10;
	button_Reboot.layer.masksToBounds = YES;
	button_Reboot.tag = 1;
	//button_Reboot.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 3 + 115);
	//button_Reboot.frame = CGRectMake(0, 0, 250, 50);
	[[self view] addSubview:button_Reboot];

	//UIButton (button_Respring) properties
	UIButton *button_Respring = [UIButton buttonWithType:UIButtonTypeSystem];
	[button_Respring addTarget:self action:@selector(process_Respring) forControlEvents:UIControlEventTouchUpInside];
	[button_Respring setTitle:@"Restart SpringBoard" forState:UIControlStateNormal];
	[button_Respring setBackgroundColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[button_Respring setBackgroundColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
	[button_Respring setTitleColor:[UIColor aquaGreenColor] forState:UIControlStateNormal];
	button_Respring.titleLabel.font = [UIFont fontWithName:@".SFUIText-Medium" size:17];
	//button_Respring.frame = CGRectMake(self.view.frame.origin.x + 20, self.view.frame.size.height - 290, self.view.frame.size.width / 2 - 40, 50);
	button_Respring.frame = CGRectMake(self.view.frame.origin.x + 20, self.view.frame.size.height - 290, self.view.frame.size.width - 40, 50);
	button_Respring.layer.cornerRadius = 10;
	button_Respring.layer.masksToBounds = YES;
	button_Respring.tag = 2;
	//button_Respring.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 3 + 175);
	//button_Respring.frame = CGRectMake(0, 0, 250, 50);
	[[self view] addSubview:button_Respring];

	/*//UIButton (button_uicache) properties
	UIButton *button_uicache = [UIButton buttonWithType:UIButtonTypeSystem];
	[button_uicache addTarget:self action:@selector(process_uicache) forControlEvents:UIControlEventTouchUpInside];
	[button_uicache setTitle:@"Reset uicache" forState:UIControlStateNormal];
	[button_uicache setBackgroundColor:[UIColor whiteColor] forState:UIControlStateNormal];
	[button_uicache setBackgroundColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
	[button_uicache setTitleColor:[UIColor aquaGreenColor] forState:UIControlStateNormal];
	button_uicache.titleLabel.font = [UIFont fontWithName:@".SFUIText-Medium" size:17];
	button_uicache.frame = CGRectMake(self.view.frame.size.width / 2 - 20, self.view.frame.size.height - 290, self.view.frame.size.width / 2 - 40, 50);
	button_uicache.layer.cornerRadius = 10;
	button_uicache.layer.masksToBounds = YES;
	button_uicache.tag = 3;
	//button_uicache.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 3 + 175);
	//button_uicache.frame = CGRectMake(0, 0, 250, 50);
	[[self view] addSubview:button_uicache];*/

	//UIButton (button_Shutdown) properties
	UIButton *button_Shutdown = [UIButton buttonWithType:UIButtonTypeSystem];
	//[button_Shutdown addTarget:self action:@selector(process_Shutdown) forControlEvents:UIControlEventTouchUpInside];
	[button_Shutdown setTitle:@"Power Off Device" forState:UIControlStateNormal];
	[button_Shutdown setBackgroundColor:[UIColor fadedWhiteColor] forState:UIControlStateNormal];
	//[button_Shutdown setBackgroundColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
	[button_Shutdown setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
	button_Shutdown.titleLabel.font = [UIFont fontWithName:@".SFUIText-Medium" size:17];
	button_Shutdown.frame = CGRectMake(self.view.frame.origin.x + 20, self.view.frame.size.height - 230, self.view.frame.size.width - 40, 50);
	button_Shutdown.layer.cornerRadius = 10;
	button_Shutdown.layer.masksToBounds = YES;
	button_Shutdown.enabled = NO;
	button_Shutdown.tag = 4;
	//button_Shutdown.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 3 + 235);
	//button_Shutdown.frame = CGRectMake(0, 0, 250, 50);
	[[self view] addSubview:button_Shutdown];

	//UILabel (label_Version) properties
	UILabel *label_Version = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.origin.x + 20, self.view.frame.size.height - 125, self.view.frame.size.width - 20, 45)];
	[label_Version setBackgroundColor:[UIColor clearColor]];
	[label_Version setText:@"Obturo 0.3 (Build 030A) \nDesigned for iOS 11"];
	[label_Version setTextColor:[UIColor whiteColor]];
	[label_Version setFont:[UIFont fontWithName:@".SFUIText-Medium" size:15]];
	//label_Version.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height - 65);
	label_Version.lineBreakMode = NSLineBreakByWordWrapping;
	label_Version.numberOfLines = 0;
	[label_Version sizeToFit];
	[label_Version setTextAlignment:NSTextAlignmentLeft];
	[[self view] addSubview:label_Version];
	[label_Version release];
}

- (void)process_Respring {
	//posix_spawn method to restart SpringBoard ([system("")] is not available at this point)
	pid_t pid;
	const char* args[] = {"killall", "-9", "SpringBoard", NULL};
	posix_spawn(&pid, "/bootstrap/usr/bin/killall", NULL, NULL, (char* const*)args, NULL);
	//[[objc_getClass("FBSystemService") sharedInstance] exitAndRelaunch:YES];
}

/*- (void)process_uicache {
	UIButton *button_Reboot = (UIButton *)[self.view viewWithTag:1];
	UIButton *button_Respring = (UIButton *)[self.view viewWithTag:2];
	UIButton *button_uicache = (UIButton *)[self.view viewWithTag:3];
	UILabel *label_Description = (UILabel *)[self.view viewWithTag:10];
	button_Reboot.enabled = NO;
	button_Respring.enabled = NO;
	button_uicache.enabled = NO;
	[label_Description setText:@"Reloading uicache..."];
	pid_t pid;
	int status;
	const char *argv[] = {"uicache", NULL};
	posix_spawn(&pid, "/bootstrap/usr/bin/uicache", NULL, NULL, (char* const*)argv, NULL);
	waitpid(pid, &status, WEXITED);
	button_Reboot.enabled = YES;
	button_Respring.enabled = YES;
	button_uicache.enabled = YES;
	[label_Description setText:@"Easily access power options for your device with Obturo."];
}*/

- (void)process_Reboot {
	pid_t pid;
	const char* args[] = {"kill", "1", NULL};
	posix_spawn(&pid, "/bootstrap/bin/kill", NULL, NULL, (char* const*)args, NULL);
	//[[objc_getClass("FBSystemService") sharedInstance] shutdownAndReboot:YES];
}

- (void)process_Shutdown {
	[[objc_getClass("FBSystemService") sharedInstance] shutdownAndReboot:NO];
}

@end
