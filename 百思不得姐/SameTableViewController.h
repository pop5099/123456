//
//  SameTableViewController.h
//  百思不得姐
//
//  Created by pop5099 on 16/10/10.
//  Copyright © 2016年 pop. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    SameTypeRecommend= 1,
    SameTypeVideo=41,
    SameTypePicture=10,
    SameTypeCross=29,
    SameTypeVoice=31
} SameType;


@interface SameTableViewController : UITableViewController

//帖子类型
@property(nonatomic,assign)SameType  type;

@end
