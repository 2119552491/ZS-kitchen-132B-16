
#include "XL_common.h"

#if XL_tyn		   

byte Power_F;

byte tyn_tick1;

byte tyn_tick2;

void tyn_scan() //
{
	if( sun_control == 0 && USB == 0 ) //  add
	{
		if(tyn_tick1 >= Key_short_time ) // 
		{
			tyn_tick1  = Key_short_time;
			if( IR_LED_ON_F == 0 )
			{
				short_mode_init_F = 1;
				IR_LED_ON_F = 1;
			}
		}
	}
	else
	{
		tyn_tick1 = 0;
	}

	if( sun_control == 1 || USB == 1 )
	{
		if (tyn_tick2 >= Key_short_time ) // key_long_time
		{
			tyn_tick2 =  Key_short_time; // key_long_time
			if( IR_LED_ON_F )
			{
				IR_LED_ON_F = 0;
			}
		}
	}
	else
		tyn_tick2 = 0;
}

#endif