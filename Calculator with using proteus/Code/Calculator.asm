
_Get_Key:

;Calculator.c,32 :: 		unsigned char Get_Key(){
;Calculator.c,33 :: 		kp=0;
	CLRF       _kp+0
;Calculator.c,34 :: 		do{
L_Get_Key0:
;Calculator.c,35 :: 		kp=Keypad_Key_Click();delay_ms(10);
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_Get_Key3:
	DECFSZ     R13+0, 1
	GOTO       L_Get_Key3
	DECFSZ     R12+0, 1
	GOTO       L_Get_Key3
	NOP
;Calculator.c,36 :: 		}while(!kp);
	MOVF       _kp+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_Get_Key0
;Calculator.c,37 :: 		switch(kp){
	GOTO       L_Get_Key4
;Calculator.c,38 :: 		case 1 :  Lcd_Cmd(_LCD_CLEAR); break ;     // ON/OFF butonu, ekrani kaldiriyor
L_Get_Key6:
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
	GOTO       L_Get_Key5
;Calculator.c,39 :: 		case 2 :  kp = '0' ; break ;               // 0
L_Get_Key7:
	MOVLW      48
	MOVWF      _kp+0
	GOTO       L_Get_Key5
;Calculator.c,40 :: 		case 3  : kp = 'E'; break ;                // "=" butonu bu halde Enter islem(girdiginiz numara kaydetmek için)
L_Get_Key8:
	MOVLW      69
	MOVWF      _kp+0
	GOTO       L_Get_Key5
;Calculator.c,41 :: 		case 4  : kp = '+' ; break ;               // + islem
L_Get_Key9:
	MOVLW      43
	MOVWF      _kp+0
	GOTO       L_Get_Key5
;Calculator.c,42 :: 		case 5  : kp = '1' ; break ;               // 1
L_Get_Key10:
	MOVLW      49
	MOVWF      _kp+0
	GOTO       L_Get_Key5
;Calculator.c,43 :: 		case 6  : kp = '2' ; break ;               // 2
L_Get_Key11:
	MOVLW      50
	MOVWF      _kp+0
	GOTO       L_Get_Key5
;Calculator.c,44 :: 		case 7  : kp = '3' ; break ;               // 3
L_Get_Key12:
	MOVLW      51
	MOVWF      _kp+0
	GOTO       L_Get_Key5
;Calculator.c,45 :: 		case 8  : kp = '-' ; break ;               // - islem
L_Get_Key13:
	MOVLW      45
	MOVWF      _kp+0
	GOTO       L_Get_Key5
;Calculator.c,46 :: 		case 9  : kp = '4' ; break ;               // 4
L_Get_Key14:
	MOVLW      52
	MOVWF      _kp+0
	GOTO       L_Get_Key5
;Calculator.c,47 :: 		case 10 : kp = '5' ; break ;               // 5
L_Get_Key15:
	MOVLW      53
	MOVWF      _kp+0
	GOTO       L_Get_Key5
;Calculator.c,48 :: 		case 11 : kp = '6' ; break ;               // 6
L_Get_Key16:
	MOVLW      54
	MOVWF      _kp+0
	GOTO       L_Get_Key5
;Calculator.c,49 :: 		case 12 : kp = '*' ; break ;               // * islem
L_Get_Key17:
	MOVLW      42
	MOVWF      _kp+0
	GOTO       L_Get_Key5
;Calculator.c,50 :: 		case 13 : kp = '7' ; break ;               // 7
L_Get_Key18:
	MOVLW      55
	MOVWF      _kp+0
	GOTO       L_Get_Key5
;Calculator.c,51 :: 		case 14 : kp = '8' ; break ;               // 8
L_Get_Key19:
	MOVLW      56
	MOVWF      _kp+0
	GOTO       L_Get_Key5
;Calculator.c,52 :: 		case 15 : kp = '9' ; break ;               // 9
L_Get_Key20:
	MOVLW      57
	MOVWF      _kp+0
	GOTO       L_Get_Key5
;Calculator.c,53 :: 		case 16 : kp = '/' ; break ;               // / islem
L_Get_Key21:
	MOVLW      47
	MOVWF      _kp+0
	GOTO       L_Get_Key5
;Calculator.c,54 :: 		}
L_Get_Key4:
	MOVF       _kp+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_Get_Key6
	MOVF       _kp+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_Get_Key7
	MOVF       _kp+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_Get_Key8
	MOVF       _kp+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_Get_Key9
	MOVF       _kp+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_Get_Key10
	MOVF       _kp+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_Get_Key11
	MOVF       _kp+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_Get_Key12
	MOVF       _kp+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_Get_Key13
	MOVF       _kp+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_Get_Key14
	MOVF       _kp+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_Get_Key15
	MOVF       _kp+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_Get_Key16
	MOVF       _kp+0, 0
	XORLW      12
	BTFSC      STATUS+0, 2
	GOTO       L_Get_Key17
	MOVF       _kp+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_Get_Key18
	MOVF       _kp+0, 0
	XORLW      14
	BTFSC      STATUS+0, 2
	GOTO       L_Get_Key19
	MOVF       _kp+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_Get_Key20
	MOVF       _kp+0, 0
	XORLW      16
	BTFSC      STATUS+0, 2
	GOTO       L_Get_Key21
L_Get_Key5:
;Calculator.c,55 :: 		}
L_end_Get_Key:
	RETURN
