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
extern char *IEEE_P_1242562249;
extern char *IEEE_P_2592010699;

char *ieee_p_1242562249_sub_1547270861_1035706684(char *, char *, char *, char *, char *, char *);
char *ieee_p_1242562249_sub_1919365254_1035706684(char *, char *, char *, char *, int );
char *ieee_p_1242562249_sub_2540846514_1035706684(char *, char *, char *, char *, int );
char *ieee_p_2592010699_sub_1837678034_503743352(char *, char *, char *, char *);
unsigned char ieee_p_2592010699_sub_2507238156_503743352(char *, unsigned char , unsigned char );


static void work_a_3108379117_3212880686_p_0(char *t0)
{
    char t21[16];
    char t22[16];
    unsigned char t1;
    char *t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned int t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    unsigned char t18;
    int t19;
    unsigned int t20;
    int t23;
    char *t24;
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
    t2 = (t0 + 2648U);
    t3 = *((char **)t2);
    t2 = (t0 + 1032U);
    t4 = *((char **)t2);
    t5 = 1;
    if (32U == 32U)
        goto LAB8;

LAB9:    t5 = 0;

LAB10:    if ((!(t5)) == 1)
        goto LAB5;

LAB6:    t8 = (t0 + 2768U);
    t9 = *((char **)t8);
    t8 = (t0 + 1192U);
    t10 = *((char **)t8);
    t11 = 1;
    if (32U == 32U)
        goto LAB14;

LAB15:    t11 = 0;

LAB16:    t1 = (!(t11));

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    xsi_set_current_line(62, ng0);
    t2 = (t0 + 2288U);
    t3 = *((char **)t2);
    t1 = *((unsigned char *)t3);
    t5 = (t1 == (unsigned char)2);
    if (t5 != 0)
        goto LAB20;

LAB22:
LAB21:    t2 = (t0 + 4192);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(57, ng0);
    t14 = xsi_get_transient_memory(32U);
    memset(t14, 0, 32U);
    t15 = t14;
    memset(t15, (unsigned char)2, 32U);
    t16 = (t0 + 2528U);
    t17 = *((char **)t16);
    t16 = (t17 + 0);
    memcpy(t16, t14, 32U);
    xsi_set_current_line(58, ng0);
    t2 = xsi_get_transient_memory(32U);
    memset(t2, 0, 32U);
    t3 = t2;
    memset(t3, (unsigned char)2, 32U);
    t4 = (t0 + 2408U);
    t7 = *((char **)t4);
    t4 = (t7 + 0);
    memcpy(t4, t2, 32U);
    xsi_set_current_line(59, ng0);
    t2 = (t0 + 2288U);
    t3 = *((char **)t2);
    t2 = (t3 + 0);
    *((unsigned char *)t2) = (unsigned char)2;
    goto LAB3;

LAB5:    t1 = (unsigned char)1;
    goto LAB7;

LAB8:    t6 = 0;

LAB11:    if (t6 < 32U)
        goto LAB12;
    else
        goto LAB10;

LAB12:    t2 = (t3 + t6);
    t7 = (t4 + t6);
    if (*((unsigned char *)t2) != *((unsigned char *)t7))
        goto LAB9;

LAB13:    t6 = (t6 + 1);
    goto LAB11;

LAB14:    t12 = 0;

LAB17:    if (t12 < 32U)
        goto LAB18;
    else
        goto LAB16;

LAB18:    t8 = (t9 + t12);
    t13 = (t10 + t12);
    if (*((unsigned char *)t8) != *((unsigned char *)t13))
        goto LAB15;

LAB19:    t12 = (t12 + 1);
    goto LAB17;

LAB20:    xsi_set_current_line(63, ng0);
    t2 = (t0 + 1512U);
    t4 = *((char **)t2);
    t11 = *((unsigned char *)t4);
    t18 = (t11 == (unsigned char)2);
    if (t18 != 0)
        goto LAB23;

LAB25:    xsi_set_current_line(67, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t19 = (31 - 31);
    t6 = (t19 * -1);
    t12 = (1U * t6);
    t20 = (0 + t12);
    t2 = (t3 + t20);
    t1 = *((unsigned char *)t2);
    t5 = (t1 == (unsigned char)2);
    if (t5 != 0)
        goto LAB26;

LAB28:    xsi_set_current_line(70, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 7084U);
    t4 = ieee_p_2592010699_sub_1837678034_503743352(IEEE_P_2592010699, t22, t3, t2);
    t7 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t21, t4, t22, 1);
    t8 = (t0 + 2648U);
    t9 = *((char **)t8);
    t8 = (t9 + 0);
    t10 = (t21 + 12U);
    t6 = *((unsigned int *)t10);
    t12 = (1U * t6);
    memcpy(t8, t7, t12);

LAB27:    xsi_set_current_line(73, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t19 = (31 - 31);
    t6 = (t19 * -1);
    t12 = (1U * t6);
    t20 = (0 + t12);
    t2 = (t3 + t20);
    t1 = *((unsigned char *)t2);
    t5 = (t1 == (unsigned char)2);
    if (t5 != 0)
        goto LAB29;

LAB31:    xsi_set_current_line(76, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 7100U);
    t4 = ieee_p_2592010699_sub_1837678034_503743352(IEEE_P_2592010699, t22, t3, t2);
    t7 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t21, t4, t22, 1);
    t8 = (t0 + 2768U);
    t9 = *((char **)t8);
    t8 = (t9 + 0);
    t10 = (t21 + 12U);
    t6 = *((unsigned int *)t10);
    t12 = (1U * t6);
    memcpy(t8, t7, t12);

LAB30:
LAB24:    xsi_set_current_line(79, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 7420);
    t1 = 1;
    if (32U == 32U)
        goto LAB35;

LAB36:    t1 = 0;

LAB37:    if ((!(t1)) != 0)
        goto LAB32;

LAB34:    xsi_set_current_line(108, ng0);
    t2 = (t0 + 7460);
    t4 = (t0 + 4336);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 32U);
    xsi_driver_first_trans_fast_port(t4);
    xsi_set_current_line(109, ng0);
    t2 = (t0 + 7492);
    t4 = (t0 + 4272);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t2, 32U);
    xsi_driver_first_trans_fast_port(t4);
    xsi_set_current_line(110, ng0);
    t2 = (t0 + 4400);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t2);

