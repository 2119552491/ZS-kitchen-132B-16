
#include "XL_common.h"

#if XL_SMG_11_IO



#if liangweisu
byte SMG_num;
byte SMG_shiwei_num;
byte SMG_step;

#endif


byte SMG_shiwei_50us_time_count;
byte SMG_gewei_num;
byte SMG_IO_Num;

byte SMG_display_num;


void SMG_display();
void num_Table();



void SMG_display()
{
#if XL_SMG_gong_ying

	if( SMG_IO_Num & 0x01 )
		SMG_a = 1;	
	else
		SMG_a = 0;
	if( SMG_IO_Num & 0x02 )
		SMG_b = 1;	
	else
		SMG_b = 0;
	if( SMG_IO_Num & 0x04 )
		SMG_c = 1;	
	else
		SMG_c = 0;
	if( SMG_IO_Num & 0x08 )
		SMG_d = 1;	
	else
		SMG_d = 0;
	if( SMG_IO_Num & 0x10 )
		SMG_e = 1;	
	else
		SMG_e = 0;
	if( SMG_IO_Num & 0x20 )
		SMG_f = 1;	
	else
		SMG_f = 0;
	if( SMG_IO_Num & 0x40 )
		SMG_g = 1;	
	else
		SMG_g = 0;	
#else

	if( SMG_IO_Num & 0x01 )
		SMG_a = 0;	
	else
		SMG_a = 1;
	if( SMG_IO_Num & 0x02 )
		SMG_b = 0;	
	else
		SMG_b = 1;
	if( SMG_IO_Num & 0x04 )
		SMG_c = 0;	
	else
		SMG_c = 1;
	if( SMG_IO_Num & 0x08 )
		SMG_d = 0;	
	else
		SMG_d = 1;
	if( SMG_IO_Num & 0x10 )
		SMG_e = 0;	
	else
		SMG_e = 1;
	if( SMG_IO_Num & 0x20 )
		SMG_f = 0;	
	else
		SMG_f = 1;
	if( SMG_IO_Num & 0x40 )
		SMG_g = 0;	
	else
		SMG_g = 1;	 
#endif
}

void	num_Table(void)
{
	switch(SMG_display_num)
	{
		case 0:
			SMG_IO_Num = 0x3F;//0x40
			break;
		case 1:
			SMG_IO_Num = 0x06;
			break;
		case 2:
			SMG_IO_Num = 0x5B;
			break;
		case 3:
			SMG_IO_Num = 0x4F;
			break;
		case 4:
			SMG_IO_Num = 0x66;
			break;
		case 5:
			SMG_IO_Num = 0x6D;//  0x02
			break;
		case 6:
			SMG_IO_Num = 0x7D;
			break;
		case 7:
			SMG_IO_Num = 0x07;
			break;
		case 8:
			SMG_IO_Num = 0x7F;
			break;
		case 9:
			SMG_IO_Num = 0x6F ;// 0x00
			break;
		default :
			SMG_IO_Num = 0x71; // L
			break;
	}
}

#if yiweisu

void SMG_display_out()
{
	SMG_display_num = SMG_gewei_num;
	num_Table();
	SMG_display();
}

#else

void SMG_display_out()
{
	switch(SMG_step)
	{
		case 0:
			SMG_display_num = SMG_shiwei_num;
			num_Table();
			SMG_display();
#if XL_SMG_gong_ying
			SMG_shiwei = 1;// 1
			SMG_gewei = 0; // 1
#else
			SMG_shiwei = 0;// 1
			SMG_gewei = 1; // 1
#endif
			SMG_shiwei_50us_time_count = 0;
			SMG_step++;
			break;
		case 1:
			if( SMG_shiwei_50us_time_count >= SMG_time )
			{
#if XL_SMG_gong_ying
				SMG_shiwei = 1;// 1
				SMG_gewei = 1; // 1
#else
				SMG_shiwei = 0;// 1
				SMG_gewei = 0; // 1
#endif
				SMG_step++;
			}
			break;
		case 2:
			SMG_display_num = SMG_gewei_num;
			num_Table();
			SMG_display();
#if XL_SMG_gong_ying
			SMG_shiwei = 0;// 1
			SMG_gewei = 1; // 1
#else
			SMG_shiwei = 1;// 1
			SMG_gewei = 0; // 1
#endif


			SMG_shiwei_50us_time_count = 0;
			SMG_step++;
			break;
		case 3:
			if( SMG_shiwei_50us_time_count >= SMG_time  )
			{
#if XL_SMG_gong_ying
				SMG_shiwei = 1;// 1
				SMG_gewei = 1; // 1
#else
				SMG_shiwei = 0;// 1
				SMG_gewei = 0; // 1
#endif
				SMG_step++;
			}
			break;
		default :
			SMG_step = 0;
			break;
	}
}
#endif

#endif