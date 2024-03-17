
#include "common.h"
void send_time_deal() // RTC_1ms_tick && LED_Flash_warning_F == 0
{
	if( Led_time_1ms_tick >= led_speed  )  // ON_F && IR_MIC_F == 2 22 
	{
		Led_time_1ms_tick= 0;
		time_led_speed_ms_tick++;	// time_LED_LEVEL_Max_tick Led_time_1ms_tick

	//	if ( time_led_speed_ms_tick >=  10 ) // 255 led_speed_Max led_level LED_LEVEL_Max RTC_mode_15_count
		{
			time_led_speed_ms_tick = 0;
			if( RTC_mode == 0   ) // || IR_LED_ON_F == 0
			{
				disgint;
				send_all_byte ();  //   INIT_LEVEL_TAB

			}
		}
	}
}

#if 0

void temp_deal_2();
byte xiufusuzu_count;
void RTC_mode_17_time_deal() // temp_deal_2  cur_adc
{
	if( IR_MIC_init_F  )  // ON_F && IR_MIC_F == 2 22 
//	if( Led_time_1ms_tick >= 4  )  // ON_F && IR_MIC_F == 2 22 
	{
		Led_time_1ms_tick= 0;
		time_led_speed_ms_tick++;	// time_LED_LEVEL_Max_tick Led_time_1ms_tick

		IR_MIC_init_F = 0;

		if( cur_adc_error > MIC_show_vol )
			MIC_show_vol++;
		else if( cur_adc_error < MIC_show_vol  )
			MIC_show_vol--;
		else if( cur_adc_error == MIC_show_vol  )
			MIC_show_vol = MIC_show_vol;

		if( MIC_show_vol >= send_data_table_num_1_2 )
			MIC_show_vol = send_data_table_num_1_2;
		if( MIC_show_vol <= 1 )
			MIC_show_vol = 1;
		if ( time_led_speed_ms_tick >=  6 ) // 255 led_speed_Max led_level LED_LEVEL_Max RTC_mode_15_count
		{
			time_led_speed_ms_tick = 0;

			byte LED_R_PWM_expect_temp, LED_G_PWM_expect_temp, LED_B_PWM_expect_temp;
			byte LED_R_PWM_expect_temp1, LED_G_PWM_expect_temp1, LED_B_PWM_expect_temp1;

			Time_Count++;

			if( Time_Count >= LED_num_MAX_1_2 + 1 ) 
			{
				Time_Count = 1;

				fade_Time_Count++;
				XL_temp_count = RTC_Color_mode ; // + 1
				if( fade_Time_Count >= XL_temp_count )// + 1
				{
					fade_Time_Count = 0;
				}
			} 

			disgint;
			fade_Time_Count++;  
//////////

			a = fade_Time_Count;
			mode_14_TABLE ();
			Color_mode  = a;
			RTC_led_level = led_level;
			send_byte_deal();

			LED_R_PWM_expect_temp = LED_R_PWM_expect;
			LED_G_PWM_expect_temp = LED_G_PWM_expect;
			LED_B_PWM_expect_temp = LED_B_PWM_expect;


			fade_Time_Count--;
///////////

			a = fade_Time_Count;
			mode_14_TABLE ();
			Color_mode  = a;
			RTC_led_level = LED_LEVEL_1_5_Max;
			send_byte_deal();

			LED_R_PWM_expect_temp1 = LED_R_PWM_expect;
			LED_G_PWM_expect_temp1 = LED_G_PWM_expect;
			LED_B_PWM_expect_temp1 = LED_B_PWM_expect;

/*
			if( LED_R_PWM_expect_temp1 )
				LED_R_PWM_expect_temp1 = 16;
			if( LED_G_PWM_expect_temp1 )
				LED_G_PWM_expect_temp1 = 16;
			if( LED_B_PWM_expect_temp1 )
				LED_B_PWM_expect_temp1 = 16;
*/

			LED_num = LED_num_MAX_1_2 - MIC_show_vol;


			while( LED_num -- ) //  
			{
				send_three_byte();
			}


			LED_R_PWM_expect  = LED_R_PWM_expect_temp;
			LED_G_PWM_expect  = LED_G_PWM_expect_temp;
			LED_B_PWM_expect  = LED_B_PWM_expect_temp;


			LED_num = MIC_show_vol ;

			LED_num = LED_num + LED_num ;
			while( LED_num -- ) //  
			{
				send_three_byte();
			}

			LED_R_PWM_expect  = LED_R_PWM_expect_temp1;
			LED_G_PWM_expect  = LED_G_PWM_expect_temp1;
			LED_B_PWM_expect  = LED_B_PWM_expect_temp1;

			LED_num = LED_num_MAX_1_2 - MIC_show_vol;

			while( LED_num -- ) //  
			{
				send_three_byte();
			}

			engint;
			time_led_speed_ms_tick= 0;
		}
	}
}
/*
	//		if( cur_adc_error >= g_comval_sensitivity || IR_MIC_init_F  ) // RTC_mode == 11
		//	if( Led_time_1ms_tick >= led_speed  )  // ON_F && IR_MIC_F == 2 22 
			{
	//			IR_MIC_init_F = 0;
			}
*/