LAB33:    goto LAB21;

LAB23:    xsi_set_current_line(64, ng0);
    t2 = (t0 + 1032U);
    t7 = *((char **)t2);
    t2 = (t0 + 2648U);
    t8 = *((char **)t2);
    t2 = (t8 + 0);
    memcpy(t2, t7, 32U);
    xsi_set_current_line(65, ng0);
    t2 = (t0 + 1192U);
    t3 = *((char **)t2);
    t2 = (t0 + 2768U);
    t4 = *((char **)t2);
    t2 = (t4 + 0);
    memcpy(t2, t3, 32U);
    goto LAB24;

LAB26:    xsi_set_current_line(68, ng0);
    t4 = (t0 + 1032U);
    t7 = *((char **)t4);
    t4 = (t0 + 2648U);
    t8 = *((char **)t4);
    t4 = (t8 + 0);
    memcpy(t4, t7, 32U);
    goto LAB27;

LAB29:    xsi_set_current_line(74, ng0);
    t4 = (t0 + 1192U);
    t7 = *((char **)t4);
    t4 = (t0 + 2768U);
    t8 = *((char **)t4);
    t4 = (t8 + 0);
    memcpy(t4, t7, 32U);
    goto LAB30;

LAB32:    xsi_set_current_line(81, ng0);
    t9 = (t0 + 7452);
    *((int *)t9) = 0;
    t10 = (t0 + 7456);
    *((int *)t10) = 3;
    t19 = 0;
    t23 = 3;

