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
char *ieee_p_1242562249_sub_2540846514_1035706684(char *, char *, char *, char *, int );


static void work_a_3108379117_3212880686_p_0(char *t0)
{
    char t17[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned int t6;
    char *t7;
    char *t8;
    char *t9;
    int t10;
    int t11;
    char *t12;
    int t13;
    unsigned char t14;
    char *t15;
    char *t16;
    unsigned int t18;
    int t19;
    unsigned int t20;
    int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;

LAB0:    xsi_set_current_line(54, ng0);
    t1 = (t0 + 2368U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)2;
    xsi_set_current_line(55, ng0);
    t1 = xsi_get_transient_memory(32U);
    memset(t1, 0, 32U);
    t2 = t1;
    memset(t2, (unsigned char)2, 32U);
    t3 = (t0 + 2248U);
    t4 = *((char **)t3);
    t3 = (t4 + 0);
    memcpy(t3, t1, 32U);
    xsi_set_current_line(56, ng0);
    t1 = xsi_get_transient_memory(32U);
    memset(t1, 0, 32U);
    t2 = t1;
    memset(t2, (unsigned char)2, 32U);
    t3 = (t0 + 2128U);
    t4 = *((char **)t3);
    t3 = (t4 + 0);
    memcpy(t3, t1, 32U);
    xsi_set_current_line(57, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 2488U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    memcpy(t1, t2, 32U);
    xsi_set_current_line(58, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 2608U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    memcpy(t1, t2, 32U);
    xsi_set_current_line(60, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 6922);
    t5 = 1;
    if (32U == 32U)
        goto LAB5;

LAB6:    t5 = 0;

LAB7:    if ((!(t5)) != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(80, ng0);
    t1 = (t0 + 6962);
    t3 = (t0 + 3992);
    t4 = (t3 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 32U);
    xsi_driver_first_trans_fast_port(t3);
    xsi_set_current_line(81, ng0);
    t1 = (t0 + 6994);
    t3 = (t0 + 4056);
    t4 = (t3 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 32U);
    xsi_driver_first_trans_fast_port(t3);
    xsi_set_current_line(82, ng0);
    t1 = (t0 + 4120);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t7 = *((char **)t4);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);

LAB3:    t1 = (t0 + 3912);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(62, ng0);
    t8 = (t0 + 6954);
    *((int *)t8) = 31;
    t9 = (t0 + 6958);
    *((int *)t9) = 0;
    t10 = 31;
    t11 = 0;

LAB11:    if (t10 >= t11)
        goto LAB12;

LAB14:    xsi_set_current_line(75, ng0);
    t1 = (t0 + 2248U);
    t2 = *((char **)t1);
    t1 = (t0 + 3992);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 32U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(76, ng0);
    t1 = (t0 + 2128U);
    t2 = *((char **)t1);
    t1 = (t0 + 4056);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 32U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(77, ng0);
    t1 = (t0 + 4120);
    t2 = (t1 + 56U);
    t3 = *((char **)t2);
    t4 = (t3 + 56U);
    t7 = *((char **)t4);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB3;

LAB5:    t6 = 0;

LAB8:    if (t6 < 32U)
        goto LAB9;
    else
        goto LAB7;

LAB9:    t4 = (t2 + t6);
    t7 = (t1 + t6);
    if (*((unsigned char *)t4) != *((unsigned char *)t7))
        goto LAB6;

LAB10:    t6 = (t6 + 1);
    goto LAB8;

LAB12:    xsi_set_current_line(63, ng0);
    t12 = (t0 + 6954);
    t13 = *((int *)t12);
    t14 = (t13 == 0);
    if (t14 != 0)
        goto LAB15;

LAB17:
LAB16:    xsi_set_current_line(66, ng0);
    t1 = (t0 + 2248U);
    t2 = *((char **)t1);
    t1 = (t0 + 6672U);
    t3 = ieee_p_1242562249_sub_2540846514_1035706684(IEEE_P_1242562249, t17, t2, t1, 1);
    t4 = (t0 + 2248U);
    t7 = *((char **)t4);
    t4 = (t7 + 0);
    t8 = (t17 + 12U);
    t6 = *((unsigned int *)t8);
    t18 = (1U * t6);
    memcpy(t4, t3, t18);
    xsi_set_current_line(67, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 6954);
    t13 = *((int *)t1);
    t19 = (t13 - 31);
    t6 = (t19 * -1);
    xsi_vhdl_check_range_of_index(31, 0, -1, *((int *)t1));
    t18 = (1U * t6);
    t20 = (0 + t18);
    t3 = (t2 + t20);
    t5 = *((unsigned char *)t3);
    t4 = (t0 + 2248U);
    t7 = *((char **)t4);
    t21 = (0 - 31);
    t22 = (t21 * -1);
    t23 = (1U * t22);
    t24 = (0 + t23);
    t4 = (t7 + t24);
    *((unsigned char *)t4) = t5;
    xsi_set_current_line(69, ng0);
    t1 = (t0 + 2248U);
    t2 = *((char **)t1);
    t1 = (t0 + 1192U);
    t3 = *((char **)t1);
    t1 = ((IEEE_P_2592010699) + 4024);
    t5 = xsi_vhdl_greaterEqual(t1, t2, 32U, t3, 32U);
    if (t5 != 0)
        goto LAB18;

LAB20:
LAB19:
LAB13:    t1 = (t0 + 6954);
    t10 = *((int *)t1);
    t2 = (t0 + 6958);
    t11 = *((int *)t2);
    if (t10 == t11)
        goto LAB14;

LAB21:    t13 = (t10 + -1);
    t10 = t13;
    t3 = (t0 + 6954);
    *((int *)t3) = t10;
    goto LAB11;

LAB15:    xsi_set_current_line(64, ng0);
    t15 = (t0 + 2368U);
    t16 = *((char **)t15);
    t15 = (t16 + 0);
    *((unsigned char *)t15) = (unsigned char)3;
    goto LAB16;

LAB18:    xsi_set_current_line(70, ng0);
    t4 = (t0 + 2248U);
    t7 = *((char **)t4);
    t4 = (t0 + 6672U);
    t8 = (t0 + 1192U);
    t9 = *((char **)t8);
    t8 = (t0 + 6608U);
    t12 = ieee_p_1242562249_sub_1547270861_1035706684(IEEE_P_1242562249, t17, t7, t4, t9, t8);
    t15 = (t0 + 2248U);
    t16 = *((char **)t15);
    t15 = (t16 + 0);
    t25 = (t17 + 12U);
    t6 = *((unsigned int *)t25);
    t18 = (1U * t6);
    memcpy(t15, t12, t18);
    xsi_set_current_line(71, ng0);
    t1 = (t0 + 2128U);
    t2 = *((char **)t1);
    t1 = (t0 + 6954);
    t13 = *((int *)t1);
    t19 = (t13 - 31);
    t6 = (t19 * -1);
    xsi_vhdl_check_range_of_index(31, 0, -1, *((int *)t1));
    t18 = (1U * t6);
    t20 = (0 + t18);
    t3 = (t2 + t20);
    *((unsigned char *)t3) = (unsigned char)3;
    goto LAB19;

}


extern void work_a_3108379117_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3108379117_3212880686_p_0};
	xsi_register_didat("work_a_3108379117_3212880686", "isim/test_udiv32_isim_beh.exe.sim/work/a_3108379117_3212880686.didat");
	xsi_register_executes(pe);
}
