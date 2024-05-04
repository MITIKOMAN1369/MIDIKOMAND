'Program Composer : mahdi heidarian
'===============================================================================
$regfile = "m128def.dat"
$crystal = 8000000
$hwstack = 512
$swstack = 512
$framesize = 512
'************************************************************************ Libery
$lib "glcdKS108.lbx"
'************************************************************************** Font
'Font Farsi
_0 Alias Chr(128)
_1 Alias Chr(129)
_2 Alias Chr(130)
_3 Alias Chr(131)
_4 Alias Chr(132)
_5 Alias Chr(133)
_6 Alias Chr(134)
_7 Alias Chr(135)
_8 Alias Chr(136)
_9 Alias Chr(137)
Virgool Alias Chr(138)
Khateh_chasban Alias Chr(139)
Alamat_soal Alias Chr(140)
A_ba_kolah Alias Chr(141)
Hamzeh_chasban Alias Chr(142)
Hamzeh_joda Alias Chr(143)
Alef Alias Chr(144)
Alef_chasbaan Alias Chr(145)
Be_bozorg Alias Chr(146)
Be_koochak Alias Chr(147)
Pe_bozorg Alias Chr(148)
Pe_koochak Alias Chr(149)
Te_bozorg Alias Chr(150)
Te_koochak Alias Chr(151)
Se_bozorg Alias Chr(152)
Se_koochak Alias Chr(153)
Jim_bozorg Alias Chr(154)
Jim_koochak Alias Chr(155)
Che_bozorg Alias Chr(156)
Che_koochak Alias Chr(157)
He_jimi_bozorg Alias Chr(158)
He_jimi_koochak Alias Chr(159)
Khe_bozorg Alias Chr(160)
Khe_koochak Alias Chr(161)
Daal Alias Chr(162)
Zaal Alias Chr(163)
Re Alias Chr(164)
Ze Alias Chr(165)
Zhe Alias Chr(166)
Sin_bozorg Alias Chr(167)
Sin_koochak Alias Chr(168)
Shin_bozorg Alias Chr(169)
Shin_koochak Alias Chr(170)
Saad_bozorg Alias Chr(171)
Saad_koochak Alias Chr(172)
Zaad_bozorg Alias Chr(173)
Zaad_koochak Alias Chr(174)
Taa Alias Chr(175)
Zaa Alias Chr(176)
Ein_bozorg Alias Chr(177)
Ein_akhar_chasban Alias Chr(178)
Ein_vasat Alias Chr(179)
Ein_koochak Alias Chr(180)
Ghein_bozorg Alias Chr(181)
Ghein_akhar_chasban Alias Chr(182)
Ghein_vasat Alias Chr(183)
Ghein_koochak Alias Chr(184)
Fe_bozorg Alias Chr(185)
Fe_koochak Alias Chr(186)
Ghaaf_bozorg Alias Chr(187)
Ghaaf_koochak Alias Chr(188)
Kaaf_bozorg Alias Chr(189)
Kaaf_koochak Alias Chr(190)
Gaaf_bozorg Alias Chr(191)
Gaaf_koochak Alias Chr(192)
Laam_bozorg Alias Chr(193)
Laam_alef Alias Chr(194)
Laam_koochak Alias Chr(195)
Mim_bozorg Alias Chr(196)
Mim_koochak Alias Chr(197)
Noon_bozorg Alias Chr(198)
Noon_koochak Alias Chr(199)
Vav Alias Chr(200)
He_koochak Alias Chr(201)
He_vasat Alias Chr(202)
He_chasbaan_avval Alias Chr(203)
Ye_chasbaan Alias Chr(204)
Ye_bozorg Alias Chr(205)
Ye_koochak Alias Chr(206)
'End Font Farsi
'******************************************************************* Function
Declare Function M_kabise(byref Sal As Word)as Byte
Declare Function Sh_kabise(byref Sal As Word)as Byte
'******************************************************************* LCD
Config Graphlcd = 128 * 64sed , Dataport = Porte , Controlport = PortA , _
Ce = 6 , Ce2 = 5 , Cd = 2 , Rd = 3 , Reset = 7 , Enable = 4
Setfont Font8x8
Cls
'******************************************************************* ADC
Config Adc = Single  , Prescaler = 128 , Reference = Avcc
'******************************************************************* timer
'Config Timer0 =Timer , prescale = 8
'Enable Interrupts
'Enable Timer0
'On OVF0 STW
'Timer0 = 6
'Start Timer0
'******************************************************************* Config 1307
$lib "ds1307clock.lib"
Config Sda = Portd.1
Config Scl = Portd.0
Const Ds1307w = &HD0
Const Ds1307r = &HD1
'****************************************************************** Config Input
'MCUCR = Bit ( MCUCR , SRE )
'MCUCR.7 = 1
'SREG.7 = 1
 Config portd.6 =Input
Config Pinb.3 = Input
Config pinc.0 = Input
Config pinc.1 = Input
Config pinc.2 = Input
Config Pinc.3 = Input
Config Pinc.4 = Input
Config Pinc.5 = Input
Config Pinc.6 = Input
Config Pinc.7 = Input
Config Portf.0 = Input
Config Portf.1 = Input
Config Portf.2 = Input
Config portg.1 = Input

'***************************************************************** Config output
Config Porta.0 = Output
Config Porta.1 = Output
'Config Porta.2 = Output
'Config Porta.3 = Output
'Config Porta.4 = Output
'Config Porta.5 = Output
'Config Porta.6 = Output
Config Portb.0 = Output
Config Portb.1 = Output
Config Portb.2 = Output
Config Portb.4 = Output
Config Portb.5 = Output
Config Portb.6 = Output
Config Portb.7 = Output
Config portg.0 = Output
Config portg.2 = output
Config portd.0 = output
Config portd.1 = output
Config portd.2 = output
Config portd.3 = output
Config portd.4 = output
Config portd.5 = output
Config portd.7 = output
'******************************************************************* Alias Input
Switch_menu Alias Pinc.0
Switch_up Alias Pinc.1
Switch_down Alias Pinc.2
Switch_enter Alias Pinc.3
Switch_heater Alias Pinc.4
Switch_fan Alias Pinc.5
Switch_glcd Alias Pinc.6
Switch_COOLER Alias Pinc.7

So Alias Pinb.3
Digital_mq7 Alias PortG.1

'****************************************************************** Alias output
COOLER_k1 Alias Porta.0
Buzzer Alias Porta.1
Sunroof_rl1 Alias Portd.7
Door1_rl2 Alias Portd.4
Door2_rl3 Alias Portd.5
Heater_k1 Alias Portd.2
Fan_radiator_k2 Alias Portd.3

led_erorr Alias Portd.6

Cs Alias Portb.0
Clk Alias Portb.1
COOLER_led_green Alias Portb.2
Heater_led_RED Alias Portb.5
Heater_led_green Alias Portb.4
Fan_led_green Alias Portb.6
Fan_led_red Alias Portb.7

POWER_GLCD Alias PortG.0
COOLER_Led_Red Alias PortG.2


Sunroof_rl1 = 0 : Door1_rl2 = 0 : Door2_rl3 = 0
Heater_led_red = 0 : Fan_led_red = 0 : Buzzer = 0
Heater_led_green = 0 : Fan_led_green = 0
Fan_radiator_k2 = 0 : Heater_k1 = 0 : POWER_GLCD = 1
cooler_led_red = 0 : cooler_led_green = 0 : cooler_k1 = 1

'************************************************************* Config Var As ...
Dim Key As Bit
Dim Show As Bit
Dim Item_menu As Byte
Dim Var_lcd As Word
Dim Show_lcd As Bit
Dim Select_var As Bit
Dim Select_var_date As Byte
Dim Item_Menu_heater As Byte
Dim Item_Menu_COOLER As Byte
Dim Item_Menu_Fan As Byte
Item_Menu_Fan = 1
Item_Menu_heater = 1
Item_Menu_COOLER = 1
Item_menu = 1
'''''''''''''''''''''''''''''''''''''''''''''
Dim Copy As Byte
Dim Seco As Byte
Dim Mine As Byte
Dim Hour As Byte
Dim _year As Word
Dim Weekday As Byte
Dim M_day As Word
Dim Sh_day As Word
Dim M_year As Word
Dim Sh_year As Word
Dim M_month As Word
Dim Sh_month As Word
Dim Kabise As Byte
Dim Kole_roz_m As Word
Dim Kole_roz_sh As Word
Dim Conter1 As Word
Dim Conter2 As Word
Dim Temp1 As Word
Dim Temp2 As Byte
Dim Day_of_month(12) As Byte
'''''''''''''''''''''''''''''''''''''''''''''
Dim H As Byte
Dim E As Byte
Dim F As Byte
Dim G As Byte
Dim I As Byte
Dim J As Byte
Dim P As Byte
Dim N As Byte
Dim V As Byte
Dim M As Byte
Dim L As Byte
Dim K As Byte
Dim Code As String * 16
Dim Strg1 As String * 2
Dim Strg2 As String * 2
Dim Strg3 As String * 2
Dim Strg As String * 12
Dim Adc_value As Integer
Dim Volt As Single
Dim V_str As String * 10
Dim Ppm As Single
Dim Volt_wster As Single
Dim Ppm_str As String * 10
Dim voltmetr_str As String * 10
Dim Temp3 As Single , Temp4 As Single
'''''''''''''''''''''''''''''''''''''''''''''
Day_of_month(1) = 31
Day_of_month(2) = 28
Day_of_month(3) = 31
Day_of_month(4) = 30
Day_of_month(5) = 31
Day_of_month(6) = 30
Day_of_month(7) = 31
Day_of_month(8) = 31
Day_of_month(9) = 30
Day_of_month(10) = 31
Day_of_month(11) = 30
Day_of_month(12) = 31
'''''''''''''''''''''''''''''''''''''''
Dim TTemp As Word
Dim TTemp1 As Single
Dim Temp_chek As Word
Dim Var_temp_max As Single
Dim Temp_max As Eram Single
Dim Var_temp_max_chek As Word
Dim S_Fan_Chek As Word
Dim S_Fan As Byte
Dim Sw_Fan As Eram byte
'''''''''''''''''''''''''''''''''''''''
Dim Var_Temp_Min_Fan As Single
Dim Temp_Min_Fan As Eram Single
Dim Var_Temp_Min_Fan_Chek As Word
Dim Tafazole_Dama_Fan As Word
'''''''''''''''''''''''''''''''''''''''
Dim Var_Temp_Min_Heater As Single
Dim Temp_Min_Heater As Eram Single
Dim Var_Temp_Min_Heater_Chek As Word
Dim Var_Temp_Min_COOLER As Single
Dim Temp_Min_COOLER As Eram Single
Dim Var_Temp_Min_COOLER_Chek As Word
Dim Tafazole_dama As Word