LAB41:    if (t19 <= t23)
        goto LAB42;

LAB44:    xsi_set_current_line(92, ng0);
    t2 = (t0 + 2888U);
    t3 = *((char **)t2);
    t19 = *((int *)t3);
    t1 = (t19 < 4);
    if (t1 != 0)
        goto LAB49;

LAB51:    xsi_set_current_line(104, ng0);
    t2 = (t0 + 2888U);
    t3 = *((char **)t2);
    t19 = *((int *)t3);
    t23 = (t19 - 4);
    t2 = (t0 + 2888U);
    t4 = *((char **)t2);
    t2 = (t4 + 0);
    *((int *)t2) = t23;

LAB50:    goto LAB33;

LAB35:    t6 = 0;

LAB38:    if (t6 < 32U)
        goto LAB39;
    else
        goto LAB37;

LAB39:    t7 = (t3 + t6);
    t8 = (t2 + t6);
    if (*((unsigned char *)t7) != *((unsigned char *)t8))
        goto LAB36;

LAB40:    t6 = (t6 + 1);
    goto LAB38;

LAB42:    xsi_set_current_line(82, ng0);
    t13 = (t0 + 2528U);
    t14 = *((char **)t13);
    t13 = (t0 + 7164U);
    t15 = ieee_p_1242562249_sub_2540846514_1035706684(IEEE_P_1242562249, t21, t14, t13, 1);
    t16 = (t0 + 2528U);
    t17 = *((char **)t16);
    t16 = (t17 + 0);
    t24 = (t21 + 12U);
    t12 = *((unsigned int *)t24);
    t20 = (1U * t12);
    memcpy(t16, t15, t20);
    xsi_set_current_line(83, ng0);
    t2 = (t0 + 2648U);
    t3 = *((char **)t2);
    t2 = (t0 + 2888U);
    t4 = *((char **)t2);
    t25 = *((int *)t4);
    t2 = (t0 + 7452);
    t26 = *((int *)t2);
    t27 = (t25 - t26);
    t28 = (t27 - 31);
    t6 = (t28 * -1);
    xsi_vhdl_check_range_of_index(31, 0, -1, t27);
    t12 = (1U * t6);
    t20 = (0 + t12);
    t7 = (t3 + t20);
    t1 = *((unsigned char *)t7);
    t8 = (t0 + 2528U);
    t9 = *((char **)t8);
    t29 = (0 - 31);
    t30 = (t29 * -1);
    t31 = (1U * t30);
    t32 = (0 + t31);
    t8 = (t9 + t32);
    *((unsigned char *)t8) = t1;
    xsi_set_current_line(85, ng0);
    t2 = (t0 + 2528U);
    t3 = *((char **)t2);
    t2 = (t0 + 2768U);
    t4 = *((char **)t2);
    t2 = ((IEEE_P_2592010699) + 4024);
    t1 = xsi_vhdl_greaterEqual(t2, t3, 32U, t4, 32U);
    if (t1 != 0)
        goto LAB45;

LAB47:
LAB46:
LAB43:    t2 = (t0 + 7452);
    t19 = *((int *)t2);
    t3 = (t0 + 7456);
    t23 = *((int *)t3);
    if (t19 == t23)
        goto LAB44;

LAB48:    t25 = (t19 + 1);
    t19 = t25;
    t4 = (t0 + 7452);
    *((int *)t4) = t19;
    goto LAB41;

