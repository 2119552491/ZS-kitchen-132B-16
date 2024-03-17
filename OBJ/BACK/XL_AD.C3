
#include "XL_common.h"

#if XL_AD		   

byte    g_comval_sensitivity;// g_comval_sensitivity

word	cur_adc;//cur_adc

word	old_adc; // old_adc

byte	cur_adc_error; // cur_adc_error
/*
byte	old_adc_error; // old_adc_error

*/
word mic_temp;
//byte mic_cnt;
////byte MIC_vol;
//byte MIC_show_vol;



bit 	IR_MIC_init_F;
//bit		AD_MIC_F;
bit 	AD_DONE_F;

void	ADC_init(void);
void	ADC_mea(void);
//void 	ADC_MAX_min_range_deal();
void 	ADC_deal();



void	ADC_init(void)
{
	//注：选择的通道需设置为输入，无上拉、下拉电阻、无数字输入使能；

	PAC.0 = 0;
	PAPH.0 = 0;
	/*
	PBC.7 = 0;
	PBPH.7 = 0;
*/
	$ ADCC	Enable,PA0;	//  PB7 启用ADC功能，通道选择（AD转换的输入信号）
						//启用：Enable；停用：Disable
						//通道选择：PB0, PB1, PB2, PB3, PB4, PB5, PB6, PB7,PA3, PA4, PA0
						//注：每个芯片的待测脚位不同，详情参考cur_adcsheet
	$ ADCM 12bit,/64;			//时钟源选择（系统时钟/X）
						//X有/1, /2, /4, /8, /16, /32, /64, /128
						//注：时钟源选择建议选用500K（/2）
						//参考高电压为VDD
	$ ADCRGC 4V;		//参考高电压为VDD

	.delay 400;			//延时400us
	AD_START = 1;		//开始ADC转换
						//注：时钟源选择其他时，延迟时间请参考cur_adcsheet
}

void	ADC_mea(void)//测量数据
{
	if( IR_LED_ON_F == 1 )  // ON_F 
	{
	//	byte Icnt = 1;//测量16笔数据
		Eword	_Temp = 0;//16笔数据之和

		if( AD_DONE )
			AD_DONE_F = 1;
		else
			return;
	/*
		while(!AD_DONE)		//等待ADC转换结果
			NULL;
	 */
		//当AD_DONE高电位时读取ADC结果
		//注意：8位分辨率读取ADCR值，9~12为分辨率读取ADCRH和ADCRL
	//	cur_adc = ADCR;		//将ADC的值赋给cur_adc

		cur_adc$1 = ADCRH;
		cur_adc$0 = ADCRL;
		_Temp = cur_adc;

		//_Temp = cur_adc >> 4;//取平均值
		cur_adc = _Temp >> 8;//取平均值 8 ----256    12  -----  16    14  ----  16

		AD_START = 1;		//开始ADC转换
	}
}

void ADC_deal()
{
	if( AD_DONE_F ) // IR_MIC_init_F
	{
		AD_DONE_F = 0;
		IR_MIC_init_F = 1;
	//	MIC_vol = cur_adc;
		
	//	old_adc_error = cur_adc_error;

		if( cur_adc >= old_adc )
		{
			mic_temp  = cur_adc - old_adc;
		}
		else
		{
			mic_temp  = old_adc - cur_adc;
		}

		old_adc  			 = cur_adc;

		if( mic_temp >= 255 )
			mic_temp=  255;

		cur_adc_error = mic_temp;

			if( cur_adc <= 155 ) // 100 255   4095
			{
					if( cur_adc_error >= 5  ) // 3 150- 450    //  300
						cur_adc_error -= 5 ;
					else
						cur_adc_error = 0 ;
			}

		if( cur_adc_error <= 10 )
			cur_adc_error=  0;
		else
			cur_adc_error = cur_adc_error - 10;
/*
		if(  RTC_mode == 9  )
		{
			cur_adc_error = cur_adc_error >>3;
			nop;
		}
		else if(  RTC_mode == 10 )
		{
			if( cur_adc_error >=  7 )
			{
				AD_num_count++;
				if( AD_num_count >= 1300)
				{
					AD_num_count = 0;
					fade_Time_Count++;
					if( fade_Time_Count >= 8 )
						fade_Time_Count = 1;
					a = fade_Time_Count;
					Mic2_Mode_TABLE();
					Color_mode = a;
				}

				send_byte_deal();
				send_data_table[0] = LED_G_PWM_expect;
				send_data_table[1] = LED_R_PWM_expect;
				send_data_table[2] = LED_B_PWM_expect;
			}
			else
			{
				send_data_table[0] = 0;
				send_data_table[1] = 0;
				send_data_table[2] = 0;
			}
		}
		else if(  RTC_mode == 11 )
		{
			if( cur_adc_error >=  20 && time_led_speed_ms_tick >= 3 )
			{
				mic_mode_F   = 1;
				step_1_value = 0;
				time_led_speed_ms_tick = 0;
				RTC_led_level = led_level + 1;

				fade_Time_Count++;
				if( fade_Time_Count >= 8 )
					fade_Time_Count = 1;
				a = fade_Time_Count;
				LED_7_Smooth_Mode_TABLE();
				Color_mode = a;
			}
		}
*/
	}
}

#endif

#if 0 

/*
		cur_adc_error = mic_temp;

		if( cur_adc_error <= 4 )
			cur_adc_error=  0;
*/

		if( cur_adc >= 80 )
		{
		/*	if( cur_adc_error >= 3 )
				cur_adc_error-=3;
			else
				cur_adc_error = 0;*/
			/*
			if( cur_adc_error <= 127 )
				cur_adc_error =  mic_temp + mic_temp ;
			else*/
				cur_adc_error = mic_temp;

			nop;
		}
		else
			cur_adc_error= 0;
#endif