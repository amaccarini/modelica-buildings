within Buildings.Electrical.AC.ThreePhasesUnbalanced.Validation.IEEETests.Test4NodesFeeder.UnbalancedStepUp;
model IEEE4Unbalanced_Y_Y_StepUp
  "IEEE 4 node test feeder model with unbalanced load and Y - Y connection (step up)"
  extends
    Buildings.Electrical.AC.ThreePhasesUnbalanced.Validation.IEEETests.Test4NodesFeeder.BaseClasses.IEEE4
    (
    final line1_use_Z_y=true,
    final line2_use_Z_y=true,
    redeclare Buildings.Electrical.AC.ThreePhasesUnbalanced.Sensors.ProbeWye
      node1,
    redeclare Buildings.Electrical.AC.ThreePhasesUnbalanced.Sensors.ProbeWye
      node2,
    redeclare Buildings.Electrical.AC.ThreePhasesUnbalanced.Sensors.ProbeWye
      node3,
    redeclare Buildings.Electrical.AC.ThreePhasesUnbalanced.Sensors.ProbeWye
      node4,
    final VLL_side1=12.47e3,
    final VLL_side2=24.9e3,
    final VARbase=6000e3,
    final V2_ref={7161,7120,7128},
    final V3_ref={13839,13663,13655},
    final V4_ref={13815,13614,13615},
    final Theta2_ref=Modelica.Constants.pi/180.0*{-0.1,-120.3,119.3},
    final Theta3_ref=Modelica.Constants.pi/180.0*{-2.1,-123.3,115.1},
    final Theta4_ref=Modelica.Constants.pi/180.0*{-2.2,-123.4,114.9},
    loadRL(use_pf_in=true));
  Modelica.Blocks.Sources.Constant load2(k=-1800e3)
    annotation (Placement(transformation(extent={{30,58},{50,78}})));
  Modelica.Blocks.Sources.Constant load3(k=-2375e3)
    annotation (Placement(transformation(extent={{4,74},{24,94}})));
  Modelica.Blocks.Sources.Constant load1(k=-1275e3)
    annotation (Placement(transformation(extent={{56,30},{76,50}})));
  Modelica.Blocks.Sources.Constant pf1(k=0.85)
    annotation (Placement(transformation(extent={{-6,-28},{14,-8}})));
  Modelica.Blocks.Sources.Constant pf2(k=0.9)
    annotation (Placement(transformation(extent={{12,-54},{32,-34}})));
  Modelica.Blocks.Sources.Constant pf3(k=0.95)
    annotation (Placement(transformation(extent={{34,-78},{54,-58}})));
  Buildings.Electrical.AC.ThreePhasesUnbalanced.Conversion.ACACTransformer
    transformer(
    VHigh=VLL_side1,
    VLow=VLL_side2,
    XoverR=6,
    Zperc=sqrt(0.01^2 + 0.06^2),
    VABase=VARbase)
    annotation (Placement(transformation(extent={{-28,0},{-8,20}})));
equation
  connect(load2.y, loadRL.Pow2) annotation (Line(
      points={{51,68},{86,68},{86,10},{74,10}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(load3.y, loadRL.Pow3) annotation (Line(
      points={{25,84},{88,84},{88,4},{74,4}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(load1.y, loadRL.Pow1) annotation (Line(
      points={{77,40},{84,40},{84,16},{74,16}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pf1.y, loadRL.pf_in_1) annotation (Line(
      points={{15,-18},{58,-18},{58,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pf2.y, loadRL.pf_in_2) annotation (Line(
      points={{33,-44},{64,-44},{64,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(pf3.y, loadRL.pf_in_3) annotation (Line(
      points={{55,-68},{70.2,-68},{70.2,0}},
      color={0,0,127},
      smooth=Smooth.None));
  connect(line1.terminal_p, transformer.terminal_n) annotation (Line(
      points={{-48,10},{-28,10}},
      color={0,120,120},
      smooth=Smooth.None));
  connect(transformer.terminal_p, line2.terminal_n) annotation (Line(
      points={{-8,10},{12,10}},
      color={0,120,120},
      smooth=Smooth.None));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}), graphics), Documentation(revisions="<html><ul>
<li>
June 17, 2014, by Marco Bonvini:<br/>
Moved to Examples IEEE package.
</li>
<li>
June 6, 2014, by Marco Bonvini:<br/>
First implementation.
</li>
</ul>
</html>"));
end IEEE4Unbalanced_Y_Y_StepUp;