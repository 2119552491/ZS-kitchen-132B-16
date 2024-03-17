
#include "XL_common.h"



#if XL_RTC_Flash | XL_RTC_MIC_Flash 

void LED_3_Flash_Mode_TABLE();
void LED_7_Flash_Mode_TABLE(); 

void LED_3_Flash_Mode();
void LED_7_Flash_Mode();


void LED_7_Flash_Mode() // RTC_1ms_tick && LED_Flash_warning_F == 0
{
	if( Led_time_1ms_tick >= 35  )  // Led_time_1ms_tick ON_F && IR_MIC_F == 2 22 
	{
		Led_time_1ms_tick= 0;
		time_led_speed_ms_tick++;	// time_LED_LEVEL_Max_tick Led_time_1ms_tick

		if ( time_led_speed_ms_tick >=  led_speed  ) // 255 led_speed_Max led_level LED_LEVEL_Max RTC_mode_15_count
		{
			time_led_speed_ms_tick = 0;

			if( RTC_mode ==  5  ) // RTC_mode_huxi_Max + RTC_mode_fade_Max + 1
			{	
				if( decrease_F )
				{
					decrease_F = 0;

					Time_Count++;
					if( Time_Count >= 7 + 1 )
						Time_Count = 1;

					a = Time_Count  ;// Color_mode_RGB_Max
					LED_7_JUMP_Mode_TABLE();//      IR_Key_Table(); IR_Key_Color_Table
					Color_mode  = a;// short_mode_init_F = 1;
				}
				else
				{
					decrease_F  = 1;

					Color_mode  = 0;
				}
			}
			Color_INIT_LEVEL_TAB();
		}
	}
}
#endif