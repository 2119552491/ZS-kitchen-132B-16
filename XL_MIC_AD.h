﻿
/*
#define MIC0      		   				PB.0    //4
#define MIC0_mode   					0x01//PAC.5    //4 
**/
#define MIC1      		   				PB.2    //4
#define MIC1_mode   					0x04//PAC.5    //4 

#define MIC2      		   				PB.0    //4
#define MIC2_mode   					0x01//PAC.5    //4 

#define MIC3      		   				PB.1    //4
#define MIC3_mode   					0x02//PAC.5    //4 


#define AD_power      		   			PA.6    //4
#define AD_power_mode   				0x40//PAC.5    //4 


#define XL_AD     			 1 
#define XL_AD_HC_MIC_VOL     0 
#define AD_jiare_mode_Max	 0

#define chongdian_jiance     0 
#define GPC_F				 0

#define AD_count_num  200 

#define AD_num	15


#define Motor_duzhuang		0

#define g_comval_sensitivity_Max      		220//210//30//20//50//100//120//75
#define g_comval_sensitivity_Mid      		20
#define g_comval_sensitivity_Min 	   		190//120//30//15//30//15//8//15

#define g_comval_sensitivity_variety_range  14

#define sensitivity_limit					0

#define MIC_10ms_tick_NUM 10

extern bit  motor_1_start_F;
extern bit  motor_2_start_F;
extern bit  motor_3_start_F;
extern bit  motor_1_taiqi_F;
extern bit  motor_2_taiqi_F;
extern bit  motor_3_taiqi_F;

extern byte IC_VDD;
extern byte AD_time_10ms_tick;

extern byte  ADC_channel;


extern byte mic_cnt;
extern byte MIC_vol;
extern byte MIC_show_vol;
extern byte MIC_show_vol_1_2;
extern byte	cur_adc;//cur_adc

extern byte	old_adc; // old_adc

extern byte	cur_adc_error; // cur_adc_errorΪ8��õ�ADCֵ

extern byte g_comval_sensitivity;
extern byte	old_adc_error; // PB4_cur_adc
extern byte	cur_adc_error; // PB4_cur_adc

extern bit  AD_DONE_F;
//extern bit  IR_MIC_init_F;
extern byte MIC_10ms_tick;
extern void sun_power_deal();
extern void	ADC_init();
extern void	ADC_mea();
extern void ADC_MAX_min_range_deal();
extern void	ADC_deal();

extern byte MIC_mode;
extern byte MIC_mode_last_10ms_tick;

extern byte		Sun_power_Color_mode ;
extern byte		Sun_power_RTC_mode ;