void RTC_mode_16_time_deal() // Led_time_1ms_tick && LED_Flash_warning_F == 0
{
	
	if( IR_MIC_init_F  )  // ON_F && IR_MIC_F == 2 22 
//	if( Led_time_1ms_tick >= 1  )  // ON_F && IR_MIC_F == 2 22 
	{
		IR_MIC_init_F = 0;
		if( MIC_show_vol == cur_adc_error  )
			MIC_show_vol = MIC_show_vol;
		else if( MIC_show_vol  > cur_adc_error )
		{
			mic_cnt++;
			if( mic_cnt >= 32 )
			{
				mic_cnt = 0;
				MIC_show_vol--;
			}

		}
		else if( MIC_show_vol < cur_adc_error  )
		{
			MIC_show_vol+= 6;
		}

		if( MIC_show_vol <= 1 )
			MIC_show_vol = 1;
		if ( Led_time_1ms_tick >=  10 ) // 255 led_speed_Max led_level LED_LEVEL_Max RTC_mode_15_count
		{
			Led_time_1ms_tick = 0;

			send_count = 0; //send_count 
			led_num    = 0;

			disgint;
			if( RTC_mode == Color_mode_Max + RTC_mode_Max + 1 )
			{

				XL_temp_count =  MIC_show_vol ;
				while( send_count < send_data_table_num  ) // 
				{
					send_count++;
					if(  send_count <= MIC_show_vol )
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
						//	point_send_data_table1 =   send_data_table + led_num + 0 ;	// - 1
							led_level_temp		   = 0; // ( ( *point_send_data_table1 ) >>5 ) ;
							send_one_byte(); 
						//	led_num++;

						//	point_send_data_table1 =   send_data_table + led_num + 1 ;	// - 1
							led_level_temp		   = 0; // ( ( *point_send_data_table1 ) >>5 ) ;//*point_send_data_table1;
							send_one_byte(); 
						//	led_num++;

						//	point_send_data_table1 =   send_data_table + led_num + 2 ;	// - 1
							led_level_temp		   = 0; //( ( *point_send_data_table1 ) >>5 ) ;//*point_send_data_table1;
							send_one_byte(); 
							
						}
					}
					led_num+=3;
			#if XL_time_Sleep	
					Sleep_time_50us_tick+=2;
			#endif
				}
			}

			engint;
		}
	}
}


