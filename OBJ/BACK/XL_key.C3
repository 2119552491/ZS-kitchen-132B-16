
#include "XL_common.h"

#if XL_Key		   
/*
bit add_F; 
bit sub_F;*/

#if XL_key_1
	byte key1_tick;
	bit KEY_long_time_F1;
#endif

#if XL_key_2
	byte key2_tick;
	bit KEY_long_time_F2;
#endif

#if XL_key_3
	byte key3_tick;
	bit KEY_long_time_F3;
#endif

#if XL_key_4
	byte key4_tick;
	bit KEY_long_time_F4;
#endif

#if XL_key_5
	byte key5_tick;
	bit KEY_long_time_F5;
#endif

byte key_mode;

//byte key5_tick;

void Key_scan(); // 

void IR_Key_Color_Table();

/*
void IR_Key_Color_Table()
{
	a += 1;
	pcadd a;
	ret 0

	ret 1
	ret 6
	ret 11

	ret 5
	ret 15
	ret 10
}

#if XL_huancai	
	disgint;

	send_count = Led_num_Max + 1 ;
	while( send_count -- )
	{
		led_level_temp = 0;
		send_one_byte(  );// 
		led_level_temp = 0;
		send_one_byte(  );// 
		led_level_temp = 0;
		send_one_byte(  );// 
	}   
	engint;
#endif
*/

void Key_init() //
{
#if XL_key_1
	T_Key1_Signal				= 1;    // A.7    
	T_Key1_mode	   	  			= IO_INput_mode;	//输入
	//T_Key1_Pull_MODE     		= 1;	//上拉
	//T_Key1_down_MODE			= 1;    //下拉
    //PAPL   = 0b0010_0000;    //1:加下拉 0:不加下拉

#endif

#if XL_key_2
	T_Key2_Signal				= 1;    // A.7    
	T_Key2_mode	   	  			= IO_INput_mode;	//输入
	T_Key2_Pull_MODE     		= 1;	//上拉
#endif
}

