/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x1cce1bb2 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Hunar Khanna/Desktop/CG3207/VHDL/lab2/cg3207-project/udiv32.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_1547270861_1035706684(char *, char *, char *, char *, char *, char *);
char *ieee_p_1242562249_sub_1919365254_1035706684(char *, char *, char *, char *, int );
char *ieee_p_1242562249_sub_2540846514_1035706684(char *, char *, char *, char *, int );
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );
char *ieee_p_2592010699_sub_1837678034_503743352(char *, char *, char *, char *);
unsigned char ieee_p_2592010699_sub_2507238156_503743352(char *, unsigned char , unsigned char );


static void work_a_3108379117_3212880686_p_0(char *t0)
{
    char t22[16];
    char t23[16];
    char *t1;
    unsigned char t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    unsigned char t7;
    unsigned int t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned char t13;
    unsigned int t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    int t20;
    unsigned int t21;
    int t24;
    int t25;
    int t26;
    int t27;
    int t28;
    int t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned char t33;
    unsigned char t34;
    unsigned char t35;
    char *t36;

LAB0:    xsi_set_current_line(56, ng0);
    t1 = (t0 + 1312U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 4192);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(57, ng0);
    t4 = (t0 + 2648U);
    t5 = *((char **)t4);
    t4 = (t0 + 1032U);
    t6 = *((char **)t4);
    t7 = 1;
    if (32U == 32U)
        goto LAB11;

LAB12:    t7 = 0;

LAB13:    if ((!(t7)) == 1)
        goto LAB8;

LAB9:    t10 = (t0 + 2768U);
    t11 = *((char **)t10);
    t10 = (t0 + 1192U);
    t12 = *((char **)t10);
    t13 = 1;
    if (32U == 32U)
        goto LAB17;

LAB18:    t13 = 0;

LAB19:    t3 = (!(t13));

LAB10:    if (t3 != 0)
        goto LAB5;

LAB7:
LAB6:    xsi_set_current_line(63, ng0);
    t1 = (t0 + 2288U);
    t4 = *((char **)t1);
    t2 = *((unsigned char *)t4);
    t3 = (t2 == (unsigned char)2);
    if (t3 != 0)
        goto LAB23;

LAB25:
LAB24:    goto LAB3;

LAB5:    xsi_set_current_line(58, ng0);
    t16 = xsi_get_transient_memory(32U);
    memset(t16, 0, 32U);
    t17 = t16;
    memset(t17, (unsigned char)2, 32U);
    t18 = (t0 + 2528U);
    t19 = *((char **)t18);
    t18 = (t19 + 0);
    memcpy(t18, t16, 32U);
    xsi_set_current_line(59, ng0);
    t1 = xsi_get_transient_memory(32U);
    memset(t1, 0, 32U);
    t4 = t1;
    memset(t4, (unsigned char)2, 32U);
    t5 = (t0 + 2408U);
    t6 = *((char **)t5);
    t5 = (t6 + 0);
    memcpy(t5, t1, 32U);
    xsi_set_current_line(60, ng0);
    t1 = (t0 + 2288U);
    t4 = *((char **)t1);
    t1 = (t4 + 0);
    *((unsigned char *)t1) = (unsigned char)2;
    goto LAB6;

LAB8:    t3 = (unsigned char)1;
    goto LAB10;

LAB11:    t8 = 0;

LAB14:    if (t8 < 32U)
        goto LAB15;
    else
        goto LAB13;

LAB15:    t4 = (t5 + t8);
    t9 = (t6 + t8);
    if (*((unsigned char *)t4) != *((unsigned char *)t9))
        goto LAB12;

LAB16:    t8 = (t8 + 1);
    goto LAB14;

LAB17:    t14 = 0;

LAB20:    if (t14 < 32U)
        goto LAB21;
    else
        goto LAB19;

LAB21:    t10 = (t11 + t14);
    t15 = (t12 + t14);
    if (*((unsigned char *)t10) != *((unsigned char *)t15))
        goto LAB18;

LAB22:    t14 = (t14 + 1);
    goto LAB20;

LAB23:    xsi_set_current_line(64, ng0);
    t1 = (t0 + 1512U);
    t5 = *((char **)t1);
    t7 = *((unsigned char *)t5);
    t13 = (t7 == (unsigned char)2);
    if (t13 != 0)
        goto LAB26;

LAB28:    xsi_set_current_line(68, ng0);
    t1 = (t0 + 1032U);
    t4 = *((char **)t1);
    t20 = (31 - 31);
    t8 = (t20 * -1);
    t14 = (1U * t8);
    t21 = (0 + t14);
    t1 = (t4 + t21);
    t2 = *((unsigned char *)t1);
    t3 = (t2 == (unsigned char)2);
    if (t3 != 0)
        goto LAB29;

LAB31:    xsi_set_current_line(71, ng0);
    t1 = (t0 + 1032U);
    t4 = *((char **)t1);
    t1 = (t0 + 7088U);
    t5 = ieee_p_2592010699_sub_1837678034_503743352(IEEE_P_2592010699, t23, t4, t1);
    t6 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t22, t5, t23, 1);
    t9 = (t0 + 2648U);
    t10 = *((char **)t9);
    t9 = (t10 + 0);
    t11 = (t22 + 12U);
    t8 = *((unsigned int *)t11);
    t14 = (1U * t8);
    memcpy(t9, t6, t14);

