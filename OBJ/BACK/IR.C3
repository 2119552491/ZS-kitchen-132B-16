

#include "common.h"

void IR_DECODE(void);
void IR_KEY_DEAL(void);
void IR_Key_Table();

byte IR_LED_ON_F;

#if XL_Wuxian

word ir_tick;
byte IR_SETP;
byte ir_long_tick;



byte IR_KEY_L;
byte IR_KEY_L1;



bit ir_err_f;
bit IR_H_F;
bit ir_repeat_f;
byte ADDR_L;


bit ir_ok_F;
bit ir_deal_F;
bit ir_end_F;
byte ir_count;

byte ADDR_H;

#if  XL_wuxian_IR
	byte IR_KEY_H;
#endif

//bit ir_long_key_num_add_F;

//byte IR_KEY_L_deal;
void IR_Key_Table()
{
	a += 1;
	pcadd a;
	ret 0

	ret 0x44
	ret 0x07
	ret 0x16

	ret 0x40
	ret 0x15

	ret 0x43
	ret 0x09
	ret 0x0d
}

void IR_Key_Color_Table()
{
	a += 1;
	pcadd a;
	ret 0

	ret 1
	ret 19
	ret 5

	ret 6
	ret 20

	ret 11
	ret 21
	ret 22
}

void IR_DECODE(void)
{
#if XL_wuxian_433
	if (IR_in == 1)
	{
		if (!IR_H_F)
		{
			if (IR_SETP == 1)
			{
				if ((ir_tick > 100) && (ir_tick < 300)) // 9MS   5.5-7MS
				{
					IR_SETP++;
				}
				else
					ir_err_f = 1;
			}
			else if ((IR_SETP >= 3) && (IR_SETP < 50))
			{
				if ((ir_tick >= 2) && (ir_tick < 35)) // 200-1000
				{
					IR_SETP++;
				}
				else
					ir_err_f = 1;
			}
			ir_tick = 0;
			IR_H_F = 1;
		}
	}
	else
	{
		if (IR_H_F)
		{
			//ir_long_tick = 0;
			if (IR_SETP == 0)
			{
				IR_SETP++;
			}
			else if ((IR_SETP >= 2) && (IR_SETP < 50))
			{
				if ((ir_tick >= 2) && (ir_tick < 40)) // 400-2MS IR_time_1mS_tick
				{
					IR_SETP++;
					//IR_KEY_H = IR_KEY_H >> 1;
					IR_KEY_L = IR_KEY_L << 1;
					ADDR_H = ADDR_H <<< 1;
					ADDR_L = ADDR_L <<< 1;
					if (ir_tick > 15)// 7
					{
						IR_KEY_L .0 = 1;
					}
					else
					{
						IR_KEY_L .0 = 0;
					}
					if (IR_SETP == 49)
					{
						if( (IR_KEY_L1 != IR_KEY_L ) ) // && IR_KEY_L2 == IR_KEY_L && IR_KEY_L3 == IR_KEY_L
						{
							IR_KEY_L1 = IR_KEY_L;
						}
						else
						{
							ir_end_f = 1;
							ir_ok_F = 1;
						}
						ir_long_tick = 0;
					}
				}
				else
					ir_err_f = 1;
			}
			else
			{
				IR_SETP = 1;
			}
			ir_tick = 0;
			IR_H_F = 0;
		}
	}
#endif

#if XL_wuxian_IR

	if (IR_in == 1)
	{
		if (!IR_H_F)
		{
			if (IR_SETP == 1)
			{
				if ((ir_tick > 60) && (ir_tick < 254)) // 9MS   6-12MS
				{
					IR_SETP++;
				}
				else
					ir_err_f = 1;
			}
			else if ((IR_SETP >= 3) && (IR_SETP < 67))
			{
				if ((ir_tick > 4) && (ir_tick < 20)) // 200-1000
				{
					if(ir_repeat_f==1)
					{
                     ir_repeat_f=0;
				  	 IR_SETP=0;
					}
                    ELSE
					{
					IR_SETP++;
					}
				}
				else
					ir_err_f = 1;
			}
			ir_tick = 0;
			IR_H_F = 1;
		}
	}
	else
	{
		if (IR_H_F)
		{
			ir_long_tick = 0;
			if (IR_SETP == 0)
			{
				IR_SETP++;
			}
			else if (IR_SETP == 2)
			{
				if ((ir_tick > 60) && (ir_tick < 110)) // 50*60=3ms  3000-5500
				{
					ir_repeat_f = 0;
					IR_KEY_H = 0;
					IR_KEY_L = 0;
					ADDR_H = 0;
					ADDR_L = 0;
					IR_SETP++;
				}
				/////////////////   �ӳ����ĵط�
				/*
				else  if((ir_tick>35)&&(ir_tick<60)) //50*60=3ms  <
				{
					IR_SETP++;
                   	ir_ok_F=1;
					ir_repeat_f = 1;
					//IR_Long_KEY_tick=0;
				}*/
				
				////////////////////////
				else
				{
					ir_err_f = 1;
				}
			}
			else if ((IR_SETP >= 2) && (IR_SETP < 67))
			{
				if ((ir_tick > 4) && (ir_tick < 40)) // 400-2MS
				{
					IR_SETP++;
					IR_KEY_H = IR_KEY_H >> 1;
					IR_KEY_L = IR_KEY_L >>> 1;
					ADDR_H = ADDR_H >>> 1;
					ADDR_L = ADDR_L >>> 1;
					if (ir_tick > 20)
					{
						IR_KEY_H .7 = 1;
					}
					else
					{
						IR_KEY_H .7 = 0;
					}
					if (IR_SETP == 67)
					{
						ir_end_f = 1;
						ir_ok_F = 1;
						//ir_long_tick = 0;

					}
				}
				else
					ir_err_f = 1;
			}
			else if (IR_SETP == 68)
				IR_SETP++;
			else
			{
				IR_SETP = 1;
			}
			ir_tick = 0;
			IR_H_F = 0;
		}
	}
#endif
	if (ir_err_f )
	{
	//	ir_long_tick = 0;
		ir_err_f = 0;
		ir_repeat_f = 0;
		IR_SETP = 0;
		IR_KEY_L = 0FFH;
	//	ir_end_f   = 0;
	}

	if(ir_end_f)
	{
#if XL_wuxian_IR
		if(ir_long_tick > 100)    //  160   �ߵ�ƽʱ�����120ms��Ϊң������̧��
#endif

#if XL_wuxian_433
		if(ir_long_tick > 220)    //  160   �ߵ�ƽʱ�����120ms��Ϊң������̧��
#endif
		{    
#if XL_24C02		   
			save_comval();
#endif
			ir_count = 0;
			ir_end_f = 0;
			ir_deal_F = 0;
			ir_repeat_f = 0;
			ir_long_tick   = 0;
			IR_KEY_L = 0;       //δ�õ�����ֵ
			IR_SETP = 0;
			IR_KEY_L1= 0;
			// Write_Eeprom();


		}
	}
}

