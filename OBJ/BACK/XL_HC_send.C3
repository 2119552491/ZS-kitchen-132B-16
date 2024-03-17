
#include "XL_common.h"

#if XL_huancai

byte led_num;
byte send_count;

bit fangxiang;

void deal_temp();

word point_send_data_table2;

word point_send_data_table1;
//byte send_count;
void HC_INIT_LEVEL_TAB_send();
void send_all_byte();
void shuzu_paixu_deal();
void shuzu_send_deal();
void clean_shuzu_deal();

byte send_data_table[ send_data_table_num + send_data_table_num + send_data_table_num ];


void shuzu_paixu_deal()// -------->>>>>
{

 // + send_data_table_num + send_data_table_num 
//	if( RTC_mode_10_count_F == 0 ) 
	{
		disgint;
		Color_INIT_LEVEL_TAB();

		send_data_table[0] = LED_G_PWM_expect;
		send_data_table[1] = LED_R_PWM_expect;
		send_data_table[2] = LED_B_PWM_expect;

		if( fangxiang == 0  )
		{
			led_num = send_data_table_num + send_data_table_num + send_data_table_num ;

			while( led_num > 3 )
			{
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
		else
		{
			led_num = 6;
			XL_temp_count = send_data_table_num + send_data_table_num + send_data_table_num ;// + 3 

			while( led_num <= XL_temp_count )
			{
#if YG_shuzu
				point_send_data_table1 		  =  send_data_table + led_num - 3 - 1;
				point_send_data_table2 		  =  send_data_table + led_num  - 1;
				*point_send_data_table1  	  = *point_send_data_table2;

				point_send_data_table1 		  = send_data_table + led_num - 4  - 1;
				point_send_data_table2 		  = send_data_table + led_num - 1 - 1;
				*point_send_data_table1  	  = *point_send_data_table2;

				point_send_data_table1 		  = send_data_table + led_num - 5  - 1;
				point_send_data_table2 		  = send_data_table + led_num - 2 - 1;
				*point_send_data_table1  	  = *point_send_data_table2;
#else
				 send_data_table[led_num - 3 - 1] = send_data_table[led_num  - 1   ];
				 send_data_table[led_num - 4 - 1] = send_data_table[led_num - 1 - 1];
				 send_data_table[led_num - 5 - 1] = send_data_table[led_num - 2 - 1];
#endif

				led_num = led_num + 3;
			}
		}

		engint;
		/*
		send_data_table[0] = 0;
		send_data_table[1] = 0;
		send_data_table[2] = 0;
		*/
	}
}

void shuzu_send_deal()// -------->>>>>
{
	disgint;

	XL_temp_count = Led_num_Max; //  Led_num_1_2_Max
	led_num       = 0;//Led_num_1_4_Max + Led_num_1_4_Max + Led_num_1_4_Max;
	while( XL_temp_count --  ) // 
	{
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
		led_level_temp = send_data_table[ led_num + 0];
		send_one_byte(); 
		led_level_temp = send_data_table[ led_num + 1];
		send_one_byte(); 
		led_level_temp = send_data_table[ led_num + 2];
		send_one_byte(); 
#endif
		led_num+=3;
	}

	engint;
}

void send_one_byte()
{
	byte send_long = 8;

SEND_BYTE1_LOOP:

	if( send_long )
	{
		if( led_level_temp & 0x80 )
			GOTO SEND_BYTE1_BIT_H;
	}
	else
	{
		return;
	}

SEND_BYTE1_BIT_L:
	WS2812_IO = 1;// 250ns

#if SYSCLK_8M		   
	WS2812_IO = 1;// 250ns
#endif

	WS2812_IO = 0;// 750ns
	led_level_temp = led_level_temp<<1;
	send_long--;
	GOTO SEND_BYTE1_LOOP;

SEND_BYTE1_BIT_H:

	WS2812_IO = 1;// 250ns
	WS2812_IO = 1;// 250ns
	WS2812_IO = 1;// 250ns

#if SYSCLK_8M		   
	WS2812_IO = 1;// 250ns
	WS2812_IO = 1;// 250ns
	WS2812_IO = 1;// 250ns
#endif
	WS2812_IO = 0;// 750ns
	led_level_temp = led_level_temp<<1;
	send_long--;
	GOTO SEND_BYTE1_LOOP;

}

void send_all_byte() 
{
	disgint;
		   
	led_num = LED_num_MAX ;///LED_num_MAX

	while( led_num -- )
	{ 
		send_three_byte (); // send_one_cur_adc   INIT_LEVEL_TAB
	}
	engint;
}

void send_three_byte()
{
//	disgint;
#if XL_send_GRB
		led_level_temp = LED_G_PWM_expect ;
		send_one_byte(  );// 
		led_level_temp = LED_R_PWM_expect;
		send_one_byte(  );// 
		led_level_temp = LED_B_PWM_expect;
		send_one_byte(  );//
#endif

#if XL_send_BRG
		led_level_temp = LED_B_PWM_expect;
		send_one_byte(  );// 
		led_level_temp = LED_R_PWM_expect;
		send_one_byte(  );// 
		led_level_temp = LED_G_PWM_expect;
		send_one_byte(  );// 
#endif

//	engint;
}


void send_000()
{
	disgint; 

	led_num = Led_num_Max ;
	while( led_num -- )
	{
		led_level_temp = 0;
		send_one_byte(  );// 
		led_level_temp = 0;
		send_one_byte(  );// 
		led_level_temp = 0;
		send_one_byte(  );// 
	}
	engint;
}

void clean_shuzu_deal()
{ 
	XL_temp_count = send_data_table_num ; //send_count  Led_num_1_2_Max
	led_num    = 0;

	disgint;

	while( XL_temp_count --  ) // 
	{
		point_send_data_table1 =   send_data_table + led_num + 0 ;	// - 1
		*point_send_data_table1= 0;

		point_send_data_table1 =   send_data_table + led_num + 1 ;	// - 1
		*point_send_data_table1= 0;

		point_send_data_table1 =   send_data_table + led_num + 2 ;	// - 1
		*point_send_data_table1= 0;
		led_num+=3;
	}

	engint;
}


	 /*
void send_byte_deal()
{
//	if( Color_mode )
	{
		//disgint;
#if XL_send_GRB
		a=Color_mode;
		G_LED_Color_LEVEL_TABLE(); // LED_W_PWM = 0;
		XL_temp_count = a ;
		LED_PWM_16_LEVEL_TABLE();
		LED_G_PWM_expect = led_level_temp;
		//send_one_byte();//

		a=Color_mode;
		R_LED_Color_LEVEL_TABLE(); // LED_W_PWM = 0;
		XL_temp_count = a ;
		LED_PWM_16_LEVEL_TABLE();
		LED_R_PWM_expect = led_level_temp;
		//send_one_byte();//

		a=Color_mode;
		B_LED_Color_LEVEL_TABLE(); // LED_W_PWM = 0;
		XL_temp_count = a ;
		LED_PWM_16_LEVEL_TABLE();
		LED_B_PWM_expect = led_level_temp;
	//	send_one_byte();//
#endif
		//engint;
	}
}


void HC_INIT_LEVEL_TAB_send()
{
	if( Color_mode )
	{
//		disgint;
#if XL_send_GRB
		a=Color_mode;
		G_LED_Color_LEVEL_TABLE(); // LED_G_PWM_expect = 0;
		XL_temp_count = a ;
		LED_PWM_16_LEVEL_TABLE();
//		LED_G_PWM_expect = led_level_temp;
		send_one_byte();//

		a=Color_mode;
		R_LED_Color_LEVEL_TABLE(); // WS2812_IO_PWM = 0;
		XL_temp_count = a ;
		LED_PWM_16_LEVEL_TABLE();
//		WS2812_IO_PWM = led_level_temp;
		send_one_byte();//

		a=Color_mode;
		B_LED_Color_LEVEL_TABLE(); // LED_B_PWM_expect = 0;
		XL_temp_count = a ;
		LED_PWM_16_LEVEL_TABLE();
//		LED_B_PWM_expect = led_level_temp;
		send_one_byte();//
#endif

#if XL_send_BRG
		a=Color_mode;
		B_LED_Color_LEVEL_TABLE(); // LED_B_PWM_expect = 0;
		XL_temp_count = a ;
		LED_PWM_16_LEVEL_TABLE();
//		LED_B_PWM_expect = led_level_temp;
		send_one_byte();//

		a=Color_mode;
		R_LED_Color_LEVEL_TABLE(); // WS2812_IO_PWM = 0;
		XL_temp_count = a ;
		LED_PWM_16_LEVEL_TABLE();
//		WS2812_IO_PWM = led_level_temp;
		send_one_byte();//

		a=Color_mode;
		G_LED_Color_LEVEL_TABLE(); // LED_G_PWM_expect = 0;
		XL_temp_count = a ;
		LED_PWM_16_LEVEL_TABLE();
//		LED_G_PWM_expect = led_level_temp;
		send_one_byte();//
#endif

#if XL_Sleep_time		   
		Sleep_time_50us_tick+=3;
#endif
//		engint;
	}
}
*/
#endif