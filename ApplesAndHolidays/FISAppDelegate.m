//  FISAppDelegate.m


#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSMutableDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

/**
 
 * Implement your methods here.
 
 */


-(NSArray *)pickApplesFromFruits:(NSArray *)fruits{
    
    NSPredicate *applePredicate = [NSPredicate predicateWithFormat:@"self LIKE 'apple'"];
    
    NSArray *appleArray = [fruits filteredArrayUsingPredicate:applePredicate];
    
    return appleArray;
}


-(NSArray *)holidaysInSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    
    NSDictionary *seasonDictionary = database[season];
    
    NSArray *holidaysInSeasonArray = [seasonDictionary allKeys];
    
    //NSLog(@"TEST THIS WILL BE HOLIDAYS IN SEASON %@",holidaysInSeasonArray);
    
    return holidaysInSeasonArray;
}


-(NSArray *)suppliesInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    
    NSMutableArray *suppliesInHolidayArray = database[season][holiday];
    
    return suppliesInHolidayArray;
}

-(BOOL)holiday:(NSString *)holiday isInSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    
    NSDictionary *seasonDictionary = database[season];
    
    if([seasonDictionary objectForKey:holiday]){
        return true;
    }
    else{
        return false;
    }
}

-(BOOL)supply:(NSString *)supply isInHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    
    //return weather or not the submitted "holiday" in the submitted "season" contains in its array the submitted "supply" string
    
    if([database[season][holiday] containsObject:supply]){
        return true;
    }
    else{
        return false;
    }

}

-(NSDictionary *)addHoliday:(NSString *)holiday toSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    
    //create a new key-value pair in the subitted "season" key's sub-dictionary that uses the submitted "holiday" as the key and sets up an empty mutable array as its value
    
    NSMutableArray *emptyArray = [NSMutableArray new];
    
    [database[season] setObject:emptyArray forKey:holiday];
    
    return database;
}

-(NSDictionary *)addSupply:(NSString *)supply toHoliday:(NSString *)holiday inSeason:(NSString *)season inDatabase:(NSDictionary *)database{
    
    [database[season][holiday] addObject:supply];
    
    return database;
}



@end