'''''''''''''''''''''''''''''''''''''''
Dim ppm_chek As word
Dim Var_High_Limit As single
Dim High_Limit As Eram single
Dim var_High_Limit_Chek As Word
Dim Error_Buzzer As Byte
Dim Sw_Error_Buzzer As Eram Byte
Dim Error_Buzzer_Chek As word
'Dim S_Error_Buzzer As As Word
'''''''''''''''''''''''''''''''''''''''
Dim Din As WORD
Dim voltvolt As WORD
Dim Volt_str As WORD

Dim ZS As WORD
Dim XS As WORD
Dim CSX As WORD
Dim VS As WORD
Dim BS As WORD
Dim NS As WORD
Dim MS As WORD
Dim DAMAZS As WORD

Dim Din0 As WORD
Dim Din1 As WORD
Dim Din2 As WORD
Dim Din3 As WORD
Dim Din4 As WORD
Dim Din5 As WORD
Dim Dama As Single
Dim Damak As Single
Dim Temp_Heater_chek As Word
Dim Var_temp_max_Heater As Single
Dim Temp_Max_Heater As Eram Single
Dim Var_temp_max_Heater_Chek As Word
Dim Sw_Heater As Eram Byte
Dim S_Heater As Byte
Dim S_Heater_Chek As Word

Dim Temp_COOLER_chek As Word
Dim Var_temp_max_COOLER As Single
Dim Temp_Max_COOLER As Eram Single
Dim Var_temp_max_COOLER_Chek As Word
Dim Sw_COOLER As Eram Byte
Dim S_COOLER As Byte
Dim S_COOLER_Chek As Word
Dim TPT As Byte
Dim Ad_pt As Long
Dim sampling As Word
Dim sample As single
Dim voltage As string*5
TPT = 20


'''''''''''''''''''''''''''''''''''''''
Dim Chec_Flash As byte
Dim Chec_eram As Eram byte
Gosub Config_Var_Eram
'******************************************************************** SUB [config var eram]
Config_Var_Eram:
Chec_Flash = Chec_Eram
Waitms 20
If Chec_Flash = 255 Then
Chec_Flash = 1
Chec_Eram = Chec_Flash
Waitms 20
'''''''''''''''''''''''''''''''''''''''
Var_High_Limit = 200
High_Limit = Var_High_Limit
Waitms 20
'''''''''''''''''''''''''''''''''''''''
Var_temp_max_Heater = 40
Temp_max_Heater = Var_temp_max_Heater
Waitms 20
'''''''''''''''''''''''''
Var_temp_max_COOLER = 40
Temp_max_COOLER = Var_temp_max_COOLER
Waitms 20
'''''''''''''''''''''''''''''''''''''''
Var_temp_max = 95
Temp_max = Var_temp_max
Waitms 20
'''''''''''''''''''''''''''''''''''''''
S_Fan = 0
Sw_Fan = S_Fan
Waitms 20
'''''''''''''''''''''''''''''''''''''''
S_Heater = 0
Sw_Heater = S_Heater
Waitms 20
'''''''''''''''''''''''''''
S_COOLER = 0
Sw_COOLER = S_COOLER
Waitms 20
'''''''''''''''''''''''''''''''''''''''
Error_Buzzer = 0
'Sw_Error_Buzzer = Error_Buzzer
'Waitms 20
'''''''''''''''''''''''''''''''''''''''
Var_Temp_Min_Heater = 5
Temp_Min_Heater = Var_Temp_Min_Heater
Waitms 20
'''''''''''''''''''''''''''''''''''''''
Var_Temp_Min_COOLER = 5
Temp_Min_COOLER = Var_Temp_Min_COOLER
Waitms 20
'''''''''''''''''''''''''''''''''''''''
Var_Temp_Min_Fan = 5
Temp_Min_FAn = Var_Temp_Min_Fan
Waitms 20
'''''''''''''''''''''''''''''''''''''''

Else
Var_Temp_Min_Fan = Temp_Min_Fan
'''''''''''''''''''''''''''''''''''''''
Var_Temp_Min_Heater = Temp_Min_Heater
'''''''''''''''''''''''''''''''''''''''
Var_Temp_Min_COOLER = Temp_Min_COOLER
'''''''''''''''''''''''''''''''''''''''
Var_high_Limit = High_Limit
Waitms 20
'''''''''''''''''''''''''''''''''''''''
Var_temp_max = Temp_max
Waitms 20
'''''''''''''''''''''''''''''''''''''''
S_Fan = Sw_Fan
Waitms 20
'''''''''''''''''''''''''''''''''''''''
S_Heater = Sw_Heater
Waitms 20
'''''''''''''''''''''''''''''''''''''''
S_COOLER = Sw_COOLER
Waitms 20
'''''''''''''''''''''''''''''''''''''''
'Error_Buzzer = Sw_Error_Buzzer
'Waitms 20
'''''''''''''''''''''''''''''''''''''''
Var_temp_max_Heater = Temp_max_Heater
Waitms 20
'''''''''''''''''''''''''''''''''''''''
Var_temp_max_COOLER = Temp_max_COOLER
Waitms 20
Gosub Welcome
End If
Return
'***************************************************************** SUB [Welcome]
Welcome:
Cls
Showpic 32 , 0 , Logo1
Wait 3
Cls
Code = "  " + Laam_bozorg + Alef_chasbaan + He_jimi_koochak + " " + Re + Daal + " " + He_koochak + Alef_chasbaan + Gaaf_koochak + Te_koochak + Sin_koochak + Daal + " "
Lcdat 1 , 1 , Code
Code = Alef_chasbaan + Fe_koochak + Taa + Laam_koochak + " " + Noon_bozorg + Vav + Ye_koochak + Sin_koochak + Alef + Re + Be_koochak + Ye_koochak + Laam_koochak + Alef_chasbaan + Kaaf_koochak
Lcdat 2 , 1 , Code
Code = ". ..." + Daal + Ye_koochak + Noon_koochak + Kaaf_koochak + " " + Re + Be_koochak + Saad_koochak +"   "
Lcdat 3 , 1 , Code
Lcdat 5 , 1 , " The device is  "
Lcdat 6 , 1 , "  calibrating,  "
Lcdat 7 , 1 , "please wait... ."
Start Adc
Waitms 500
Gosub Chek_temp
Waitms 500
Gosub Chek_temp
Waitms 500
Gosub Chek_temp
Waitms 500
Gosub Chek_temp
Gosub Main
Return
'******************************************************************** SUB [Main]
Main:
Show = 0 : Cls
 '  GLCDcmd &H3E , 1 : GLCDcmd &H3E , 2
 '  portg.0 = 0
     ' portg.2 = 1