LAB30:    xsi_set_current_line(74, ng0);
    t1 = (t0 + 1192U);
    t4 = *((char **)t1);
    t20 = (31 - 31);
    t8 = (t20 * -1);
    t14 = (1U * t8);
    t21 = (0 + t14);
    t1 = (t4 + t21);
    t2 = *((unsigned char *)t1);
    t3 = (t2 == (unsigned char)2);
    if (t3 != 0)
        goto LAB32;

LAB34:    xsi_set_current_line(77, ng0);
    t1 = (t0 + 1192U);
    t4 = *((char **)t1);
    t1 = (t0 + 7104U);
    t5 = ieee_p_2592010699_sub_1837678034_503743352(IEEE_P_2592010699, t23, t4, t1);
    t6 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t22, t5, t23, 1);
    t9 = (t0 + 2768U);
    t10 = *((char **)t9);
    t9 = (t10 + 0);
    t11 = (t22 + 12U);
    t8 = *((unsigned int *)t11);
    t14 = (1U * t8);
    memcpy(t9, t6, t14);

LAB33:
LAB27:    xsi_set_current_line(80, ng0);
    t1 = (t0 + 1192U);
    t4 = *((char **)t1);
    t1 = (t0 + 7424);
    t2 = 1;
    if (32U == 32U)
        goto LAB38;

LAB39:    t2 = 0;

LAB40:    if ((!(t2)) != 0)
        goto LAB35;

LAB37:    xsi_set_current_line(109, ng0);
    t1 = (t0 + 7464);
    t5 = (t0 + 4336);
    t6 = (t5 + 56U);
    t9 = *((char **)t6);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t1, 32U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(110, ng0);
    t1 = (t0 + 7496);
    t5 = (t0 + 4272);
    t6 = (t5 + 56U);
    t9 = *((char **)t6);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t1, 32U);
    xsi_driver_first_trans_fast_port(t5);
    xsi_set_current_line(111, ng0);
    t1 = (t0 + 4400);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t9 = *((char **)t6);
    *((unsigned char *)t9) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);

LAB36:    goto LAB24;

