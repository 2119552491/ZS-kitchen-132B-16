
#include "common.h"

void RTC_mode_1_qicailiushui_0123456789_time_deal() // 
{
	if( Led_time_1ms_tick >= led_speed  )  // ON_F && IR_MIC_F == 2 22 
	{
		Led_time_1ms_tick= 0;
		time_led_speed_ms_tick++;	// time_LED_LEVEL_Max_tick Led_time_1ms_tick

//		if ( time_led_speed_ms_tick >=  6 ) // 255 led_speed_Max led_level LED_LEVEL_Max RTC_mode_15_count
		{
			time_led_speed_ms_tick = 0;

			disgint;
			led_num    = LED_num_MAX - 1;
			while( led_num -- ) //  send_data_table_num
			{
				Color_mode++;
				if( Color_mode >= 18  + 1 )
				{
					Color_mode = 1;     
				} 
				INIT_LEVEL_TAB_send();


			#if XL_time_Sleep	
					Sleep_time_50us_tick+=2;
			#endif
			}

			engint;
		}
	}
}

#if 0

void RTC_mode_1_qicailiushui_0123456789_time_deal() // 
{
	if( Led_time_1ms_tick >= led_speed  )  // ON_F && IR_MIC_F == 2 22 
	{
		Led_time_1ms_tick= 0;
		time_led_speed_ms_tick++;	// time_LED_LEVEL_Max_tick Led_time_1ms_tick

//		if ( time_led_speed_ms_tick >=  6 ) // 255 led_speed_Max led_level LED_LEVEL_Max RTC_mode_15_count
		{
			time_led_speed_ms_tick = 0;

			Time_Count++;
			if( Time_Count >= 48 )
			{
				Time_Count = 2;/*
				if( auto_RTC_mode_F )
				{
					RTC_auto_count++;
					if( RTC_auto_count >= RTC_auto_count_time )
					{
						RTC_auto_count = 0;
						short_mode_init_F = 1;
					}
				}*/
			}


//			RTC_mode_10_step++;
			RTC_mode_15_count++;
			fade_Time_Count++;

			if( RTC_mode_15_count >= 12 )
			{
				RTC_mode_15_count = 1;
				RTC_mode_10_step++;
				if( RTC_mode_10_step >= 7 )
					RTC_mode_10_step = 0;
			}

			if( RTC_mode_10_step == 3 || RTC_mode_10_step == 6 )
			{/*
				if( RTC_mode_15_count == 1 )
					fade_Time_Count = 7;
				else*/
					fade_Time_Count = 11;
			}
			else
			{/*
				if( RTC_mode_15_count == 1 )
					fade_Time_Count = 13;
				else*/
					fade_Time_Count = 22;

			}

			if( RTC_mode_10_step == 0 || RTC_mode_10_step == 4 )// LED_G_PWM_expect=255;
			{
					LED_R_PWM_expect-=fade_Time_Count;
			}
			else if( RTC_mode_10_step == 1  )	// LED_G_PWM_expect=255;  || RTC_mode_10_step == 4
			{
					LED_R_PWM_expect+=fade_Time_Count;
			}
			else if( RTC_mode_10_step == 2 )	// LED_G_PWM_expect=255;
			{
					LED_G_PWM_expect-=fade_Time_Count;
			}
			else if( RTC_mode_10_step == 3 )	// LED_G_PWM_expect=255;
			{
					LED_B_PWM_expect+=fade_Time_Count;
			}
			else if( RTC_mode_10_step == 6 )	// LED_G_PWM_expect=255;
			{
					LED_B_PWM_expect-=fade_Time_Count;
			}
			else if( RTC_mode_10_step == 5  )	// LED_G_PWM_expect=255;  || RTC_mode_10_step == 4
			{
					LED_R_PWM_expect+=fade_Time_Count;
					LED_G_PWM_expect+=fade_Time_Count;
			}

			send_data_table[0] = LED_G_PWM_expect;
			send_data_table[1] = LED_R_PWM_expect;
			send_data_table[2] = LED_B_PWM_expect;

			led_num = send_data_table_num + send_data_table_num + send_data_table_num ; // + send_data_table_num + send_data_table_num 
			while( led_num > 3 )
			{
				point_send_data_table1 		  =  send_data_table + led_num - 3 - 1;
				point_send_data_table2 		  =  send_data_table + led_num  - 1;
				*point_send_data_table2  	  = *point_send_data_table1;

				point_send_data_table1 		  = send_data_table + led_num - 4  - 1;
				point_send_data_table2 		  = send_data_table + led_num - 1 - 1;
				*point_send_data_table2  	  = *point_send_data_table1;

				point_send_data_table1 		  = send_data_table + led_num - 5  - 1;
				point_send_data_table2 		  = send_data_table + led_num - 2 - 1;
				*point_send_data_table2  	  = *point_send_data_table1;

				 /*
				 send_data_table[led_num  - 1] 	  = send_data_table[led_num - 3 - 1];
				 send_data_table[led_num - 1 - 1] = send_data_table[led_num - 4 - 1];
				 send_data_table[led_num - 2 - 1] = send_data_table[led_num - 5 - 1];
				*/

				led_num = led_num - 3;
			}


			send_count = 0; //send_count 
			led_num    = 0;

			disgint;
			while( send_count < LED_num_MAX  ) //  send_data_table_num
			{
				if( led_num >= send_data_table_num )
					led_num = 0;
			//	while( send_time_count -- )
				{
					point_send_data_table1 =   send_data_table + led_num + 0 ;	// - 1
					led_level_temp		   = *point_send_data_table1;
					send_one_byte(); 
				//	led_num++;
				send_count++;
					point_send_data_table1 =   send_data_table + led_num + 1 ;	// - 1
					led_level_temp		   = *point_send_data_table1;
					send_one_byte(); 
				//	led_num++;

					point_send_data_table1 =   send_data_table + led_num + 2 ;	// - 1
					led_level_temp		   = *point_send_data_table1;
					send_one_byte(); 
					
				}
				led_num+=3;

			#if XL_time_Sleep	
					Sleep_time_50us_tick+=2;
			#endif
			}



			engint;

			send_data_table[0] = 0;
			send_data_table[1] = 0;
			send_data_table[2] = 0;
		}
	}
}

#endif