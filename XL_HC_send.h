

#define MOS 		 	 				PA.7   
#define MOS_IO_mode 	  			    0x80//PAC.7 

#define WS2812_IO         				PA.3    //13
#define WS2812_IO_mode   				0x02//PBC.1    //13


#define YG_shuzu 			  	 1
#define XL_huancai 			  	 0


#define XL_send_GRB			 	  1
#define XL_send_BRG			 	  0

#define XL_HC_RGB_fade 		   				0
#define XL_HC_RGB_qicailiushui 				0
#define XL_HC_RGB_qicailiushui_fangxiang    0

#define XL_HC_music_VOL_F  						0 // 
#define XL_HC_01234543210_F  					0 // 	
#define XL_HC_one_color_liushui_F 				0
#define XL_HC_one_color_liushui_9999999900_F 	0
#define XL_HC_one_color_liushui_9999990099_F 	0



#define liushui_color_num  			10 
#define Led_num_1_4_Max   			25
#define Led_num_1_2_Max   			Led_num_1_4_Max + Led_num_1_4_Max
#define Led_num_Max   				Led_num_1_2_Max + Led_num_1_2_Max //+ liushui_color_num
#define Led_num_Min	  				10



#define send_data_table_1_2_num		 Led_num_1_2_Max

#define send_data_table_num			 10


extern bit fangxiang;

extern byte step_1_value;
extern byte step_2_value;
extern byte step_3_value;
extern word point_adress;
extern word point_adress1;
extern byte led_level_temp;
extern byte led_num;
extern byte send_count;
extern byte send_time_count;

//extern byte send_count;
extern void send_all_byte(); 
extern byte send_data_table[]; // 81 send_data_table

extern byte led_num_MAX_0 ;
extern byte led_num_MAX_1 ;

extern word point_send_data_table1;
extern word point_send_data_table2;

extern void send_three_byte();
extern void send_one_byte();
extern void send_000();
extern void send_000_no_interrput_deal();
extern void clean_shuzu_deal();
extern void send_all_byte ();
extern void send_byte_deal ();
extern void INIT_LEVEL_TAB_send();
extern void send_one_byte();
extern void send_all_byte_no_interrput_deal();
extern void HC_INIT_LEVEL_TAB_send();
extern void Color_INIT_LEVEL_TAB_send();
extern void shuzu_paixu_deal();
extern void shuzu_send_deal();