void Key_scan() //
{

#if XL_key_1
	if( T_Key1_Signal == 0 ) //  add
	{

		if(key1_tick >= Key_short_time ) // 
		{
			key1_tick  = Key_short_time;
			PB.7 = 0;//     = 0b1000_0000;
#if XL_RTC_liushui_JUMP
				LED_liushui_JUMP();
#endif
			/*
			if( KEY_long_time_F1 == 0 )
			{	
				KEY_long_time_F1 = 1;

			}*/
		}
	}
	else
	{
		if (  key1_tick >= Key_short_time   ) // 
		{
		//	if ( KEY_long_time_F1 == 0 )
			{
				Time_Count = 1;
				PB     = 0b1000_0000;
			//	short_mode_init_F = 1;
				//IR_LED_ON_F = 1;
			//	led_mode++;
			}
#if XL_24C02		   
			save_comval();
#endif
		}

#if XL_RTC_baoshan
				LED_baoshan();
#endif

		key1_tick = 0;
	//	KEY_long_time_F1 = 0;
	}
#endif

#if XL_key_2
	if( T_Key2_Signal == 0 ) //  sub
	{
		if(key2_tick >= Key_short_time ) // 
		{
			key2_tick  = Key_short_time;
//			sub_F = 1;
		//	if( KEY_long_time_F1 == 0 )
			{	
		//		KEY_long_time_F1 = 1;
			}
		}
	}
	else
	{
		if (  key2_tick >= Key_short_time   ) // 
		{
			if ( KEY_long_time_F2 == 0 )
			{
				short_mode_init_F = 1;

				if( IR_LED_ON_F )
				{
					IR_LED_ON_F = 0;
				}
				else
				{
					IR_LED_ON_F = 1;
				}
			}
#if XL_24C02		   
			save_comval();
#endif
		}
//		sub_F = 0;
		key2_tick = 0;
		KEY_long_time_F2 = 0;
	}

#endif

#if XL_key_3
	if( T_Key3_Signal == 0 ) //  speed
	{
		if(key3_tick >= Key_short_time ) // 
		{
			key3_tick  = Key_short_time;
		//	if( KEY_long_time_F1 == 0 )
			{	
		//		KEY_long_time_F1 = 1;
			}
		}
	}
	else
	{
		if (  key3_tick >= Key_short_time   ) // 
		{
			if ( KEY_long_time_F2 == 0 )
			{
				short_mode_init_F = 1;
				if( led_speed == 10 )
					led_speed = 15;
				else if( led_speed == 15 )
					led_speed = 20;
				else if( led_speed == 20 )
					led_speed = 30;
				else if( led_speed == 30 )
					led_speed = 40;
				else if( led_speed == 40 )
					led_speed = 10;
				else
					led_speed = 10;
			}
#if XL_24C02		   
			save_comval();
#endif
		}
		key3_tick = 0;
		KEY_long_time_F3 = 0;
	}
#endif

#if XL_key_4
	if( T_Key4_Signal == 0 ) //  ON_Off
	{
		if( key4_tick >= Key_short_time )  
		{
			key4_tick  = Key_short_time;
		//	if( KEY_long_time_F1 == 0 )
			{	
		//		KEY_long_time_F1 = 1;
			}
		}
	}
	else
	{
		if (  key4_tick >= Key_short_time   )  
		{
			if ( KEY_long_time_F2 == 0 )
			{
				short_mode_init_F = 1;

			}
#if XL_24C02		   
			save_comval();
#endif
		}
		key4_tick = 0;
		KEY_long_time_F4 = 0;
	}
#endif

#if XL_key_5
	if( T_Key5_Signal == 0 ) //  ON_Off
	{
		if( key5_tick >= Key_short_time )  
		{
			key5_tick  = Key_short_time;
		//	if( KEY_long_time_F1 == 0 )
			{	
		//		KEY_long_time_F1 = 1;
			}
		}
	}
	else
	{
		if (  key5_tick >= Key_short_time   )  
		{
			if ( KEY_long_time_F5 == 0 )
			{
				short_mode_init_F = 1;

			}
#if XL_24C02		   
			save_comval();
#endif
		}
		key5_tick = 0;
		KEY_long_time_F5 = 0;
	}
#endif

}

#endif


#if 0
	#if XL_key_1
		if( T_Key1_Signal == 0 ) //  add
		{
			if(key1_tick >= Key_short_time ) // 
			{
				key1_tick  = Key_short_time;
				/*
				if( KEY_long_time_F1 == 0 )
				{	
					KEY_long_time_F1 = 1;
					short_mode_init_F = 1;
					if( IR_LED_ON_F )
					{
						IR_LED_ON_F = 0;
					}
					else
					{
						IR_LED_ON_F = 1;
					}
				}*/
			}
		}
		else
		{
			if (  key1_tick >= Key_short_time   ) // 
			{
				if ( KEY_long_time_F1 == 0 )
				{
					short_mode_init_F = 1;

					IR_LED_ON_F = 1;
				//	Power_F 	= 1;
					key_mode++;

					if( key_mode >= Color_mode_Max + RTC_mode_Max + MIC_mode_Max + 1 + 1 ) // 
					{
						key_mode = 0;
						IR_LED_ON_F = 0;
					//	Power_F 	= 0;
					}				

					if( key_mode <= 1 )
						led_mode = Color_mode_Max + 1;
					else if( key_mode <= Color_mode_Max + 1 + 1 )
					{
						led_mode = key_mode - 1 - 1;
						/*
						if( led_mode == Color_mode_Max )
						{
							IR_LED_ON_F = 1;
							Power_F 	= 1;
						}*/
					}
				}
	#if XL_24C02		   
				save_comval();
	#endif
			}
			key1_tick = 0;
		//	KEY_long_time_F1 = 0;
		}
	#endif
#endif