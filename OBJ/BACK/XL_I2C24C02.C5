
#include "XL_common.h"

#if IO_fuyong  |  XL_Key_juzheng | XL_24C02// XL_Key_led		

void Delay10us()
{
	byte i;
	i=5;
	while(i--)
	{
		nop;
	}
}

#endif



#if XL_24C02		   

//BYTE a1;
BYTE a2;
//byte a3;
//byte I2C_CRC;

byte I2C_dat;
byte  download_init_A5;
byte  save_step;
//byte temp_byte_value;
/*
BIT I2C_dat_7 : I2C_dat.7;
BIT I2C_dat_0 : I2C_dat.0;

*/
//byte led_order_F;  // ????R_G_B  pin?????

void Start();
void Stop();
void Read8Bit();
void Write8Bit();
void At24C02Read();
void At24C02Write();
void At24C02_init();

void Start()
{
	SDA=1;
	Delay10us();
	SCL=1;
	Delay10us();
	SDA=0;
	Delay10us();
	SCL=0;
	Delay10us();
}
void Stop()
{

	SDA=0;
	Delay10us();
	SCL=1;
	Delay10us();
	SDA=1;
	Delay10us();
}



void ACK()
{
   SDA=0;
		Delay10us();

   SCL=1;
		Delay10us();

   SCL=0;
		Delay10us();

   SDA=1;
 		Delay10us();
}
void NoAck()
{
   SDA=1;
		Delay10us();

   SCL=1;
		Delay10us();

   SCL=0;
		Delay10us();

}
void Write8Bit()
{
	led_level_temp=0;
   while(led_level_temp<8)
   {
	    led_level_temp++;
		if( I2C_dat & 0x80)//if(I2C_dat_7)
			SDA=1;
		else
			SDA=0;
		Delay10us();
    	SCL=1;
		Delay10us();
    	SCL=0;
   	 	I2C_dat=I2C_dat<<1;
		Delay10us();
  }
	SDA=1;	
	Delay10us();
    SCL=1;
	while(SDA)
	{
		a2++;
		if(a2>200)
		{
		    SCL=0;
			Delay10us();
		//    a=0;
		    return;
		}	
	}
    SCL=0;
	Delay10us();
  //  a=1;
    return;
}

void Read8Bit()
{
	SDA=1;	
	Delay10us();
	led_level_temp=0;
	SDA_C=0;
	Delay10us();

	    while(led_level_temp<8)
		{
			led_level_temp++;
			SCL=1;
			Delay10us();
			I2C_dat=I2C_dat<<1;
			if(SDA)
				I2C_dat = I2C_dat | 0x01; //I2C_dat_0=1;
			else
				I2C_dat = I2C_dat & 0xFE;//I2C_dat_0=0;
			SCL=0;
			Delay10us();
		}
	SDA_C=1;
	Delay10us();
	temp_byte_value=I2C_dat;
	return;
}

void save_comval()
{
//		disgint;
		Start();
		I2C_dat=0xa0;
		Write8Bit();
		I2C_dat=0x00;
		Write8Bit();

		I2C_dat=IR_LED_ON_F;     
		Write8Bit();

		I2C_dat=led_mode;     
		Write8Bit();
/*
		I2C_dat=led_speed; 
		Write8Bit();
*/
		I2C_dat=led_level;
		Write8Bit();
#if XL_AD
		I2C_dat=g_comval_sensitivity;     
		Write8Bit();

#endif
		I2C_dat=download_init_A5;     
		Write8Bit();

		Stop();		

//		engint;
}

void read_comval()
{
	//	disgint;
		Start();
		I2C_dat=0xa0;
		Write8Bit();
		I2C_dat=0x00;
		Write8Bit();

		Start();
		I2C_dat=0xa1;
		Write8Bit();

		Read8Bit();
		IR_LED_ON_F				=temp_byte_value;   // led_level led_speed
		ACK();

		Read8Bit();
		led_mode				=temp_byte_value;   // led_level led_speed
		ACK();
/*
		Read8Bit();
		led_speed				=temp_byte_value;   // led_level led_speed
		ACK();
*/
		Read8Bit();
		led_level				=temp_byte_value;   // led_level led_speed
		ACK();
#if XL_AD

		Read8Bit();
		g_comval_sensitivity	=temp_byte_value;   // led_level led_speed 
		ACK();
#endif
		Read8Bit();
		download_init_A5		=temp_byte_value;
		NoAck();


		Stop();	

//		engint;
}

#endif