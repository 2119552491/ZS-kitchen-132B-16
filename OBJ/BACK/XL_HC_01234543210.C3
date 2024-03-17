
#include "XL_common.h"

#if XL_HC_01234543210_F	// not finish   

void XL_HC_01234543210_table() // R-G-B-
{
	a += 1;
	pcadd a;
	ret 0

	ret 0 
	ret 51
	ret 102
	ret 153 
	ret 204
	ret 255

	ret 255
	ret 204 
	ret 153 
	ret 102 
	ret 51
}


void XL_HC_01234543210_deal() // RTC_1ms_tick && LED_Flash_warning_F == 0
{
	if( Led_time_50us_tick >= 20   )  // Led_time_1ms_tick ON_F && IR_MIC_F == 2 22 
	{
		Led_time_50us_tick= 0;
		time_led_speed_ms_tick++;	// time_LED_LEVEL_Max_tick Led_time_1ms_tick

		if ( time_led_speed_ms_tick >=  20  ) // 255 led_speed_Max led_level LED_LEVEL_Max RTC_mode_15_count
		{
			time_led_speed_ms_tick = 0;

			if( step_1_value )
				step_1_value--;
			else
				step_1_value = Led_num_Max;

			Time_Count = step_1_value;

			led_num = Led_num_Max;//11 


			disgint;
			while( led_num -- )
			{ 
				Time_Count++;
				if( Time_Count >= Led_num_Max + 1)
					Time_Count  = 1;


				if( Color_mode == 6 || Color_mode == 5 				  || Color_mode == 10  || Color_mode == 16 )
				{
					a = Time_Count;
					XL_HC_01234543210_table();
					led_level_temp = a;
				}
				else
					led_level_temp = 0;
				send_one_byte(  );// 


				if( Color_mode == 1 || Color_mode == 5 || Color_mode == 15                   || Color_mode == 16 )
				{
					a = Time_Count;
					XL_HC_01234543210_table();
					led_level_temp = a;
				}
				else
					led_level_temp = 0;
				send_one_byte(  );// 



				if( Color_mode == 11  				||Color_mode == 15 || Color_mode == 10  || Color_mode == 16 )
				{
					a = Time_Count;
					XL_HC_01234543210_table();
					led_level_temp = a;
				}
				else
					led_level_temp = 0;
				send_one_byte(  );// 
			}
			engint;
		}
	}
}

#endif