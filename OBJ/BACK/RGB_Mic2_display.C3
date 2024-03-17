#include "common.h"

#if XL_AD     			 

void Mic_7Color_huxi_Mode() // RTC_1ms_tick && LED_Flash_warning_F == 0
{/*
	if( IR_MIC_init_F  ) // Led_time_1ms_tick ON_F && IR_MIC_F == 2 22 
//	if( Led_time_1ms_tick >= 1  )  // ON_F && IR_MIC_F == 2 22 
	{
		IR_MIC_init_F = 0;
		if( cur_adc_error >= 10 && MIC_1ms_tick >= 100 )
		{	
			MIC_1ms_tick = 0;
			time_led_speed_ms_tick = 0;
			LED_R_PWM_expect=0;
			LED_G_PWM_expect=0;
			LED_B_PWM_expect=0;
			
			Time_Count++;
			decrease_F = 0;
			if( Time_Count >= 7+1 )
				Time_Count = 1;
		}
	}*/
	LED_7_huxi_Mode();
}


#endif