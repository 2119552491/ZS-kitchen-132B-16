
#include "common.h"

void RTC_mode_2_qicailiushui_111112222233333_time_deal() // 
{
	if( Led_time_1ms_tick >= led_speed  )  // ON_F && IR_MIC_F == 2 22 
	{
		Led_time_1ms_tick= 0;
//		time_led_speed_ms_tick++;	// time_LED_LEVEL_Max_tick Led_time_1ms_tick

//		if ( time_led_speed_ms_tick >=  6 ) // 255 led_speed_Max led_level LED_LEVEL_Max RTC_mode_15_count
		{
//			time_led_speed_ms_tick = 0;

			disgint;
			led_num    = 5*6 - 1;
			while( led_num -- ) //  send_data_table_num
			{
				Time_Count++;
				if( Time_Count >= 5 + 1 )
				{
					Time_Count = 1;
					fade_Time_Count++;
					if( fade_Time_Count >= 6 + 1 )
					{
						fade_Time_Count = 1;     
					} 
					a = fade_Time_Count ;
					mode_2_TABLE();
					Color_mode = a;
				}
				Color_INIT_LEVEL_TAB_send(); 

			#if XL_time_Sleep	
					Sleep_time_50us_tick+=2;
			#endif
			}

			engint;
		}
	}
}

#if 0



#endif