#line 1 "C:/Users/asus/Desktop/Calculator/Code/Calculator.c"


sbit LCD_RS at RB0_bit;
sbit LCD_EN at RB1_bit;
sbit LCD_D4 at RB2_bit;
sbit LCD_D5 at RB3_bit;
sbit LCD_D6 at RB4_bit;
sbit LCD_D7 at RB5_bit;

sbit LCD_RS_Direction at TRISB0_bit;
sbit LCD_EN_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB2_bit;
sbit LCD_D5_Direction at TRISB3_bit;
sbit LCD_D6_Direction at TRISB4_bit;
sbit LCD_D7_Direction at TRISB5_bit;

char keypadPort at PORTD;




unsigned short kp,i,j,lcd[5],op[12];


unsigned long Calc,Op1,Op2;






unsigned char Get_Key(){
kp=0;
do{
kp=Keypad_Key_Click();delay_ms(10);
}while(!kp);
switch(kp){
case 1 : Lcd_Cmd(_LCD_CLEAR); break ;
case 2 : kp = '0' ; break ;
case 3 : kp = 'E'; break ;
case 4 : kp = '+' ; break ;
case 5 : kp = '1' ; break ;
case 6 : kp = '2' ; break ;
case 7 : kp = '3' ; break ;
case 8 : kp = '-' ; break ;
case 9 : kp = '4' ; break ;
case 10 : kp = '5' ; break ;
case 11 : kp = '6' ; break ;
case 12 : kp = '*' ; break ;
case 13 : kp = '7' ; break ;
case 14 : kp = '8' ; break ;
case 15 : kp = '9' ; break ;
case 16 : kp = '/' ; break ;
 }
 }


void main() {

Keypad_Init();
Lcd_Init();
Lcd_Cmd(_LCD_CLEAR);


for(;;){
Op1=0;
Op2=0;
Lcd_Out(1,1,"NUM1=");





while(1){
Get_Key();
if(kp=='E')break;
Lcd_Chr_Cp(kp);
Op1=10*Op1+(kp -'0');


}





Lcd_Out(2,1,"NUM2=");
while(1){
Get_Key();
if(kp=='E')break;
Lcd_Chr_Cp(kp);
Op2=10*Op2+(kp -'0');

}



Lcd_Cmd(_LCD_CLEAR);
Lcd_Out(1,1,"OPERATION:");
Get_Key();
switch(kp){
case '+': Calc =Op1 + Op2; break;
case '-': Calc =Op1 - Op2; break;
case '*': Calc =Op1 * Op2; break;
case '/': Calc =Op1 / Op2; break;

}






LongToStr(Calc,Op);
 j=0;
for(i=0;i<=11;i++)

{
if(Op[i]!=' ')

{
lcd[j]=Op[i];
j++;

}

}


Lcd_Cmd(_LCD_CLEAR);
Lcd_Out(1,1,"Result=");
Lcd_Out_Cp(lcd);
delay_ms(3000);
Lcd_Cmd(_LCD_CLEAR);

}

}
