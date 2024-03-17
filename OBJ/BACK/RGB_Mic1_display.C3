#include "common.h"

#if XL_AD     			 

void Mic_7Color_fade_Mode_tab()
{
	a += 1;
	pcadd a;
	ret 0//0

	ret 1//1 
	ret 2// 2 
	ret 3// 3  

	ret 6//4  
	ret 7//5 
	ret 8//6 

	ret 4// 7 

}

void Mic_7Color_fade_Mode() // RTC_1ms_tick && LED_Flash_warning_F == 0
{
	if( IR_MIC_init_F  ) // Led_time_1ms_tick ON_F && IR_MIC_F == 2 22 
//	if( Led_time_1ms_tick >= 1  )  // ON_F && IR_MIC_F == 2 22 
	{
		IR_MIC_init_F = 0;
		if( cur_adc_error >= 10 && MIC_1ms_tick >= 100 )
		{	
			MIC_1ms_tick = 0;
			time_led_speed_ms_tick = 0;// // R-G-B-RG-GB-RB-RGB

			Time_Count++;
			if( Time_Count >= 8 )
				Time_Count = 1;

			a = Time_Count;

			Color_INIT_LEVEL_TAB();
			LED_R_PWM_expect=0;
			LED_G_PWM_expect=0;
			LED_B_PWM_expect=0;

		}
	}
	LED_7_Fade_Mode();
}

#endif