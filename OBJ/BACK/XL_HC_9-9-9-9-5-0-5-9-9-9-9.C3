
#include "XL_common.h"

#if XL_HC_9999_5_0_5_9999	//not finish   


void XL_HC_9999_5_0_5_9999_deal() // RTC_1ms_tick && LED_Flash_warning_F == 0
{
	if( Led_time_50us_tick >= 20   )  // Led_time_1ms_tick ON_F && IR_MIC_F == 2 22 
	{
		Led_time_50us_tick= 0;
		time_led_speed_ms_tick++;	// time_LED_LEVEL_Max_tick Led_time_1ms_tick

		if ( time_led_speed_ms_tick >=  led_speed  ) // 255 led_speed_Max led_level LED_LEVEL_Max RTC_mode_15_count
		{
			time_led_speed_ms_tick = 0;

			Time_Count++;

			disgint;
				   
			LED_num = LED_num_MAX;

			while( LED_num -- )
			{ 
				send_three_byte (); // send_one_cur_adc   INIT_LEVEL_TAB
			}
			engint;
		}
	}
}

void XL_HC_9999_5_0_5_9999_table() // R-G-B-
{
	a += 1;
	pcadd a;
	ret 1

	ret 1
	ret 2
	ret 3

}

#endif