void RTC_mode_14_time_deal() // temp_deal_2
{
	byte LED_R_PWM_expect_temp, LED_G_PWM_expect_temp, LED_B_PWM_expect_temp;
	byte LED_R_PWM_expect_temp1, LED_G_PWM_expect_temp1, LED_B_PWM_expect_temp1;

	if( Led_time_1ms_tick >= led_speed  )  // ON_F && IR_MIC_F == 2 22 
	{
		Led_time_1ms_tick= 0;
		time_led_speed_ms_tick++;	// time_LED_LEVEL_Max_tick Led_time_1ms_tick

//		if ( time_led_speed_ms_tick >=  2 ) // 255 led_speed_Max led_level LED_LEVEL_Max
		{
			Time_Count++;

			if( Time_Count >= LED_num_MAX_1_2 + 1 ) 
			{
				Time_Count = 1;

				fade_Time_Count++;
				XL_temp_count = RTC_Color_mode + 1;
				if( fade_Time_Count >= XL_temp_count )// + 1
				{
					fade_Time_Count = 1;
					if( auto_RTC_mode_F )
					{
						RTC_auto_count++;
						if( RTC_auto_count >= RTC_auto_count_time )
						{
							RTC_auto_count = 0;
							short_mode_init_F = 1;
						}
					}
				}
				temp_deal_2(); // LED_num_MAX_1_2
			} 

			disgint;
			fade_Time_Count--; 
//////////

			temp_deal_2();
			send_byte_deal();
/*
			if( LED_R_PWM_expect )
				LED_R_PWM_expect = 5;
			if( LED_G_PWM_expect )
				LED_G_PWM_expect = 5;
			if( LED_B_PWM_expect )
				LED_B_PWM_expect = 5;
*/
			LED_R_PWM_expect_temp = LED_R_PWM_expect;
			LED_G_PWM_expect_temp = LED_G_PWM_expect;
			LED_B_PWM_expect_temp = LED_B_PWM_expect;


			fade_Time_Count++;
///////////

			temp_deal_2();
			send_byte_deal();

			LED_R_PWM_expect_temp1 = LED_R_PWM_expect;
			LED_G_PWM_expect_temp1 = LED_G_PWM_expect;
			LED_B_PWM_expect_temp1 = LED_B_PWM_expect;

			if( RTC_mode == 11 || RTC_mode == 12 )
				LED_num = LED_num_MAX_1_2 - Time_Count;
			else
				LED_num = Time_Count;

			while( LED_num -- ) //  
			{
				send_three_byte();
			}


			LED_R_PWM_expect  = LED_R_PWM_expect_temp;
			LED_G_PWM_expect  = LED_G_PWM_expect_temp;
			LED_B_PWM_expect  = LED_B_PWM_expect_temp;

			if( RTC_mode == 11 || RTC_mode == 12 )
				LED_num = Time_Count ;
			else
				LED_num = LED_num_MAX_1_2 - Time_Count;

			LED_num = LED_num + LED_num ;
			while( LED_num -- ) //  
			{/*
				if( RTC_mode_10_count == 0)
				{
					led_level_temp = 0;
					send_one_byte(  );// 
					led_level_temp = 0;
					send_one_byte(  );// 
					led_level_temp = 0;
					send_one_byte(  );// 
				}
				else*/
					send_three_byte();
			}

			LED_R_PWM_expect  = LED_R_PWM_expect_temp1;
			LED_G_PWM_expect  = LED_G_PWM_expect_temp1;
			LED_B_PWM_expect  = LED_B_PWM_expect_temp1;

			if( RTC_mode == 11 || RTC_mode == 12 )
				LED_num = LED_num_MAX_1_2 - Time_Count;
			else
				LED_num = Time_Count;

			while( LED_num -- ) //  
			{
				send_three_byte();
			}

			engint;
			time_led_speed_ms_tick= 0;
		}
	}
}

void RTC_mode_11_time_deal() // temp_deal_2
{
	byte LED_R_PWM_expect_temp, LED_G_PWM_expect_temp, LED_B_PWM_expect_temp;
	byte LED_R_PWM_expect_temp1, LED_G_PWM_expect_temp1, LED_B_PWM_expect_temp1;

	if( Led_time_1ms_tick >= led_speed  )  // ON_F && IR_MIC_F == 2 22 
	{
		Led_time_1ms_tick= 0;
		time_led_speed_ms_tick++;	// time_LED_LEVEL_Max_tick Led_time_1ms_tick

//		if ( time_led_speed_ms_tick >=  2 ) // 255 led_speed_Max led_level LED_LEVEL_Max
		{
			Time_Count++;

			if( Time_Count >= LED_num_MAX_1_2 + 1 ) 
			{
				Time_Count = 1;

				fade_Time_Count++;
				XL_temp_count = RTC_Color_mode;
				if( fade_Time_Count >= XL_temp_count )// + 1
				{
					fade_Time_Count = 0;
					if( auto_RTC_mode_F )
					{
						RTC_auto_count++;
						if( RTC_auto_count >= RTC_auto_count_time )
						{
							RTC_auto_count = 0;
							short_mode_init_F = 1;
						}
					}
				}
				temp_deal_2(); // LED_num_MAX_1_2
			} 

			disgint;
			fade_Time_Count++;
//////////

			temp_deal_2();
			send_byte_deal();
/*
			if( LED_R_PWM_expect )
				LED_R_PWM_expect = 5;
			if( LED_G_PWM_expect )
				LED_G_PWM_expect = 5;
			if( LED_B_PWM_expect )
				LED_B_PWM_expect = 5;
*/
			LED_R_PWM_expect_temp = LED_R_PWM_expect;
			LED_G_PWM_expect_temp = LED_G_PWM_expect;
			LED_B_PWM_expect_temp = LED_B_PWM_expect;


			fade_Time_Count--;
///////////

			temp_deal_2();
			send_byte_deal();

			LED_R_PWM_expect_temp1 = LED_R_PWM_expect;
			LED_G_PWM_expect_temp1 = LED_G_PWM_expect;
			LED_B_PWM_expect_temp1 = LED_B_PWM_expect;

			if( RTC_mode == 11 || RTC_mode == 12 )
				LED_num = LED_num_MAX_1_2 - Time_Count;
			else
				LED_num = Time_Count;

			while( LED_num -- ) //  
			{
				send_three_byte();
			}


			LED_R_PWM_expect  = LED_R_PWM_expect_temp;
			LED_G_PWM_expect  = LED_G_PWM_expect_temp;
			LED_B_PWM_expect  = LED_B_PWM_expect_temp;

			if( RTC_mode == 11 || RTC_mode == 12 )
				LED_num = Time_Count ;
			else
				LED_num = LED_num_MAX_1_2 - Time_Count;

			LED_num = LED_num + LED_num ;
			while( LED_num -- ) //  
			{/*
				if( RTC_mode_10_count == 0)
				{
					led_level_temp = 0;
					send_one_byte(  );// 
					led_level_temp = 0;
					send_one_byte(  );// 
					led_level_temp = 0;
					send_one_byte(  );// 
				}
				else*/
					send_three_byte();
			}

			LED_R_PWM_expect  = LED_R_PWM_expect_temp1;
			LED_G_PWM_expect  = LED_G_PWM_expect_temp1;
			LED_B_PWM_expect  = LED_B_PWM_expect_temp1;

			if( RTC_mode == 11 || RTC_mode == 12 )
				LED_num = LED_num_MAX_1_2 - Time_Count;
			else
				LED_num = Time_Count;

			while( LED_num -- ) //  
			{
				send_three_byte();
			}

			engint;
			time_led_speed_ms_tick= 0;
		}
	}
}