LAB26:    xsi_set_current_line(65, ng0);
    t1 = (t0 + 1032U);
    t6 = *((char **)t1);
    t1 = (t0 + 2648U);
    t9 = *((char **)t1);
    t1 = (t9 + 0);
    memcpy(t1, t6, 32U);
    xsi_set_current_line(66, ng0);
    t1 = (t0 + 1192U);
    t4 = *((char **)t1);
    t1 = (t0 + 2768U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    memcpy(t1, t4, 32U);
    goto LAB27;

LAB29:    xsi_set_current_line(69, ng0);
    t5 = (t0 + 1032U);
    t6 = *((char **)t5);
    t5 = (t0 + 2648U);
    t9 = *((char **)t5);
    t5 = (t9 + 0);
    memcpy(t5, t6, 32U);
    goto LAB30;

LAB32:    xsi_set_current_line(75, ng0);
    t5 = (t0 + 1192U);
    t6 = *((char **)t5);
    t5 = (t0 + 2768U);
    t9 = *((char **)t5);
    t5 = (t9 + 0);
    memcpy(t5, t6, 32U);
    goto LAB33;

LAB35:    xsi_set_current_line(82, ng0);
    t10 = (t0 + 7456);
    *((int *)t10) = 0;
    t11 = (t0 + 7460);
    *((int *)t11) = 3;
    t20 = 0;
    t24 = 3;

LAB44:    if (t20 <= t24)
        goto LAB45;

LAB47:    xsi_set_current_line(93, ng0);
    t1 = (t0 + 2888U);
    t4 = *((char **)t1);
    t20 = *((int *)t4);
    t2 = (t20 < 4);
    if (t2 != 0)
        goto LAB52;

LAB54:    xsi_set_current_line(105, ng0);
    t1 = (t0 + 2888U);
    t4 = *((char **)t1);
    t20 = *((int *)t4);
    t24 = (t20 - 4);
    t1 = (t0 + 2888U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    *((int *)t1) = t24;

LAB53:    goto LAB36;

LAB38:    t8 = 0;

LAB41:    if (t8 < 32U)
        goto LAB42;
    else
        goto LAB40;

LAB42:    t6 = (t4 + t8);
    t9 = (t1 + t8);
    if (*((unsigned char *)t6) != *((unsigned char *)t9))
        goto LAB39;

LAB43:    t8 = (t8 + 1);
    goto LAB41;

LAB45:    xsi_set_current_line(83, ng0);
    t12 = (t0 + 2528U);
    t15 = *((char **)t12);
    t12 = (t0 + 7168U);
    t16 = ieee_p_1242562249_sub_2540846514_1035706684(IEEE_P_1242562249, t22, t15, t12, 1);
    t17 = (t0 + 2528U);
    t18 = *((char **)t17);
    t17 = (t18 + 0);
    t19 = (t22 + 12U);
    t14 = *((unsigned int *)t19);
    t21 = (1U * t14);
    memcpy(t17, t16, t21);
    xsi_set_current_line(84, ng0);
    t1 = (t0 + 2648U);
    t4 = *((char **)t1);
    t1 = (t0 + 2888U);
    t5 = *((char **)t1);
    t25 = *((int *)t5);
    t1 = (t0 + 7456);
    t26 = *((int *)t1);
    t27 = (t25 - t26);
    t28 = (t27 - 31);
    t8 = (t28 * -1);
    xsi_vhdl_check_range_of_index(31, 0, -1, t27);
    t14 = (1U * t8);
    t21 = (0 + t14);
    t6 = (t4 + t21);
    t2 = *((unsigned char *)t6);
    t9 = (t0 + 2528U);
    t10 = *((char **)t9);
    t29 = (0 - 31);
    t30 = (t29 * -1);
    t31 = (1U * t30);
    t32 = (0 + t31);
    t9 = (t10 + t32);
    *((unsigned char *)t9) = t2;
    xsi_set_current_line(86, ng0);
    t1 = (t0 + 2528U);
    t4 = *((char **)t1);
    t1 = (t0 + 2768U);
    t5 = *((char **)t1);
    t1 = ((IEEE_P_2592010699) + 4024);
    t2 = xsi_vhdl_greaterEqual(t1, t4, 32U, t5, 32U);
    if (t2 != 0)
        goto LAB48;

LAB50:
LAB49:
LAB46:    t1 = (t0 + 7456);
    t20 = *((int *)t1);
    t4 = (t0 + 7460);
    t24 = *((int *)t4);
    if (t20 == t24)
        goto LAB47;

LAB51:    t25 = (t20 + 1);
    t20 = t25;
    t5 = (t0 + 7456);
    *((int *)t5) = t20;
    goto LAB44;

LAB48:    xsi_set_current_line(87, ng0);
    t6 = (t0 + 2528U);
    t9 = *((char **)t6);
    t6 = (t0 + 7168U);
    t10 = (t0 + 2768U);
    t11 = *((char **)t10);
    t10 = (t0 + 7200U);
    t12 = ieee_p_1242562249_sub_1547270861_1035706684(IEEE_P_1242562249, t22, t9, t6, t11, t10);
    t15 = (t0 + 2528U);
    t16 = *((char **)t15);
    t15 = (t16 + 0);
    t17 = (t22 + 12U);
    t8 = *((unsigned int *)t17);
    t14 = (1U * t8);
    memcpy(t15, t12, t14);
    xsi_set_current_line(88, ng0);
    t1 = (t0 + 2408U);
    t4 = *((char **)t1);
    t1 = (t0 + 2888U);
    t5 = *((char **)t1);
    t25 = *((int *)t5);
    t1 = (t0 + 7456);
    t26 = *((int *)t1);
    t27 = (t25 - t26);
    t28 = (t27 - 31);
    t8 = (t28 * -1);
    xsi_vhdl_check_range_of_index(31, 0, -1, t27);
    t14 = (1U * t8);
    t21 = (0 + t14);
    t6 = (t4 + t21);
    *((unsigned char *)t6) = (unsigned char)3;
    goto LAB49;

LAB52:    xsi_set_current_line(95, ng0);
    t1 = (t0 + 2888U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    *((int *)t1) = 31;
    xsi_set_current_line(96, ng0);
    t1 = (t0 + 2288U);
    t4 = *((char **)t1);
    t1 = (t4 + 0);
    *((unsigned char *)t1) = (unsigned char)3;
    xsi_set_current_line(97, ng0);
    t1 = (t0 + 1512U);
    t4 = *((char **)t1);
    t3 = *((unsigned char *)t4);
    t7 = (t3 == (unsigned char)3);
    if (t7 == 1)
        goto LAB58;

LAB59:    t2 = (unsigned char)0;

LAB60:    if (t2 != 0)
        goto LAB55;

LAB57:    xsi_set_current_line(100, ng0);
    t1 = (t0 + 2408U);
    t4 = *((char **)t1);
    t1 = (t0 + 4272);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t9 = (t6 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t4, 32U);
    xsi_driver_first_trans_fast_port(t1);

LAB56:    xsi_set_current_line(102, ng0);
    t1 = (t0 + 2528U);
    t4 = *((char **)t1);
    t1 = (t0 + 4336);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t9 = (t6 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t4, 32U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(103, ng0);
    t1 = (t0 + 4400);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t9 = *((char **)t6);
    *((unsigned char *)t9) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB53;

LAB55:    xsi_set_current_line(98, ng0);
    t10 = (t0 + 2408U);
    t11 = *((char **)t10);
    t10 = (t0 + 7152U);
    t12 = ieee_p_2592010699_sub_1837678034_503743352(IEEE_P_2592010699, t23, t11, t10);
    t15 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t22, t12, t23, 1);
    t16 = (t0 + 4272);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t36 = *((char **)t19);
    memcpy(t36, t15, 32U);
    xsi_driver_first_trans_fast_port(t16);
    goto LAB56;

LAB58:    t1 = (t0 + 1032U);
    t5 = *((char **)t1);
    t20 = (31 - 31);
    t8 = (t20 * -1);
    t14 = (1U * t8);
    t21 = (0 + t14);
    t1 = (t5 + t21);
    t13 = *((unsigned char *)t1);
    t6 = (t0 + 1192U);
    t9 = *((char **)t6);
    t24 = (31 - 31);
    t30 = (t24 * -1);
    t31 = (1U * t30);
    t32 = (0 + t31);
    t6 = (t9 + t32);
    t33 = *((unsigned char *)t6);
    t34 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t13, t33);
    t35 = (t34 == (unsigned char)3);
    t2 = t35;
    goto LAB60;

}


extern void work_a_3108379117_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3108379117_3212880686_p_0};
	xsi_register_didat("work_a_3108379117_3212880686", "isim/test_udiv32_isim_beh.exe.sim/work/a_3108379117_3212880686.didat");
	xsi_register_executes(pe);
}
