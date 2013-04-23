within PowerSystems.Control;
package IgnitionTables "Ignition tables for inverters"
extends Modelica.Icons.VariantsPackage;

record Table_2 "Ignition Table2, 3 pulses/period"
  extends Modelica.Icons.Record;
  constant Real phiIgn[12, 7]=
 [0.0, 0.52360, 1.5708, 2.6180, 3.6652, 4.7124, 5.7596;
  0.1, 0.56774, 1.5708, 2.5738, 3.7093, 4.7124, 5.7154;
  0.2, 0.60946, 1.5708, 2.5321, 3.7511, 4.7124, 5.6737;
  0.3, 0.64876, 1.5708, 2.4928, 3.7904, 4.7124, 5.6344;
  0.4, 0.68570, 1.5708, 2.4559, 3.8273, 4.7124, 5.5975;
  0.5, 0.72036, 1.5708, 2.4212, 3.8620, 4.7124, 5.5628;
  0.6, 0.75285, 1.5708, 2.3887, 3.8944, 4.7124, 5.5303;
  0.7, 0.78331, 1.5708, 2.3583, 3.9249, 4.7124, 5.4999;
  0.8, 0.81185, 1.5708, 2.3297, 3.9534, 4.7124, 5.4713;
  0.9, 0.83862, 1.5708, 2.3030, 3.9802, 4.7124, 5.4446;
  1.0, 0.86373, 1.5708, 2.2779, 4.0053, 4.7124, 5.4195;
  1.1, 0.86373, 1.5708, 2.2779, 4.0053, 4.7124, 5.4195];
  annotation (defaultComponentName = "table_2",
    Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics),
    Documentation(
            info="<html>
<p>Ignition Table_mult: (2*mult - 1) pulses/period, equidistant arguments u.<br>
For use with interpolation function 'Base.Math.interpolateTable'.
<pre>
  Argument:  u = phi_ign[12,1]   desired pu voltage amplitude, from 0 to 1.1, step 0.1
  Values:    phi_ign[12,2:7]     tabulated ignition phase-angles phi_ign(u)
</pre>
Initial state is <tt>{true,false}</tt>.<br>
<tt>u[1] = 1</tt> corresponds to AC single-phase amplitude <tt>= v_DC/2</tt>.</p>
</p>
</html>
"));
end Table_2;

record Table_3 "Ignition Table3, 5 pulses/period"
  extends Modelica.Icons.Record;
  constant Real phiIgn[12, 11]=
 [0.0, 0.31416, 0.94248, 1.5708, 2.1991, 2.8274, 3.4558, 4.0841, 4.7124, 5.3407, 5.9690;
  0.1, 0.34374, 0.92353, 1.5708, 2.2181, 2.7979, 3.4853, 4.0651, 4.7124, 5.3597, 5.9394;
  0.2, 0.37268, 0.90360, 1.5708, 2.2380, 2.7689, 3.5143, 4.0452, 4.7124, 5.3796, 5.9105;
  0.3, 0.40093, 0.88262, 1.5708, 2.2590, 2.7407, 3.5425, 4.0242, 4.7124, 5.4006, 5.8823;
  0.4, 0.42846, 0.86054, 1.5708, 2.2811, 2.7131, 3.5701, 4.0021, 4.7124, 5.4226, 5.8547;
  0.5, 0.45524, 0.83732, 1.5708, 2.3043, 2.6864, 3.5968, 3.9789, 4.7124, 5.4459, 5.8279;
  0.6, 0.48125, 0.81291, 1.5708, 2.3287, 2.6603, 3.6228, 3.9545, 4.7124, 5.4703, 5.8019;
  0.7, 0.50646, 0.78727, 1.5708, 2.3543, 2.6351, 3.6481, 3.9289, 4.7124, 5.4959, 5.7767;
  0.8, 0.53089, 0.76037, 1.5708, 2.3812, 2.6107, 3.6725, 3.9020, 4.7124, 5.5228, 5.7523;
  0.9, 0.55453, 0.73220, 1.5708, 2.4094, 2.5871, 3.6961, 3.8738, 4.7124, 5.5510, 5.7287;
  1.0, 0.57739, 0.70275, 1.5708, 2.4388, 2.5642, 3.7190, 3.8443, 4.7124, 5.5804, 5.7058;
  1.1, 0.57739, 0.70275, 1.5708, 2.4388, 2.5642, 3.7190, 3.8443, 4.7124, 5.5804, 5.7058];
  annotation (defaultComponentName = "table_3",
    Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics),
    Documentation(
            info="<html>
<p>Ignition Table_mult: (2*mult - 1) pulses/period, equidistant arguments u.<br>
For use with interpolation function 'Base.Math.interpolateTable'.
<pre>
  Argument:  u = phi_ign[12,1]   desired pu voltage amplitude, from 0 to 1.1, step 0.1
  Values:    phi_ign[12,2:7]     tabulated ignition phase-angles phi_ign(u)
</pre>
Initial state is <tt>{true,false}</tt>.<br>
<tt>u[1] = 1</tt> corresponds to AC single-phase amplitude <tt>= v_DC/2</tt>.</p>
</p>
</html>"));
end Table_3;

record Table_4 "Ignition Table4, 7 pulses/period"
  extends Modelica.Icons.Record;
  constant Real phiIgn[12, 15]=
 [0.0, 0.22440, 0.67320, 1.1220, 1.5708, 2.0196, 2.4684, 2.9172,
       3.3660,  3.8148,  4.2636, 4.7124, 5.1612, 5.6100, 6.0588;
  0.1, 0.24616, 0.65541, 1.1315, 1.5708, 2.0101, 2.4862, 2.8954,
       3.3878,  3.7970,  4.2731, 4.7124, 5.1516, 5.6278, 6.0370;
  0.2, 0.26768, 0.63712, 1.1407, 1.5708, 2.0009, 2.5045, 2.8739,
       3.4093,  3.7787,  4.2823, 4.7124, 5.1425, 5.6461, 6.0155;
  0.3, 0.28893, 0.61834, 1.1495, 1.5708, 1.9921, 2.5232, 2.8527,
       3.4305,  3.7599,  4.2911, 4.7124, 5.1337, 5.6648, 5.9943;
  0.4, 0.30988, 0.59907, 1.1580, 1.5708, 1.9836, 2.5425, 2.8317,
       3.4515,  3.7407,  4.2996, 4.7124, 5.1252, 5.6841, 5.9733;
  0.5, 0.33053, 0.57930, 1.1662, 1.5708, 1.9754, 2.5623, 2.8111,
       3.4721,  3.7209,  4.3078, 4.7124, 5.1170, 5.7039, 5.9527;
  0.6, 0.35084, 0.55906, 1.1740, 1.5708, 1.9676, 2.5825, 2.7908,
       3.4924,  3.7006,  4.3156, 4.7124, 5.1092, 5.7241, 5.9323;
  0.7, 0.37080, 0.53834, 1.1816, 1.5708, 1.9600, 2.6033, 2.7708,
       3.5124,  3.6799,  4.3232, 4.7124, 5.1016, 5.7448, 5.9124;
  0.8, 0.39041, 0.51715, 1.1889, 1.5708, 1.9527, 2.6244, 2.7512,
       3.5320,  3.6587,  4.3305, 4.7124, 5.0943, 5.7660, 5.8928;
  0.9, 0.40965, 0.49553, 1.1959, 1.5708, 1.9457, 2.6461, 2.7319,
       3.5512,  3.6371,  4.3375, 4.7124, 5.0872, 5.7877, 5.8735;
  1.0, 0.42851, 0.47349, 1.2027, 1.5708, 1.9389, 2.6681, 2.7131,
       3.5701,  3.6151,  4.3443, 4.7124, 5.0804, 5.8097, 5.8547;
  1.1, 0.42851, 0.47349, 1.2027, 1.5708, 1.9389, 2.6681, 2.7131,
       3.5701,  3.6151,  4.3443, 4.7124, 5.0804, 5.8097, 5.8547];
  annotation (defaultComponentName = "table_4",
    Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics),
    Documentation(
            info="<html>
<p>Ignition Table_mult: (2*mult - 1) pulses/period, equidistant arguments u.<br>
For use with interpolation function 'Base.Math.interpolateTable'.
<pre>
  Argument:  u = phi_ign[12,1]   desired pu voltage amplitude, from 0 to 1.1, step 0.1
  Values:    phi_ign[12,2:7]     tabulated ignition phase-angles phi_ign(u)
</pre>
Initial state is <tt>{true,false}</tt>.<br>
<tt>u[1] = 1</tt> corresponds to AC single-phase amplitude <tt>= v_DC/2</tt>.</p>
</p>
</html>"));
end Table_4;

record Table_5 "Ignition Table5, 9 pulses/period"
  extends Modelica.Icons.Record;
  constant Real phiIgn[12, 19]=
 [0.0, 0.17453, 0.52360, 0.87266, 1.2217, 1.5708, 1.9199, 2.2689, 2.6180, 2.9671,
       3.3161,  3.6652,  4.0143,  4.3633, 4.7124, 5.0615, 5.4105, 5.7596, 6.1087;
  0.1, 0.19167, 0.50835, 0.88373, 1.2157, 1.5708, 1.9259, 2.2579, 2.6332, 2.9499,
       3.3333,  3.6499,  4.0253,  4.3573, 4.7124, 5.0675, 5.3995, 5.7748, 6.0915;
  0.2, 0.20868, 0.49285, 0.89451, 1.2094, 1.5708, 1.9322, 2.2471, 2.6487, 2.9329,
       3.3503,  3.6344,  4.0361,  4.3510, 4.7124, 5.0738, 5.3887, 5.7903, 6.0745;
  0.3, 0.22557, 0.47709, 0.90501, 1.2029, 1.5708, 1.9387, 2.2366, 2.6645, 2.9160,
       3.3672,  3.6187,  4.0466,  4.3445, 4.7124, 5.0803, 5.3782, 5.8061, 6.0576;
  0.4, 0.24231, 0.46108, 0.91522, 1.1962, 1.5708, 1.9454, 2.2264, 2.6805, 2.8993,
       3.3839,  3.6027,  4.0568,  4.3378, 4.7124, 5.0870, 5.3680, 5.8221, 6.0409;
  0.5, 0.25889, 0.44482, 0.92517, 1.1892, 1.5708, 1.9524, 2.2164, 2.6968, 2.8827,
       3.4005,  3.5864,  4.0668,  4.3308, 4.7124, 5.0940, 5.3580, 5.8384, 6.0243;
  0.6, 0.27531, 0.42834, 0.93486, 1.1820, 1.5708, 1.9596, 2.2067, 2.7133, 2.8663,
       3.4169,  3.5699,  4.0765,  4.3236, 4.7124, 5.1011, 5.3483, 5.8548, 6.0079;
  0.7, 0.29155, 0.41163, 0.94430, 1.1746, 1.5708, 1.9670, 2.1973, 2.7300, 2.8500,
       3.4331,  3.5532,  4.0859,  4.3162, 4.7124, 5.1086, 5.3389, 5.8716, 5.9916;
  0.8, 0.30761, 0.39471, 0.95349, 1.1669, 1.5708, 1.9747, 2.1881, 2.7469, 2.8340,
       3.4492,  3.5363,  4.0951,  4.3084, 4.7124, 5.1163, 5.3297, 5.8885, 5.9756;
  0.9, 0.32347, 0.37758, 0.96244, 1.1588, 1.5708, 1.9828, 2.1792, 2.7640, 2.8181,
       3.4651,  3.5192,  4.1040,  4.3004, 4.7124, 5.1244, 5.3207, 5.9056, 5.9597;
  1.0, 0.33913, 0.36027, 0.97116, 1.1505, 1.5708, 1.9911, 2.1704, 2.7813, 2.8025,
       3.4807,  3.5019,  4.1128,  4.2921, 4.7124, 5.1327, 5.3120, 5.9229, 5.9441;
  1.1, 0.33913, 0.36027, 0.97116, 1.1505, 1.5708, 1.9911, 2.1704, 2.7813, 2.8025,
       3.4807,  3.5019,  4.1128,  4.2921, 4.7124, 5.1327, 5.3120, 5.9229, 5.9441];
  annotation (defaultComponentName = "table_5",
    Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics),
    Documentation(
            info="<html>
<p>Ignition Table_mult: (2*mult - 1) pulses/period, equidistant arguments u.<br>
For use with interpolation function 'Base.Math.interpolateTable'.
<pre>
  Argument:  u = phi_ign[12,1]   desired pu voltage amplitude, from 0 to 1.1, step 0.1
  Values:    phi_ign[12,2:7]     tabulated ignition phase-angles phi_ign(u)
</pre>
Initial state is <tt>{true,false}</tt>.<br>
<tt>u[1] = 1</tt> corresponds to AC single-phase amplitude <tt>= v_DC/2</tt>.</p>
</p>
</html>"));
end Table_5;

annotation (preferedView="info",
    Documentation(info="<html>
<p>Ignition tables for synchronous PWM gate-control.</p>
</html>
"),
  Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics));
end IgnitionTables;
