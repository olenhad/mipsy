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
char *ieee_p_1242562249_sub_2540846514_1035706684(char *, char *, char *, char *, int );
char *ieee_p_2592010699_sub_1697423399_503743352(char *, char *, char *, char *, char *, char *);
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_3108379117_3212880686_p_0(char *t0)
{
    char t4[16];
    char t19[16];
    char *t1;
    unsigned char t2;
    unsigned char t3;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    unsigned char t15;
    unsigned int t16;
    char *t17;
    char *t18;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    unsigned char t30;
    unsigned int t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    int t36;
    int t37;
    int t38;
    int t39;
    int t40;

LAB0:    xsi_set_current_line(52, ng0);
    t1 = (t0 + 1312U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 3912);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(53, ng0);
    t5 = (t0 + 2488U);
    t6 = *((char **)t5);
    t5 = (t0 + 6700U);
    t7 = (t0 + 1032U);
    t8 = *((char **)t7);
    t7 = (t0 + 6604U);
    t9 = ieee_p_2592010699_sub_1697423399_503743352(IEEE_P_2592010699, t4, t6, t5, t8, t7);
    t10 = (t4 + 12U);
    t11 = *((unsigned int *)t10);
    t12 = (1U * t11);
    t13 = (t0 + 6934);
    t15 = 1;
    if (t12 == 32U)
        goto LAB11;

LAB12:    t15 = 0;

LAB13:    if ((!(t15)) == 1)
        goto LAB8;

LAB9:    t20 = (t0 + 2608U);
    t21 = *((char **)t20);
    t20 = (t0 + 6716U);
    t22 = (t0 + 1192U);
    t23 = *((char **)t22);
    t22 = (t0 + 6620U);
    t24 = ieee_p_2592010699_sub_1697423399_503743352(IEEE_P_2592010699, t19, t21, t20, t23, t22);
    t25 = (t19 + 12U);
    t26 = *((unsigned int *)t25);
    t27 = (1U * t26);
    t28 = (t0 + 6966);
    t30 = 1;
    if (t27 == 32U)
        goto LAB17;

LAB18:    t30 = 0;

LAB19:    t3 = (!(t30));

LAB10:    if (t3 != 0)
        goto LAB5;

LAB7:
LAB6:    xsi_set_current_line(60, ng0);
    t1 = (t0 + 1192U);
    t5 = *((char **)t1);
    t1 = (t0 + 6998);
    t2 = 1;
    if (32U == 32U)
        goto LAB26;

LAB27:    t2 = 0;

LAB28:    if ((!(t2)) != 0)
        goto LAB23;

LAB25:    xsi_set_current_line(80, ng0);
    t1 = (t0 + 7038);
    t6 = (t0 + 3992);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 32U);
    xsi_driver_first_trans_fast_port(t6);
    xsi_set_current_line(81, ng0);
    t1 = (t0 + 7070);
    t6 = (t0 + 4056);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 32U);
    xsi_driver_first_trans_fast_port(t6);
    xsi_set_current_line(82, ng0);
    t1 = (t0 + 4120);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);

LAB24:    goto LAB3;

LAB5:    xsi_set_current_line(54, ng0);
    t34 = (t0 + 2368U);
    t35 = *((char **)t34);
    t34 = (t35 + 0);
    *((unsigned char *)t34) = (unsigned char)2;
    xsi_set_current_line(55, ng0);
    t1 = xsi_get_transient_memory(32U);
    memset(t1, 0, 32U);
    t5 = t1;
    memset(t5, (unsigned char)2, 32U);
    t6 = (t0 + 2248U);
    t7 = *((char **)t6);
    t6 = (t7 + 0);
    memcpy(t6, t1, 32U);
    xsi_set_current_line(56, ng0);
    t1 = xsi_get_transient_memory(32U);
    memset(t1, 0, 32U);
    t5 = t1;
    memset(t5, (unsigned char)2, 32U);
    t6 = (t0 + 2128U);
    t7 = *((char **)t6);
    t6 = (t7 + 0);
    memcpy(t6, t1, 32U);
    xsi_set_current_line(57, ng0);
    t1 = (t0 + 1032U);
    t5 = *((char **)t1);
    t1 = (t0 + 2488U);
    t6 = *((char **)t1);
    t1 = (t6 + 0);
    memcpy(t1, t5, 32U);
    xsi_set_current_line(58, ng0);
    t1 = (t0 + 1192U);
    t5 = *((char **)t1);
    t1 = (t0 + 2608U);
    t6 = *((char **)t1);
    t1 = (t6 + 0);
    memcpy(t1, t5, 32U);
    goto LAB6;

LAB8:    t3 = (unsigned char)1;
    goto LAB10;

LAB11:    t16 = 0;

LAB14:    if (t16 < t12)
        goto LAB15;
    else
        goto LAB13;

LAB15:    t17 = (t9 + t16);
    t18 = (t13 + t16);
    if (*((unsigned char *)t17) != *((unsigned char *)t18))
        goto LAB12;

LAB16:    t16 = (t16 + 1);
    goto LAB14;

LAB17:    t31 = 0;

LAB20:    if (t31 < t27)
        goto LAB21;
    else
        goto LAB19;

LAB21:    t32 = (t24 + t31);
    t33 = (t28 + t31);
    if (*((unsigned char *)t32) != *((unsigned char *)t33))
        goto LAB18;

LAB22:    t31 = (t31 + 1);
    goto LAB20;

