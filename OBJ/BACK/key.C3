
#include "common.h"

#if XL_Key		   

bit KEY_long_time_F1;
bit KEY_long_time_F2;


byte juzheng_key_scan_step;
byte key_F;

byte key1_tick;
byte key2_tick;
byte key3_tick;
byte key4_tick;
void Key_scan();


#if XL_Key_juzheng


void Key_scan()
{
	switch( juzheng_key_scan_step )
	{
		case 0: //   
		{
			juzheng_key_scan_step = 1;
			output_key1 = 1;
			Delay20us();
		//	Delay20us();
			{
				if ( !T_Key1_Signal || !T_Key2_Signal  )//
				{
						key2_tick = 0;
				//		key4_tick = 0;
						juzheng_key_scan_step = 0;
						if ( key1_tick >= key_short_time )
						{
							key1_tick = key_short_time;
							if (  T_Key1_Signal  == 0   ) 		  // 
							{
								key_F = 1;
							}
							else if (  T_Key2_Signal  == 0   )
							{
								key_F = 2;
							}
						}
				}
				else
				{
					if ( key1_tick >= key_short_time  ) // || key2_tick >= key_short_time
					{
						short_mode_init_F =1;
						led_mode++;
						switch( key_F )
						{
							case 1: //   
								if( led_mode <= Color_mode_Max || led_mode >= Color_mode_Max + RTC_mode_Max + 1 )
									led_mode = Color_mode_Max + 1;
								break;
							case 2:
								if( led_mode >= Color_mode_Max + 1)
									led_mode = 1;
								break;
							default:
								break;
						}
						#if XL_24C02
						    save_comval();
						#endif
					}
				//	key_F = 0;
					key1_tick = 0;
				//	key2_tick = 0;
				}
			}
		}
		break;
		case 1:
		{
			juzheng_key_scan_step = 0;
			output_key1 = 0;
			Delay20us();
		//	Delay20us();
			{
				if ( !T_Key1_Signal || !T_Key2_Signal )//
				{
					if ( key2_tick >= key_short_time )
					{
						key2_tick = key_short_time;
						if (  T_Key1_Signal  == 0   ) 		  // 
						{
							key_F = 3;
						}
						else if (  T_Key2_Signal  == 0   )
						{
							key_F = 4;
						}
					}
				}
				else
				{
					if ( key2_tick >= key_short_time )// ||  key4_tick >= key_short_time
					{
						short_mode_init_F = 1;
						
						switch( key_F )
						{
							case 3: //   
								led_mode++;
								if( led_mode <= Color_mode_Max + RTC_mode_Max || led_mode >= Color_mode_Max + RTC_mode_Max + MIC_mode_Max + 1 )
									led_mode = Color_mode_Max + RTC_mode_Max + 1;
								break;
							case 4:
								if( IR_LED_ON_F == 0  )
									IR_LED_ON_F = 1;
								else
								{
								//	IR_LED_ON_F = 0;
									send_000();
									IR_LED_ON_F = 0;
									Time_mode   = 0;
								}
								break;
							default:
								break;
						}
						#if XL_24C02
						    save_comval();
						#endif
					}
			//		key_F = 0;
					key2_tick = 0;
				//	key4_tick = 0;
				}
			}
		}
		break;

		default:
			break;
	}
}

#endif

#if XL_Key

void Key_scan(); //  on -  off

void	Key_scan(void) //  on -  off
{
	if( T_Key1_Signal == 0 ) //  T_Key8_Signal
	{
		if(key1_tick >=  Key_long_time) // Key_long_time
		{
			key1_tick  = Key_long_time;
			if( KEY_long_time_F1 == 0 )
			{	
				KEY_long_time_F1 = 1;
				if( IR_LED_ON_F == 0 )
					IR_LED_ON_F = 1;
				else
					IR_LED_ON_F = 0;
			}
		//	KEY_long_time_F1 = 1;
		}
	}
	else
	{
		if (  key1_tick >= Key_short_time   ) // && IR_LED_ON_F == 1
		{
			if ( KEY_long_time_F1 == 0 )
			{
				short_mode_init_F = 1;
				led_mode++;
				if( led_mode >= 28 + 1 )
					led_mode = 1;
			}
#if XL_24C02		   
			save_comval();
#endif
		}
		key1_tick = 0;
		KEY_long_time_F1 = 0;
	}
}

#endif


#endif