
#include "common.h"

void RTC_mode_7_qicailiushui_543210_012345_time_deal() // 
{
	if( Led_time_1ms_tick >= led_speed  )  // ON_F && IR_MIC_F == 2 22 
	{
		Led_time_1ms_tick= 0;
//		time_led_speed_ms_tick++;	// time_LED_LEVEL_Max_tick Led_time_1ms_tick

//		if ( time_led_speed_ms_tick >=  6 ) // 255 led_speed_Max led_level LED_LEVEL_Max RTC_mode_15_count
		{
//			time_led_speed_ms_tick = 0;
			if( back_F == 0 )
			{
				Time_Count++;
				if( Time_Count >=  send_data_table_num_1_2 )
				{
					back_F = 1;
				}
			}
			else
			{
				Time_Count--;
				if( Time_Count ==  0 )
				{
					back_F = 0;
					fade_Time_Count++;
					if( fade_Time_Count >= 8 )
						fade_Time_Count = 1;
					a = fade_Time_Count;
					LED_7_Smooth_Mode_TABLE();
					Color_mode = a;
				}
			}

			send_byte_deal();
			disgint;

///////////////////////////////////////////////////////////// 1
			XL_temp_count = Time_Count  ;
			led_num = XL_temp_count;
			send_000();
//////////////////////////////////////////////////////////// 2
			led_num    = send_data_table_num_1_2 - Time_Count;
			send_all_byte_no_interrput_deal();
//////////////////////////////////////////////////////////// 3
			led_num    = send_data_table_num_1_2 - Time_Count;
			send_all_byte_no_interrput_deal();
///////////////////////////////////////////////////////////// 4
			XL_temp_count = Time_Count  ;
			led_num = XL_temp_count;
			send_000();

			engint;
		}
	}
}

#if 0



#endif