#define key_mode_init_L 8

void IR_KEY_DEAL(void)  //
{
	if ( ir_ok_F == 0 )
		return;
	ir_ok_F = 0;

	ir_count++; // 

	Flag_time_led_100ms_tick = 0;
	Flag_time_led_1ms_tick   = 0;

//	IR_Dui_Ma_DEAL();  	//	duima

//	if( return_F )
//		return;
	if (ir_deal_F == 1)
		return;
	ir_deal_F = 1;
/*
	if ( ADDR_H != 0xFF  ) // 0x21   0xF6 0xCF 0xEF 0xFB
		return;			 // 
	if ( ADDR_L != 0x00  ) // 0xBA   0x12 0x00 0xE2
		return;			 //   0x28
*/
#if download		   

#else
	/*
	if( duima_write_F )
	{
		if ( ADDR_H != ADDR_H_check ) // 0x50  
			return;
		if ( ADDR_L != ADDR_L_check ) // 0x0A
			return;
	}
	*/
#endif

	byte key_loop_time;
	key_loop_time = 0;
	short_mode_init_F = 1;
		   
	if( IR_KEY_L== 0x08 )// 0x46
	{
	//	send_000();
		IR_LED_ON_F = 0;
	//	Time_mode   = 0;
		return;
	}  

	if( IR_KEY_L== 0x07  ) // 0x45
	{
		IR_LED_ON_F = 1;
		return;
	}  

	key_loop_time = key_mode_init_L;

	while(1)
	{
		key_loop_time++;
	//	a = key_loop_time;
	//	IR_Key_Table();
	//	if(IR_KEY_L==a)
		if( IR_KEY_L == key_loop_time )
		{
			if( key_loop_time <= Color_mode_Max + RTC_mode_Max + MIC_mode_Max + key_mode_init_L )
			{
				led_mode  = key_loop_time - 8;
				/*
				Color_mode  = led_mode// short_mode_init_F = 1;
				RTC_mode =0; */
			}
			break;
		}
		if(key_loop_time >= Color_mode_Max + RTC_mode_Max + MIC_mode_Max + key_mode_init_L + 1 )
		{
			break;
		}
	}

	if( IR_LED_ON_F == 1)  
	{
		switch( IR_KEY_L )
		{
//////////////////////////////////////////////////////////////
			case 0x05:// 0x0c
				if( led_mode >= Color_mode_Max + RTC_mode_Max + 1 )
				{
					short_mode_init_F = 0;
					if( g_comval_sensitivity <= g_comval_sensitivity_Min + g_comval_sensitivity_variety_range )
						g_comval_sensitivity = g_comval_sensitivity_Min;
					else
						g_comval_sensitivity -= g_comval_sensitivity_variety_range;

					if( g_comval_sensitivity <= g_comval_sensitivity_Min)
						g_comval_sensitivity = g_comval_sensitivity_Min;
				}
				else if( led_mode >= Color_mode_Max +  1 )
				{
					short_mode_init_F = 0;
					if( led_speed <= led_speed_Min + speed_variety_range )
						led_speed = led_speed_Min;
					else
						led_speed -= speed_variety_range;

					if( led_speed <= led_speed_Min)
						led_speed = led_speed_Min;
				}
				else // if( Color_mode )
				{
					if( led_level >= led_level_Max - short_key_Light_variety_range ) // led_level_Max
						led_level = led_level_Max;
					else
						led_level += short_key_Light_variety_range;
					if( led_level >= led_level_Max )
						led_level = led_level_Max;
				}
				break;
			case 0x06:
				if( led_mode >= Color_mode_Max + RTC_mode_Max + 1 )
				{
					short_mode_init_F = 0;
					if( g_comval_sensitivity >= g_comval_sensitivity_Max - g_comval_sensitivity_variety_range ) // LED_LEVEL_Max
						g_comval_sensitivity = g_comval_sensitivity_Max;
					else
						g_comval_sensitivity += g_comval_sensitivity_variety_range;

					if( g_comval_sensitivity >= g_comval_sensitivity_Max )
						g_comval_sensitivity = g_comval_sensitivity_Max;
				}
				else if( led_mode >= Color_mode_Max +  1 )
				{
					short_mode_init_F = 0;
					if( led_speed >= led_speed_Max - speed_variety_range ) // LED_LEVEL_Max
						led_speed = led_speed_Max;
					else
						led_speed += speed_variety_range;

					if( led_speed >= led_speed_Max )
						led_speed = led_speed_Max;
				}
				else // if( Color_mode )
				{
					if( led_level <= led_level_Min + short_key_Light_variety_range )
					{
						led_level = led_level_Min;
					}
					else
						led_level -= short_key_Light_variety_range;

					if( led_level <= led_level_Min)
						led_level = led_level_Min;
				}
				break;

			default:
				break;
		}
	}
}

