within PowerSystems.Examples.Spot;
package InvertersAC3ph "Inverters dqo"
  extends Modelica.Icons.ExamplesPackage;

  model Rectifier "Rectifier"

    inner PowerSystems.System system(ini="tr", ref="inertial")
                        annotation (Placement(transformation(extent={{-100,80},
              {-80,100}}, rotation=0)));
    PowerSystems.Blocks.Signals.TransientPhasor transPh(
      t_change=0.1,
      t_duration=0.1,
      a_ini=2,
      a_fin=1)
         annotation (Placement(transformation(extent={{-100,20},{-80,40}},
            rotation=0)));
    PowerSystems.AC3ph.Sources.Voltage vAC(scType_par=false, V_nom=100)
          annotation (Placement(transformation(extent={{-80,0},{-60,20}},
            rotation=0)));
    PowerSystems.AC3ph.Impedances.Inductor ind(r=0.05,
      V_nom=100,
      S_nom=1e3)
      annotation (Placement(transformation(extent={{-50,0},{-30,20}}, rotation=
              0)));
    PowerSystems.AC3ph.Sensors.PVImeter meterAC(abc=true,
      av=true,
      tcst=0.1,
      V_nom=100,
      S_nom=1e3,
      phasor=true)
      annotation (Placement(transformation(extent={{-20,0},{0,20}}, rotation=0)));
    PowerSystems.AC3ph.Inverters.Rectifier rectifier(rectifier(par=idealSC100V_10A))
      annotation (Placement(transformation(extent={{30,0},{10,20}}, rotation=0)));
    PowerSystems.AC1ph_DC.Sensors.PVImeter meterDC(av=true, tcst=0.1,
      V_nom=100,
      S_nom=1e3)
      annotation (Placement(transformation(extent={{40,0},{60,20}}, rotation=0)));
    PowerSystems.AC1ph_DC.Sources.DCvoltage vDC(pol=0, V_nom=100)
      annotation (Placement(transformation(extent={{90,0},{70,20}}, rotation=0)));
    PowerSystems.AC3ph.Nodes.GroundOne grd1
                               annotation (Placement(transformation(extent={{
              -80,0},{-100,20}}, rotation=0)));
    PowerSystems.AC3ph.Nodes.GroundOne grd2
                               annotation (Placement(transformation(extent={{90,
              0},{110,20}}, rotation=0)));
    PowerSystems.Common.Thermal.BdCondV bdCond(m=3) annotation (Placement(
          transformation(extent={{10,20},{30,40}}, rotation=0)));
    PowerSystems.Examples.Spot.Data.Semiconductors.IdealSC100V_10A idealSC100V_10A
      annotation (Placement(transformation(extent={{0,80},{40,100}}, rotation=0)));

  equation
    connect(vAC.term, ind.term_p) annotation (Line(points={{-60,10},{-50,10}},
          color={0,110,110}));
    connect(ind.term_n, meterAC.term_p) annotation (Line(points={{-30,10},{-20,
            10}}, color={0,110,110}));
    connect(meterAC.term_n, rectifier.AC)
      annotation (Line(points={{0,10},{10,10}}, color={0,110,110}));
    connect(rectifier.DC, meterDC.term_p)
      annotation (Line(points={{30,10},{40,10}}, color={0,0,255}));
    connect(meterDC.term_n, vDC.term)
      annotation (Line(points={{60,10},{70,10}}, color={0,0,255}));
    connect(transPh.y, vAC.vPhasor)
                                  annotation (Line(points={{-80,30},{-64,30},{
            -64,20}}, color={0,0,127}));
    connect(grd1.term, vAC.neutral)
      annotation (Line(points={{-80,10},{-80,10}}, color={0,0,255}));
    connect(vDC.neutral, grd2.term)
      annotation (Line(points={{90,10},{90,10}}, color={0,0,255}));
    connect(rectifier.heat, bdCond.heat)
      annotation (Line(points={{20,20},{20,20}}, color={176,0,0}));
    annotation (

      Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics),
      Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics),
      Documentation(
              info="<html>
<p>3-phase rectifier. Compare 'equation' and 'modular' version.</p>
<p><a href=\"PowerSystems.UsersGuide.Examples\">up users guide</a></p>
</html>
"),   experiment(
        StopTime=0.2,
        NumberOfIntervals=1000,
        Tolerance=1e-005,
        Algorithm="Lsodar"),
      experimentSetupOutput);
  end Rectifier;

  model InverterToLoad "Inverter to load"

    inner PowerSystems.System system(ini="tr", ref="inertial")
                        annotation (Placement(transformation(extent={{-100,80},
              {-80,100}}, rotation=0)));
    PowerSystems.AC3ph.Nodes.GroundOne grd
                              annotation (Placement(transformation(extent={{-80,
              -20},{-100,0}}, rotation=0)));
    PowerSystems.AC1ph_DC.Sources.DCvoltage vDC(pol=0, V_nom=100)
      annotation (Placement(transformation(extent={{-80,-20},{-60,0}}, rotation=
             0)));
    PowerSystems.AC1ph_DC.Sensors.PVImeter meterDC(av=true, tcst=0.1,
      V_nom=100,
      S_nom=1e3)
      annotation (Placement(transformation(extent={{-50,-20},{-30,0}}, rotation=
             0)));
    PowerSystems.AC3ph.Inverters.Inverter inverter(redeclare
        PowerSystems.AC3ph.Inverters.Components.InverterEquation inverter(par=
            idealSC100V_10A) "equation, with losses")
      annotation (Placement(transformation(extent={{-20,-20},{0,0}}, rotation=0)));
    PowerSystems.AC3ph.Inverters.Select select(fType_sys=false, fType_par=true, f=100,
      uType_par=false)  annotation (Placement(transformation(extent={{-20,20},{
              0,40}}, rotation=0)));
    PowerSystems.AC3ph.Sensors.PVImeter meterAC(
      abc=true,
      av=true,
      tcst=0.1,
      phasor=true,
      V_nom=100,
      S_nom=1e3)
      annotation (Placement(transformation(extent={{10,-20},{30,0}}, rotation=0)));
    PowerSystems.Blocks.Signals.TransientPhasor vCtrl(
      t_change=0.05,
      t_duration=0.05,
      a_ini=0)
         annotation (Placement(transformation(extent={{-50,40},{-30,60}},
            rotation=0)));
    PowerSystems.AC3ph.Loads.PQindLoad pqLoad(
      tcst=0.01, imax=1,
      V_nom=100,
      S_nom=1e3)                                 annotation (Placement(
          transformation(extent={{40,-20},{60,0}}, rotation=0)));
    PowerSystems.Common.Thermal.BdCondV bdCond(m=3) annotation (Placement(
          transformation(extent={{-20,0},{0,20}}, rotation=0)));
    PowerSystems.Examples.Spot.Data.Semiconductors.IdealSC100V_10A idealSC100V_10A
      annotation (Placement(transformation(extent={{0,80},{40,100}}, rotation=0)));

  equation
    connect(vDC.term, meterDC.term_p)
      annotation (Line(points={{-60,-10},{-50,-10}}, color={0,0,255}));
    connect(meterDC.term_n, inverter.DC)
      annotation (Line(points={{-30,-10},{-20,-10}}, color={0,0,255}));
    connect(inverter.AC, meterAC.term_p)
      annotation (Line(points={{0,-10},{10,-10}}, color={0,120,120}));
    connect(select.theta_out, inverter.theta)
      annotation (Line(points={{-16,20},{-16,0}}, color={0,0,127}));
    connect(select.uPhasor_out, inverter.uPhasor) annotation (Line(points={{-4,
            20},{-4,0}}, color={0,0,127}));
    connect(vCtrl.y, select.uPhasor) annotation (Line(points={{-30,50},{-4,50},
            {-4,40}}, color={0,0,127}));
    connect(meterAC.term_n, pqLoad.term) annotation (Line(points={{30,-10},{40,
            -10}}, color={0,120,120}));
    connect(grd.term, vDC.neutral)
      annotation (Line(points={{-80,-10},{-80,-10}}, color={0,0,255}));
    connect(inverter.heat, bdCond.heat)
      annotation (Line(points={{-10,0},{-10,0}}, color={176,0,0}));
    annotation (

      Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics),
      Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics),
      Documentation(
              info="<html>
<p>3-phase inverter, feeding load at constant 100Hz with increasing amplitude.</p>
<p><a href=\"PowerSystems.UsersGuide.Examples\">up users guide</a></p>
</html>
"),   experiment(
        StopTime=0.2,
        NumberOfIntervals=1000,
        Tolerance=1e-005,
        Algorithm="Lsodar"),
      experimentSetupOutput);
  end InverterToLoad;

  model InverterToGrid "Inverter to grid"

    inner PowerSystems.System system(ini="tr", ref="synchron")
                        annotation (Placement(transformation(extent={{-100,80},
              {-80,100}}, rotation=0)));
    PowerSystems.AC1ph_DC.Sources.DCvoltage vDC(pol=0,
      V_nom=100,
      v0=2)
      annotation (Placement(transformation(extent={{-90,-20},{-70,0}}, rotation=
             0)));
    PowerSystems.AC1ph_DC.Sensors.PVImeter meterDC(tcst=0.1,
      V_nom=100,
      S_nom=1e3,
      av=true)
      annotation (Placement(transformation(extent={{-60,-20},{-40,0}}, rotation=
             0)));
    PowerSystems.AC3ph.Inverters.Inverter inverter(redeclare
        PowerSystems.AC3ph.Inverters.Components.InverterEquation inverter(par=
            idealSC100V_10A) "equation, with losses")
      annotation (Placement(transformation(extent={{-30,-20},{-10,0}}, rotation=
             0)));
    PowerSystems.AC3ph.Inverters.Select select(uType_par=false)
                                  annotation (Placement(transformation(extent={
              {-30,20},{-10,40}}, rotation=0)));
    PowerSystems.AC3ph.Sensors.PVImeter meterAC(
      phasor=true,
      V_nom=100,
      S_nom=1e3,
      av=true,
      tcst=0.1,
      abc=true)
      annotation (Placement(transformation(extent={{0,-20},{20,0}}, rotation=0)));
    PowerSystems.AC3ph.Impedances.Inductor ind(r=0.05,
      V_nom=100,
      S_nom=1e3)
      annotation (Placement(transformation(extent={{50,-20},{30,0}}, rotation=0)));
    PowerSystems.AC3ph.Sources.Voltage vAC(V_nom=100)
          annotation (Placement(transformation(extent={{80,-20},{60,0}},
            rotation=0)));
    PowerSystems.Blocks.Signals.TransientPhasor vCtrl(
      t_change=0.1,
      t_duration=0.1,
      ph_fin=0.5235987755983)
         annotation (Placement(transformation(extent={{-60,40},{-40,60}},
            rotation=0)));
    PowerSystems.AC3ph.Nodes.GroundOne grd
                               annotation (Placement(transformation(extent={{80,
              -20},{100,0}}, rotation=0)));
    PowerSystems.Common.Thermal.BdCondV bdCond(m=3) annotation (Placement(
          transformation(extent={{-30,0},{-10,20}}, rotation=0)));
    PowerSystems.Examples.Spot.Data.Semiconductors.IdealSC100V_10A idealSC100V_10A
      annotation (Placement(transformation(extent={{0,80},{40,100}}, rotation=0)));

  equation
    connect(vAC.term, ind.term_p) annotation (Line(points={{60,-10},{50,-10}},
          color={0,110,110}));
    connect(vDC.term, meterDC.term_p)
      annotation (Line(points={{-70,-10},{-60,-10}}, color={0,0,255}));
    connect(meterDC.term_n, inverter.DC)
      annotation (Line(points={{-40,-10},{-30,-10}}, color={0,0,255}));
    connect(inverter.AC, meterAC.term_p) annotation (Line(points={{-10,-10},{0,
            -10}}, color={0,120,120}));
    connect(meterAC.term_n, ind.term_n) annotation (Line(points={{20,-10},{30,
            -10}}, color={0,120,120}));
    connect(select.theta_out, inverter.theta) annotation (Line(points={{-26,20},
            {-26,0}}, color={0,0,127}));
    connect(select.uPhasor_out, inverter.uPhasor) annotation (Line(points={{-14,
            20},{-14,0}}, color={0,0,127}));
    connect(vCtrl.y, select.uPhasor) annotation (Line(points={{-40,50},{-14,50},
            {-14,40}}, color={0,0,127}));
    connect(vAC.neutral, grd.term)
      annotation (Line(points={{80,-10},{80,-10}}, color={0,0,255}));
    connect(inverter.heat, bdCond.heat)
      annotation (Line(points={{-20,0},{-20,0}}, color={176,0,0}));
    annotation (

      Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics),
      Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics),
      Documentation(
              info="<html>
<p>3-phase inverter, feeding into grid with increasing phase. Compare 'switch', 'equation' and 'modular' version.</p>
<p><a href=\"PowerSystems.UsersGuide.Examples\">up users guide</a></p>
</html>"),
      experiment(
        StopTime=0.2,
        NumberOfIntervals=1000,
        Tolerance=1e-005,
        Algorithm="Lsodar"),
      experimentSetupOutput);
  end InverterToGrid;

  model InverterAvToGrid "Inverter to grid"

    inner PowerSystems.System system(ini="tr")
                        annotation (Placement(transformation(extent={{-100,80},
              {-80,100}}, rotation=0)));
    PowerSystems.AC1ph_DC.Sources.DCvoltage vDC(pol=0,
      V_nom=100,
      v0=2)
      annotation (Placement(transformation(extent={{-90,-20},{-70,0}}, rotation=
             0)));
    PowerSystems.AC1ph_DC.Sensors.PVImeter meterDC(av=true, tcst=0.1,
      V_nom=100,
      S_nom=1e3)
      annotation (Placement(transformation(extent={{-60,-20},{-40,0}}, rotation=
             0)));
    PowerSystems.AC3ph.Inverters.InverterAverage inverter(
            par=idealSC100V_10A)
      annotation (Placement(transformation(extent={{-30,-20},{-10,0}}, rotation=
             0)));
    PowerSystems.AC3ph.Inverters.Select select(uType_par=false)
                                  annotation (Placement(transformation(extent={
              {-30,20},{-10,40}}, rotation=0)));
    PowerSystems.AC3ph.Sensors.PVImeter meterAC(
      abc=true,
      av=true,
      tcst=0.1,
      phasor=true,
      V_nom=100,
      S_nom=1e3)
      annotation (Placement(transformation(extent={{0,-20},{20,0}}, rotation=0)));
    PowerSystems.AC3ph.Impedances.Inductor ind(r=0.05,
      V_nom=100,
      S_nom=1e3)
      annotation (Placement(transformation(extent={{50,-20},{30,0}}, rotation=0)));
    PowerSystems.AC3ph.Sources.Voltage vAC(V_nom=100)
          annotation (Placement(transformation(extent={{80,-20},{60,0}},
            rotation=0)));
    PowerSystems.Blocks.Signals.TransientPhasor vCtrl(
      t_change=0.1,
      t_duration=0.1,
      ph_fin=0.5235987755983)
         annotation (Placement(transformation(extent={{-60,40},{-40,60}},
            rotation=0)));
    PowerSystems.AC3ph.Nodes.GroundOne grd
                               annotation (Placement(transformation(extent={{80,
              -20},{100,0}}, rotation=0)));
    PowerSystems.Common.Thermal.BdCondV bdCond(m=1) annotation (Placement(
          transformation(extent={{-30,0},{-10,20}}, rotation=0)));
    PowerSystems.Examples.Spot.Data.Semiconductors.IdealSC100V_10A idealSC100V_10A
      annotation (Placement(transformation(extent={{0,80},{40,100}}, rotation=0)));

  equation
    connect(vAC.term, ind.term_p) annotation (Line(points={{60,-10},{50,-10}},
          color={0,110,110}));
    connect(vDC.term, meterDC.term_p)
      annotation (Line(points={{-70,-10},{-60,-10}}, color={0,0,255}));
    connect(meterDC.term_n, inverter.DC)
      annotation (Line(points={{-40,-10},{-30,-10}}, color={0,0,255}));
    connect(inverter.AC, meterAC.term_p) annotation (Line(points={{-10,-10},{0,
            -10}}, color={0,120,120}));
    connect(meterAC.term_n, ind.term_n) annotation (Line(points={{20,-10},{30,
            -10}}, color={0,120,120}));
    connect(select.theta_out, inverter.theta) annotation (Line(points={{-26,20},
            {-26,0}}, color={0,0,127}));
    connect(select.uPhasor_out, inverter.uPhasor) annotation (Line(points={{-14,
            20},{-14,0}}, color={0,0,127}));
    connect(vCtrl.y, select.uPhasor) annotation (Line(points={{-40,50},{-14,50},
            {-14,40}}, color={0,0,127}));
    connect(vAC.neutral, grd.term)
      annotation (Line(points={{80,-10},{80,-10}}, color={0,0,255}));
    connect(inverter.heat, bdCond.heat)
      annotation (Line(points={{-20,0},{-20,0}}, color={176,0,0}));
    annotation (

      Icon(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics),
      Diagram(coordinateSystem(
          preserveAspectRatio=false,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics),
      Documentation(
              info="<html>
<p>3-phase inverter based on AVERAGED switch-equation, feeding into grid with increasing phase.</p>
<p><a href=\"PowerSystems.UsersGuide.Examples\">up users guide</a></p>
</html>"),
      experiment(
        StopTime=0.2,
        NumberOfIntervals=1000,
        Algorithm="Dassl"),
      experimentSetupOutput);
  end InverterAvToGrid;

  annotation (preferedView="info",

Documentation(info="<html>
<p>Comparison of different three-phase rectifier and inverter models.</p>
<p><a href=\"PowerSystems.UsersGuide.Examples\">up users guide</a></p>
</html>
"), Icon(coordinateSystem(
        preserveAspectRatio=false,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics));
end InvertersAC3ph;
