
#include "XL_common.h"

void time_deal();

byte time_50us_tick;
byte time_1ms_tick;
byte time_10ms_tick;
byte time_100ms_tick;
byte time_200ms_tick;
bit motor_work_time_limit_F;

byte AD_time_10ms_tick;

#if RTC_mode_auto_Max
	byte time_300ms_tick;
#endif

#if RGB_Color
	byte Led_time_1ms_tick; 
	byte time_led_speed_ms_tick;
#endif

//byte Led_time_10ms_tick; 

void time_50us_tick_function()
{
    if( time_50us_tick >= 20) // time_50us_tick
    {
        time_50us_tick = time_50us_tick - 20 ; // Led_time_1ms_tick Led_time_50us_tick
		time_1ms_tick++;

		#if XL_AD
			if( AD_time_10ms_tick >= 10 )
			{
				AD_time_10ms_tick = 0;
			}
			if( AD_time_10ms_tick <= 1 )
			{
			//	AD_time_10ms_tick = 1;
				ADC_deal();
			}
			else
			{
				LED_R = LED_OFF;
				LED_G = LED_OFF;
				LED_B = LED_OFF;
			}
		#endif

			if( motor_1_start_F == 0 )
				motor_1 = 0;
			if( motor_2_start_F == 0 )
				motor_2 = 0;
			if( motor_3_start_F == 0 )
				motor_3 = 0;

			#if XL_Sleep_IC	
				SLEEP();
			#endif
		if( time_1ms_tick >= 10 )
		{
			time_1ms_tick = 0;
			time_10ms_tick++;
			AD_time_10ms_tick++;


			#if XL_Sleep_time		   
				sleep_time_deal_function();
			#endif


			#if 1 
				Led_mode_deal();
				#if XL_Key_led | XL_Key_juzheng		   
					Key_scan();
				#endif
			#endif


			if( time_10ms_tick >= 10 )
			{
				time_10ms_tick = time_10ms_tick - 10;
				time_100ms_tick++;

				if( shengya )
				{
					if( motor_1_start_F )
						motor_1 = 1;
					else if( motor_2_start_F )
						motor_2 = 1;
					else if( motor_3_start_F )
						motor_3 = 1;
				}

				if( time_100ms_tick >=2 ) // time_200ms_tick
				{
					time_100ms_tick = time_100ms_tick - 2;
					#if Motor_duzhuang
						if( motor_1 || motor_2 || motor_3 )
						{
							time_200ms_tick++;
						}
						else
							time_200ms_tick = 0;

						if( time_200ms_tick >= 20 ) // time_200ms_tick
						{
							{
								if( motor_1 )
									$ ADCC	Enable,PB.7 ;
								else if( motor_2 || motor_3)
									$ ADCC	Enable,PB.5 ;
								if( motor_1 || motor_2 || motor_3 )
								{
									.delay 1600;			//延时400us
									AD_START = 1;		//开始ADC转换

									disgint;
									while(!AD_DONE)		//等待ADC转换结果
										NULL;
									cur_adc = ADCRL;// 2V 255   20mV 2.55   50mV  6.25
									engint;
									
									if( cur_adc < 50 )
									{
										motor_1 = 0;
										motor_2 = 0;
										motor_3 = 0;
										motor_1_start_F = 0;
										motor_2_start_F = 0;
										motor_3_start_F = 0;
									}
								}
							}
						}
					#endif
				}
			}
		}
    }
}

#if 0
			if( time_10ms_tick >= 3 )
			{
				time_10ms_tick = 0;

				#if XL_AD_HC_MIC_VOL
					if( MIC_show_vol  > cur_adc_error )
					{
						MIC_show_vol--;
					}
					MIC_show_vol_1_2 = MIC_show_vol>>1;
				#endif

			//	time_300ms_tick++;
			}


			if( time_10ms_tick >= 10 )
			{
				time_10ms_tick = 0;
				time_100ms_tick++;

				if( Flash_warning )
				{
					Flash_warning -- ;
					if( Flash_warning )
					{
						if(LED_Y_PWM_temp || LED_W_PWM_temp )
						{
						//	LED_W_PWM_expect = 0;
						//	LED_Y_PWM_expect = 0;
							LED_Y_PWM_temp 	 = 0;
							LED_W_PWM_temp 	 = 0;
						}
						else
						{
						//	LED_W_PWM_expect = 0;
						//	LED_Y_PWM_expect = 0;
							LED_Y_PWM_temp 	 = LED_Y_PWM_expect;
							LED_W_PWM_temp 	 = LED_W_PWM_expect;
						}
					}
					else
					{
					//	LED_W_PWM_expect = 0;
					//	LED_Y_PWM_expect = 0;
						LED_Y_PWM_temp 	 = LED_Y_PWM_expect;
						LED_W_PWM_temp 	 = LED_W_PWM_expect;
					}
				//	IR_LED_ON_F = 1;
				//	short_mode_init_F = 1;
				}
			}
#if RTC_mode_auto_Max
			if( time_10ms_tick >= 10 )
			{
				time_10ms_tick = 0;
				time_300ms_tick++;

				if( time_300ms_tick >= led_speed )
				{
					time_300ms_tick = 0;
					if( led_mode == Color_mode_Max + RTC_mode_Max   )// MIC_mode_Max +
					{
						short_mode_init_F = 1; 
						RTC_mode ++;
						if( RTC_mode >= RTC_mode_Max  ) // LED_LEVEL_Max
							RTC_mode = 1;
					}
				}
			}
#endif

#endif