#include "common.h"

#if XL_AD     			 

bit mic_mode_F;


void Mic_7Color_fade_to_0() // Led_time_1ms_tick && LED_Flash_warning_F == 0
{
	if( IR_MIC_init_F  ) // Led_time_1ms_tick ON_F && IR_MIC_F == 2 22 
//	if( Led_time_1ms_tick >= 1  )  // ON_F && IR_MIC_F == 2 22 
	{
		IR_MIC_init_F = 0;
		if( cur_adc_error >= 10 &&  MIC_1ms_tick >= 20  )
		{	
			mic_mode_F   = 1;
			step_1_value = 0;
			MIC_1ms_tick = 0;
			RTC_led_level = led_level + 1;

			Time_Count++;
			if( Time_Count >= 7 + 1 )
				Time_Count = 1;
			a = Time_Count;// XL_temp_count
			LED_7_Smooth_Mode_TABLE();
			Color_mode = a;
		//	Color_INIT_LEVEL_TAB();
		}

		if ( Led_time_50us_tick >=  10 ) // 255 led_speed_Max led_level LED_LEVEL_Max RTC_mode_15_count
		{
			Led_time_50us_tick = 0;
			step_1_value++;

			if( step_1_value >= 36 ) // 8
				step_1_value = 1;

			if( mic_mode_F )
			{
				Color_INIT_LEVEL_TAB();
				if( RTC_led_level == 0 )
				{
					mic_mode_F = 0;
					RTC_led_level = led_level + 1 ;
				}
				else
				{
					XL_temp_count = led_level>>4;
				//	XL_temp_count = XL_temp_count + 1;
					if( step_1_value <= XL_temp_count ) // 8
						RTC_led_level-=16; //RTC_mode_10_count = 20;
					else
					{
						if( RTC_led_level )
							RTC_led_level-=1;//   5  3  17
						if( RTC_led_level )
							RTC_led_level-=1;//   5  3  17
						if( RTC_led_level )
							RTC_led_level-=1;//   5  3  17
					}
				}
			}
		}
	}
}
#endif