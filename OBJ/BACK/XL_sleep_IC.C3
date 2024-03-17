
#include "XL_common.h"

#if XL_Sleep_IC		   

byte sleep_tick;
void SLEEP();

void Pre_sleep_set()
{
//	disgint;


#if XL_huancai
	send_count = 100 ;
	while( send_count -- )
	{
		Delay10us();
	}

	send_count = Led_num_Max + 1 ;
	while( send_count -- )
	{
		led_level_temp = 0;
		send_one_byte(  );// 
		led_level_temp = 0;
		send_one_byte(  );// 
		led_level_temp = 0;
		send_one_byte(  );// 
	}   
	WS2812_IO = 0;
#endif

	$ ADCC	Disable;	//启用ADC功能，通道选择（AD转换的输入信号）
						//启用：Enable；停用：Disable
////////////////////////////////////////

/*
	fa_she 	 = 0;
	AD_power = 0;*/
/////////////////////////////////////////
	$ MISC Fast_Wake_Up , WDT_256K;
	clkmd.En_WatchDog	=0;
	engint;

}

// 唤醒后动作
void After_wakeup_set()
{
/*
	fa_she 	 = 1;
	AD_power = 1;*/
//	short_mode_init_F = 1;

	sleep_tick = 0;
//	ADC_channel = 0;
	AD_time_10ms_tick = 0;

	$ ADCC	Enable,PB.2 ;
	#if time_test // #else #endif
		chaocai_Sleep_time_10ms_tick+=6;//
	#else
		chaocai_Sleep_time_10ms_tick+=6;//
	#endif

	engint;
}

void SLEEP()               
{
	sleep_tick++;
#if chongdian_jiance
	if (  DC_tou_IO_check == 0 ) 
#endif
	{
	#if XL_Key_led | XL_Key_juzheng		   
		if( motor_1_start_F == 0 && motor_2_start_F == 0 && motor_3_start_F == 0 )//if (  T_Key1_Signal == 1 ) 
	#endif
		{
			//if( IR_LED_ON_F == 0 )
			{
				if( sleep_tick >= 12 )     //10ms    50 *20    
				{
					Pre_sleep_set();
					/*
					$ PADIER 0b_1001_0000; // A.0 光敏电阻   A.5 人体感应头  A.6 USB  A.7 IC_4054
					$ PBDIER 0b_0000_0000;*/
//					$ PCDIER 0b_0000_0000;
					nop;
					nop;
					STOPEXE;
				//	STOPSYS;
					nop;
					nop;
					After_wakeup_set();
				}	
			}
		//	else
		//		sleep_tick=0;
		}
	#if XL_Key_led | XL_Key_juzheng		   
		else
			sleep_tick=0;
	#endif
	}
#if chongdian_jiance
	else
		sleep_tick=0;
#endif
}

/*
void SLEEP()               
{
	if (  T_Key1_Signal == 1 ) 
	{
		if( Power_F == 0 )
		{
			if(sleep_tick>100)     //10ms    50 *20    
			{
				Pre_sleep_set();

				nop;
				nop;
				STOPSYS;
				nop;		
				nop;

				After_wakeup_set();
			}	
		}
		else
		{
			if( sun_control == 1 || USB == 1 )
			{			
				if( IR_LED_ON_F == 0 )
				{
					if(sleep_tick>100)     //10ms    50 *20    
					{
						Pre_sleep_set();

						nop;
						nop;
						STOPSYS;
						nop;		
						nop;

						After_wakeup_set();
					}	
				}
				else
					sleep_tick=0;
			}	
			else
				sleep_tick=0;
		}
	}
	else
		sleep_tick=0;
}
*/
#endif