Gosub Ds1307
Gosub Show_weekday
'Start Adc
'Start Adc
Do
If Show = 0 Then
Gosub Ds1307
Gosub Show_weekday
If Copy <> Seco Then
Copy = Seco
Gosub M_to_sh
'''''''''''''''''''''''''''''''''''''''''''''Show Data
Strg1 = Str(sh_day)
If Len(strg1) = 1 Then
Strg1 = "0" + Strg1
End If
Strg2 = Str(sh_month)
If Len(strg2) = 1 Then
Strg2 = "0" + Strg2
End If
Strg = Str(sh_year)
If Len(strg) = 4 Then
Strg3 = Mid(strg , 3 , 2)
End If
If Len(strg) = 3 Then
Strg3 = Mid(strg , 2 , 2)
End If
If Len(strg) = 2 Then
Strg3 = Strg
End If
If Len(strg) < 2 And Len(strg) > 4 Then
Strg3 = "  "
End If
Setfont Font8x8
Strg ="14" + Strg3 + "/" + Strg2 + "/" + Strg1
Lcdat 4 , 1 , Strg
'''''''''''''''''''''''''''''''''''''''''''''Show Time
Strg1 = Str(seco)
If Len(strg1) = 1 Then
Strg1 = "0" + Strg1
End If
Strg2 = Str(mine)
If Len(strg2) = 1 Then
Strg2 = "0" + Strg2
End If
Strg3 = Str(hour)
If Len(strg3) = 1 Then
Strg3 = "0" + Strg3
End If
Setfont Font12x16
Strg = Strg3 + ":" + Strg2 + ":" + Strg1
Lcdat 1 , 1 , Strg
'''''''''''''''''''''''''''''''''''''''''''''Show Analog Time
G = Seco - 1
If Seco = 0 Then G = 59
H = Mine - 1
If Mine = 0 Then H = 59
K = P - 1
If P = 0 Then K = 59
V = Hour
If V > 11 Then V = V - 12
N = Mine / 12 : P = V * 5 : P = P + N
End If
'''''''''''''''''''''''''''''''''''''''''''''Show co2
Gosub adc_co2
Ppm_str = Fusing(ppm , "#.&")
Setfont Font8x8
'Code = Daal + Ye_koochak + Sin_koochak + Kaaf_koochak + Vav + Noon_koochak + Vav + Mim_koochak + "="
Lcdat 5 , 1 , "CO = " ; Ppm_str ; "PPM"
Gosub Chek_rly_co
''''''''''''''''''''''''''''''''''''''''''''''' chek_heater
'Gosub chek_heater
'Chek_heater:
MS = Getadc(2)
Waitms 10
DIN = MS /4
DAMAZS = DIN *  4.8828125'/ 2.04
DAMA = DAMAZS / 10
'Return
Code = Ye_bozorg + Re + Alef_chasbaan + Khateh_chasban + Khe_koochak + Be_koochak + " = "
Lcdat 8 , 1 , Code ; Fusing(DAMA , "#.#") ; "C"
Gosub Chek_rly_Heater

'''''''''''''''''''''''''''''''''''''''''''''Show fan
Gosub Chek_temp
Code = Be_bozorg + A_ba_kolah + Ye_bozorg + Alef_chasbaan + Mim_koochak + Daal + " = "
lcdat 7 , 1 , Code ;Fusing(TTemp1 , "#.#") ; "C"
Gosub Chek_rly
'''''''''''''''''''''''''''''''''''''''''''''Show voltmetr
Gosub voltmetr:
sampling = GetAdc(1)
Voltage = Fusing (Sample , "#.##")
Setfont Font8x8
Lcdat 6 , 1 , "VOLTAGE=" ; Voltage ; "V"

'''''''''''''''''''''''''''''''''''''''''''''Show COOLER
'Gosub chek_COOLER
'Code = "  " + Re + Laam_koochak + Vav + Kaaf_koochak + " = "
'Lcdat 7, 1 , Code ; Fusing(dama , "#.#") ; "C"
Gosub Chek_rly_COOLER
End If
'''''''''''''''''''''''''''''''''''''''''''''Chekkey
If Key = 1 And  Switch_menu = 1 Then
Key = 0
Gosub Menu
End If
'''''''''''''''''''''''''''''''''''''''''''''
If Switch_enter = 1 And Key = 1 Then
Key = 0 :Show = 1 : cls

Code = "  "+ He_koochak + Alef_chasbaan + Gaaf_koochak + Te_koochak + Sin_koochak + Daal + " " + He_koochak + Zaad_koochak + Fe_koochak + Alef_chasbaan + He_jimi_koochak + "  "
Lcdat 1 , 1 , Code

Code = Noon_bozorg + Fe_koochak + " ="
lcdat 3 , 1 , Code ; Var_Temp_Max ; "/" ; Var_Temp_Min_Fan

Code = Ye_bozorg + Re + Alef_chasbaan + Khateh_chasban + Khe_koochak + Be_koochak + " ="
Lcdat 5 , 1 , Code ; VAr_Temp_Max_Heater ; "/" ; Var_Temp_Min_Heater

Code = "  " + Re + Laam_koochak + Vav + Kaaf_koochak + " ="
Lcdat 6 , 1 , Code ; VAr_Temp_Max_COOLER ; "/" ; Var_Temp_Min_COOLER

Lcdat 7 , 1 , "CO =" ; Var_High_Limit
End If
'''''''''''''''''''''''''''''''''''''''''''''
If Switch_Fan = 1 And Key = 1 Then
   Key = 0
 Sw_Fan = S_Fan
    WaItms 10
   If S_fan = 0 Then
    S_Fan = 1
   Else
    S_Fan = 0
   End If
End If
'''''''''''''''''''''''''''''''''''''''''''''
If Switch_Heater = 1 And Key = 1 Then
   Key = 0
 Sw_Heater = S_Heater
    WaItms 10
   If S_Heater = 0 Then
    S_Heater = 1
   Else
    S_Heater = 0
   End If
End If
'''''''''''''''''''''''''''''''''''''''''''''
If Switch_COOLER = 1 And Key = 1 Then
   Key = 0
 Sw_COOLER = S_COOLER
    WaItms 10
   If S_COOLER = 0 Then
    S_COOLER = 1
   Else
    S_COOLER = 0
   End If
End If
'''''''''''''''''''''''''''''''''''''''''''''  Taze neveshtam chek kon
If Switch_glcd = 1 And Key = 1 Then
Key = 0
  If   POWER_GLCD = 0 Then
      POWER_GLCD = 1
   waitms 1500
  Else
   POWER_GLCD = 0
     End if
 End if
'''''''''''''''''''''''''''''''''''''''''''''
If Error_Buzzer_Chek = 1 Then
Gosub danjer_Chek
End If
'''''''''''''''''''''''''''''''''''''''''''''
If Key = 0 And Switch_menu = 0 And Switch_enter = 0 And Switch_up = 0 And Switch_down = 0 And Switch_Fan = 0 And Switch_Heater = 0 And Switch_glcd = 0  And Switch_COOLER = 0 Then
Key = 1 : Show = 0 : cls
End If
Loop
Return
'******************************************************************** SUB [Menu]

Menu:
Gosub Display_item_list
Do
If Switch_menu = 1 And Key = 1 Then
Key = 0
Gosub Main
End If

If Switch_enter = 1 And Key = 1 Then
Key = 0
Select Case Item_menu
Case 1:
Gosub Edit_date
Case 2:
Gosub Edit_time
Case 3:
Gosub Edit_weekday
Case 4:
Gosub Edit_co
Case 5:
Gosub Menu_fan
Case 6:
Gosub Menu_Heater
Case 7:
Gosub Menu_COOLER

End Select
End If

If Switch_up = 1 And Key = 1 Then
Key = 0
If Item_menu > 1 Then
Decr Item_menu
Else
Item_menu = 7
End If

Gosub Display_item_list
End If

If Switch_down = 1 And Key = 1 Then
Key = 0
If Item_menu < 7 Then
Incr Item_menu
Else
Item_menu = 1
End If

Gosub Display_item_list
End If

If Key = 0 And Switch_menu = 0 And Switch_enter = 0 And Switch_up = 0 And Switch_down = 0 And Switch_Fan = 0 And Switch_Heater = 0 Then
Key = 1
End If
Loop
Return

'*****************************************************SUB [Display_Item_list]
Display_item_list:
If Item_menu = 0 Then Item_menu = 1
Cls

Code = "    " + Te_bozorg + Alef_chasbaan + Mim_koochak + Ye_koochak + Zaa + Noon_koochak + Te_koochak + "     "
Lcdat 1 , 1 , Code
Select Case Item_menu

Case 1 :
Gosub Show_item
Code = "    " + Khe_bozorg + Ye_koochak + Re + Alef_chasbaan + Te_koochak + " " + Mim_bozorg + Ye_koochak + Zaa + Noon_koochak + Te_koochak + "<"
Lcdat 2 , 1 , Code , 1

Case 2 :
Gosub Show_item
Code = "     " + Te_bozorg + Ein_koochak + Alef_chasbaan + Sin_koochak + " " + Mim_bozorg + Ye_koochak + Zaa + Noon_koochak + Te_koochak + "<"
Lcdat 3 , 1 , Code , 1

Case 3 :
Gosub Show_item
Code = "      " + Ze + Vav + Re + " " + Mim_bozorg + Ye_koochak + Zaa + Noon_koochak + Te_koochak + "<"
Lcdat 4 , 1 , Code , 1

Case 4 :
Gosub Show_item
Code = "      " + Ze + Alef_chasbaan + Gaaf_koochak + " " + Mim_bozorg + Ye_koochak + Zaa + Noon_koochak + Te_koochak + "<"
Lcdat 5 , 1 , Code , 1

Case 5:
Gosub Show_item
Code = "       " + Noon_bozorg + Fe_koochak  + " " + Mim_bozorg + Ye_koochak + Zaa + Noon_koochak + Te_koochak + "<"
Lcdat 6 , 1 , Code , 1

Case 6:
Gosub Show_item
Code =  "    " + Ye_bozorg + Re + Alef_chasbaan + Khe_koochak + Be_koochak + " " + Mim_bozorg + Ye_koochak + Zaa + Noon_koochak + Te_koochak + "<"
Lcdat 7 , 1 , Code , 1

Case 7:
Gosub Show_item
Code =  "     " + Re + Laam_koochak + Vav + Kaaf_koochak + " " + Mim_bozorg + Ye_koochak + Zaa + Noon_koochak + Te_koochak + "<"
Lcdat 8 , 1 , Code , 1