void RTC_mode_2_time_deal() // Led_time_1ms_tick && LED_Flash_warning_F == 0
{
	if( Led_time_1ms_tick >= led_speed  )  // ON_F && IR_MIC_F == 2 22 
	{
		Led_time_1ms_tick= 0;
		time_led_speed_ms_tick++;	// time_LED_LEVEL_Max_tick Led_time_1ms_tick

//		if ( time_led_speed_ms_tick >=  6 ) // 255 led_speed_Max led_level LED_LEVEL_Max RTC_mode_15_count
		{
			time_led_speed_ms_tick = 0;
/*
			Time_Count++;
			if( Time_Count >= 48 )
			{
				Time_Count = 2;
			}
*/
			if (RTC_mode_10_count_F == 0)
				xiufusuzu_count++;
			else
			{
				if( xiufusuzu_count )
					xiufusuzu_count--;
			}
			if (xiufusuzu_count >= 80)
				xiufusuzu_count = 80;

			RTC_mode_10_step++;
//			if(  RTC_mode == 2 ||  RTC_mode == 3 || RTC_mode == 4 || RTC_mode == 5 || RTC_mode == 6 || RTC_mode == 7 )
			{
				if( RTC_mode_10_step >= 6 )
				{
					RTC_mode_10_step = 1;
					fade_Time_Count++;
					if( fade_Time_Count >= RTC_Color_mode )
					{
						fade_Time_Count = 0;
						if( auto_RTC_mode_F )
						{
							RTC_auto_count++;
							if( RTC_auto_count >= RTC_auto_count_time )
							{
								RTC_auto_count = 0;
								short_mode_init_F = 1;
							}
						}
					}
				}
			}

			temp_deal_2();

			if(  RTC_mode == 5 || RTC_mode == 6 || RTC_mode == 7 || RTC_mode == 15 )
			{
				RTC_mode_15_count++;
				if( RTC_mode_15_count >= 6)
					RTC_mode_15_count = 1;
				XL_temp_count = RTC_mode_15_count - 1 ;
				RTC_led_level = 255;
				while( XL_temp_count -- )
					RTC_led_level = RTC_led_level>>1;
			}
			
			send_byte_deal();



			if(  RTC_mode == 8 || RTC_mode == 9 || RTC_mode == 10 )
			{
				if( RTC_mode_10_step_count >= send_data_table_num + 4 )
				{
					RTC_mode_10_step_count = 0;
					if( RTC_mode_10_count_F == 0 )
						RTC_mode_10_count_F = 1;
					else
						RTC_mode_10_count_F = 0;
				}
				RTC_mode_10_step_count++;
			}

			led_num = send_data_table_num + send_data_table_num + send_data_table_num ; // + send_data_table_num + send_data_table_num 
			if( RTC_mode_10_count_F == 0 )
			{
				send_data_table[0] = LED_G_PWM_expect;
				send_data_table[1] = LED_R_PWM_expect;
				send_data_table[2] = LED_B_PWM_expect;
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
			}
			else
			{
				led_num = 6;
				XL_temp_count = send_data_table_num + send_data_table_num + send_data_table_num ;
				while( led_num < XL_temp_count )
				{
					point_send_data_table1 		  =  send_data_table + led_num - 3 - 1;
					point_send_data_table2 		  =  send_data_table + led_num  - 1;
					*point_send_data_table1  	  = *point_send_data_table2;

					point_send_data_table1 		  = send_data_table + led_num - 4  - 1;
					point_send_data_table2 		  = send_data_table + led_num - 1 - 1;
					*point_send_data_table1  	  = *point_send_data_table2;

					point_send_data_table1 		  = send_data_table + led_num - 5  - 1;
					point_send_data_table2 		  = send_data_table + led_num - 2 - 1;
					*point_send_data_table1  	  = *point_send_data_table2;

					 /*
					 send_data_table[led_num - 3 - 1] = send_data_table[led_num  - 1   ];
					 send_data_table[led_num - 4 - 1] = send_data_table[led_num - 1 - 1];
					 send_data_table[led_num - 5 - 1] = send_data_table[led_num - 2 - 1];
					*/

					led_num = led_num + 3;
				}

				led_num = send_data_table_num - RTC_mode_10_step_count + send_data_table_num - RTC_mode_10_step_count + send_data_table_num - RTC_mode_10_step_count;
				if( led_num )
				{
					point_send_data_table2 		  =  send_data_table + led_num  - 1;
					*point_send_data_table2 = 0;
					point_send_data_table2 		  =  send_data_table + led_num  - 2;
					*point_send_data_table2 = 0;
					point_send_data_table2 		  =  send_data_table + led_num  - 3;
					*point_send_data_table2 = 0;
				}
			}

			send_count = 0; //send_count 
			led_num    = 0;

			disgint;
			if (xiufusuzu_count > 42)
			{
				XL_temp_count = xiufusuzu_count - 42;
				while( XL_temp_count --)
				{
					led_level_temp		   = 0;
					send_one_byte(); 
					led_level_temp		   = 0;
					send_one_byte(); 
					led_level_temp		   = 0;
					send_one_byte(); 
				}

				while( send_count < send_data_table_num  ) // 
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
			#if XL_time_Sleep	
					Sleep_time_50us_tick+=2;
			#endif
					point_send_data_table1 =   send_data_table + led_num + 2 ;	// - 1
					led_level_temp		   = *point_send_data_table1;
					send_one_byte(); 
				
					led_num+=3;
				}

			}
			else
			{
				while( send_count < send_data_table_num  ) // 
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
				#if XL_time_Sleep	
						Sleep_time_50us_tick+=2;
				#endif
						point_send_data_table1 =   send_data_table + led_num + 2 ;	// - 1
						led_level_temp		   = *point_send_data_table1;
						send_one_byte(); 
						
					}
					led_num+=3;
				}
				LED_num = 4 + 4 + 4 ;
				while( LED_num -- )
				{
					led_level_temp = 0;
					send_one_byte();
				}
#if XL_time_Sleep
				Sleep_time_50us_tick += 8;
#endif
			}
			engint;
		}
	}
}

