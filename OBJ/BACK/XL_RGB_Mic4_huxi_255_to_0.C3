#include "XL_common.h"

#if XL_RTC_MIC_huxi_255_to_0     			 

bit mic_mode_F;


void Mic_7Color_fade_to_0() // Led_time_1ms_tick && LED_Flash_warning_F == 0
{
//	if( IR_MIC_init_F  ) // Led_time_1ms_tick ON_F && IR_MIC_F == 2 22 
//	if( Led_time_1ms_tick >= 1  )  // ON_F && IR_MIC_F == 2 22 
	{
	//	IR_MIC_init_F = 0;

#if 1//XL_AD MIC shansuo
		if( cur_adc_error >= g_comval_sensitivity &&  MIC_10ms_tick >= MIC_10ms_tick_NUM  )
		{	
			MIC_10ms_tick = 0;

			mic_mode_F   = 1;
			step_1_value = 0;
			RTC_led_level = led_level;


			Time_Count++;
			if( Time_Count >= 7 + 1 )
				Time_Count = 1;
			a = Time_Count;// temp_byte_value
			LED_7_JUMP_Mode_TABLE();
			Color_mode = a;
			//Color_mode = LED_7_Smooth_Mode_TABLE[ Time_Count ]
		//	Color_INIT_LEVEL_TAB();
		}
#endif

#if 0//dingshi shansuo
		if( Led_time_10ms_tick >= 55  )
		{	
			Led_time_10ms_tick = 0;
			mic_mode_F   = 1;
			RTC_led_level = led_level + 1;

			temp_deal_2();
			step_1_value = 0;
		}
#endif
	//	temp_byte_value = led_speed>>3;
		if ( Led_time_1ms_tick >= led_speed  ) //   255 led_speed _Max led_level LED_LEVEL_Max RTC_mode_15_count
		{
			Led_time_1ms_tick = 0;
			step_1_value++;

//			if( step_1_value >= 36 ) // 8
//				step_1_value = 1;
disgint; 
			if( mic_mode_F )
			{
				//Color_INIT_LEVEL_TAB();
				if( RTC_led_level == 0 )
				{
					mic_mode_F = 0;
					RTC_led_level = led_level_Max + 1 ;
				}
				else
				{
					if( step_1_value <= 15 ) //  XL_temp_count
						RTC_led_level-=16; //RTC_mode_10_count = 20;
					else
					{
						temp_byte_value = 3;
						while( temp_byte_value-- )
						{
							if( RTC_led_level )
								RTC_led_level-=1;//   5  3  17
						}
					}
					#if RGB_Color
						Color_INIT_LEVEL_TAB_RGB();
					#endif
					#if YW_Color
						Color_INIT_LEVEL_TAB_YW();
					#endif
				}
#if XL_huancai
				send_all_byte();
#endif	
			}
		}
	}
}
#endif