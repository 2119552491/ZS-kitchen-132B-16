
#if 0

//		disgint;
	//	if( IR_LED_ON_F )
		{
		//	if( T_Key1_Signal && T_Key2_Signal )//  && T_Key3_Signal && T_Key4_Signal
			{

				
			}
		}

#if XL_huancai 
		if( guanji_RTC_mode_F == 0  && IR_LED_ON_F )
		{
	#if XL_HC_RGB_qicailiushui 
				if( RTC_mode == 1 || RTC_mode == 2 )
					HC_LED_qicailiushui_Mode1();
				else if( RTC_mode == 3  ) // || RTC_mode == 3 Mic_7Color_fade_to_0()
					Mic_7Color_fade_to_0();
				else if( RTC_mode == 4 || RTC_mode == 5 || RTC_mode == 6 || RTC_mode == 7 )
					XL_HC_music_VOL_deal();
			//	else if( RTC_mode == 2  ) // || RTC_mode == 3
				//	HC_LED_qicailiushui_Mode2();
//				else// if( RTC_mode == 3  || RTC_mode == 12 ) // || RTC_mode == 3
//					HC_LED_qicailiushui_Mode3();
			//	else //if(  ( 4 <= RTC_mode  &&   RTC_mode <= 7 ) || RTC_mode == 9 ) // || RTC_mode == 3 ()
				//	HC_LED_qicailiushui_Mode4();
	#endif
		}

		if( Led_time_1ms_tick == 0    )  //led_speed Led_time_1ms_tick ON_F && IR_MIC_F == 2 22 
		{
			if( RTC_mode != 3 ||  guanji_RTC_mode_F  ) // || RTC_mode == 3 Mic_7Color_fade_to_0()
			{
				shuzu_paixu_deal();
				if( IR_LED_ON_F )
				{
					if( ( RTC_mode == 1  || RTC_mode == 2 ) ||  guanji_RTC_mode_F )
						shuzu_send_deal();
				}
			}
		}
#else

	#if XL_RTC_MIC_huxi_255_to_0 
						 if( RTC_mode == RTC_mode_Max + 4  ) // || RTC_mode == 3 Mic_7Color_fade_to_0()
								Mic_7Color_fade_to_0();
	#endif


	#if XL_RTC_3JUMP | XL_RTC_7JUMP //XL_RTC_JUMP 
						//if(  RTC_mode_huxi_Max + RTC_mode_fade_Max + RTC_mode_shan_Max + 1 <= RTC_mode &&  RTC_mode <= RTC_mode_huxi_Max + RTC_mode_fade_Max + RTC_mode_shan_Max + RTC_mode_jump_Max )
						if( RTC_mode == 1 || RTC_mode == 2 || RTC_mode == RTC_mode_Max + 3 )
							LED_7_JUMP_Mode();
	#endif

	#if XL_RTC_liushui_JUMP 
						//if(  RTC_mode_huxi_Max + RTC_mode_fade_Max + RTC_mode_shan_Max + 1 <= RTC_mode &&  RTC_mode <= RTC_mode_huxi_Max + RTC_mode_fade_Max + RTC_mode_shan_Max + RTC_mode_jump_Max )
						if( RTC_mode == 1  )
							LED_liushui_JUMP();
	#endif

	#if XL_RTC_fade

		#if 0//XL_RTC_3fade// 0
						if( RTC_mode == 3 || RTC_mode == 4 || RTC_mode == RTC_mode_Max + 2 ) // 6 -- music1
							LED_7_Fade_Mode();// LED_3_Fade_Mode
		#endif

		#if XL_RTC_7fade
					//	if(  RTC_mode == 2 || RTC_mode == 3 )
							//LED_7_Fade_Mode();
		#endif

	#endif

	#if XL_RTC_Flash
						if( RTC_mode == 5 )
							LED_7_Flash_Mode();
	#endif

	#if XL_RTC_huxi | XL_RTC_MIC_huxi//
						if( RTC_mode == RTC_mode_Max + 1 )
							LED_7_huxi_Mode();
	#endif

#endif

#endif

extern void time_50us_tick_function(void);
extern void PWM_strobe();

extern byte led_color_255_1;

extern byte time_led_speed_ms_tick; 
extern byte long_key_speed_up;
extern byte long_key_count;


extern byte long_key_adjust_parameter_50us_tick;
extern byte long_key_adjust_parameter_10ms_tick;
extern byte AD_time_50us_tick;
extern byte ir_long_tick_err;
extern byte  Flash_warning;

extern void short_key_add();  
extern void short_key_sub();

extern void short_speed_add();
extern void short_speed_sub();

extern void time_deal();

extern byte time_50us_tick;
extern byte time_1ms_tick;
extern byte time_300ms_tick;
extern byte time_10ms_tick;


//extern byte Flag_time_led_10ms_tick;
extern byte Flag_time_led_100ms_tick;


extern bit kaiguanji_F; // 
extern byte Led_time_1ms_tick; 
extern byte Led_time_10ms_tick;

extern word duima_1ms_tick;