
#include "XL_common.h"

#if XL_huancai // 

#if 1

void XL_HC_RGB_qicailiushui();

void XL_HC_RGB_qicailiushui()
{
	Color_mode++;
	if( Color_mode >= 48 + 1)	Color_mode = 1;

	send_byte_deal();// send_data_deal1 send_byte_deal1 

	send_data_table[0] = LED_G_PWM;
	send_data_table[1] = LED_R_PWM;
	send_data_table[2] = LED_B_PWM;

	led_num = LED_num_MAX + LED_num_MAX + LED_num_MAX ; // + LED_num_MAX + LED_num_MAX 
	while( led_num > 3 )
	{
		if (IR_in == 0)
			return;
		#if YG_shuzu 
			point_send_data_table1 		  =  send_data_table + led_num - 3 - 1;
			point_send_data_table2 		  =  send_data_table + led_num  - 1;
			*point_send_data_table2  	  = *point_send_data_table1;

			point_send_data_table1 		  = send_data_table + led_num - 4  - 1;
			point_send_data_table2 		  = send_data_table + led_num - 1 - 1;
			*point_send_data_table2  	  = *point_send_data_table1;

			point_send_data_table1 		  = send_data_table + led_num - 5  - 1;
			point_send_data_table2 		  = send_data_table + led_num - 2 - 1;
			*point_send_data_table2  	  = *point_send_data_table1;
		#else
			 send_data_table[led_num  - 1] 	  = send_data_table[led_num - 3 - 1];
			 send_data_table[led_num - 1 - 1] = send_data_table[led_num - 4 - 1];
			 send_data_table[led_num - 2 - 1] = send_data_table[led_num - 5 - 1];
		#endif

		led_num = led_num - 3;
	}
}
#endif

#endif