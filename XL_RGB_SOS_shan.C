
#include "XL_common.h"

#if XL_RTC_SOS_shan		   

void LED_SOS_shan(); 

void LED_baoshan() // RTC_1ms_tick && LED_Flash_warning_F == 0
{
	if (Led_time_50us_tick >= 25) // ON_F && IR_MIC_F == 2 22
	{
		Led_time_50us_tick = 0;

		if(  Led_step <= 5 )
		{
			Time_Count++;
			if( Time_Count >= 10 )	
			{
				Time_Count = 0;
				Led_step++;

				if (LED_B_PWM)
				{
					LED_R_PWM = 0; 
					LED_G_PWM = 0;
					LED_B_PWM = 0;
				}
				else
				{
					LED_R_PWM = LED_LEVEL_Max;
					LED_G_PWM = LED_LEVEL_Max;
					LED_B_PWM = LED_LEVEL_Max;
				}
			}	
		}
		else if(  Led_step <= 11 )
		{
			Time_Count++;
			if( Time_Count >= 20 )	
			{   
				Time_Count = 0;
				Led_step++;

				if (LED_B_PWM)
				{
					LED_R_PWM = 0; 
					LED_G_PWM = 0;
					LED_B_PWM = 0; 

				}
				else
				{
					LED_R_PWM = LED_LEVEL_Max;
					LED_G_PWM = LED_LEVEL_Max;
					LED_B_PWM = LED_LEVEL_Max;
				}
			}	
		}
		else  if(  Led_step <= 13 )              
		{               
			Led_step++;
			LED_R_PWM = 0;
			LED_G_PWM = 0;
			LED_B_PWM = 0;
		}   
		else // if(  Led_step <= 11 )              
		{               
			Led_step = 0;
			LED_R_PWM = 0;
			LED_G_PWM = 0;
			LED_B_PWM = 0;
		}
	}
}

#endif