End Select
Return
'*************************************************************** SUB [Show_Item]
Show_item:
Code = "     " + Khe_bozorg + Ye_koochak + Re + Alef_chasbaan + Te_koochak + " " + Mim_bozorg + Ye_koochak + Zaa + Noon_koochak + Te_koochak
Lcdat 2 , 1 , Code , 0
Code = "      " + Te_bozorg + Ein_koochak + Alef_chasbaan + Sin_koochak + " " + Mim_bozorg + Ye_koochak + Zaa + Noon_koochak + Te_koochak
Lcdat 3 , 1 , Code , 0
Code = "       " + Ze + Vav + Re + " " + Mim_bozorg + Ye_koochak + Zaa + Noon_koochak + Te_koochak
Lcdat 4 , 1 , Code , 0
Code = "       " + Ze + Alef_chasbaan + Gaaf_koochak + " " + Mim_bozorg + Ye_koochak + Zaa + Noon_koochak + Te_koochak
Lcdat 5 , 1 , Code , 0
Code = "        " + Noon_bozorg + Fe_koochak  + " " + Mim_bozorg + Ye_koochak + Zaa + Noon_koochak + Te_koochak
Lcdat 6 , 1 , Code , 0
Code =  "     " + Ye_bozorg + Re + Alef_chasbaan + Khe_koochak + Be_koochak + " " + Mim_bozorg + Ye_koochak + Zaa + Noon_koochak + Te_koochak
Lcdat 7 , 1 , Code , 0
Code =  "      " + Re + Laam_koochak + Vav + Kaaf_koochak + " " + Mim_bozorg + Ye_koochak + Zaa + Noon_koochak + Te_koochak
Lcdat 8 , 1 , Code , 0
Return

'******************************************************* Sub [Menu COOLER]
Menu_COOLER:
Gosub Display_Item_List_COOLER
Do
If Switch_Menu = 1 And Key = 1 Then
Key = 0
Gosub Menu
End If
''''''''''''''''''''''''''''''''''''''''''''
If Switch_Enter = 1 And Key = 1 Then
Key = 0

Select Case Item_Menu_COOLER

Case 1:
Gosub Edit_COOLER

Case 2:
Gosub Edit_COOLER_Auto

End Select
End If
''''''''''''''''''''''''''''''''''''''''''''
If Switch_Up = 1 And Key = 1 Then
key = 0
If Item_Menu_COOLER > 1 Then
Decr Item_Menu_COOLER
Else
Item_Menu_COOLER = 2
End If
Gosub Display_Item_List_COOLER
End If
''''''''''''''''''''''''''''''''''''''''''''
If Switch_Down = 1 And Key = 1 Then
key = 0
If Item_Menu_COOLER < 2 Then
Incr Item_Menu_COOLER
Else
Item_Menu_COOLER = 1
End If
Gosub Display_Item_List_COOLER
End If
''''''''''''''''''''''''''''''''''''''''''''
If Key = 0 And Switch_menu = 0 And Switch_enter = 0 And Switch_up = 0 And Switch_down = 0 And Switch_Fan = 0 And Switch_Heater = 0 Then
Key = 1
End If
Loop
Return
'*************************************************************** Sub [ Display_Item_List_COOLER]
Display_Item_List_COOLER:
If Item_Menu_COOLER = 0 Then Item_Menu_COOLER = 1
Cls
Code = "  " + Re + Laam_koochak + Vav + Kaaf_koochak +" " + Te_bozorg + Alef_chasbaan + Mim_koochak + Ye_koochak + Zaa + Noon_koochak + Te_koochak + "  "
Lcdat 1 , 1 , Code
Select Case Item_Menu_COOLER

Case 1:
Gosub Show_Item_COOLER
Code = "     " + Re + Laam_koochak + Vav + Kaaf_koochak + " " + Mim_bozorg + Ye_koochak + Zaa + Noon_koochak + Te_koochak + "<"
Lcdat 2 , 1 , Code , 1

Case 2:
Gosub Show_Item_COOLER
Code = "    " + Re + Laam_koochak + Vav + Kaaf_koochak + " " + Te_bozorg + Alef_chasbaan + Mim_koochak + Vav + Te_koochak + Alef+"<"
Lcdat 3 , 1 , Code , 1

End Select
Return
'*************************************************************** Sub [ Show_Item_COOLER]
Show_Item_COOLER:

Code = "      " + Re + Laam_koochak + Vav + Kaaf_koochak + " " + Mim_bozorg + Ye_koochak + Zaa + Noon_koochak + Te_koochak
Lcdat 2 , 1 , Code , 0

Code = "     " + Re + Laam_koochak + Vav + Kaaf_koochak +" "+ Te_bozorg + Alef_chasbaan + Mim_koochak + Vav + Te_koochak + Alef
Lcdat 3 , 1 , Code , 0
Return
'******************************************************* Sub [Menu Fan]
Menu_Fan:
Gosub Display_Item_List_Fan
Do
If Switch_Menu = 1 And Key = 1 Then
Key = 0
Gosub Menu
End If
''''''''''''''''''''''''''''''''''''''''''''
If Switch_Enter = 1 And Key = 1 Then
Key = 0

Select Case Item_Menu_Fan

Case 1:
Gosub Edit_Fan

Case 2:
Gosub Edit_Fan_Auto

End Select
End If
''''''''''''''''''''''''''''''''''''''''''''
If Switch_Up = 1 And Key = 1 Then
key = 0
If Item_Menu_Fan > 1 Then
Decr Item_Menu_Fan
Else
Item_Menu_Fan = 2
End If
Gosub Display_Item_List_Fan
End If
''''''''''''''''''''''''''''''''''''''''''''
If Switch_Down = 1 And Key = 1 Then
key = 0
If Item_Menu_Fan < 2 Then
Incr Item_Menu_Fan
Else
Item_Menu_Fan = 1
End If
Gosub Display_Item_List_Fan
End If
''''''''''''''''''''''''''''''''''''''''''''
If Key = 0 And Switch_menu = 0 And Switch_enter = 0 And Switch_up = 0 And Switch_down = 0 And Switch_Fan = 0 And Switch_Heater = 0 Then
Key = 1
End If
Loop
Return
'*************************************************************** Sub [ Display_Item_List_Fan]
Display_Item_List_Fan:
If Item_Menu_Fan = 0 Then Item_Menu_Fan = 1
Cls
Code = "   " + Noon_bozorg + Fe_koochak + " " + Te_bozorg + Alef_chasbaan + Mim_koochak + Ye_koochak + Zaa + Noon_koochak + Te_koochak + "   "
Lcdat 1 , 1 , Code
Select Case Item_Menu_Fan

Case 1:
Gosub Show_Item_FAn
Code = "  " + Noon_bozorg + Fe_koochak + " " + Ye_bozorg + Alef_chasbaan + Mim_koochak + Daal+ " " + Mim_bozorg + Ye_koochak + Zaa + Noon_koochak + Te_koochak + "<"
Lcdat 2 , 1 , Code , 1

Case 2:
Gosub Show_Item_Fan
Code = "     "+ Alef_chasbaan + Mim_koochak + Daal +" "+ Te_bozorg + Alef_chasbaan + Mim_koochak + Vav + Te_koochak + Alef+"<"
Lcdat 3 , 1 , Code , 1

End Select
Return
'*************************************************************** Sub [ Show_Item_Fan]
Show_Item_Fan:

Code ="   " + Noon_bozorg + Fe_koochak + " " + Ye_bozorg + Alef_chasbaan + Mim_koochak + Daal+ " " + Mim_bozorg + Ye_koochak + Zaa + Noon_koochak + Te_koochak
Lcdat 2 , 1 , Code , 0

Code ="      "+ Alef_chasbaan + Mim_koochak + Daal +" "+ Te_bozorg + Alef_chasbaan + Mim_koochak + Vav + Te_koochak + Alef
Lcdat 3 , 1 , Code , 0
Return
'******************************************************* Sub [Menu Heater]
Menu_Heater:
Gosub Display_Item_List_Heater
Do
If Switch_Menu = 1 And Key = 1 Then
Key = 0
Gosub Menu
End If
''''''''''''''''''''''''''''''''''''''''''''
If Switch_Enter = 1 And Key = 1 Then
Key = 0

Select Case Item_Menu_Heater

Case 1:
Gosub Edit_Heater

Case 2:
Gosub Edit_Heater_Auto

End Select
End If
''''''''''''''''''''''''''''''''''''''''''''
If Switch_Up = 1 And Key = 1 Then
key = 0
If Item_Menu_heater > 1 Then
Decr Item_Menu_heater
Else
Item_Menu_heater = 2
End If
Gosub Display_Item_List_Heater
End If
''''''''''''''''''''''''''''''''''''''''''''
If Switch_Down = 1 And Key = 1 Then
key = 0
If Item_Menu_heater < 2 Then
Incr Item_Menu_heater
Else
Item_Menu_heater = 1
End If
Gosub Display_Item_List_heater
End If
''''''''''''''''''''''''''''''''''''''''''''
If Key = 0 And Switch_menu = 0 And Switch_enter = 0 And Switch_up = 0 And Switch_down = 0 And Switch_Fan = 0 And Switch_Heater = 0 Then
Key = 1
End If
Loop
Return
'*************************************************************** Sub [ Display_Item_List_Heater]
Display_Item_List_Heater:
If Item_Menu_Heater = 0 Then Item_Menu_Heater = 1
Cls
Code = " "+Ye_bozorg + Re + Alef_chasbaan + Khe_koochak + Be_koochak  +" " + Te_bozorg + Alef_chasbaan + Mim_koochak + Ye_koochak + Zaa + Noon_koochak + Te_koochak + "  "
Lcdat 1 , 1 , Code
Select Case Item_Menu_Heater

