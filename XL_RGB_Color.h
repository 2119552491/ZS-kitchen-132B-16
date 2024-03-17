
#define FS_3 			   		PA.0  //15
#define LED_R 			   	 	PA.0   //15
#define LED_R_mode 	  	   	 	PAC.0   //15

#define FS_2 			   		PA.4  //15
#define LED_G 			   	 	PA.4   //15
#define LED_G_mode 	  	   	 	PAC.4   //15

#define FS_1 			   		PA.3  //15
#define LED_B 			   		PA.3  //15
#define LED_B_mode 	  	   	 	PAC.3   //15

#define Color_mode_RGB_Max   48//20//7 

#define Color_mode_Max   Color_mode_RGB_Max + Color_mode_YW_Max

#define RGB_Color 			  	 1


#define led_speed_1_4_Max 	   	5//15//3//2//10   1  15
#define led_speed_2_4_Max 	   	led_speed_1_4_Max + led_speed_1_4_Max //15//3//2//10


#define led_speed_Max      		24//led_speed_2_4_Max + led_speed_2_4_Max//15//165//20
#define led_speed_Min 	   		3//led_speed_1_4_Max//15//3//2//10

#define speed_variety_range  	led_speed_Min//15//2


#define led_speed_add_sub_F		1

#define led_speed_limit			0
#define led_speed_fanzhuang	 	0
#define led_speed_add_sub	 	1 


#define auto_mode_F			 	0 


#define led_level_1_16_Max 	 			16 // 240+8//
#define led_level_1_8_Max 	 			led_level_1_16_Max + led_level_1_16_Max // 240+8//
#define led_level_1_4_Max 	 			led_level_1_8_Max + led_level_1_8_Max // 240+8//
#define led_level_2_4_Max 	 			led_level_1_4_Max + led_level_1_4_Max // 240+8//
#define led_level_3_4_Max 	 			led_level_1_4_Max + led_level_1_4_Max + led_level_1_4_Max// 240+8// short_key_Light_variety_range
#define led_level_7_8_Max 	 			led_level_3_4_Max + led_level_1_8_Max //+ led_level_1_4_Max// 240+8// short_key_Light_variety_range



#define led_level_variety_Max 			led_level_7_8_Max


#define led_level_Min 	 	 			led_level_1_16_Max//44//88/
#define led_level_Max 	 	 			led_level_2_4_Max + led_level_2_4_Max - 1//

#define short_key_Light_variety_range	led_level_1_8_Max//led_level_1_4_Max
#define long_key_Light_variety_range	1//1024//1024//262144//131072//(256)<<11//led_level_1_8_Max//33//// 53//




#define led_mode_variety_range  16//128//256 //1024 - 2//  

#define led_mode_Max_1_4	 			led_mode_variety_range
#define led_mode_Max_2_4	 			led_mode_Max_1_4 + led_mode_Max_1_4
#define led_mode_Max_3_4	 			led_mode_Max_1_4 + led_mode_Max_1_4 + led_mode_Max_1_4
#define led_mode_Max_4_4	 			led_mode_Max_2_4 + led_mode_Max_2_4

#define led_mode_Min  	 		0 
#define led_mode_Mid  	 		led_mode_Max_2_4 
#define led_mode_Max  	 		led_mode_Max_4_4//led_mode_Mid  + led_mode_Mid//256//1024 


#define XL_level_zdy			0  // 25 - 50 - 75 - 100 
#define level_limit				0
#define level_fanzhuang			0
#define level_add_sub			1


extern bit RTC_mode_auto_first_F;

extern byte LED_R_PWM_expect;
extern byte LED_G_PWM_expect;
extern byte LED_B_PWM_expect;

extern byte led_level_1_16;
/*
extern byte LED_R_PWM_expect_fade;
extern byte LED_G_PWM_expect_fade;
extern byte LED_B_PWM_expect_fade;
*/
extern byte LED_R_PWM_temp;
extern byte LED_G_PWM_temp;
extern byte LED_B_PWM_temp;

extern byte temp_byte_value;
extern byte RTC_mode;


extern byte RTC_led_level;
extern byte Color_mode;

extern byte led_mode;
extern byte led_level;
extern byte led_speed;
extern byte temp_byte_value;

//extern byte led_level_count;
//extern bit led_level_init_F;
extern byte led_level_adjust_temp;
extern word XL_temp_count;


extern byte LED_duty;

extern void RGB_init();
extern void one_mode_LEVEL_TABLE();
extern void LED_Color_LEVEL_TABLE();
extern void LED_Color_LEVEL_TEMP_TABLE();
extern void LED_PWM_4_LEVEL_TABLE(); 
extern void LED_PWM_16_LEVEL_TABLE(); 

extern void R_LED_Color_LEVEL_TABLE();
extern void G_LED_Color_LEVEL_TABLE();
extern void B_LED_Color_LEVEL_TABLE();
extern void LED_YW_6_color_TABLE();
extern byte R_Color_Level;
extern byte G_Color_Level;
extern byte B_Color_Level;

extern void Color_INIT_LEVEL_TAB_RGB();