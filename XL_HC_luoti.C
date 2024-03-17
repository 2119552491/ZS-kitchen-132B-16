
#include "XL_common.h"

#if XL_huancai // XL_HC_RGB_qicailiushui

#if XL_huancai_luoti

#define luoti_zhengxiang		0
#define luoti_fanxiang			1

void HC_RTC_luoti();
void HC_RTC_luoti()
{
	byte XL_temp_count1;
//	if(  RTC_mode ==  18  ) // 
	{
		send_count = 0;  
		led_num    = 0;

		#if luoti_fanxiang	//fanxiang
			XL_temp_count = LED_num_MAX - MIC_show_vol;
			XL_temp_count1 = LED_num_MAX - time_100ms_tick_misic;		
			while( send_count < XL_temp_count  ) // 
			{

				if (IR_in == 0)
					return;
				send_count++;
				if( send_count == XL_temp_count1 )
				{
					led_level_temp		   = 0;//( ( *point_send_data_table1 ) >>5 ) ;//*point_send_data_table1;
					send_one_byte(); 
					led_level_temp		   = 255;//( ( *point_send_data_table1 ) >>5 ) ;//*point_send_data_table1;
					send_one_byte(); 
					led_level_temp		   = 0;//( ( *point_send_data_table1 ) >>5 ) ;//*point_send_data_table1;
					send_one_byte(); 
				}
				else
				{
					led_level_temp		   = 0;//( ( *point_send_data_table1 ) >>5 ) ;//*point_send_data_table1;
					send_one_byte(); 
					led_level_temp		   = 0;//( ( *point_send_data_table1 ) >>5 ) ;//*point_send_data_table1;
					send_one_byte(); 
					led_level_temp		   = 0;//( ( *point_send_data_table1 ) >>5 ) ;//*point_send_data_table1;
					send_one_byte(); 
				}
				led_num+=3;
			}
			while( send_count < LED_num_MAX  ) // 
			{
				send_count++;

				if (IR_in == 0)
					return;

				#if YG_shuzu  
					point_send_data_table1 =   send_data_table + led_num + 0 ;	// - 1
					led_level_temp		   = *point_send_data_table1;
					send_one_byte(); 

					point_send_data_table1 =   send_data_table + led_num + 1 ;	// - 1
					led_level_temp		   = *point_send_data_table1;
					send_one_byte(); 

					point_send_data_table1 =   send_data_table + led_num + 2 ;	// - 1
					led_level_temp		   = *point_send_data_table1;
					send_one_byte(); 
				#else
					led_level_temp		   = send_data_table[ led_num + 0 ];
					send_one_byte(); 
					led_level_temp		   = send_data_table[ led_num + 1 ];
					send_one_byte(); 
					led_level_temp		   = send_data_table[ led_num + 2 ];
					send_one_byte(); 
				#endif
				led_num+=3;
			}
		#endif


		#if luoti_zhengxiang////zhengxiang
			
			while( send_count < MIC_show_vol  ) // 
			{
				send_count++;
				if (IR_in == 0)
					return;
					
				#if YG_shuzu  
					point_send_data_table1 =   send_data_table + led_num + 0 ;	// - 1
					led_level_temp		   = *point_send_data_table1;
					send_one_byte(); 

					point_send_data_table1 =   send_data_table + led_num + 1 ;	// - 1
					led_level_temp		   = *point_send_data_table1;
					send_one_byte(); 

					point_send_data_table1 =   send_data_table + led_num + 2 ;	// - 1
					led_level_temp		   = *point_send_data_table1;
					send_one_byte(); 
				#else
					led_level_temp		   = send_data_table[ led_num + 0 ];
					send_one_byte(); 
					led_level_temp		   = send_data_table[ led_num + 1 ];
					send_one_byte(); 
					led_level_temp		   = send_data_table[ led_num + 2 ];
					send_one_byte(); 
				#endif

				led_num+=3;
			}
			while( send_count < LED_num_MAX  ) // 
			{

				if (IR_in == 0)
					return;
				send_count++;
				if( send_count == time_100ms_tick_misic )
				{
					led_level_temp		   = 0;//( ( *point_send_data_table1 ) >>5 ) ;//*point_send_data_table1;
					send_one_byte(); 
					led_level_temp		   = 255;//( ( *point_send_data_table1 ) >>5 ) ;//*point_send_data_table1;
					send_one_byte(); 
					led_level_temp		   = 0;//( ( *point_send_data_table1 ) >>5 ) ;//*point_send_data_table1;
					send_one_byte(); 
				}
				else
				{
					led_level_temp		   = 0;//( ( *point_send_data_table1 ) >>5 ) ;//*point_send_data_table1;
					send_one_byte(); 
					led_level_temp		   = 0;//( ( *point_send_data_table1 ) >>5 ) ;//*point_send_data_table1;
					send_one_byte(); 
					led_level_temp		   = 0;//( ( *point_send_data_table1 ) >>5 ) ;//*point_send_data_table1;
					send_one_byte(); 
				}
				led_num+=3;
			}
		#endif
	}
}
#endif

#endif