Case 1:
Gosub Show_Item_Heater
Code = "    " + Ye_bozorg + Re + Alef_chasbaan + Khe_koochak + Be_koochak + " " + Mim_bozorg + Ye_koochak + Zaa + Noon_koochak + Te_koochak + "<"
Lcdat 2 , 1 , Code , 1

Case 2:
Gosub Show_Item_Heater
Code = "     " + Alef_chasbaan + Mim_koochak + Daal +" "+ Te_bozorg + Alef_chasbaan + Mim_koochak + Vav + Te_koochak + Alef+"<"
Lcdat 3 , 1 , Code , 1

End Select
Return
'*************************************************************** Sub [ Show_Item_Heater]
Show_Item_Heater:

Code = "     " + Ye_bozorg + Re + Alef_chasbaan + Khe_koochak + Be_koochak + " " + Mim_bozorg + Ye_koochak + Zaa + Noon_koochak + Te_koochak
Lcdat 2 , 1 , Code , 0

Code = "      " + Alef_chasbaan + Mim_koochak + Daal +" "+ Te_bozorg + Alef_chasbaan + Mim_koochak + Vav + Te_koochak + Alef
Lcdat 3 , 1 , Code , 0
Return
'*************************************************************** SUB [Edit_Date]
Edit_date:
Var_lcd = 0
Select_var_date = 0
Cls
Code = "   " + Khe_bozorg + Ye_koochak + Re + Alef_chasbaan + Te_koochak + " " + Mim_bozorg + Ye_koochak + Zaa + Noon_koochak + Te_koochak + "  "
Lcdat 1 , 1 , Code , 0
Strg = Str(sh_year)
Strg3 = Mid(strg , 3 , 2)
Do
Incr Var_lcd
If Var_lcd > 999 Then
Var_lcd = 0
Toggle Show_lcd
If Select_var_date = 0 Then
If Show_lcd = 0 Then
Lcdat 4 , 1 , "DATE: " ; Strg3 ; "/" ; Sh_month ; "/" ; Sh_day ; "  "
Else
Lcdat 4 , 1 , "DATE: " ; "  " ; "/" ; Sh_month ; "/" ; Sh_day ; "  "
End If
End If
If Select_var_date = 1 Then
If Show_lcd = 0 Then
Lcdat 4 , 1 , "DATE: " ; Strg3 ; "/" ; Sh_month ; "/" ; Sh_day ; "  "
Else
If Sh_month > 9 Then
Lcdat 4 , 1 , "DATE: " ; Strg3 ; "/" ; "  " ; "/" ; Sh_day ; "  "
Else
Lcdat 4 , 1 , "DATE: " ; Strg3 ; "/" ; " " ; "/" ; Sh_day ; "  "
End If
End If
End If
If Select_var_date = 2 Then
If Show_lcd = 0 Then
Lcdat 4 , 1 , "DATE: " ; Strg3 ; "/" ; Sh_month ; "/" ; Sh_day ; "  "
Else
Lcdat 4 , 1 , "DATE: " ; Strg3 ; "/" ; Sh_month ; "/" ; "    "
End If
End If
End If
If Switch_menu = 1 And Key = 1 Then
Key = 0
Gosub Sh_to_m
_year = M_year - 2000
M_day = Makebcd(m_day) : M_month = Makebcd(m_month) : _year = Makebcd(_year)
I2cstart
I2cwbyte Ds1307w
I2cwbyte 4
I2cwbyte M_day
I2cwbyte M_month
I2cwbyte _year
I2cstop
Gosub Menu
End If
If Switch_enter = 1 And Key = 1 Then
Key = 0
Incr Select_var_date
If Select_var_date > 2 Then Select_var_date = 0
End If
If Switch_up = 1 And Key = 1 Then
Key = 0
If Select_var_date = 0 Then
If Sh_year < 1470 Then
Incr Sh_year
Else
Sh_year = 1390
End If
Strg = Str(sh_year)
Strg3 = Mid(strg , 3 , 2)
End If
If Select_var_date = 1 Then
If Sh_month < 12 Then
Incr Sh_month
Else
Sh_month = 1
End If
End If
If Select_var_date = 2 Then
If Sh_day < 31 Then
Incr Sh_day
Else
Sh_day = 1
End If
End If
End If
If Switch_down = 1 And Key = 1 Then
Key = 0
If Select_var_date = 0 Then
If Sh_year > 1390 Then
Decr Sh_year
Else
Sh_year = 1470
End If
Strg = Str(sh_year)
Strg3 = Mid(strg , 3 , 2)
End If
If Select_var_date = 1 Then
If Sh_month > 1 Then
Decr Sh_month
Else
Sh_month = 12
End If
End If
If Select_var_date = 2 Then
If Sh_day > 1 Then
Decr Sh_day
Else
Sh_day = 31
End If
End If
End If
If Key = 0 And Switch_menu = 0 And Switch_enter = 0 And Switch_up = 0 And Switch_down = 0 Then
Key = 1
End If
Loop
Return
'*************************************************************** SUB [Edit_Time]
Edit_time:
Var_lcd = 0
Select_var = 0
Cls
Code = "   " + Te_bozorg + Ein_koochak + Alef_chasbaan + Sin_koochak + " " + Mim_bozorg + Ye_koochak + Zaa + Noon_koochak + Te_koochak + "   "
Lcdat 1 , 1 , Code , 0
Do
Incr Var_lcd
If Var_lcd > 999 Then
Var_lcd = 0
Toggle Show_lcd
If Select_var = 0 Then
If Show_lcd = 0 Then
Lcdat 4 , 1 , "Time = " ; Hour ; ":" ; Mine ; "    "
Else
If Hour > 9 Then
Lcdat 4 , 1 , "Time =   " ; ":" ; Mine ; "    "
Else
Lcdat 4 , 1 , "Time =  " ; ":" ; Mine ; "    "
End If
End If
End If
If Select_var = 1 Then
If Show_lcd = 0 Then
Lcdat 4 , 1 , "Time = " ; Hour ; ":" ; Mine ; "    "
Else
Lcdat 4 , 1 , "Time = " ; Hour ; ":" ; "      "
End If
End If
End If
If Switch_menu = 1 And Key = 1 Then
Key = 0 : Seco = 0
Seco = Makebcd(seco) : Mine = Makebcd(mine) : Hour = Makebcd(hour)
I2cstart
I2cwbyte Ds1307w
I2cwbyte 0
I2cwbyte Seco
I2cwbyte Mine
I2cwbyte Hour
I2cstop
Gosub Menu
End If
If Switch_enter = 1 And Key = 1 Then
Key = 0
Toggle Select_var
End If
If Switch_up = 1 And Key = 1 Then
Key = 0
If Select_var = 0 Then
If Hour < 23 Then
Incr Hour
Else
Hour = 0
End If
End If
If Select_var = 1 Then
If Mine < 59 Then
Incr Mine
Else
Mine = 0
End If
End If
End If
If Switch_down = 1 And Key = 1 Then
Key = 0
If Select_var = 0 Then
If Hour > 0 Then
Decr Hour
Else
Hour = 23
End If
End If
If Select_var = 1 Then
If Mine > 0 Then
Decr Mine
Else
Mine = 59
End If
End If
End If
If Key = 0 And Switch_menu = 0 And Switch_enter = 0 And Switch_up = 0 And Switch_down = 0 Then
Key = 1
End If
Loop
Return
'************************************************************ SUB [Edit_Weekday]
Edit_weekday:
Cls
Code = "    " + Ze + Vav + Re + " " + Mim_bozorg + Ye_koochak + Zaa + Noon_koochak + Te_koochak + "   "
Lcdat 1 , 1 , Code
Gosub Weekday_item
Do
If Switch_menu = 1 And Key = 1 Then
Key = 0
Gosub Sh_to_m
_year = M_year - 2000
Weekday = Makebcd(weekday)
I2cstart
I2cwbyte Ds1307w
I2cwbyte 3
I2cwbyte Weekday
I2cstop
Gosub Menu
End If
If Switch_up = 1 And Key = 1 Then
Key = 0
If Weekday > 1 Then
Decr Weekday
Else
Weekday = 7
End If
Gosub Weekday_item
End If
If Switch_down = 1 And Key = 1 Then
Key = 0
If Weekday < 7 Then
Incr Weekday
Else
Weekday = 1
End If
Gosub Weekday_item
End If
If Key = 0 And Switch_menu = 0 And Switch_enter = 0 And Switch_up = 0 And Switch_down = 0 Then
Key = 1
End If
Loop
Return
'************************************************************ SUB [Weekday_Item]
Weekday_item:
Select Case Weekday
Case 1 :
Gosub Show_weekday_item
Code = "           " + He_koochak + Be_koochak + Noon_koochak + Shin_koochak + "<"
Lcdat 2 , 1 , Code , 1
Case 2 :
Gosub Show_weekday_item
Code = "         " + He_koochak + Be_koochak + Noon_koochak + Shin_koochak + Kaaf_koochak + Ye_koochak + "<"
Lcdat 3 , 1 , Code , 1
Case 3 :
Gosub Show_weekday_item
Code = "         " + He_koochak + Be_koochak + Noon_koochak + Shin_koochak + Vav + Daal + "<"
Lcdat 4 , 1 , Code , 1
Case 4 :
Gosub Show_weekday_item
Code = "         " + He_koochak + Be_koochak + Noon_koochak + Shin_koochak + He_koochak + Sin_koochak + "<"
Lcdat 5 , 1 , Code , 1
Case 5 :
Gosub Show_weekday_item
Code = "       " + He_koochak + Be_koochak + Noon_koochak + Shin_koochak + Re + Alef_chasbaan + He_vasat + Che_koochak + "<"
Lcdat 6 , 1 , Code , 1
Case 6 :
Gosub Show_weekday_item
Code = "        " + He_koochak + Be_koochak + Noon_koochak + Shin_koochak + Jim_bozorg + Noon_koochak + Pe_koochak + "<"
Lcdat 7 , 1 , Code , 1
Case 7 :
Gosub Show_weekday_item
Code = "           " + He_koochak + Ein_vasat + Mim_koochak + Jim_koochak + "<"
Lcdat 8 , 1 , Code , 1
End Select
Return
'******************************************************* SUB [Show_Weekday_Item]
Show_weekday_item:
Code = "            " + He_koochak + Be_koochak + Noon_koochak + Shin_koochak
Lcdat 2 , 1 , Code
Code = "          " + He_koochak + Be_koochak + Noon_koochak + Shin_koochak + Kaaf_koochak + Ye_koochak
Lcdat 3 , 1 , Code
Code = "          " + He_koochak + Be_koochak + Noon_koochak + Shin_koochak + Vav + Daal
Lcdat 4 , 1 , Code
Code = "          " + He_koochak + Be_koochak + Noon_koochak + Shin_koochak + He_koochak + Sin_koochak
Lcdat 5 , 1 , Code
Code = "        " + He_koochak + Be_koochak + Noon_koochak + Shin_koochak + Re + Alef_chasbaan + He_vasat + Che_koochak
Lcdat 6 , 1 , Code
Code = "         " + He_koochak + Be_koochak + Noon_koochak + Shin_koochak + Jim_bozorg + Noon_koochak + Pe_koochak
Lcdat 7 , 1 , Code
Code = "            " + He_koochak + Ein_vasat + Mim_koochak + Jim_koochak
Lcdat 8 , 1 , Code
Return
'****************************************************************** SUB [Ds1307]
Ds1307:
I2cstart
I2cwbyte Ds1307w
I2cwbyte 0
I2cstart
I2cwbyte Ds1307r
I2crbyte Seco , Ack
I2crbyte Mine , Ack
I2crbyte Hour , Ack
I2crbyte Weekday , Ack                                      ' Day of Week
I2crbyte M_day , Ack                                        ' Day of Month
I2crbyte M_month , Ack                                      ' Month of Year
I2crbyte _year , Nack                                       ' Year
I2cstop
Seco = Makedec(seco) : Mine = Makedec(mine) : Hour = Makedec(hour)
M_day = Makedec(m_day) : M_month = Makedec(m_month) : _year = Makedec(_year)
Weekday = Makedec(weekday)
M_year = 2000 + _year
If Seco > 59 Or Mine > 59 Or Hour > 23 Then
Seco = 0 : Mine = 0 : Hour = 0
_year = 17 : M_month = 12 : M_day = 18
Seco = Makebcd(seco) : Mine = Makebcd(mine) : Hour = Makebcd(hour)
M_day = Makebcd(m_day) : M_month = Makebcd(m_month) : _year = Makebcd(_year)
Weekday = Makebcd(weekday)
I2cstart
I2cwbyte Ds1307w
I2cwbyte 0
I2cwbyte Seco
I2cwbyte Mine
I2cwbyte Hour
I2cwbyte Weekday
I2cwbyte M_day
I2cwbyte M_month
I2cwbyte _year
I2cstop
End If
Return
'***************************************************************** SUB [M_to_sh]
M_to_sh:
If M_kabise(m_year) = 0 Then
Day_of_month(2) = 28
Else
Day_of_month(2) = 29
End If
'-----------------------------------------------------
Conter2 = M_month - 1
Kole_roz_m = 0
For Conter1 = 1 To Conter2
Kole_roz_m = Kole_roz_m + Day_of_month(conter1)
Next
Kole_roz_m = Kole_roz_m + M_day
'-----------------------------------------------------
If Kole_roz_m > 79 Then
Sh_year = M_year - 621
Kole_roz_sh = Kole_roz_m - 79
Else
Sh_year = M_year - 622
Temp1 = M_year - 1
Temp2 = M_kabise(temp1)
If Temp2 = 0 Then
Kole_roz_sh = Kole_roz_m + 286
Else
Kole_roz_sh = Kole_roz_m + 287
End If
End If
'-----------------------------------------------------
Sh_month = 1
While Kole_roz_sh > 30
If Sh_month < 7 Then
Kole_roz_sh = Kole_roz_sh - 31
Else
Kole_roz_sh = Kole_roz_sh - 30
End If
Incr Sh_month
Wend
'-----------------------------------------------------
If Kole_roz_sh = 0 Then
Decr Sh_month
If Sh_month < 7 Then
Sh_day = 31
Else
Sh_day = 30
End If
Else
Sh_day = Kole_roz_sh
End If
Return
'***************************************************************** SUB [Sh_to_m]
Sh_to_m:
Kole_roz_sh = 0
If Sh_month > 6 Then
Kole_roz_sh = 186
Temp1 = Sh_month - 7
Temp1 = Temp1 * 30
Kole_roz_sh = Kole_roz_sh + Temp1
Else
Temp1 = Sh_month - 1
Temp1 = Temp1 * 31
Kole_roz_sh = Kole_roz_sh + Temp1
End If
Kole_roz_sh = Kole_roz_sh + Sh_day
'-----------------------------------------------------
If Kole_roz_sh > 286 Then
M_year = Sh_year + 622
Kole_roz_m = Kole_roz_sh - 286
Else
M_year = Sh_year + 621
Kole_roz_m = Kole_roz_sh + 79
End If
'-----------------------------------------------------
Temp2 = M_kabise(m_year)
If Temp2 = 0 Then
Day_of_month(2) = 28
Else
Day_of_month(2) = 29
End If
'-----------------------------------------------------
For M_month = 1 To 12
If Kole_roz_m < 31 Then Exit For
Kole_roz_m = Kole_roz_m - Day_of_month(m_month)
Next
'-----------------------------------------------------
If Kole_roz_m > Day_of_month(m_month) Then
Kole_roz_m = Kole_roz_m - Day_of_month(conter1)
Incr M_month
End If
M_day = Kole_roz_m
Return
'************************************************************ SUB [Show_Weekday]
Show_weekday:
Select Case Weekday:
Case 1:
Code = He_koochak + Be_koochak + Noon_koochak + Shin_koochak
Lcdat 3 , 1 , Code
Case 2:
Code = He_koochak + Be_koochak + Noon_koochak + Shin_koochak + Kaaf_koochak + Ye_koochak
Lcdat 3 , 1 , Code
Case 3:
Code = He_koochak + Be_koochak + Noon_koochak + Shin_koochak + Vav + Daal
Lcdat 3 , 1 , Code
Case 4:
Code = He_koochak + Be_koochak + Noon_koochak + Shin_koochak + He_koochak + Sin_koochak
Lcdat 3 , 1 , Code
Case 5:
Code = He_koochak + Be_koochak + Noon_koochak + Shin_koochak + Re + Alef_chasbaan + He_vasat + Che_koochak
Lcdat 3 , 1 , Code
Case 6:
Code = He_koochak + Be_koochak + Noon_koochak + Shin_koochak + Jim_bozorg + Noon_koochak + Pe_koochak
Lcdat 3 , 1 , Code
Case 7:
Code = He_koochak + Ein_vasat + Mim_koochak + Jim_koochak
Lcdat 3 , 1 , Code
End Select
Return
'***********************************************************sub [adc_co2]
adc_co2:
Adc_value = Getadc(0)
waitms 10
Volt = Adc_value * 0.004887585532746823069403714565
V_str = Fusing(volt , "#.&&")
Temp3 = 1.0698 * Volt                                    'CO Sensors
Temp4 = 2.71 ^ Temp3
Ppm = 3.027 * Temp4
Return
'***********************************************************sub [Chek_Rly_co]
Chek_rly_co:
ppm_Chek = ppm
Waitms 1
Var_High_Limit_Chek = Var_High_Limit
Waitms 1
Error_Buzzer_chek = Error_Buzzer
Waitms 1
'''''''''''''''''''''''''''''''''''''''''''''''''''''''''
If ppm_Chek >= Var_high_Limit_Chek Then
waitms 1
Sunroof_rl1 = 1
Door1_rl2 = 1
Door2_rl3 = 1
waitms 750
'Buzzer = 1
Sound PORTa.1 , 500 , 400
Sound PORTa.1 , 400 , 500
Sound PORTa.1 , 300 , 600
Sound PORTa.1 , 200 , 300
Sound PORTa.1 , 100 , 200
Sound PORTa.1 , 50 , 100
Sound PORTa.1 , 5 , 50
Sound PORTa.1 , 800 , 500
Sound PORTa.1 , 900 , 100
Sunroof_rl1 = 0
Door1_rl2 = 0
Door2_rl3 = 0
End If
If ppm_Chek < Var_high_Limit_Chek Then
Sunroof_rl1 = 0
Door1_rl2 = 0
Door2_rl3 = 0
End If
Return
'***********************************************************SUB [Edit_co]
Edit_co:
Cls
Code = "   " +  Ze + Alef_chasbaan + Gaaf_koochak + " " + Mim_bozorg + Ye_koochak + Zaa + Noon_koochak + Te_koochak + "   "
Lcdat 1 , 1 , Code , 0
Code = Noon_bozorg + Be_koochak + Re + Kaaf_koochak + Daal + Ye_koochak + Sin_koochak + Kaaf_koochak + Vav + Noon_koochak + Vav + Mim_koochak + " =  "
Lcdat 4 , 1 , Code

Do
lcdat 6 , 1 ,  "    " ; Var_High_limit ; " " ; "PPM";" "

If switch_menu = 1 And key = 1 then
key = 0
High_Limit=Var_High_Limit
Waitms 10
Gosub menu
End If


If Switch_up = 1 And key = 1 Then
key = 0
If Var_High_Limit < 200 Then
Incr Var_High_Limit
End If
End If

If Switch_down = 1 And key = 1 Then
key = 0
If Var_High_Limit > 30 Then
Decr Var_High_Limit
End If
End If

If key = 0 And Switch_menu = 0 And Switch_Enter = 0 And Switch_up = 0 And Switch_Down = 0 Then
Key = 1
End If
Loop
Return
'*************************************************************** SUB [Chek_Temp]
Chek_temp:
Clk = 1
Cs = 0
Waitms 100
Shiftin So , Clk , TTemp , 0 , 16 , 100
Cs = 1
Shift TTemp , Right , 3
TTemp = TTemp And &B0000111111111111
TTemp1 = TTemp * 0.25
TTemp1 = TTemp1 - 1
Return
'**************************************************************** SUB [Chek_Rly]
Chek_rly:
Temp_chek = TTemp1
Waitms 1
Var_temp_max_chek = Var_temp_max
Waitms 1
Var_Temp_Min_Heater_Chek = Var_Temp_Min_Heater
Waitms 1
S_Fan_Chek = S_Fan
Waitms 1
Tafazole_Dama_Fan = Var_temp_max_chek - Var_Temp_Min_Heater_Chek
''''''''''''''''''''''''''''''''''''''
If S_Fan_Chek =1 Then
     If Temp_chek > Tafazole_Dama_Fan Then
      Fan_radiator_k2 = 1
      Fan_led_green = 0
      Fan_led_red = 1
     Else
      Fan_radiator_k2 = 0
      Fan_led_green = 1
      Fan_led_red = 0
     End If
Else
      Fan_radiator_k2 = 0
      Fan_led_green = 0
      Fan_led_red = 0
End If
Return
End
'***********************************************************sub [Edit_fan]
Edit_fan:
Cls
Code =  "   " + Noon_bozorg + Fe_koochak + " " + Te_bozorg + Alef_chasbaan + Mim_koochak + Ye_koochak + Zaa + Noon_koochak + Te_koochak + "   "
Lcdat 1 , 1 , Code , 0
Lcdat 3 , 1 , "EDIT TEMP FAN ="
Do
lcdat 2 , 1 , "  " ; Var_temp_max ; "  "

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''Set KeyPad
If Switch_menu = 1 And Key = 1 Then
Key = 0
Temp_max = Var_temp_max
Waitms 10
Gosub Menu_Fan
End If
If Switch_enter = 1 And Key = 1 Then
Key = 0
End If
If Switch_up = 1 And Key = 1 Then
Key = 0
If Var_temp_max < 100 Then
Incr Var_temp_max
End If
End If
If Switch_down = 1 And Key = 1 Then
Key = 0
If Var_temp_max > 0 Then
Decr Var_temp_max
End If
End If
If Key = 0 And Switch_menu = 0 And Switch_enter = 0 And Switch_up = 0 And Switch_down = 0 Then
Key = 1
End If
Loop
Return
'*************************************************************** SUB [ Edit_Fan_Auto ]
Edit_Fan_Auto:
Cls
Code =  "   " + Noon_bozorg + Fe_koochak + " " + Te_bozorg + Alef_chasbaan + Mim_koochak + Ye_koochak + Zaa + Noon_koochak + Te_koochak + "   "
Lcdat 1 , 1 , Code , 0
Lcdat 3 , 1 , "EDIT TEMP AUTO ="
Do
Lcdat 2 , 1 , " " ; Var_Temp_Min_Fan ; " "
'''''''''''''''''''''''''''''''''''''''''''''''''
If Switch_Menu = 1 And Key = 1 Then
Key = 0
Temp_Min_Fan = Var_Temp_Min_Fan
Waitms 10
Gosub Menu_Fan
End If
'''''''''''''''''''''''''''''''''''''''''''''''''
If Switch_Enter = 1 And Key = 1 Then
Key = 0
End If
'''''''''''''''''''''''''''''''''''''''''''''''''
If Switch_Up = 1 And Key = 1 Then
Key = 0
If Var_Temp_Min_Fan < 10 Then
Incr Var_Temp_Min_Fan
End If
End If
''''''''''''''''''''''''''''''''''''''''''''''''
If Switch_Down = 1 And Key = 1 Then
Key = 0
If Var_Temp_Min_Fan > 0 Then
Decr Var_Temp_Min_Fan
End If
End If

If Key = 0 And Switch_menu = 0 And Switch_enter = 0 And Switch_up = 0 And Switch_down = 0 Then
Key = 1
End If
Loop
Return
'***********************************************************Sub [chek heater]
Chek_heater:
MS = Getadc(2)
Waitms 10
DIN = MS /4
DAMAZS = DIN *  4.8828125'/ 2.04
DAMA = DAMAZS / 10
Return
'**************************************************************** SUB [Chek_Rly_Heater]
Chek_rly_Heater:
Temp_Heater_chek = Dama
Waitms 1
Var_temp_max_Heater_chek = Var_temp_max_Heater
Waitms 1
Var_temp_Min_Heater_chek = Var_temp_Min_Heater
Waitms 1
S_Heater_Chek = S_Heater
Waitms 1
Tafazole_Dama = Var_Temp_Max_Heater_Chek - Var_Temp_Min_Heater_Chek
   If ppm_Chek >= Var_High_Limit_Chek Then
   S_Heater = 0
   End If
If S_Heater = 0 Then
        Heater_K1 = 0
        Heater_Led_green = 0
        Heater_Led_Red = 0
       Else
If Temp_Heater_Chek < Tafazole_Dama Then
       If S_Heater_Chek = 1 Then
        Heater_K1 = 1
        Heater_Led_Red = 1
        Heater_Led_green = 0
       End If
Else
       If S_Heater_Chek = 1 Then
        Heater_K1 = 0
        Heater_Led_Green = 1
        Heater_Led_Red = 0
       End If
End If
End If
Return
End
Return

'*************************************************************** SUB [ Edit_Heater_Auto ]
Edit_Heater_Auto:
Cls
Code = " "+Ye_bozorg + Re + Alef_chasbaan + Khe_koochak + Be_koochak  +" " + Te_bozorg + Alef_chasbaan + Mim_koochak + Ye_koochak + Zaa + Noon_koochak + Te_koochak + "  "
Lcdat 1 , 1 , Code , 0
Lcdat 3 , 1 , "TEMP AUTO ="
Do
Lcdat 2 , 1 , " " ; Var_Temp_Min_Heater; " "
'''''''''''''''''''''''''''''''''''''''''''''''''
If Switch_Menu = 1 And Key = 1 Then
Key = 0
Temp_Min_Heater = Var_Temp_Min_Heater
Waitms 10
Gosub Menu_Heater
End If
'''''''''''''''''''''''''''''''''''''''''''''''''
If Switch_Enter = 1 And Key = 1 Then
Key = 0
End If
'''''''''''''''''''''''''''''''''''''''''''''''''
If Switch_Up = 1 And Key = 1 Then
Key = 0
If Var_Temp_Min_Heater < 10 Then
Incr Var_Temp_Min_Heater
End If
End If
''''''''''''''''''''''''''''''''''''''''''''''''
If Switch_Down = 1 And Key = 1 Then
Key = 0
If Var_Temp_Min_Heater > 0 Then
Decr Var_Temp_Min_Heater
End If
End If

If Key = 0 And Switch_menu = 0 And Switch_enter = 0 And Switch_up = 0 And Switch_down = 0 Then
Key = 1
End If
Loop
Return
'***********************************************************sub [Edit_Heater]
Edit_Heater:
Cls
Code = " "+Ye_bozorg + Re + Alef_chasbaan + Khe_koochak + Be_koochak  +" " + Te_bozorg + Alef_chasbaan + Mim_koochak + Ye_koochak + Zaa + Noon_koochak + Te_koochak + "  "
Lcdat 1 , 1 , Code , 0
Lcdat 3 , 1 , "TEMP HEATER ="
Do
lcdat 2 , 1 , "  " ; Var_temp_max_Heater ; "  "

''''''''''''''''''''''''''''''''''''''''''''Set KeyPad
If Switch_menu = 1 And Key = 1 Then
Key = 0
Temp_max_Heater = Var_temp_max_Heater
Waitms 10
Gosub Menu_Heater
End If
If Switch_enter = 1 And Key = 1 Then
Key = 0
End If
If Switch_up = 1 And Key = 1 Then
Key = 0
If Var_Temp_Max_Heater < 45 Then
Incr Var_Temp_Max_Heater
End If
End If
If Switch_down = 1 And Key = 1 Then
Key = 0
If Var_Temp_Max_Heater > 15 Then
Decr Var_Temp_Max_Heater
End If
End If
If Key = 0 And Switch_menu = 0 And Switch_enter = 0 And Switch_up = 0 And Switch_down = 0 Then
Key = 1
End If
Loop
Return
'***********************************************************Sub [chek COOLER]
Chek_COOLER:
Din0 = Getadc(2)
Waitms 20

Din1 = Getadc(2)
Waitms 20

Din2 = Getadc(2)
Waitms 20

Din3 = Getadc(2)
Waitms 20

Din4= din0 + din1
Waitms 20

din5 = din2 + din3
Waitms  20

din = din4 + din5
Waitms 20

Damak = Din / 2.04
Return
'**************************************************************** SUB [Chek_Rly_COOLER]
Chek_rly_COOLER:
Temp_COOLER_chek = Damak
Waitms 1
Var_temp_max_COOLER_chek = Var_temp_max_COOLER
Waitms 1
Var_temp_Min_COOLER_chek = Var_temp_Min_COOLER
Waitms 1
S_COOLER_Chek = S_COOLER
Waitms 1
Tafazole_Dama = Var_Temp_Max_COOLER_Chek - Var_Temp_Min_COOLER_Chek
   If ppm_Chek >= Var_High_Limit_Chek Then
   S_Heater = 0
   End If
If S_COOLER = 0 Then
       COOLER_K1 = 0
       COOLER_Led_green = 0
        COOLER_Led_Red = 0
       Else
If Temp_COOLER_Chek < Tafazole_Dama Then
       If S_COOLER_Chek = 1 Then
        COOLER_K1 = 1
        COOLER_Led_Red = 1
       COOLER_Led_green = 0
       End If
Else
       If S_COOLER_Chek = 1 Then
        COOLER_K1 = 0
        COOLER_Led_Green = 1
        COOLER_Led_Red = 0
       End If
End If
End If
Return
End
Return

'*************************************************************** SUB [ Edit_COOLER_Auto ]
Edit_COOLER_Auto:
Cls
Code = "  " + Re + Laam_koochak + Vav + Kaaf_koochak + " " + Te_bozorg + Alef_chasbaan + Mim_koochak + Ye_koochak + Zaa + Noon_koochak + Te_koochak + "  "
Lcdat 1 , 1 , Code , 0
Lcdat 3 , 1 , "TEMP AUTO ="
Do
Lcdat 2 , 1 , " " ; Var_Temp_Min_COOLER; " "
'''''''''''''''''''''''''''''''''''''''''''''''''
If Switch_Menu = 1 And Key = 1 Then
Key = 0
Temp_Min_COOLER = Var_Temp_Min_COOLER
Waitms 10
Gosub Menu_COOLER
End If
'''''''''''''''''''''''''''''''''''''''''''''''''
If Switch_Enter = 1 And Key = 1 Then
Key = 0
End If
'''''''''''''''''''''''''''''''''''''''''''''''''
If Switch_Up = 1 And Key = 1 Then
Key = 0
If Var_Temp_Min_COOLER < 10 Then
Incr Var_Temp_Min_COOLER
End If
End If
''''''''''''''''''''''''''''''''''''''''''''''''
If Switch_Down = 1 And Key = 1 Then
Key = 0
If Var_Temp_Min_COOLER > 0 Then
Decr Var_Temp_Min_COOLER
End If
End If

If Key = 0 And Switch_menu = 0 And Switch_enter = 0 And Switch_up = 0 And Switch_down = 0 Then
Key = 1
End If
Loop
Return
'***********************************************************sub [Edit_COOLER]
Edit_COOLER:
Cls
Code = "  " + Re + Laam_koochak + Vav + Kaaf_koochak + " " + Te_bozorg + Alef_chasbaan + Mim_koochak + Ye_koochak + Zaa + Noon_koochak + Te_koochak + "  "
Lcdat 1 , 1 , Code , 0
Lcdat 3 , 1 , "TEMP COOLER ="
Do
lcdat 2 , 1 , "  " ; Var_temp_max_COOLER ; "  "

''''''''''''''''''''''''''''''''''''''''''''Set KeyPad
If Switch_menu = 1 And Key = 1 Then
Key = 0
Temp_max_COOLER = Var_temp_max_COOLER
Waitms 10
Gosub Menu_COOLER
End If
If Switch_enter = 1 And Key = 1 Then
Key = 0
End If
If Switch_up = 1 And Key = 1 Then
Key = 0
If Var_Temp_Max_COOLER < 40 Then
Incr Var_Temp_Max_COOLER
End If
End If
If Switch_down = 1 And Key = 1 Then
Key = 0
If Var_Temp_Max_COOLER > 20 Then
Decr Var_Temp_Max_COOLER
End If
End If
If Key = 0 And Switch_menu = 0 And Switch_enter = 0 And Switch_up = 0 And Switch_down = 0 Then
Key = 1
End If
Loop
Return
'***********************************************************sub [voltmetr]
voltmetr:
sampling = Getadc(1)
waitms 10
ad_pt = sampling
sample = ad_pt /204.6
sample =sample *11.3
sample = sample + 0.8
Return
'*********************************************************** Sub [ Danjer ]
Danjer_Chek:
Cls
Sw_Error_Buzzer = Error_Buzzer
Do

Gosub Adc_co2
ppm_Chek = ppm
Waitms 1
Var_High_Limit_Chek = Var_High_Limit
Waitms 1
Error_Buzzer_chek = Error_Buzzer
Waitms 1
''''''''''''''''''''''''''''''''''''''''''
If Error_Buzzer_Chek = 0 Then
  Buzzer = 0
  Gosub Main

Else
  Buzzer = 1
Showpic 0 , 0 , Danjer
Waitms 500
Cls
Code =  " " + Daal + Alef_chasbaan + Jim_koochak + Ye_koochak + Alef + " " + Te_koochak + Re + Vav + Saad_koochak + " " + Re + Daal + "  "
Lcdat 1 , 1 , Code

Code = " " + Laam_bozorg +  Ye_koochak + Alef_chasbaan + Sin_koochak + Vav + " " + Alef + Vav + He_chasbaan_avval + " " + He_koochak + Ye_koochak + Vav + He_vasat + Te_koochak
Lcdat 2 , 1 , Code

Code = Ghaaf_bozorg+ Alef_chasbaan + Jim_koochak + Alef + Daal + Noon_koochak + Noon_koochak + Alef_chasbaan + Mim_koochak + " "+ Alef + Ze + Alef_chasbaan + Mim_koochak + Re + Gaaf_Koochak
Lcdat 3 , 1 , Code

Code = " " + Alef + Re + " " + Alef_chasbaan + Jim_koochak + Re + Daal + " " + Ye_bozorg + Re + Alef_chasbaan + Khe_koochak + Be_koochak + " " + Vav + " "
Lcdat 4 , 1 , Code

Code = "  ." + Daal + Ye_koochak + Noon_koochak + Kaaf_koochak + " " + Shin_bozorg + Vav + Mim_koochak + Alef_chasbaan + Khe_koochak + "   "
Lcdat 5 , 1 , Code

Code = " DOWN" + Vav + "UP" + Daal + Ye_koochak + Laam_koochak + Kaaf_koochak + " " + Sin_bozorg + Pe_koochak + Sin_koochak
Lcdat 7 , 1 , Code

Code = Daal + Ye_koochak + He_chasbaan_avval + Daal + " " + Re + Alef_chasbaan + Shin_koochak + Fe_koochak + " " + Noon_bozorg + Alef_chasbaan + Mim_koochak + Ze + Mim_koochak + He_chasbaan_avval
Lcdat 8 , 1 , Code
Waitms 2500
End If
''''''''''''''''''''''''''''''''''''''''''
If ppm_Chek < Var_high_Limit_Chek Then
If Switch_Up = 1 And Switch_Down = 1 And key = 1 Then
Key = 0
Waitms 10
   If Error_Buzzer = 1 Then
   Error_Buzzer = 0
   End If
End If
End If
Loop
Return
'*********************************************************** Function [M_kabise]
Function M_kabise(byref Sal As Word)as Byte
Local T1 As Integer
Local T2 As Integer
Local T3 As Integer
Local B As Byte
'-----------------------------------------------------
T1 = Sal Mod 4
T2 = Sal Mod 100
T3 = Sal Mod 400
B = 0
'-----------------------------------------------------
If T1 = 0 And T2 <> 0 Then
B = 1
End If
'-----------------------------------------------------
If T2 = 0 And T3 = 0 Then
B = 1
End If
'-----------------------------------------------------
M_kabise = B
End Function
'********************************************************** Function [Sh_kabise]
Function Sh_kabise(byref Sal As Word)as Byte
Local T1 As Integer
Local B As Byte
'-----------------------------------------------------
T1 = Sal Mod 33
B = 0
If T1 = 1 Or T1 = 5 Or T1 = 9 Or T1 = 13 Or T1 = 17 Or T1 = 22 Or _
T1 = 26 Or T1 = 30 Then
B = 1
End If
'-----------------------------------------------------
Sh_kabise = B
End Function
'**************************************************************** STW
'STW:
'Stop Timer0
'Heater_Led_Red = 1
'Waitms 20
'Heater_led_Red = 0
'Waitms 20
'Timer0 = 6
'Start Timer0
'Return
'**************************************************************** Data [Font8x8]
$include "font8x8.font"
$include "font12x16.font"
'**************************************************************** pictur logo
Logo1:
   $bgf "Logo1.BGF"
Danjer:
  $bgf "Danjer.BGF"


'----------------------------------END PROGRAM----------------------------------
'Program Composer: mahdi heidarian
'------------------------------------------------------------------------------