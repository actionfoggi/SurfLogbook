// Generated by Apple Swift version 2.0 (swiftlang-700.0.59 clang-700.0.72)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if defined(__has_include) && __has_include(<uchar.h>)
# include <uchar.h>
#elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
#endif

typedef struct _NSZone NSZone;

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted) 
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
#endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
#if defined(__has_feature) && __has_feature(modules)
@import UIKit;
@import CoreData;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
@class UIWindow;
@class UIApplication;
@class NSObject;
@class NSURL;
@class NSManagedObjectModel;
@class NSPersistentStoreCoordinator;
@class NSManagedObjectContext;

SWIFT_CLASS("_TtC11SurfLogbook11AppDelegate")
@interface AppDelegate : UIResponder <UIApplicationDelegate>
@property (nonatomic) UIWindow * __nullable window;
- (BOOL)application:(UIApplication * __nonnull)application didFinishLaunchingWithOptions:(NSDictionary * __nullable)launchOptions;
- (void)applicationWillResignActive:(UIApplication * __nonnull)application;
- (void)applicationDidEnterBackground:(UIApplication * __nonnull)application;
- (void)applicationWillEnterForeground:(UIApplication * __nonnull)application;
- (void)applicationDidBecomeActive:(UIApplication * __nonnull)application;
- (void)applicationWillTerminate:(UIApplication * __nonnull)application;
@property (nonatomic) NSURL * __nonnull applicationDocumentsDirectory;
@property (nonatomic) NSManagedObjectModel * __nonnull managedObjectModel;
@property (nonatomic) NSPersistentStoreCoordinator * __nullable persistentStoreCoordinator;
@property (nonatomic) NSManagedObjectContext * __nullable managedObjectContext;
- (void)saveContext;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

typedef SWIFT_ENUM(int32_t, SkyConditions) {
  SkyConditionsSunny = 0,
  SkyConditionsPartly_cloudy = 1,
  SkyConditionsCloudy = 2,
  SkyConditionsRain = 3,
  SkyConditionsHeavy_rain = 4,
  SkyConditionsSnow = 5,
  SkyConditionsHeavy_snow = 6,
};

@class NSFetchedResultsController;
@class NSFetchRequest;
@class UITableView;
@class NSIndexPath;
@class UITableViewCell;
@class UIStoryboardSegue;
@class NSBundle;
@class NSCoder;

SWIFT_CLASS("_TtC11SurfLogbook26WetsuitTableViewController")
@interface WetsuitTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>
@property (nonatomic, readonly) NSManagedObjectContext * __nullable managedObjectContext;
@property (nonatomic) NSFetchedResultsController * __nullable fetchedResultsController;
- (void)viewDidLoad;
- (NSFetchRequest * __nonnull)allWetsuitsFetchRequest;
- (NSInteger)numberOfSectionsInTableView:(UITableView * __nonnull)tableView;
- (NSInteger)tableView:(UITableView * __nonnull)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell * __nonnull)tableView:(UITableView * __nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * __nonnull)indexPath;
- (void)didReceiveMemoryWarning;
- (IBAction)unwindToWetsuitList:(UIStoryboardSegue * __nonnull)sender;
- (void)prepareForSegue:(UIStoryboardSegue * __nonnull)segue sender:(id __nullable)sender;
- (nonnull instancetype)initWithStyle:(UITableViewStyle)style OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class NSEntityDescription;

SWIFT_CLASS("_TtC11SurfLogbook8Wetsuits")
@interface Wetsuits : NSManagedObject
@property (nonatomic, copy) NSString * __nonnull name;
@property (nonatomic, copy) NSString * __nonnull manufacturer;
@property (nonatomic, copy) NSString * __nonnull wetsuitThickness;
- (NSString * __nonnull)simpleDescription;
- (nonnull instancetype)initWithEntity:(NSEntityDescription * __nonnull)entity insertIntoManagedObjectContext:(NSManagedObjectContext * __nullable)context OBJC_DESIGNATED_INITIALIZER;
@end

@class NSManagedObjectID;
@class UIPickerView;
@class UIBarButtonItem;
@class UITextField;

SWIFT_CLASS("_TtC11SurfLogbook12vcNewWetsuit")
@interface vcNewWetsuit : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UINavigationControllerDelegate>
@property (nonatomic, copy) NSString * __null_unspecified wetsuitName;
@property (nonatomic, copy) NSString * __null_unspecified manufacturer;
@property (nonatomic, copy) NSString * __null_unspecified wetsuitThickness;
@property (nonatomic) NSManagedObjectID * __null_unspecified objectId;
@property (nonatomic, weak) IBOutlet UITextField * __null_unspecified manufacturerTextField;
@property (nonatomic, weak) IBOutlet UITextField * __null_unspecified wetsuitNameTextField;
@property (nonatomic, weak) IBOutlet UITextField * __null_unspecified thicknessTextField;
@property (nonatomic, readonly) UIPickerView * __nonnull thicknessPickerView;
@property (nonatomic, weak) IBOutlet UIBarButtonItem * __null_unspecified saveButton;
- (void)viewDidLoad;