; end of _Get_Key

_main:

;Calculator.c,58 :: 		void main() {
;Calculator.c,60 :: 		Keypad_Init();
	CALL       _Keypad_Init+0
;Calculator.c,61 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Calculator.c,62 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Calculator.c,65 :: 		for(;;){
L_main22:
;Calculator.c,66 :: 		Op1=0; //birinci numara tanimladik
	CLRF       _Op1+0
	CLRF       _Op1+1
	CLRF       _Op1+2
	CLRF       _Op1+3
;Calculator.c,67 :: 		Op2=0; //ikinci numara tanimladik
	CLRF       _Op2+0
	CLRF       _Op2+1
	CLRF       _Op2+2
	CLRF       _Op2+3
;Calculator.c,68 :: 		Lcd_Out(1,1,"NUM1=");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Calculator+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Calculator.c,74 :: 		while(1){
L_main25:
;Calculator.c,75 :: 		Get_Key();  //kullanci herhangi bir anahtari bastirsa, anahtarin harfi al
	CALL       _Get_Key+0
;Calculator.c,76 :: 		if(kp=='E')break;
	MOVF       _kp+0, 0
	XORLW      69
	BTFSS      STATUS+0, 2
	GOTO       L_main27
	GOTO       L_main26
L_main27:
;Calculator.c,77 :: 		Lcd_Chr_Cp(kp);  //aldigimiz harf imleçin su andaki yerinde yaziyoruz
	MOVF       _kp+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Calculator.c,78 :: 		Op1=10*Op1+(kp -'0'); //bu hat sürekli yazdigimiz hanetleri kaydediyor
	MOVLW      10
	MOVWF      R0+0
	CLRF       R0+1
	CLRF       R0+2
	CLRF       R0+3
	MOVF       _Op1+0, 0
	MOVWF      R4+0
	MOVF       _Op1+1, 0
	MOVWF      R4+1
	MOVF       _Op1+2, 0
	MOVWF      R4+2
	MOVF       _Op1+3, 0
	MOVWF      R4+3
	CALL       _Mul_32x32_U+0
	MOVLW      48
	SUBWF      _kp+0, 0
	MOVWF      R4+0
	CLRF       R4+1
	BTFSS      STATUS+0, 0
	DECF       R4+1, 1
	MOVF       R4+0, 0
	MOVWF      _Op1+0
	MOVF       R4+1, 0
	MOVWF      _Op1+1
	MOVLW      0
	BTFSC      _Op1+1, 7
	MOVLW      255
	MOVWF      _Op1+2
	MOVWF      _Op1+3
	MOVF       R0+0, 0
	ADDWF      _Op1+0, 1
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	INCFSZ     R0+1, 0
	ADDWF      _Op1+1, 1
	MOVF       R0+2, 0
	BTFSC      STATUS+0, 0
	INCFSZ     R0+2, 0
	ADDWF      _Op1+2, 1
	MOVF       R0+3, 0
	BTFSC      STATUS+0, 0
	INCFSZ     R0+3, 0
	ADDWF      _Op1+3, 1
;Calculator.c,81 :: 		}
	GOTO       L_main25
L_main26:
;Calculator.c,87 :: 		Lcd_Out(2,1,"NUM2=");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_Calculator+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Calculator.c,88 :: 		while(1){
L_main28:
;Calculator.c,89 :: 		Get_Key();
	CALL       _Get_Key+0
;Calculator.c,90 :: 		if(kp=='E')break;
	MOVF       _kp+0, 0
	XORLW      69
	BTFSS      STATUS+0, 2
	GOTO       L_main30
	GOTO       L_main29
L_main30:
;Calculator.c,91 :: 		Lcd_Chr_Cp(kp);
	MOVF       _kp+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;Calculator.c,92 :: 		Op2=10*Op2+(kp -'0');
	MOVLW      10
	MOVWF      R0+0
	CLRF       R0+1
	CLRF       R0+2
	CLRF       R0+3
	MOVF       _Op2+0, 0
	MOVWF      R4+0
	MOVF       _Op2+1, 0
	MOVWF      R4+1
	MOVF       _Op2+2, 0
	MOVWF      R4+2
	MOVF       _Op2+3, 0
	MOVWF      R4+3
	CALL       _Mul_32x32_U+0
	MOVLW      48
	SUBWF      _kp+0, 0
	MOVWF      R4+0
	CLRF       R4+1
	BTFSS      STATUS+0, 0
	DECF       R4+1, 1
	MOVF       R4+0, 0
	MOVWF      _Op2+0
	MOVF       R4+1, 0
	MOVWF      _Op2+1
	MOVLW      0
	BTFSC      _Op2+1, 7
	MOVLW      255
	MOVWF      _Op2+2
	MOVWF      _Op2+3
	MOVF       R0+0, 0
	ADDWF      _Op2+0, 1
	MOVF       R0+1, 0
	BTFSC      STATUS+0, 0
	INCFSZ     R0+1, 0
	ADDWF      _Op2+1, 1
	MOVF       R0+2, 0
	BTFSC      STATUS+0, 0
	INCFSZ     R0+2, 0
	ADDWF      _Op2+2, 1
	MOVF       R0+3, 0
	BTFSC      STATUS+0, 0
	INCFSZ     R0+3, 0
	ADDWF      _Op2+3, 1
;Calculator.c,94 :: 		}
	GOTO       L_main28
L_main29:
;Calculator.c,98 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Calculator.c,99 :: 		Lcd_Out(1,1,"OPERATION:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_Calculator+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Calculator.c,100 :: 		Get_Key();
	CALL       _Get_Key+0
;Calculator.c,101 :: 		switch(kp){
	GOTO       L_main31
;Calculator.c,102 :: 		case '+': Calc =Op1 + Op2; break;  //ve kullancinin istedigi islem gore iki sayimizin arasinda hesaplama yapiyoruz
L_main33:
	MOVF       _Op1+0, 0
	MOVWF      _Calc+0
	MOVF       _Op1+1, 0
	MOVWF      _Calc+1
	MOVF       _Op1+2, 0
	MOVWF      _Calc+2
	MOVF       _Op1+3, 0
	MOVWF      _Calc+3
	MOVF       _Op2+0, 0
	ADDWF      _Calc+0, 1
	MOVF       _Op2+1, 0
	BTFSC      STATUS+0, 0
	INCFSZ     _Op2+1, 0
	ADDWF      _Calc+1, 1
	MOVF       _Op2+2, 0
	BTFSC      STATUS+0, 0
	INCFSZ     _Op2+2, 0
	ADDWF      _Calc+2, 1
	MOVF       _Op2+3, 0
	BTFSC      STATUS+0, 0
	INCFSZ     _Op2+3, 0
	ADDWF      _Calc+3, 1
	GOTO       L_main32
;Calculator.c,103 :: 		case '-': Calc =Op1 - Op2; break;  //islemin sonucu Calc icinde kaydediyoruz
L_main34:
	MOVF       _Op2+0, 0
	MOVWF      R0+0
	MOVF       _Op2+1, 0
	MOVWF      R0+1
	MOVF       _Op2+2, 0
	MOVWF      R0+2
	MOVF       _Op2+3, 0
	MOVWF      R0+3
	MOVF       _Op1+0, 0
	MOVWF      _Calc+0
	MOVF       _Op1+1, 0
	MOVWF      _Calc+1
	MOVF       _Op1+2, 0
	MOVWF      _Calc+2
	MOVF       _Op1+3, 0
	MOVWF      _Calc+3
	MOVF       R0+0, 0
	SUBWF      _Calc+0, 1
	MOVF       R0+1, 0
	BTFSS      STATUS+0, 0
	INCFSZ     R0+1, 0
	SUBWF      _Calc+1, 1
	MOVF       R0+2, 0
	BTFSS      STATUS+0, 0
	INCFSZ     R0+2, 0
	SUBWF      _Calc+2, 1
	MOVF       R0+3, 0
	BTFSS      STATUS+0, 0
	INCFSZ     R0+3, 0
	SUBWF      _Calc+3, 1
	GOTO       L_main32
;Calculator.c,104 :: 		case '*': Calc =Op1 * Op2; break;
L_main35:
	MOVF       _Op1+0, 0
	MOVWF      R0+0
	MOVF       _Op1+1, 0
	MOVWF      R0+1
	MOVF       _Op1+2, 0
	MOVWF      R0+2
	MOVF       _Op1+3, 0
	MOVWF      R0+3
	MOVF       _Op2+0, 0
	MOVWF      R4+0
	MOVF       _Op2+1, 0
	MOVWF      R4+1
	MOVF       _Op2+2, 0
	MOVWF      R4+2
	MOVF       _Op2+3, 0
	MOVWF      R4+3
	CALL       _Mul_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      _Calc+0
	MOVF       R0+1, 0
	MOVWF      _Calc+1
	MOVF       R0+2, 0
	MOVWF      _Calc+2
	MOVF       R0+3, 0
	MOVWF      _Calc+3
	GOTO       L_main32
;Calculator.c,105 :: 		case '/': Calc =Op1 / Op2; break;
L_main36:
	MOVF       _Op2+0, 0
	MOVWF      R4+0
	MOVF       _Op2+1, 0
	MOVWF      R4+1
	MOVF       _Op2+2, 0
	MOVWF      R4+2
	MOVF       _Op2+3, 0
	MOVWF      R4+3
	MOVF       _Op1+0, 0
	MOVWF      R0+0
	MOVF       _Op1+1, 0
	MOVWF      R0+1
	MOVF       _Op1+2, 0
	MOVWF      R0+2
	MOVF       _Op1+3, 0
	MOVWF      R0+3
	CALL       _Div_32x32_U+0
	MOVF       R0+0, 0
	MOVWF      _Calc+0
	MOVF       R0+1, 0
	MOVWF      _Calc+1
	MOVF       R0+2, 0
	MOVWF      _Calc+2
	MOVF       R0+3, 0
	MOVWF      _Calc+3
	GOTO       L_main32
;Calculator.c,107 :: 		}
L_main31:
	MOVF       _kp+0, 0
	XORLW      43
	BTFSC      STATUS+0, 2
	GOTO       L_main33
	MOVF       _kp+0, 0
	XORLW      45
	BTFSC      STATUS+0, 2
	GOTO       L_main34
	MOVF       _kp+0, 0
	XORLW      42
	BTFSC      STATUS+0, 2
	GOTO       L_main35
	MOVF       _kp+0, 0
	XORLW      47
	BTFSC      STATUS+0, 2
	GOTO       L_main36
L_main32:
;Calculator.c,114 :: 		LongToStr(Calc,Op);   //Op bizim string array output olarak(farkettisen Op yazmadik yukarda cunku LongToStr function den cikiyor zaten)
	MOVF       _Calc+0, 0
	MOVWF      FARG_LongToStr_input+0
	MOVF       _Calc+1, 0
	MOVWF      FARG_LongToStr_input+1
	MOVF       _Calc+2, 0
	MOVWF      FARG_LongToStr_input+2
	MOVF       _Calc+3, 0
	MOVWF      FARG_LongToStr_input+3
	MOVLW      _op+0
	MOVWF      FARG_LongToStr_output+0
	CALL       _LongToStr+0
;Calculator.c,115 :: 		j=0;
	CLRF       _j+0
;Calculator.c,116 :: 		for(i=0;i<=11;i++)
	CLRF       _i+0
L_main37:
	MOVF       _i+0, 0
	SUBLW      11
	BTFSS      STATUS+0, 0
	GOTO       L_main38
;Calculator.c,119 :: 		if(Op[i]!=' ') //Op array den bazi bos haneleri var onlari silmek istiyoruz ve "lcd" arrayin icinde hersey kaydediyoruz
	MOVF       _i+0, 0
	ADDLW      _op+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      32
	BTFSC      STATUS+0, 2
	GOTO       L_main40
;Calculator.c,122 :: 		lcd[j]=Op[i];
	MOVF       _j+0, 0
	ADDLW      _lcd+0
	MOVWF      R1+0
	MOVF       _i+0, 0
	ADDLW      _op+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;Calculator.c,123 :: 		j++;
	INCF       _j+0, 1
;Calculator.c,125 :: 		}
L_main40:
;Calculator.c,116 :: 		for(i=0;i<=11;i++)
	INCF       _i+0, 1
;Calculator.c,127 :: 		}
	GOTO       L_main37
L_main38:
;Calculator.c,130 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Calculator.c,131 :: 		Lcd_Out(1,1,"Result=");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_Calculator+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Calculator.c,132 :: 		Lcd_Out_Cp(lcd);//(lcd icinde matematik sonucu kaydedildi)
	MOVLW      _lcd+0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
;Calculator.c,133 :: 		delay_ms(3000);
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_main41:
	DECFSZ     R13+0, 1
	GOTO       L_main41
	DECFSZ     R12+0, 1
	GOTO       L_main41
	DECFSZ     R11+0, 1
	GOTO       L_main41
	NOP
;Calculator.c,134 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Calculator.c,136 :: 		}
	GOTO       L_main22
;Calculator.c,138 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