LAB23:    xsi_set_current_line(61, ng0);
    t9 = (t0 + 2368U);
    t10 = *((char **)t9);
    t3 = *((unsigned char *)t10);
    t15 = (t3 == (unsigned char)2);
    if (t15 != 0)
        goto LAB32;

LAB34:    xsi_set_current_line(75, ng0);
    t1 = (t0 + 2248U);
    t5 = *((char **)t1);
    t1 = (t0 + 3992);
    t6 = (t1 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t5, 32U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(76, ng0);
    t1 = (t0 + 2128U);
    t5 = *((char **)t1);
    t1 = (t0 + 4056);
    t6 = (t1 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t5, 32U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(77, ng0);
    t1 = (t0 + 4120);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB33:    goto LAB24;

LAB26:    t11 = 0;

LAB29:    if (t11 < 32U)
        goto LAB30;
    else
        goto LAB28;

LAB30:    t7 = (t5 + t11);
    t8 = (t1 + t11);
    if (*((unsigned char *)t7) != *((unsigned char *)t8))
        goto LAB27;

LAB31:    t11 = (t11 + 1);
    goto LAB29;

LAB32:    xsi_set_current_line(62, ng0);
    t9 = (t0 + 7030);
    *((int *)t9) = 31;
    t13 = (t0 + 7034);
    *((int *)t13) = 0;
    t36 = 31;
    t37 = 0;

LAB35:    if (t36 >= t37)
        goto LAB36;

LAB38:    goto LAB33;

LAB36:    xsi_set_current_line(63, ng0);
    t14 = (t0 + 7030);
    t38 = *((int *)t14);
    t30 = (t38 == 0);
    if (t30 != 0)
        goto LAB39;

LAB41:
LAB40:    xsi_set_current_line(66, ng0);
    t1 = (t0 + 2248U);
    t5 = *((char **)t1);
    t1 = (t0 + 6684U);
    t6 = ieee_p_1242562249_sub_2540846514_1035706684(IEEE_P_1242562249, t4, t5, t1, 1);
    t7 = (t0 + 2248U);
    t8 = *((char **)t7);
    t7 = (t8 + 0);
    t9 = (t4 + 12U);
    t11 = *((unsigned int *)t9);
    t12 = (1U * t11);
    memcpy(t7, t6, t12);
    xsi_set_current_line(67, ng0);
    t1 = (t0 + 1032U);
    t5 = *((char **)t1);
    t1 = (t0 + 7030);
    t38 = *((int *)t1);
    t39 = (t38 - 31);
    t11 = (t39 * -1);
    xsi_vhdl_check_range_of_index(31, 0, -1, *((int *)t1));
    t12 = (1U * t11);
    t16 = (0 + t12);
    t6 = (t5 + t16);
    t2 = *((unsigned char *)t6);
    t7 = (t0 + 2248U);
    t8 = *((char **)t7);
    t40 = (0 - 31);
    t26 = (t40 * -1);
    t27 = (1U * t26);
    t31 = (0 + t27);
    t7 = (t8 + t31);
    *((unsigned char *)t7) = t2;
    xsi_set_current_line(69, ng0);
    t1 = (t0 + 2248U);
    t5 = *((char **)t1);
    t1 = (t0 + 1192U);
    t6 = *((char **)t1);
    t1 = ((IEEE_P_2592010699) + 4024);
    t2 = xsi_vhdl_greaterEqual(t1, t5, 32U, t6, 32U);
    if (t2 != 0)
        goto LAB42;

LAB44:
LAB43:
LAB37:    t1 = (t0 + 7030);
    t36 = *((int *)t1);
    t5 = (t0 + 7034);
    t37 = *((int *)t5);
    if (t36 == t37)
        goto LAB38;

LAB45:    t38 = (t36 + -1);
    t36 = t38;
    t6 = (t0 + 7030);
    *((int *)t6) = t36;
    goto LAB35;

LAB39:    xsi_set_current_line(64, ng0);
    t17 = (t0 + 2368U);
    t18 = *((char **)t17);
    t17 = (t18 + 0);
    *((unsigned char *)t17) = (unsigned char)3;
    goto LAB40;

LAB42:    xsi_set_current_line(70, ng0);
    t7 = (t0 + 2248U);
    t8 = *((char **)t7);
    t7 = (t0 + 6684U);
    t9 = (t0 + 1192U);
    t10 = *((char **)t9);
    t9 = (t0 + 6620U);
    t13 = ieee_p_1242562249_sub_1547270861_1035706684(IEEE_P_1242562249, t4, t8, t7, t10, t9);
    t14 = (t0 + 2248U);
    t17 = *((char **)t14);
    t14 = (t17 + 0);
    t18 = (t4 + 12U);
    t11 = *((unsigned int *)t18);
    t12 = (1U * t11);
    memcpy(t14, t13, t12);
    xsi_set_current_line(71, ng0);
    t1 = (t0 + 2128U);
    t5 = *((char **)t1);
    t1 = (t0 + 7030);
    t38 = *((int *)t1);
    t39 = (t38 - 31);
    t11 = (t39 * -1);
    xsi_vhdl_check_range_of_index(31, 0, -1, *((int *)t1));
    t12 = (1U * t11);
    t16 = (0 + t12);
    t6 = (t5 + t16);
    *((unsigned char *)t6) = (unsigned char)3;
    goto LAB43;

}


extern void work_a_3108379117_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3108379117_3212880686_p_0};
	xsi_register_didat("work_a_3108379117_3212880686", "isim/test_udiv32_isim_beh.exe.sim/work/a_3108379117_3212880686.didat");
	xsi_register_executes(pe);
}
