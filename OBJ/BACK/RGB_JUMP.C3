
#include "common.h"

#if XL_RTC_JUMP		   

void LED_3_Smooth_Mode_TABLE();
void LED_7_Smooth_Mode_TABLE(); 



void LED_3_Smooth_Mode();
void LED_7_Smooth_Mode();


void LED_3_Smooth_Mode() // RTC_1ms_tick && LED_Flash_warning_F == 0
{
	if( Led_time_50us_tick >= led_speed  )  // Led_time_1ms_tick ON_F && IR_MIC_F == 2 22 
	{
		Led_time_50us_tick= 0;
		time_led_speed_ms_tick++;	// time_LED_LEVEL_Max_tick Led_time_1ms_tick

		if ( time_led_speed_ms_tick >=  led_level_Max  ) // 255 led_speed_Max led_level LED_LEVEL_Max RTC_mode_15_count
		{
			time_led_speed_ms_tick = 0;

			Time_Count++;
			if( Time_Count >= 3 + 1)
				Time_Count = 1;
			a = Time_Count;// XL_temp_count
			LED_3_Smooth_Mode_TABLE();
			Color_mode = a;
			Color_INIT_LEVEL_TAB();
		}
	}
}

void LED_7_Smooth_Mode() // RTC_1ms_tick && LED_Flash_warning_F == 0
{
	if( Led_time_50us_tick >= led_speed  )  // Led_time_1ms_tick ON_F && IR_MIC_F == 2 22 
	{
		Led_time_50us_tick= 0;
		time_led_speed_ms_tick++;	// time_LED_LEVEL_Max_tick Led_time_1ms_tick

		if ( time_led_speed_ms_tick >=  led_level_Max  ) // 255 led_speed_Max led_level LED_LEVEL_Max RTC_mode_15_count
		{
			time_led_speed_ms_tick = 0;

			Time_Count++;
			if( Time_Count >= 7 + 1 )
				Time_Count = 1;
			a = Time_Count;// XL_temp_count
			LED_7_Smooth_Mode_TABLE();
			Color_mode = a;
			Color_INIT_LEVEL_TAB();
		}
	}
}

void LED_3_Smooth_Mode_TABLE() // R-G-B-
{
	a += 1;
	pcadd a;
	ret 1

	ret 1
	ret 2
	ret 3

}

void LED_7_Smooth_Mode_TABLE() // R-G-B-RG-GB-RB-RGB
{
	a += 1;
	pcadd a;
	ret 1

	ret 1
	ret 2
	ret 3
	ret 4
//	ret 5
	ret 6
	ret 7
	ret 8
}
/*

void LED_3_Smooth_Mode_TABLE() // R-G-B-
{
	a += 1;
	pcadd a;
	ret 1

	ret 1
	ret 6
	ret 11

}

void LED_7_Smooth_Mode_TABLE() // R-G-B-RG-GB-RB-RGB
{
	a += 1;
	pcadd a;
	ret 1

	ret 1
	ret 5
	ret 6
	ret 10
	ret 11
	ret 15
	ret 17
}
*/
#endif