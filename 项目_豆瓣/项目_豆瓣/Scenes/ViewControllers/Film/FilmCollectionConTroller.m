//
//  FilmCollectionConTroller.m
//  项目_豆瓣
//
//  Created by lanou3g on 15/12/16.
//  Copyright © 2015年 韩晓龙. All rights reserved.
//

#import "FilmCollectionConTroller.h"

@interface FilmCollectionConTroller ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@end

static NSString *const cellReuseID = @"systemReuseIdentifier";
static NSString *const footerReuseID = @"footerReuseIdentifier";

@implementation FilmCollectionConTroller
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
    {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem  alloc]initWithImage:[UIImage imageNamed:@"btn_nav_list"] style:UIBarButtonItemStyleDone target:self action:@selector(itemAction)];
        self.navigationItem.title = @"电影";
        self.navigationItem.hidesBackButton = YES;
    }
    return self;
}

-(void)itemAction
{
    [self.navigationController popViewControllerAnimated:NO];
}

-(void)viewDidLoad
{
    
    self.view.backgroundColor = [UIColor greenColor];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(100 , 150);
    
    flowLayout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
    
    NSLog(@"-%@",self.dataArray);
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    collectionView.backgroundColor = [UIColor greenColor];
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellReuseID];
    collectionView.delegate =self;
    collectionView.dataSource =self;
    
    
  //  flowLayout.footerReferenceSize = CGSizeMake(100, 30);
   // [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerReuseID];
    
    
    
    
    [self.view addSubview: collectionView];
}

//-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
//{
//    UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerReuseID forIndexPath:indexPath];
//    footer.backgroundColor = [UIColor yellowColor];
//    if ([kind isEqualToString:UICollectionElementKindSectionFooter])
//    {
//        return footer;
//    }
//    return nil;
//}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
   // return self.dataArray.count;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellReuseID forIndexPath:indexPath];
    UIImageView *imgView = [[UIImageView alloc]initWithFrame:cell.bounds];
    MovieListClass *list = [MovieListClass new];
    list = self.dataArray[indexPath.item];
   // NSLog(@"%@",list);
    [imgView sd_setImageWithURL:[NSURL URLWithString:list.pic_url]placeholderImage:[UIImage imageNamed:@"picholder"]];
    [cell addSubview:imgView];
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