LAB45:    xsi_set_current_line(86, ng0);
    t7 = (t0 + 2528U);
    t8 = *((char **)t7);
    t7 = (t0 + 7164U);
    t9 = (t0 + 2768U);
    t10 = *((char **)t9);
    t9 = (t0 + 7196U);
    t13 = ieee_p_1242562249_sub_1547270861_1035706684(IEEE_P_1242562249, t21, t8, t7, t10, t9);
    t14 = (t0 + 2528U);
    t15 = *((char **)t14);
    t14 = (t15 + 0);
    t16 = (t21 + 12U);
    t6 = *((unsigned int *)t16);
    t12 = (1U * t6);
    memcpy(t14, t13, t12);
    xsi_set_current_line(87, ng0);
    t2 = (t0 + 2408U);
    t3 = *((char **)t2);
    t2 = (t0 + 2888U);
    t4 = *((char **)t2);
    t25 = *((int *)t4);
    t2 = (t0 + 7452);
    t26 = *((int *)t2);
    t27 = (t25 - t26);
    t28 = (t27 - 31);
    t6 = (t28 * -1);
    xsi_vhdl_check_range_of_index(31, 0, -1, t27);
    t12 = (1U * t6);
    t20 = (0 + t12);
    t7 = (t3 + t20);
    *((unsigned char *)t7) = (unsigned char)3;
    goto LAB46;

LAB49:    xsi_set_current_line(94, ng0);
    t2 = (t0 + 2888U);
    t4 = *((char **)t2);
    t2 = (t4 + 0);
    *((int *)t2) = 31;
    xsi_set_current_line(95, ng0);
    t2 = (t0 + 2288U);
    t3 = *((char **)t2);
    t2 = (t3 + 0);
    *((unsigned char *)t2) = (unsigned char)3;
    xsi_set_current_line(96, ng0);
    t2 = (t0 + 1512U);
    t3 = *((char **)t2);
    t5 = *((unsigned char *)t3);
    t11 = (t5 == (unsigned char)3);
    if (t11 == 1)
        goto LAB55;

LAB56:    t1 = (unsigned char)0;

LAB57:    if (t1 != 0)
        goto LAB52;

LAB54:    xsi_set_current_line(99, ng0);
    t2 = (t0 + 2408U);
    t3 = *((char **)t2);
    t2 = (t0 + 4272);
    t4 = (t2 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t3, 32U);
    xsi_driver_first_trans_fast_port(t2);

LAB53:    xsi_set_current_line(101, ng0);
    t2 = (t0 + 2528U);
    t3 = *((char **)t2);
    t2 = (t0 + 4336);
    t4 = (t2 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t3, 32U);
    xsi_driver_first_trans_fast_port(t2);
    xsi_set_current_line(102, ng0);
    t2 = (t0 + 4400);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t2);
    goto LAB50;

LAB52:    xsi_set_current_line(97, ng0);
    t9 = (t0 + 2408U);
    t10 = *((char **)t9);
    t9 = (t0 + 7148U);
    t13 = ieee_p_2592010699_sub_1837678034_503743352(IEEE_P_2592010699, t22, t10, t9);
    t14 = ieee_p_1242562249_sub_1919365254_1035706684(IEEE_P_1242562249, t21, t13, t22, 1);
    t15 = (t0 + 4272);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t24 = (t17 + 56U);
    t36 = *((char **)t24);
    memcpy(t36, t14, 32U);
    xsi_driver_first_trans_fast_port(t15);
    goto LAB53;

LAB55:    t2 = (t0 + 1032U);
    t4 = *((char **)t2);
    t19 = (31 - 31);
    t6 = (t19 * -1);
    t12 = (1U * t6);
    t20 = (0 + t12);
    t2 = (t4 + t20);
    t18 = *((unsigned char *)t2);
    t7 = (t0 + 1192U);
    t8 = *((char **)t7);
    t23 = (31 - 31);
    t30 = (t23 * -1);
    t31 = (1U * t30);
    t32 = (0 + t31);
    t7 = (t8 + t32);
    t33 = *((unsigned char *)t7);
    t34 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t18, t33);
    t35 = (t34 == (unsigned char)3);
    t1 = t35;
    goto LAB57;

}


extern void work_a_3108379117_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3108379117_3212880686_p_0};
	xsi_register_didat("work_a_3108379117_3212880686", "isim/test_udiv32_isim_beh.exe.sim/work/a_3108379117_3212880686.didat");
	xsi_register_executes(pe);
}