void RTC_mode_1_time_deal() // Led_time_1ms_tick && LED_Flash_warning_F == 0
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
				Time_Count = 2;
				if( auto_RTC_mode_F )
				{
					RTC_auto_count++;
					if( RTC_auto_count >= RTC_auto_count_time )
					{
						RTC_auto_count = 0;
						short_mode_init_F = 1;
					}
				}
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



void temp_deal_2()
{
	switch( RTC_mode_10_count )
	{
		case 0:
//			a = Color_mode_temp;
			break;
		case 1:
//			a = fade_Time_Count;
//			mode_1_TABLE ();
			break;
		case 2:
			a = fade_Time_Count;
			mode_2_TABLE ();
			break;
		case 3:
			a = fade_Time_Count;
			mode_3_TABLE ();
			break;
		case 5:
			a = fade_Time_Count;
			mode_5_TABLE ();
			break;
		case 6:
			a = fade_Time_Count;
			mode_6_TABLE ();
			break;
		case 8:
			a = fade_Time_Count;
			mode_8_TABLE ();
			break;
		case 11:
			a = fade_Time_Count;
			mode_11_TABLE ();
			break;
		case 12:
			a = fade_Time_Count;
			mode_12_TABLE ();
			break;
		case 13:
			a = fade_Time_Count;
			mode_13_TABLE ();
			break;
		case 14:
			a = fade_Time_Count;
			mode_14_TABLE ();
			break;
		case 15:
			a = fade_Time_Count;
			mode_15_TABLE ();
			break;
		default:
			break;
	}
	Color_mode  = a;
//	send_cur_adc_deal();
}
#endif