

/*

	IR_send_temp_count = IR_KEY_L;

	if( IR_LED_ON_F )      // 0x25
	{  
		SMG_byte_to_suzhu( IR_KEY_L ); 
		SMG_abcdefg_value_get();
	}              


	IR_send_IO = 0;
	Delay5ms();
	IR_send_IO = 1;
	Delay5ms(); 

	led_level_temp = 0x00; 
	IR_send_one_byte();
	led_level_temp = 0xFF; 
	IR_send_one_byte();

	led_level_temp = IR_send_temp_count;
	IR_send_one_byte();
	led_level_temp = 0xff-IR_send_temp_count;
	IR_send_one_byte();

	IR_send_IO = 0;// 750ns
	Delay600us();
	IR_send_IO = 1;// 750ns
*/



#define XL_IR_send 	0

#define IR_send_IO 			PA.3
#define IR_send_IO_mode 	0x08//PA.3
 
extern void IR_send_one_byte();

extern byte IR_send_temp_count;
extern void Delay400us();
extern void Delay600us();
extern void Delay1500us();
extern void Delay5ms();