/// handle picker view selections *
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView * __nonnull)pickerView;
- (NSInteger)pickerView:(UIPickerView * __nonnull)pickerView numberOfRowsInComponent:(NSInteger)component;
- (NSString * __nullable)pickerView:(UIPickerView * __nonnull)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
- (void)pickerView:(UIPickerView * __nonnull)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;
- (void)didReceiveMemoryWarning;
- (IBAction)calcel:(UIBarButtonItem * __nonnull)sender;
- (void)prepareForSegue:(UIStoryboardSegue * __nonnull)segue sender:(id __nullable)sender;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

@class UIDatePicker;
@class UISlider;
@class UIButton;
@class UIScrollView;
@class UIView;
@class UILabel;
@class UITextView;

SWIFT_CLASS("_TtC11SurfLogbook14vcSessionEntry")
@interface vcSessionEntry : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate, UIScrollViewDelegate>

/// scroll content *
@property (nonatomic, weak) IBOutlet UIScrollView * __null_unspecified scrollView;
@property (nonatomic, weak) IBOutlet UIView * __null_unspecified contentView;

/// day info *
@property (nonatomic) IBOutlet UITextField * __null_unspecified dayTextField;
@property (nonatomic) UIDatePicker * __null_unspecified datePickerView;
@property (nonatomic) IBOutlet UITextField * __null_unspecified startTimeTextField;
@property (nonatomic) UIDatePicker * __null_unspecified startTimePickerView;
@property (nonatomic) IBOutlet UITextField * __null_unspecified endTimeTextField;
@property (nonatomic) UIDatePicker * __null_unspecified endTimePickerView;

/// weather info info *
@property (nonatomic, weak) IBOutlet UILabel * __null_unspecified airTempLabel;
@property (nonatomic, weak) IBOutlet UISlider * __null_unspecified airTempSlider;
@property (nonatomic, weak) IBOutlet UILabel * __null_unspecified waterTempLabel;
@property (nonatomic, weak) IBOutlet UISlider * __null_unspecified waterTempSlider;
@property (nonatomic, weak) IBOutlet UILabel * __null_unspecified avgPeopleLabel;
@property (nonatomic, weak) IBOutlet UISlider * __null_unspecified avgPeopleSlider;
@property (nonatomic, weak) IBOutlet UITextField * __null_unspecified skyConditionTextField;

/// common session info *
@property (nonatomic, weak) IBOutlet UITextField * __null_unspecified usedWetsuitTextField;
@property (nonatomic, copy) NSArray<Wetsuits *> * __nonnull wetsuitPickOption;
@property (nonatomic, weak) IBOutlet UIButton * __null_unspecified editWetsuitsButton;
@property (nonatomic, weak) IBOutlet UITextView * __null_unspecified commentTextView;
- (void)viewDidLoad;
- (void)loadCoreDataContentToView;

/// handle scroll view *
- (void)viewDidLayoutSubviews;

/// Air Temp Slinder *
- (IBAction)slinderValueChanged:(UISlider * __nonnull)sender;

/// water temp slider *
- (IBAction)waterTempSliderValueChanged:(UISlider * __nonnull)sender;

/// avg people slider *
- (IBAction)avgPeopleSliderValueChanged:(UISlider * __nonnull)sender;

/// handle picker view selections wetsuit *
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView * __nonnull)pickerView;
- (NSInteger)pickerView:(UIPickerView * __nonnull)pickerView numberOfRowsInComponent:(NSInteger)component;
- (NSString * __nullable)pickerView:(UIPickerView * __nonnull)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
- (void)pickerView:(UIPickerView * __nonnull)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;

/// handle day picker selection *
- (IBAction)dayTextField:(UITextField * __nonnull)sender;
- (void)handleDayPicker:(UIDatePicker * __nonnull)sender;

/// handly start time picker selection *
- (IBAction)startTimeTextField:(UITextField * __nonnull)sender;
- (void)handleStartTimePicker:(UIDatePicker * __nonnull)sender;
- (IBAction)endTimeTextField:(UITextField * __nonnull)sender;
- (void)handleEndTimePicker:(UIDatePicker * __nonnull)sender;

/// handly end of selection *
- (IBAction)editingDone:(UIButton * __nonnull)sender;
- (void)didReceiveMemoryWarning;
- (IBAction)unwindToSessionEntry:(UIStoryboardSegue * __nonnull)sender;
- (nonnull instancetype)initWithNibName:(NSString * __nullable)nibNameOrNil bundle:(NSBundle * __nullable)nibBundleOrNil OBJC_DESIGNATED_INITIALIZER;
- (nullable instancetype)initWithCoder:(NSCoder * __nonnull)aDecoder OBJC_DESIGNATED_INITIALIZER;
@end

#pragma clang diagnostic pop
