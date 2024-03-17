
#include "XL_common.h"

#if XL_HC_one_color_liushui_9999999900_F	// not finish   
/*
1000000000000
1111000000000
1111111111111
*/

#define liushui_9999999900_num_MAX   14 


void XL_HC_one_color_liushui_999999900_deal() // RTC_1ms_tick && LED_Flash_warning_F == 0
{
	if( Led_time_1ms_tick >= led_speed   )  // Led_time_1ms_tick ON_F && IR_MIC_F == 2 22 
	{
		Led_time_1ms_tick= 0;

		byte LED_R_PWM_expect1 , LED_G_PWM_expect1 , LED_B_PWM_expect1;
		byte LED_R_PWM_expect2 , LED_G_PWM_expect2 , LED_B_PWM_expect2;

	//	time_led_speed_ms_tick++;	// time_LED_LEVEL_Max_tick Led_time_1ms_tick

	//	if ( time_led_speed_ms_tick >=  50  ) // 255 led_speed_Max led_level LED_LEVEL_Max RTC_mode_15_count
		{
	//		time_led_speed_ms_tick = 0;

			step_2_value++;
			if( step_2_value >= liushui_9999999900_num_MAX + 1 )
			{
				step_2_value =  0;

				step_1_value++;
				if( step_1_value >= 8 )
					step_1_value = 1;
			}

			if( step_1_value == 0 )
				step_1_value = 1;
///////////////////////////////////////////
			if( step_1_value )
				step_1_value--;
			if( step_1_value == 0 )
				step_1_value = 7;
			a = step_1_value;
			HC_qicailiushui_TABLE();
			Color_mode = a;
			Color_INIT_LEVEL_TAB();

			LED_R_PWM_expect1  = LED_R_PWM_expect;
			LED_G_PWM_expect1  = LED_G_PWM_expect;
			LED_B_PWM_expect1  = LED_B_PWM_expect;
/////////////////////////////////////////////////////////
			step_1_value++;
			if( step_1_value >= 8 )
				step_1_value = 1;

			a = step_1_value;
			HC_qicailiushui_TABLE();
			Color_mode = a;
			Color_INIT_LEVEL_TAB();

			LED_R_PWM_expect2  = LED_R_PWM_expect;
			LED_G_PWM_expect2  = LED_G_PWM_expect;
			LED_B_PWM_expect2  = LED_B_PWM_expect;

////////////////////////////////////////////
			disgint;

			XL_temp_count = 1;
			while( XL_temp_count -- )
			{
/////////////////////////////////////////////////////////////////
				LED_R_PWM_expect  = LED_R_PWM_expect1;
				LED_G_PWM_expect  = LED_G_PWM_expect1;
				LED_B_PWM_expect  = LED_B_PWM_expect1;

				led_num = liushui_9999999900_num_MAX - step_2_value;
				while( led_num -- )
				{ 
					led_level_temp = LED_G_PWM_expect;
					send_one_byte(  );// 
					led_level_temp = LED_R_PWM_expect;
					send_one_byte(  );// 
					led_level_temp = LED_B_PWM_expect;
					send_one_byte(  );// 
				}
/////////////////////////////////////////////////////////////////
				LED_R_PWM_expect  = LED_R_PWM_expect2;
				LED_G_PWM_expect  = LED_G_PWM_expect2;
				LED_B_PWM_expect  = LED_B_PWM_expect2;
				led_num = step_2_value;
				led_num = led_num + led_num;
				while( led_num -- )
				{ 
					led_level_temp = LED_G_PWM_expect;
					send_one_byte(  );// 
					led_level_temp = LED_R_PWM_expect;
					send_one_byte(  );// 
					led_level_temp = LED_B_PWM_expect;
					send_one_byte(  );// 
				}
				LED_R_PWM_expect  = LED_R_PWM_expect1;
				LED_G_PWM_expect  = LED_G_PWM_expect1;
				LED_B_PWM_expect  = LED_B_PWM_expect1;

				led_num = liushui_9999999900_num_MAX - step_2_value;
				while( led_num -- )
				{ 
					led_level_temp = LED_G_PWM_expect;
					send_one_byte(  );// 
					led_level_temp = LED_R_PWM_expect;
					send_one_byte(  );// 
					led_level_temp = LED_B_PWM_expect;
					send_one_byte(  );// 
				}
			}

			engint;
		}
	}
}


#endif