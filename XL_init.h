
extern void Led_mode_deal(); // MIN_

//extern bit led_speed_init_F;

extern byte step_1_value;
extern byte step_2_value;
extern byte step_3_value;
extern byte step_4_value;
extern bit back_F;

extern bit short_mode_init_F; // 

#if 0//PWM_BEEP

/*
    PCC    = ~0xFF;//0b1111_1111;    //1:???, 0:????   PA7/5=input
    PCPH   =  0xFF ;//0b0000_0000;    //1:?????? 0:????????
    PCDIER =  0xFF ;//0b0000_0000;  chongdian_IO_check_mode  //CS??????1?T_Key??????��???UART_IO?????????IO(???1
*/ 
	#if 0
		#if IC_PMS152

			$ PWMGCLK Enable,/1,SYSCLK;	//IHRC �Ƿ�����PWMG��дEnable���ã���д�رգ�����Ƶ��ʱ��Դѡ��

			LPWMGCUBL = 0b111_00000;		//���޵�λ�Ĵ���������2λ��PWMG0CUBL[7:6] ��Ӧ CB10_1[2:1]��
			LPWMGCUBH = 0b0111_1111;		//���޸�λ�Ĵ�������ӦCB10_1[10:3]��
		//	$ LPWMG0C LPWMG0,PA0;			//�Ƿ񷴼��������дInverseΪ���ã���д��Ϊͣ�ã������ѡ������˿�ѡ�����Ԥѡ��
		//	$ LPWMG1C LPWMG1,PA4;			//�Ƿ񷴼��������дInverseΪ���ã���д��Ϊͣ�ã������ѡ������˿�ѡ��
		//	$ LPWMG2C LPWMG0,PA3;			//�Ƿ񷴼��������дInverseΪ���ã���д��Ϊͣ�ã������ѡ������˿�ѡ�����Ԥѡ��
		#else
		//	$ PWMG0C Enable,PA0,SYSCLK;	//�Ƿ�����PWMG0��дEnable���ã���дͣ�ã����Ƿ񷴼��������дInverseΪ���ã���дͣ�ã����Ƿ���������㣨дReset����PWMG0������������������λ���Զ���0��������ţ�ʱ��Դ
										//����Ҫ��ʱ�ӿ�ѡ��SYSCLK��IHRC������ſ�ѡDisable����ѡ��, PB5, PB4, PA0
		//	$ PWMG0C;					//�ص�ʱ�ӣ���PWMG0ֹͣ����
		//	$ PWMG0S /1,/1;				//Ԥ��Ƶ����Ƶ
			$ PWMG2S /1,/1;				//Ԥ��Ƶ����Ƶ

		//	PWMG2CUBL = 0b111_00000;	//���޵�λ�Ĵ���������2λ��PWMG0CUBL[7:6] ��Ӧ CB10_1[2:1]��
		//	PWMG2CUBH = 0b0111_1111;	//���޸�λ�Ĵ�������ӦCB10_1[10:3]��
		//	$ PWMG1C Enable,PA4,SYSCLK;	//�Ƿ�����PWMG0��дEnable���ã���дͣ�ã����Ƿ񷴼��������дInverseΪ���ã���дͣ�ã����Ƿ���������㣨дReset����PWMG0������������������λ���Զ���0��������ţ�ʱ��Դ
										//����Ҫ��ʱ�ӿ�ѡ��SYSCLK��IHRC������ſ�ѡDisable����ѡ��, PB5, PB4, PA0
		//	$ PWMG0C;					//�ص�ʱ�ӣ���PWMG0ֹͣ����
	//		$ PWMG1S /1,/2;				//Ԥ��Ƶ����Ƶ

	//		PWMG1CUBL = 0b111_00000;	//���޵�λ�Ĵ���������2λ��PWMG0CUBL[7:6] ��Ӧ CB10_1[2:1]��
	//		PWMG1CUBH = 0b0111_1111;	//���޸�λ�Ĵ�������ӦCB10_1[10:3]��

/*
			PWMGCUBL = 0b11_000000;		//���޵�λ�Ĵ���������2λ��PWMG0CUBL[7:6] ��Ӧ CB10_1[2:1]��
			PWMGCUBH = 0b0001_1000;		//���޸�λ�Ĵ�������ӦCB10_1[10:3]��  1M  108K
*/

		//	PWMG0DTL = (LED_Y_PWM_temp << 6);// | 0b0010_0000;//?????????????��?????
		//	PWMG0DTH = (LED_Y_PWM_temp >> 2);		//?????????????��?????
			$ PWMG2S /1,/1;				//Ԥ��Ƶ����Ƶ
			$ PWMG2C Enable,PA3,IHRC;

			PWMG2CUBL = 0b00_000000;	//���޵�λ�Ĵ���������2λ��PWMG0CUBL[7:6] ��Ӧ CB10_1[2:1]��
			PWMG2CUBH = 0b0010_0101;	//���޸�λ�Ĵ�������ӦCB10_1[10:3]�� 148 = 128 +  16  + 4

			PWMG2DTL = ( 0 );// | 0b0010_0000;//?????????????��?????
			PWMG2DTH = ( 0b0000_0010 );		//?????????????��?????


		#endif
	#endif

	#if 1//IC_PFS122
		$ TM3S 8BIT,/1,/16;
	//	TM3B = 127;
		$ TM3C IHRC,PB5,PWM;
	//	TM3B = 0;					//1/256������
	//	$ TM3C Stop;				//�ر�PWM��0%������

/*
		TM3B = 0;					//1/256������
		$ TM3C Stop;				//�ر�PWM��0%������
*/
//	#else 

		$ PWMG1S /16,/1;
		PWMG1CUBL = 0b11_000000;
		PWMG1CUBH = 0b0011_1111;
		PWMG1DTL = (0 << 6) | 0b0010_0000;//��ռ�ձȷָ�ռ�ձȵ�λ�Ĵ���
		PWMG1DTH = (0 >> 2);		//��ռ�ձȷָ�ռ�ձȸ�λ�Ĵ���

		$ PWMG0S /16,/1;
		PWMG0CUBL = 0b11_000000;
		PWMG0CUBH = 0b0011_1111;
		PWMG0DTL = (0 << 6) | 0b0010_0000;//��ռ�ձȷָ�ռ�ձȵ�λ�Ĵ���
		PWMG0DTH = (0 >> 2);		//��ռ�ձȷָ�ռ�ձȸ�λ�Ĵ���


		$ PWMG1C Enable,PB7,IHRC;
		$ PWMG0C Enable,PB4,IHRC;
//	$ LPWMG1C ;					//���ر�LPWMG1
//	$ LPWMG0C ;					//���ر�LPWMG1

	#endif
#endif

//extern bit auto_RTC_mode_F;

//extern byte RTC_mode_10_step; 
//extern byte RTC_mode_10_step_count; 

//extern bit RTC_mode_10_count_F;
extern void Color_INIT_LEVEL_TAB();
//extern byte Light_variety_range_Count; 
//extern byte speed_variety_range_Count; 


extern byte Time_Count, Time_Count_fade;/*
extern word LED_num_MAX;	 	
extern word LED_num_2_4_MAX;*/


//extern bit LED_Flash_warning_F;
extern bit debug_F;
extern bit IR_debug_F;

//extern byte RTC_auto_count;

extern byte fade_Time_Count;
//extern byte RTC_mode_10_count;
//extern byte  RTC_mode_15_count;
//extern byte RTC_Color_mode;


extern byte Time_Count_temp;
extern byte fade_Time_Count_temp;
extern byte  RTC_mode_15_count_temp;