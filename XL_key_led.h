

#define XL_key_1 		1
#define XL_key_2 		0 
#define XL_key_3 		0
#define XL_key_4 		0
#define XL_key_5 		0

#define XL_key_1_long   0
#define XL_key_2_long   0 
#define XL_key_3_long   0
#define XL_key_4_long   0
#define XL_key_5_long   0


#define output_key1     	  			PA.0//PA.6    //4
#define output_key1_mode 	    		0x01//PAC.5   //11 MOVIE

#define T_Key1_Signal     	  			PA.7//PA.6    //4
#define T_Key1_mode 	    			0x80//PAC.5   //11 MOVIE

#define T_Key2_Signal     	  			PA.6//PA.3    //4
#define T_Key2_mode 	    			0x40//PAC.5   //11 MOVIE

#define T_Key3_Signal     	  			PA.7//PA.6    //4
#define T_Key3_mode 	    			0x80//PAC.5   //11 MOVIE

#define T_Key4_Signal     	  			PA.6//PA.3    //4
#define T_Key4_mode 	    			0x40//PAC.5   //11 MOVIE

/*
#define T_Key3_Signal     	  			PA.3    //4
#define T_Key3_mode 	    			0x08//PAC.5   //11 MOVIE

#define T_Key4_Signal     	  			PA.3    //4
#define T_Key4_mode 	    			0x08//PAC.5   //11 MOVIE
*/
#define T_Key5_Signal     	  			PA.3    //4
#define T_Key5_mode 	    			0x08//PAC.5   //11 MOVIE


#define XL_Key_led	 	  1 // 
#define XL_Key_juzheng	  0 
#define IO_fuyong		  0

#define long_key_		  1

#define key_juzheng_short_time   3
#define key_short_time   		 5
#define key_long_time    		 50 // 10ms * 50 =  2500ms 


extern	byte KEY_long_time_F1_10ms_tick;
extern bit KEY_long_time_F1;
extern byte key1_tick;
extern byte key2_tick;
extern byte key1_tick;
extern byte key3_tick;
extern byte key4_tick;

extern bit guanji_RTC_mode_F;

extern byte key5_tick;
extern void Key_led_scan();
extern void Key_init(void); //  on -  off

#if 0
		key1_tick++;
		double_key_tick++;
		if( double_key_tick >= key_double_time )
		{
			double_key_tick = 0;
			double_key_count = 0;
			if( double_key_F )// 			
			{
				double_key_F = 0;

				short_mode_init_F = 1;

				if( IR_LED_ON_F == 0 )
				{
					IR_LED_ON_F = 1;
				}
				else
				{
					if( led_mode == 0 )
						led_mode = led_mode_Mid;
					else if( led_mode == led_mode_Mid )
						led_mode = led_mode_Max;
					else// if( led_mode == led_mode_Max )
						led_mode = 0;
				//	else //if( led_mode == led_mode_Max )
					//	led_mode = 0;
				}
			
			}
		}


		#if IO_fuyong
				PAC = ~( T_Key5_mode | T_Key1_mode | T_Key2_mode | T_Key3_mode | T_Key4_mode );
				Delay10us();
				Delay10us();
		#endif



	#if XL_key_1

		if( T_Key1_Signal == 0 ) //  LED
		{
			if(key1_tick >= key_long_time ) // 
			{
				key1_tick  = key_long_time;
			
	#if XL_key_1_long

				if( KEY_long_time_F1 == 0 )
				{	
					KEY_long_time_F1 = 1;

					if( add_sub_F )
						IR_KEY_L_deal  = 201;
					else
						IR_KEY_L_deal  = 203;
				//	IR_LED_ON_F = 0;
				//	
				}
	#endif
			}
		}
		else
		{
			if (  key1_tick >= Key_short_time   ) //  	 	 			
			{
				if ( KEY_long_time_F1 == 0 )
				{
					double_key_F = 1;
					double_key_tick = 0;

					double_key_count++;
					if( double_key_count >= 2 )
					{
						double_key_F = 0;
						double_key_count = 0;
						IR_LED_ON_F		 = 0;
					}	
				}
	#if XL_24C02	
				save_comval();
	#endif
				if( add_sub_F )
					add_sub_F = 0;
				else
					add_sub_F=  1;
				IR_KEY_L_deal  = 0;
			}
			key1_tick = 0;
			KEY_long_time_F1 = 0;
		}

	#endif

#endif

#if 0 
	if( kaiguanji_F )
	{
		if( IR_LED_ON_F == 0 )
		{
			IR_LED_ON_F = 1;
			kaiguanji_F = 0;

		}
	}
//	if( guanji_RTC_mode_F )
	{
		KEY_long_time_F1_10ms_tick++;
		if( KEY_long_time_F1_10ms_tick >= 250)
		{
			KEY_long_time_F1_10ms_tick = 250;
			guanji_RTC_mode_F = 0;
			if( kaiguanji_F )
			{
				short_mode_init_F = 1;
				if( KEY_long_time_F1 )
				{
					if( IR_LED_ON_F == 1 )
					{
						IR_LED_ON_F = 0;
						kaiguanji_F = 0;
					}
				}
				else
					kaiguanji_F = 0;
			}
		}
	}



if( IR_LED_ON_F && kaiguanji_F == 0 )
{
	if(   guanji_RTC_mode_F )//  KEY_long_time_F1 &&kaiji_texiao 	RTC_mode
	{
		if( Led_time_1ms_tick >= 50   )  //27 Led_time_1ms_tick ON_F && IR_MIC_F == 2 22 
		{
			Led_time_1ms_tick= 0;

				Color_mode += 3;
				if( Color_mode >= 48 + 1)
					Color_mode = 1;
		}
	}
}


if( IR_LED_ON_F && kaiguanji_F == 1  )
{
if( KEY_long_time_F1 &&  guanji_RTC_mode_F )// guanji_texiao 	RTC_mode
{
	if( Led_time_1ms_tick >= 50   )  // Led_time_1ms_tick ON_F && IR_MIC_F == 2 22 
	{
		Led_time_1ms_tick = 0;
		Time_Count++;
		if( Time_Count >= 5)
		{
			Time_Count = 1;
			Color_mode  = 33;
		}
		else
		{
			Color_mode  = 0;
		}
	}
}
}	
#endif