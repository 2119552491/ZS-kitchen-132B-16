
#include "XL_common.h"

#if XL_RTC_fade	| XL_RTC_MIC_fade   

#define fade_adjust_num 1

void LED_3_Fade_Mode_TABLE();
void LED_7_Fade_Mode_TABLE(); 

void LED_3_Fade_Mode();
void LED_7_Fade_Mode(); 

#if XL_RTC_7fade 

void LED_7_Fade_Mode() // LED_3_Fade_Mode  RTC_1ms_tick && LED_Flash_warning_F == 0
{
/*
	if(  MIC_10ms_tick >= MIC_10ms_tick_NUM )
	{
		Led_time_1ms_tick 	   = 0;
		time_led_speed_ms_tick = 0;
	}
*/
//	if( Led_time_1ms_tick >= led_speed  )  // Led_time_1ms_tick Led_time_1ms_tick ON_F && IR_MIC_F == 2 22 
	{
//		Led_time_1ms_tick= 0;
		time_led_speed_ms_tick++;	// time_LED_LEVEL_Max_tick Led_time_1ms_tick

//		XL_temp_count = Time_Count;


		if( LED_R_PWM_temp < LED_R_PWM_expect_fade ) // LED_R_PWM_expect_fade
			LED_R_PWM_temp++;
		else if( LED_R_PWM_temp > LED_R_PWM_expect_fade )
			LED_R_PWM_temp--;

		if( LED_G_PWM_temp < LED_G_PWM_expect_fade )
			LED_G_PWM_temp++;
		else if( LED_G_PWM_temp > LED_G_PWM_expect_fade )
			LED_G_PWM_temp--;

		if( LED_B_PWM_temp < LED_B_PWM_expect_fade )
			LED_B_PWM_temp++;
		else if( LED_B_PWM_temp > LED_B_PWM_expect_fade )
			LED_B_PWM_temp--;



//	$ LPWMG0C ;					//仅关闭LPWMG1

/*

		TM3B = LED_B_PWM_temp;

		PWMG0DTL = (LED_R_PWM_temp << 6) | 0b0010_0000;//将占空比分给占空比低位寄存器
		PWMG0DTH = (LED_R_PWM_temp >> 2);		//将占空比分给占空比高位寄存器

		PWMG1DTL = (LED_G_PWM_temp << 6) | 0b0010_0000;//将占空比分给占空比低位寄存器
		PWMG1DTH = (LED_G_PWM_temp >> 2);		//将占空比分给占空比高位寄存器


		if( LED_G_PWM_temp )
		{
			$ PWMG1C Enable,PB7,IHRC;
		}
		else
			$ PWMG1C ;	


		if( LED_R_PWM_temp )
		{
			$ PWMG0C Enable,PB4,IHRC;
		}
		else
			$ PWMG0C ;	


		if( LED_B_PWM_temp )
		{
			$ TM3C IHRC,PB5,PWM;
		}
		else
		{
			$ TM3C Stop;				//关闭PWM，0%的亮度
		}
*/

#if W_Color
		if( LED_W_PWM_temp < LED_W_PWM_expect )
			LED_W_PWM_temp++;
		else if( LED_W_PWM_temp > LED_W_PWM_expect )
			LED_W_PWM_temp--;
#endif

#if 0//XL_huancai
		send_all_byte(); 
#endif

		if ( time_led_speed_ms_tick >=  led_level_Max  ) // 255 led_speed_Max led_level LED_LEVEL_Max RTC_mode_15_count
		{
			time_led_speed_ms_tick = 0;

			//if( ! ( RTC_mode == RTC_mode_Max + 2 ) )
			{
				Time_Count_fade++;
			}

	//		if( led_mode == Color_mode_Max + 2 )
			{
				if( Time_Count_fade >= 6 + 1 )
					Time_Count_fade = 1;
			}
/*
			if( led_mode == Color_mode_Max + 3 )
			{
				if( Time_Count >= 2 + 1 )
					Time_Count = 1;
			}
*/
			a = Time_Count_fade  ;// Color_mode_RGB_Max
			LED_7_JUMP_Mode_TABLE();//      IR_Key_Table(); IR_Key_Color_Table
			Color_mode  = a;// short_mode_init_F = 1;

			#if RGB_Color
				Color_INIT_LEVEL_TAB_RGB();
			#endif
			#if YW_Color
				Color_INIT_LEVEL_TAB_YW();
			#endif

			LED_R_PWM_expect_fade = LED_R_PWM_expect;
			LED_G_PWM_expect_fade = LED_G_PWM_expect;
			LED_B_PWM_expect_fade = LED_B_PWM_expect;
			nop;
		}
	}
}


#endif


#endif