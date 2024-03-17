#include "common.h"

byte AD_num_count;

void Mic2_Mode_TABLE()
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
	ret 18
}

void Mic2_deal() // Led_time_1ms_tick && LED_Flash_warning_F == 0
{
	if( IR_MIC_init_F  )  // ON_F && IR_MIC_F == 2 22 
//	if( Led_time_1ms_tick >= 1  )  // ON_F && IR_MIC_F == 2 22 
	{
		IR_MIC_init_F = 0;

		if ( Led_time_1ms_tick >=  10 ) // 255 led_speed_Max led_level LED_LEVEL_Max RTC_mode_15_count
		{
			Led_time_1ms_tick = 0;

			if( cur_adc_error >=  7 )
			{
				AD_num_count++;
				if( AD_num_count >= 32)
				{
					AD_num_count = 0;
					fade_Time_Count++;
					if( fade_Time_Count >= 8 )
						fade_Time_Count = 1;
					a = fade_Time_Count;
					Mic2_Mode_TABLE();
					Color_mode = a;
				}

				send_byte_deal();
				send_data_table[0] = LED_G_PWM_expect;
				send_data_table[1] = LED_R_PWM_expect;
				send_data_table[2] = LED_B_PWM_expect;
			}
			else
			{
				send_data_table[0] = 0;
				send_data_table[1] = 0;
				send_data_table[2] = 0;
			}

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
			send_data_table[0] = 0;
			send_data_table[1] = 0;
			send_data_table[2] = 0;
			

			send_count = 0; //send_count 
			led_num    = 0;

			disgint;

			while( send_count < send_data_table_num  ) // 
			{
			//	while( send_time_count -- )
				{
					point_send_data_table1 =   send_data_table + led_num + 0 ;	// - 1
					led_level_temp		   = *point_send_data_table1;
					send_one_byte(); 

					send_count++;
					point_send_data_table1 =   send_data_table + led_num + 1 ;	// - 1
					led_level_temp		   = *point_send_data_table1;
					send_one_byte(); 

				#if XL_time_Sleep	
					Sleep_time_50us_tick+=2;
				#endif

					point_send_data_table1 =   send_data_table + led_num + 2 ;	// - 1
					led_level_temp		   = *point_send_data_table1;
					send_one_byte(); 
					
				}
				led_num+=3;
			}
			engint;
		}
	}
}