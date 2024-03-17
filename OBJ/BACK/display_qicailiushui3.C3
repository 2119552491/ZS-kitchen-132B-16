
#include "common.h"

void RTC_mode_3_qicailiushui_012345678900_time_deal() // 
{
	if( Led_time_1ms_tick >= led_speed  )  // ON_F && IR_MIC_F == 2 22 
	{
		Led_time_1ms_tick= 0;
		time_led_speed_ms_tick++;	// time_LED_LEVEL_Max_tick Led_time_1ms_tick

//		if ( time_led_speed_ms_tick >=  6 ) // 255 led_speed_Max led_level LED_LEVEL_Max RTC_mode_15_count
		{
			time_led_speed_ms_tick = 0;
			if( Color_mode == 0 )
				Color_mode = 1;
			if( fade_Time_Count == 0 )
				fade_Time_Count = 1;

			if( back_F == 0 )
			{
				Time_Count++;
				XL_temp_count = LED_num_MAX - step_1_value;
				if( Time_Count >=  XL_temp_count )
				{
					Time_Count = 0;
					step_1_value++;
					if( step_1_value >= LED_num_MAX )
					{
						back_F = 1;
						step_1_value = LED_num_MAX;
						//Time_Count = 0;
					}
				}
			}
			else
			{
				Time_Count++;
				XL_temp_count = LED_num_MAX - step_1_value;
				if( Time_Count >=  XL_temp_count )
				{
					Time_Count = 0;
					step_1_value--;
					if( step_1_value >= LED_num_MAX )
					{
						back_F = 0;
						step_1_value = 0;
						fade_Time_Count++;
						a = fade_Time_Count;
						LED_7_Smooth_Mode_TABLE();
						Color_mode = a;
					}
				}
			}
			send_byte_deal();
			disgint;
///////////////////////////////////////////////////////////// 1
			led_num    = step_1_value;
			send_all_byte_no_interrput_deal();


///////////////////////////////////////////////////////////// 2
			if( back_F == 0 )
				XL_temp_count =  LED_num_MAX - step_1_value - Time_Count;
			else
				XL_temp_count = Time_Count ;
			led_num = XL_temp_count;
			send_000();

/////////////////////////////////////////////////////////// 3
			send_three_byte();

//////////////////////////////////////////////////////////// 4
			if( back_F == 0 )
				XL_temp_count = Time_Count ;
			else
				XL_temp_count =  LED_num_MAX - step_1_value - Time_Count;
			led_num = XL_temp_count;
			send_000();
////////////////////////////////////////////////////////////
			engint;
		}
	}
}

#if 0



#endif