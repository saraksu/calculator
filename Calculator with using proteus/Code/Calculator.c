//ekran ve klavye için tris ve elektrik noktalarinin tanimlanmasi:

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
///////////////////////////////////////////////////////////////////

//kp: bastigimiz harf kaydetmek için. i ve j: son kisimdeki loop için kullanildi.
//lcd ve op: matematik islem yaptiktan sonra sonuç kaydetmek için
unsigned short kp,i,j,lcd[5],op[12];
//Op1: Birinci girdigimiz numara, Op2: Ikinci girdigimiz numara, 
//Calc: lcd ve op den once islemin sonucu kaydetmek için
unsigned long Calc,Op1,Op2;

///////////////////////////////////////////////////////////////////

//bu function(Get_Key) anahtarlari basildigini algilar ve anahtarlarin binary miktari göre
//kp için dogru harfi atar

unsigned char Get_Key(){
kp=0;
do{
kp=Keypad_Key_Click();delay_ms(10);
}while(!kp);
switch(kp){
case 1 :  Lcd_Cmd(_LCD_CLEAR); break ;     // ON/OFF butonu, ekrani kaldiriyor
case 2 :  kp = '0' ; break ;               // 0
case 3  : kp = 'E'; break ;                // "=" butonu bu halde Enter islem(girdiginiz numara kaydetmek için)
case 4  : kp = '+' ; break ;               // + islem
case 5  : kp = '1' ; break ;               // 1
case 6  : kp = '2' ; break ;               // 2
case 7  : kp = '3' ; break ;               // 3
case 8  : kp = '-' ; break ;               // - islem
case 9  : kp = '4' ; break ;               // 4
case 10 : kp = '5' ; break ;               // 5
case 11 : kp = '6' ; break ;               // 6
case 12 : kp = '*' ; break ;               // * islem
case 13 : kp = '7' ; break ;               // 7
case 14 : kp = '8' ; break ;               // 8
case 15 : kp = '9' ; break ;               // 9
case 16 : kp = '/' ; break ;               // / islem
 }
 }
 
///////////////////////////////////////////////////////////////////
void main() {
//burda LCD ve klavyemizi baslatiyoruz
Keypad_Init();
Lcd_Init();
Lcd_Cmd(_LCD_CLEAR);

//bu infinity for loop tarzi gibi bir sey
for(;;){
Op1=0; //birinci numara tanimladik
Op2=0; //ikinci numara tanimladik
Lcd_Out(1,1,"NUM1=");

///////////////////////////////////////////////////////////////////////////////////////////////////////////////

//burda while loop açtik, ve birinci numara kaydetmeye basladik, kullanci numara girdikten ve Enter anahtari
//bastiktan sonra ikinci numaraya geçiyoruz
while(1){
Get_Key();  //kullanci herhangi bir anahtari bastirsa, anahtarin harfi al
if(kp=='E')break;
Lcd_Chr_Cp(kp);  //aldigimiz harf imleçin su andaki yerinde yaziyoruz
Op1=10*Op1+(kp -'0'); //bu hat sürekli yazdigimiz hanetleri kaydediyor
                      //mesela diyelim ilk basta 2 bastik ondan sonra 3 bastik(23 yazmak icin):
                      //0 * 10 + 2 - 0 = 2 ===>  10 * 2 + 3 - 0 = 23
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////


//burda ikinci numaraya gectik ve ayni islem yaptik
Lcd_Out(2,1,"NUM2=");
while(1){
Get_Key();
if(kp=='E')break;
Lcd_Chr_Cp(kp);
Op2=10*Op2+(kp -'0');

}

//ikinci numara aldik tan sonra, kullancinin istedigi matematik islem aliyoruz burda

Lcd_Cmd(_LCD_CLEAR);
Lcd_Out(1,1,"OPERATION:");
Get_Key();
switch(kp){
case '+': Calc =Op1 + Op2; break;  //ve kullancinin istedigi islem gore iki sayimizin arasinda hesaplama yapiyoruz
case '-': Calc =Op1 - Op2; break;  //islemin sonucu Calc icinde kaydediyoruz
case '*': Calc =Op1 * Op2; break;
case '/': Calc =Op1 / Op2; break;

}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////

//su ana kadar Calc long diye bir variable, asagidaki function kullanarak Calc String array ye degistiriyoruz
//cunku lcd ekrani long yazmiyor

LongToStr(Calc,Op);   //Op bizim string array output olarak(farkettisen Op yazmadik yukarda cunku LongToStr function den cikiyor zaten)
 j=0;
for(i=0;i<=11;i++)

{
if(Op[i]!=' ') //Op array den bazi bos haneleri var onlari silmek istiyoruz ve "lcd" arrayin icinde hersey kaydediyoruz

{
lcd[j]=Op[i];
j++;

}

}
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//sonunda burda lcd array ekrana yaziyoruz
Lcd_Cmd(_LCD_CLEAR);
Lcd_Out(1,1,"Result=");
Lcd_Out_Cp(lcd);//(lcd icinde matematik sonucu kaydedildi)
delay_ms(3000);
Lcd_Cmd(_LCD_CLEAR);

}

}