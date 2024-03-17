
#include "XL_common.h"

#if XL_HC_music_VOL_F	// not finish   

void XL_HC_music_VOL_deal() // Led_time_50us_tick && LED_Flash_warning_F == 0
{
	send_count = 0; //send_count 
	led_num    = 0;

	while( send_count < send_data_table_num  ) // MIC_show_vol_1_2
	{
		if( RTC_mode == 7 )// || RTC_mode == 7 
		{
			send_count = Led_num_1_2_Max - MIC_show_vol_1_2;
			send_count = send_count + send_count + send_count;
		//	send_count = send_count + send_count ;
			while( send_count )
			{
				send_count --;
			//	point_send_data_table1 =   send_data_table + led_num + 0 ;	// - 1
				led_level_temp		   = 0; // ( ( *point_send_data_table1 ) >>5 ) ;
				send_one_byte(); 
			}

			while(  send_count < MIC_show_vol )
			{
				#if 1 
			//	while( send_time_count -- )
				{
					point_send_data_table1 =   send_data_table + led_num + 0 ;	// - 1
					led_level_temp		   = *point_send_data_table1;
					send_one_byte(); 
				//	led_num++;

					point_send_data_table1 =   send_data_table + led_num + 1 ;	// - 1
					led_level_temp		   = *point_send_data_table1;
					send_one_byte(); 
				//	led_num++;

					point_send_data_table1 =   send_data_table + led_num + 2 ;	// - 1
					led_level_temp		   = *point_send_data_table1;
					send_one_byte(); 
				}
				#endif
				send_count++;
				led_num+=3;
			}

			send_count = Led_num_1_2_Max - MIC_show_vol_1_2;
			send_count = send_count + send_count + send_count;
		//	send_count = send_count + send_count ;
			while( send_count )
			{
				send_count --;
			//	point_send_data_table1 =   send_data_table + led_num + 0 ;	// - 1
				led_level_temp		   = 0; // ( ( *point_send_data_table1 ) >>5 ) ;
				send_one_byte(); 
			}
		}

		if( RTC_mode == 6 )// || RTC_mode == 7 
		{
			while(  send_count < MIC_show_vol_1_2 )
			{
				#if 1 
			//	while( send_time_count -- )
				{
					point_send_data_table1 =   send_data_table + led_num + 0 ;	// - 1
					led_level_temp		   = *point_send_data_table1;
					send_one_byte(); 
				//	led_num++;

					point_send_data_table1 =   send_data_table + led_num + 1 ;	// - 1
					led_level_temp		   = *point_send_data_table1;
					send_one_byte(); 
				//	led_num++;

					point_send_data_table1 =   send_data_table + led_num + 2 ;	// - 1
					led_level_temp		   = *point_send_data_table1;
					send_one_byte(); 
				}
				#endif
				send_count++;
				led_num+=3;
			}

			send_count = send_data_table_num - MIC_show_vol;
			send_count = send_count + send_count + send_count;
		//	send_count = send_count + send_count ;
			while( send_count )
			{
				send_count --;
			//	point_send_data_table1 =   send_data_table + led_num + 0 ;	// - 1
				led_level_temp		   = 0; // ( ( *point_send_data_table1 ) >>5 ) ;
				send_one_byte(); 
			}

			while(  send_count < MIC_show_vol_1_2 )
			{
				#if 1 
			//	while( send_time_count -- )
				{
					point_send_data_table1 =   send_data_table + led_num + 0 ;	// - 1
					led_level_temp		   = *point_send_data_table1;
					send_one_byte(); 
				//	led_num++;

					point_send_data_table1 =   send_data_table + led_num + 1 ;	// - 1
					led_level_temp		   = *point_send_data_table1;
					send_one_byte(); 
				//	led_num++;

					point_send_data_table1 =   send_data_table + led_num + 2 ;	// - 1
					led_level_temp		   = *point_send_data_table1;
					send_one_byte(); 
				}
				#endif
				send_count++;
				led_num+=3;
			}
		}

		if( RTC_mode == 4 || RTC_mode == 5 )
		{
			while(  send_count < MIC_show_vol )
			{
				#if 1 
			//	while( send_time_count -- )
				{
					point_send_data_table1 =   send_data_table + led_num + 0 ;	// - 1
					led_level_temp		   = *point_send_data_table1;
					send_one_byte(); 
				//	led_num++;

					point_send_data_table1 =   send_data_table + led_num + 1 ;	// - 1
					led_level_temp		   = *point_send_data_table1;
					send_one_byte(); 
				//	led_num++;

					point_send_data_table1 =   send_data_table + led_num + 2 ;	// - 1
					led_level_temp		   = *point_send_data_table1;
					send_one_byte(); 
				}
				#endif
				send_count++;
				led_num+=3;
			}
		}

		if( RTC_mode == 4 )
		{
			send_count = send_data_table_num;
			send_count = send_count + send_count + send_count;
			while( send_count -- )
			{
			//	point_send_data_table1 =   send_data_table + led_num + 0 ;	// - 1
				led_level_temp		   = 0; // ( ( *point_send_data_table1 ) >>5 ) ;
				send_one_byte(); 
			}
		}
		else if( RTC_mode == 5 )
		{

			send_count = 12;
			while( send_count -- )
			{
			//	point_send_data_table1 =   send_data_table + led_num + 0 ;	// - 1
				led_level_temp		   = 0; // ( ( *point_send_data_table1 ) >>5 ) ;
				send_one_byte(); 
			}


			if(  MIC_show_vol )
			{
				point_send_data_table1 =   send_data_table + 0 + 0 ;	// - 1
				led_level_temp		   = *point_send_data_table1;
				send_one_byte(); 
			//	led_num++;

				point_send_data_table1 =   send_data_table + 0 + 1 ;	// - 1
				led_level_temp		   = *point_send_data_table1;
				send_one_byte(); 
			//	led_num++;

				point_send_data_table1 =   send_data_table + 0 + 2 ;	// - 1
				led_level_temp		   = *point_send_data_table1;
				send_one_byte(); 
			}


			send_count = send_data_table_num - MIC_show_vol;
			send_count = send_count + send_count + send_count;
			while( send_count -- )
			{
			//	point_send_data_table1 =   send_data_table + led_num + 0 ;	// - 1
				led_level_temp		   = 0; // ( ( *point_send_data_table1 ) >>5 ) ;
				send_one_byte(); 
			}
		}
		send_count = send_data_table_num;
}
#endif

#IF 0
	if( RTC_mode == 16 )
	{
		temp_byte_value = send_data_table_num - MIC_show_vol;
		while( send_count < send_data_table_num  ) // 
		{
			send_count++;
			if( send_count > temp_byte_value || send_count <= MIC_show_vol )
			{
			//	while( send_time_count -- )
				{
					point_send_data_table1 =   send_data_table + led_num + 0 ;	// - 1
					led_level_temp		   = *point_send_data_table1;
					send_one_byte(); 
				//	led_num++;

					point_send_data_table1 =   send_data_table + led_num + 1 ;	// - 1
					led_level_temp		   = *point_send_data_table1;
					send_one_byte(); 
				//	led_num++;

					point_send_data_table1 =   send_data_table + led_num + 2 ;	// - 1
					led_level_temp		   = *point_send_data_table1;
					send_one_byte(); 
					
				}
			}
			else
			{
			//	while( send_time_count -- )
				{
					point_send_data_table1 =   send_data_table + led_num + 0 ;	// - 1
					led_level_temp		   = ( ( *point_send_data_table1 ) >>5 ) ;
					send_one_byte(); 
				//	led_num++;

					point_send_data_table1 =   send_data_table + led_num + 1 ;	// - 1
					led_level_temp		   = ( ( *point_send_data_table1 ) >>5 ) ;//*point_send_data_table1;
					send_one_byte(); 
				//	led_num++;

					point_send_data_table1 =   send_data_table + led_num + 2 ;	// - 1
					led_level_temp		   = ( ( *point_send_data_table1 ) >>5 ) ;//*point_send_data_table1;
					send_one_byte(); 
					
				}
			}
			led_num+=3;
		}
	}
#endif