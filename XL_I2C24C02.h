

#define XL_24C02    		 0


#define SDA_mode    	   0x40//	   PBC.6   //3  
#define SDA_C    		   PBC.6   //3
#define SDA       		   PB.6	
#define SDA_Pull_mode      PBPH.6    //4

#define SCL_mode    	   0x80//
#define SCL     		   PB.7    //2
#define SCL_Pull_mode      PBPH.7    //4


extern byte led_order_F;

extern byte a1;
extern byte a2;
extern byte a3;
//extern byte I2C_CRC;
//extern byte i;
extern byte I2C_dat ;
extern byte  download_init_A5;//只下载一次初始值的标记
extern byte  save_step;


//extern bit shangdian_F;
extern void IC_24C02_init();
extern byte led_order_F;  // ����R_G_B  pin��˳��
extern void Delay10ms();
extern void Delay1ms();
extern void Start();
extern void Stop();
extern void Read8Bit();
extern void Write8Bit();
extern void read_comval();
extern void save_comval();
extern void At24C02Read1();
extern void At24C02Write1();
extern void At24C02_init();
extern void Delay1ms();
extern void Delay10us();
extern void Delay20us();

#if 0

void save_comval( byte adreess_24C02)
{
	//	disgint;

		Start();
		I2C_dat=0xa0;
		Write8Bit();
		I2C_dat=adreess_24C02;
		Write8Bit();

		if( adreess_24C02 == 0 )
		{
			I2C_dat=download_init_A5 ;     
			Write8Bit();

			I2C_dat=ADDR_H_24C02 ;     
			Write8Bit();
	/*
			I2C_dat=led_mode$1;     
			Write8Bit();
	*/
			I2C_dat=ADDR_L_24C02 ; 
			Write8Bit();
	/*
			I2C_dat=led_level$1;
			Write8Bit();

	*/
			I2C_dat= led_mode;
			Write8Bit();

			I2C_dat=led_level;
			Write8Bit();

			I2C_dat=IR_LED_ON_F;     
			Write8Bit();


		}
		else if( adreess_24C02 == 8 )
		{
			I2C_dat=shangdian5s_mode ;
			Write8Bit();

			I2C_dat=shangdian5s_count;
			Write8Bit();

			I2C_dat=IR_KEY_24C02_1;     
			Write8Bit();

			I2C_dat=IR_KEY_24C02_2;     
			Write8Bit();

			I2C_dat=IR_KEY_24C02_3; 
			Write8Bit();


		}
		Stop();	

	//	engint;
}

void read_comval( byte adreess_24C02 )
{
//		disgint;

		Start();
		I2C_dat=0xa0;
		Write8Bit();
		I2C_dat=adreess_24C02;
		Write8Bit();

		Start();
		I2C_dat=0xa1;
		Write8Bit();

		if( adreess_24C02 == 0 )
		{

			Read8Bit();
			download_init_A5 	=temp_byte_value;   // led_level led_speed
			ACK();

			Read8Bit();
			ADDR_H_24C02 		=temp_byte_value;   // led_level led_speed
			ACK();
	/*
			Read8Bit();
			led_mode$1	=temp_byte_value;   // led_level led_speed
			ACK();

			Read8Bit();
			led_level$0	=temp_byte_value;   // led_level led_speed
			ACK();
	*/
			Read8Bit();
			ADDR_L_24C02 		=temp_byte_value;   // led_level led_speed
			ACK();

			Read8Bit();
			led_mode			=temp_byte_value;   // led_level led_speed
			ACK();

			Read8Bit();
			led_level			=temp_byte_value;   // led_level led_speed
			ACK();

			Read8Bit();
			IR_LED_ON_F			=temp_byte_value;
		//	NoAck();
		}
		else if( adreess_24C02 == 8 )
		{
			Read8Bit();
			shangdian5s_mode	=temp_byte_value;
			ACK();

			Read8Bit();
			shangdian5s_count	=temp_byte_value;
			ACK();

			Read8Bit();
			IR_KEY_24C02_1 		=temp_byte_value;   // led_level led_speed
			ACK();

			Read8Bit();
			IR_KEY_24C02_2		=temp_byte_value;   // led_level led_speed
			ACK();

			Read8Bit();
			IR_KEY_24C02_3		=temp_byte_value;   // led_level led_speed
		//	NoAck();

		}

		NoAck();
		Stop();	

//		engint;
}

#endif