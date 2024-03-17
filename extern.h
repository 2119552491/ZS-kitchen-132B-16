

System_Clock	EQU	8000000	//	Used at UART, PS2, ...

#if	defined(ADCC)
	#if defined(ADCR)
		ADCRH	EQU		ADCR
		ADCRL	EQU		0
	#else
		ADCR	EQU		ADCRH
	#endif
#endif

/*
	PA = 0b_0000_0000;
	PAC = 0b_1101_1111;// A5 IR  A0 A3 A4 A6 LED   a6 dat a7 clk   IIC 24C02 1:输出   0:输入
	$ PADIER 0b_0110_0000;
	paph = 0b_0110_0000; // pa4 pullup
	papL = 0b_0000_0000;

	PB = 0b_1010_1011;  //pb7 白光按键   pb5 音乐按键  pb4 MIC 脚  
    // pb3 亮度调节按钮 pb2 W  -PWM pb1 开关按键  pb0 RGB七色切换按键
	PBC = 0b_0001_0100;// 1:输出   0:输入
	$ PBDIER 0b_1010_1011;
	pbph = 0b_1010_1011; //
	pbpL = 0b_0000_0000;
*/