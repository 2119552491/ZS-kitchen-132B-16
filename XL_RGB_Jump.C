
#include "XL_common.h"

	   

void LED_3_JUMP_Mode_TABLE();
void LED_7_JUMP_Mode_TABLE(); 

void LED_3_JUMP_Mode();
void LED_7_JUMP_Mode();

#if 0 
void LED_7_JUMP_Mode_TABLE()// R-B-G-RB-RG-GB-RGB
{
	a += 1;
	pcadd a;
	ret 0

	ret 1//255 
//	ret 0//255 
	ret 17//255 
//	ret 0//255 
	ret 33//255  
//	ret 0//255 

	ret 1  + 8//255 
//	ret 0//255 
	ret 17 + 8//255 
//	ret 0//255 
	ret 33 + 8//255  
//	ret 0//255 


	ret 49//255  
//	ret 0//255 

//	ret 0//255 
//	ret 0//255 
/*
	ret 50//255 
	ret 8//255  
	ret 4//255  
	ret 44//255  
*/
}
#endif

#if XL_RTC_7JUMP	| XL_RTC_7JUMP |  XL_RTC_MIC_JUMP

void LED_7_JUMP_Mode_TABLE()// R-B-G-RB-RG-GB-RGB
{
	a += 1;
	pcadd a;
	ret 0

	ret 1//255 
	ret 0//255 
	ret 17//255 
	ret 0//255 
	ret 33//255  
	ret 0//255 

	ret 0//255 
	ret 0//255 
/*
	ret 50//255 
	ret 8//255  
	ret 4//255  
	ret 44//255  
*/
}

void LED_7_JUMP_Mode() // RTC_1ms_tick && LED_Flash_warning_F == 0
{
	if( Led_time_1ms_tick >= led_speed  )  // Led_time_1ms_tick ON_F && IR_MIC_F == 2 22 
	{
		Led_time_1ms_tick= 0;
		time_led_speed_ms_tick++;	// time_LED_LEVEL_Max_tick Led_time_1ms_tick

		if ( time_led_speed_ms_tick >=  42  ) // 255 led_speed_Max led_level LED_LEVEL_Max RTC_mode_15_count
		{
			time_led_speed_ms_tick = 0;


			if( ! ( RTC_mode == RTC_mode_Max + 3 ) )
			{
				Time_Count++;
			}

#if XL_RTC_3JUMP

			if( RTC_mode == 1  )
			{
				if( Time_Count >= 3 + 1 )
				{
					Time_Count = 1;
				}
			}

#endif

#if XL_RTC_7JUMP

			if( RTC_mode == 2  )//if( RTC_mode == RTC_mode_huxi_Max + RTC_mode_fade_Max + RTC_mode_shan_Max + 2 )
			{
				if( Time_Count >= 7 + 1 )
				{
					Time_Count = 1;
				}
			}

#endif

			a = Time_Count;// 
			LED_7_JUMP_Mode_TABLE();
			Color_mode = a;

			#if RGB_Color
				Color_INIT_LEVEL_TAB_RGB();
			#endif
			#if YW_Color
				Color_INIT_LEVEL_TAB_YW();
			#endif

#if XL_huancai

		send_all_byte();

#endif

		}
	}
}
#endif