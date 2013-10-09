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
static const char *ng0 = "C:/Users/pc richard/Documents/CG3207/cg3207-project/udiv32.vhd";
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_1922276087_1035706684(char *, char *, char *, char *, char *, char *);
char *ieee_p_1242562249_sub_3059403468_1035706684(char *, char *, char *, char *, char *, char *);


static void work_a_3108379117_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t4;
    unsigned int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    xsi_set_current_line(43, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 6621);
    t4 = 1;
    if (32U == 32U)
        goto LAB5;

LAB6:    t4 = 0;

LAB7:    if (t4 != 0)
        goto LAB3;

LAB4:
LAB11:    t13 = (t0 + 4184);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    *((unsigned char *)t17) = (unsigned char)2;
    xsi_driver_first_trans_fast(t13);

LAB2:    t18 = (t0 + 4056);
    *((int *)t18) = 1;

LAB1:    return;
LAB3:    t8 = (t0 + 4184);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = (unsigned char)3;
    xsi_driver_first_trans_fast(t8);
    goto LAB2;

LAB5:    t5 = 0;

LAB8:    if (t5 < 32U)
        goto LAB9;
    else
        goto LAB7;

LAB9:    t6 = (t2 + t5);
    t7 = (t1 + t5);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB6;

LAB10:    t5 = (t5 + 1);
    goto LAB8;

LAB12:    goto LAB2;

}

static void work_a_3108379117_3212880686_p_1(char *t0)
{
    char t5[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;

LAB0:    xsi_set_current_line(45, ng0);
    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB5:    t15 = xsi_get_transient_memory(32U);
    memset(t15, 0, 32U);
    t16 = t15;
    memset(t16, (unsigned char)2, 32U);
    t17 = (t0 + 4248);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    memcpy(t21, t15, 32U);
    xsi_driver_first_trans_fast_port(t17);

LAB2:    t22 = (t0 + 4072);
    *((int *)t22) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 1032U);
    t6 = *((char **)t1);
    t1 = (t0 + 6484U);
    t7 = (t0 + 1192U);
    t8 = *((char **)t7);
    t7 = (t0 + 6500U);
    t9 = ieee_p_1242562249_sub_1922276087_1035706684(IEEE_P_1242562249, t5, t6, t1, t8, t7);
    t10 = (t0 + 4248);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t9, 32U);
    xsi_driver_first_trans_fast_port(t10);
    goto LAB2;

LAB6:    goto LAB2;

}

static void work_a_3108379117_3212880686_p_2(char *t0)
{
    char t5[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;

LAB0:    xsi_set_current_line(46, ng0);
    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB3;

LAB4:
LAB5:    t15 = xsi_get_transient_memory(32U);
    memset(t15, 0, 32U);
    t16 = t15;
    memset(t16, (unsigned char)2, 32U);
    t17 = (t0 + 4312);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    memcpy(t21, t15, 32U);
    xsi_driver_first_trans_fast_port(t17);

LAB2:    t22 = (t0 + 4088);
    *((int *)t22) = 1;

LAB1:    return;
LAB3:    t1 = (t0 + 1032U);
    t6 = *((char **)t1);
    t1 = (t0 + 6484U);
    t7 = (t0 + 1192U);
    t8 = *((char **)t7);
    t7 = (t0 + 6500U);
    t9 = ieee_p_1242562249_sub_3059403468_1035706684(IEEE_P_1242562249, t5, t6, t1, t8, t7);
    t10 = (t0 + 4312);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t9, 32U);
    xsi_driver_first_trans_fast_port(t10);
    goto LAB2;

LAB6:    goto LAB2;

}

static void work_a_3108379117_3212880686_p_3(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(47, ng0);

LAB3:    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 4376);
    t4 = (t1 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 4104);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_3108379117_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3108379117_3212880686_p_0,(void *)work_a_3108379117_3212880686_p_1,(void *)work_a_3108379117_3212880686_p_2,(void *)work_a_3108379117_3212880686_p_3};
	xsi_register_didat("work_a_3108379117_3212880686", "isim/test_udiv32_isim_beh.exe.sim/work/a_3108379117_3212880686.didat");
	xsi_register_executes(pe);
}
