

#define IR_Long_key 	  	   0
#define XL_Wuxian 			   0
#define XL_wuxian_IR      	   0    //4
#define XL_wuxian_IR_long_key  0    //4
#define XL_wuxian_433      	   0    //4


#define XL_wuxian_cabiao       1    //4

#define IR_KEY_L_ON_OFF 	0

#define IR_KEY_L_ON 	   			0x01//0x40
#define IR_KEY_L_OFF 	   		 	0x03//0x11//0x41

#define led_mode_add_key			0x09

#define IR_KEY_L_dingshi_60_min 	0xFC//0x16
#define IR_KEY_L_dingshi_30_min 	0xFE//0x16

#define IR_KEY_L_user_color 		0x08//0x16  CCT

#define IR_KEY_L_user_color1 		0x0D//0x16  CCT
#define IR_KEY_L_user_color2 		0x0F//0x16  CCT
#define IR_KEY_L_user_color3 		0x0E//0x16  CCT
#define IR_KEY_L_user_color4 		0x10//0x16  CCT
#define IR_KEY_L_user_color5 		0x12//0x16  CCT

#define IR_KEY_L_color_add 			0x09//0x16
#define IR_KEY_L_color_sub 			0x07//0x12

#define IR_KEY_L_levle_add 			0x04//0x5C
#define IR_KEY_L_levle_sub 			0x05//0x5D

#define IR_KEY_L_speed_add 			0x04
#define IR_KEY_L_speed_sub 			0x05



#define IR_in      		   		PA.5    //4
#define IR_in_mode   	   		0x20//PAC.5    //4
//#define IR_in_Pull_mode    PAPH.5    //4


void IR_DECODE();
void IR_KEY_DEAL();

extern byte ir_data_temp; 

extern byte IR_KEY_L;
extern byte IR_KEY_L1;
extern byte IR_SETP;
extern byte ir_long_tick;
extern byte ADDR_H;
extern bit ir_err_f;
extern bit IR_H_F;
extern bit ir_repeat_f;
extern byte ADDR_L;
extern byte IR_KEY_L_deal;
extern byte ir_tick_1ms;
extern byte ir_tick;
extern bit ir_ok_F;
extern bit ir_deal_F;
extern bit ir_end_F;
//extern byte IR_KEY_F;
extern byte ir_count;
//extern byte IR_KEY_L_deal;

extern byte IR_LED_ON_F;
extern void IR_Key_Color_Table();
//bit ir_long_key_speed_add_F;
//bit ir_long_key_light_add_F;
//extern bit ir_long_key_num_add_F;

//extern byte IR_KEY_L_deal;