#endif

#if 0
			case  :// music 
				if( led_mode <= Color_mode_Max + RTC_mode_Max )
					led_mode = Color_mode_Max + RTC_mode_Max + 1;
				else
				{
					led_mode++;
					if( led_mode >= Color_mode_Max + RTC_mode_Max + MIC_mode_Max + 1)
						led_mode = Color_mode_Max + RTC_mode_Max + 1;
				}
				/*RTC_mode   = 17;*/
				break;

			case 0x08: 
				led_mode   = Color_mode_Max + 1;
				//RTC_mode   = 18;
				break;
			case 0x1C:
				led_mode   = Color_mode_Max + 5;
				//RTC_mode   = 18;
				break;
			case 0x5a:
				led_mode   = Color_mode_Max + 2;
				break;

			case 0x19:// fade
				
				led_mode   = Color_mode_Max + 8;
				//RTC_mode   = 16;
				break;

			case 0x47:
				#if XL_time_Sleep
					sleep_mode_init_F = 1;
					Time_mode         = 5;
					LED_Flash_warning_F   = 1;
				#endif
				break;

				led_level_init_F = 1;
				if( led_level_count >= 4 )
					led_level_count = 4;
				else
					led_level_count ++;

			//	short_mode_init_F = 0;

				break;


			//	short_mode_init_F = 0;
				led_level_init_F = 1;
			///	led_level_count++;


				if( led_level >= LED_LEVEL_Max - Light_step ) // LED_LEVEL_Max
					led_level = LED_LEVEL_Max;
				else
					led_level += Light_step;

				if( led_level >= LED_LEVEL_Max )
					led_level = LED_LEVEL_Max;

				if( led_level <= LED_LEVEL_Min + Light_step )
					led_level = LED_LEVEL_Min;
				else
					led_level -= Light_step;

				if( led_level <= LED_LEVEL_Min)
					led_level = LED_LEVEL_Min;

				short_mode_init_F = 0;
			//	led_init_F = 1;        g_comval_sensitivity_Max
				if( RTC_mode )
				{
					if( RTC_mode == 11 )
					{
						if( g_comval_sensitivity <= g_comval_sensitivity_Min + g_comval_sensitivity_variety_range )
							g_comval_sensitivity = g_comval_sensitivity_Min;
						else
							g_comval_sensitivity -= g_comval_sensitivity_variety_range;

						if( g_comval_sensitivity <= g_comval_sensitivity_Min)
							g_comval_sensitivity = g_comval_sensitivity_Min;
					}
					else
					{

					}
				}


				short_mode_init_F = 0;
			//	led_init_F = 1;
				if( RTC_mode )
				{
					if( RTC_mode == 11 )
					{
						if( g_comval_sensitivity >= g_comval_sensitivity_Max - g_comval_sensitivity_variety_range ) // LED_LEVEL_Max
							g_comval_sensitivity = g_comval_sensitivity_Max;
						else
							g_comval_sensitivity += g_comval_sensitivity_variety_range;

						if( g_comval_sensitivity >= g_comval_sensitivity_Max )
							g_comval_sensitivity = g_comval_sensitivity_Max;
					}
					else
					{

					}
				}



#endif