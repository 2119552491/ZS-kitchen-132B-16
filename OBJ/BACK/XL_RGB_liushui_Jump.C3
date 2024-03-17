
#include "XL_common.h"

#if XL_RTC_liushui_JUMP		   

void LED_liushui_JUMP_Mode_TABLE(); 

void LED_liushui_JUMP_Mode_TABLE()// R-B-G-RB-RG-GB-RGB
{
	a += 1;
	pcadd a;
	ret 0

	ret 0 
	ret 0 
	ret 0 
	ret 0 

	ret 255
	ret 255
	ret 255
	ret 255 

	ret 0 
	ret 0 
	ret 0 
	ret 0 
}

void LED_liushui_JUMP();

void LED_liushui_JUMP() // RTC_1ms_tick && LED_Flash_warning_F == 0
{
	if( Led_time_1ms_tick >= 20  )  // Led_time_1ms_tick ON_F && IR_MIC_F == 2 22 
	{
		Led_time_1ms_tick= 0;
		time_led_speed_ms_tick++;	// time_LED_LEVEL_Max_tick Led_time_1ms_tick

		if ( time_led_speed_ms_tick >=  1  ) // 255 led_speed_Max led_level LED_LEVEL_Max RTC_mode_15_count
		{
			time_led_speed_ms_tick = 0;

			a = Time_Count + 0;
			LED_liushui_JUMP_Mode_TABLE();
			LED_R_PWM_temp = a;	

			a = Time_Count + 1;
			LED_liushui_JUMP_Mode_TABLE();
			LED_G_PWM_temp = a;	

			a = Time_Count+ 2;
			LED_liushui_JUMP_Mode_TABLE();
			LED_B_PWM_temp = a;	

			a = Time_Count+ 3;
			LED_liushui_JUMP_Mode_TABLE();
			LED_W_PWM_temp = a;	

			Time_Count++;
			if( Time_Count >= 4 + 1)
				Time_Count = 1;
		
		}
	}
}

#endif

/*
			if( Color_mode & 0x40)
				PB.6 = 1;
			else
				PB.6 = 0;

			if( Color_mode & 0x20)
				PB.5 = 1;
			else
				PB.5 = 0;

			if( Color_mode & 0x10)
				PB.4 = 1;
			else
				PB.4 = 0;

			if( Color_mode & 0x08)
				PB.3 = 1;
			else
				PB.3 = 0;

			if( Color_mode & 0x04)
				PB.2 = 1;
			else
				PB.2 = 0;

			if( Color_mode & 0x02)
				PB.1 = 1;
			else
				PB.1 = 0;

			if( Color_mode & 0x01)
				PB.0 = 1;
			else
				PB.0 = 0;
*/	