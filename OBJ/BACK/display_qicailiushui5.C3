
#include "common.h"

#define liuxing_num    9

#define led_level_1_9  28

////////////////////433 ����ʧ�� ������ʱ��̫��

void mode_5_TABLE() // +3
{
	a += 1;
	pcadd a;
	ret 11

	ret 1     
	ret 6 
	ret 11 //1
}

void RTC_mode_5_qicailiushui_001234500_time_deal() // 
{
	if( Led_time_1ms_tick >= led_speed  )  // ON_F && IR_MIC_F == 2 22 
	{
		Led_time_1ms_tick= 0;
//		time_led_speed_ms_tick++;	// time_LED_LEVEL_Max_tick Led_time_1ms_tick

//		if ( time_led_speed_ms_tick >=  6 ) // 255 led_speed_Max led_level LED_LEVEL_Max RTC_mode_15_count
		{
//			time_led_speed_ms_tick = 0;
			Time_Count++;

			if( Time_Count >= LED_num_MAX + liuxing_num + 1 )
			{
				Time_Count = 1;
				fade_Time_Count++;
				if( fade_Time_Count >= 3 + 1 )
				{
					fade_Time_Count = 1;  
				} 
				a = fade_Time_Count ;
				mode_5_TABLE();
				Color_mode = a;
				led_level = led_level_Max; 
			}
			if( Time_Count <= liuxing_num )
			{

				RTC_led_level  -= led_level_1_9; // led_level
				send_byte_deal();
			}
			else
			{
				LED_G_PWM_expect  = 0;
				LED_R_PWM_expect  = 0;
				LED_B_PWM_expect  = 0;
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
			while( send_count < send_data_table_num  ) //  send_data_table_num
			{
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

#if 0


z
#endif