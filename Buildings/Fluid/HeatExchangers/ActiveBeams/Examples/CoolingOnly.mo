within Buildings.Fluid.HeatExchangers.ActiveBeams.Examples;
model CoolingOnly
  extends Modelica.Icons.Example;

  Buildings.Fluid.Sources.FixedBoundary sin_1(redeclare package Medium =
        Buildings.Media.Water, nPorts=1) "Sink water"
    annotation (Placement(transformation(extent={{100,90},{80,110}})));
  Buildings.Fluid.Sources.MassFlowSource_T sou_2(
    redeclare package Medium = Buildings.Media.Air,
    use_m_flow_in=false,
    m_flow=0.0792,
    nPorts=1,
    T=285.85) "Source air" annotation (Placement(transformation(extent={{100,10},{80,30}})));
  Buildings.Fluid.Sources.FixedBoundary bou(redeclare package Medium =
        Buildings.Media.Air, nPorts=1) "Sink Air"
    annotation (Placement(transformation(extent={{100,-110},{80,-90}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor thermalConductor(G=200)
    "Thermal conductor (wall)"
    annotation (Placement(transformation(extent={{-60,-110},{-40,-90}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow
    "Thermal loads"
    annotation (Placement(transformation(extent={{-30,-70},{-10,-50}})));
  Modelica.Blocks.Sources.Constant const(k=273.15 + 25) "Set-point temperature"
    annotation (Placement(transformation(extent={{-110,-20},{-90,0}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature fixedTemperature(T=301.15)
    "Outdoor air temperature"
    annotation (Placement(transformation(extent={{-110,-110},{-90,-90}})));
  Buildings.Controls.Continuous.LimPID conPID(
    reverseAction=true,
    Td=0,
    k=0.5,
    Ti=70,
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    yMax=0.094) "Controller"
         annotation (Placement(transformation(extent={{-70,-20},{-50,0}})));
  Buildings.Fluid.Sources.FixedBoundary sou_1(
    redeclare package Medium = Buildings.Media.Water,
    nPorts=1,
    T=288.15) "Source water"
    annotation (Placement(transformation(extent={{-80,90},{-60,110}})));
  Buildings.Fluid.Movers.FlowControlled_m_flow pum(
    redeclare package Medium = Buildings.Media.Water,
    m_flow_nominal=0.094,
    addPowerToMedium=false,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial) "pump water"
    annotation (Placement(transformation(extent={{-20,90},{0,110}})));
  Modelica.Blocks.Math.Gain gain(k=1200) "Gain thermal loads"
    annotation (Placement(transformation(extent={{-68,-70},{-48,-50}})));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor senTem
    "Room air temperature sensor"
    annotation (Placement(transformation(extent={{-20,-40},{-40,-20}})));
  Modelica.Blocks.Sources.Sine sine(
    freqHz=1/86400,
    amplitude=1,
    phase=-1.5707963267949) "Source thermal loads"
    annotation (Placement(transformation(extent={{-110,-70},{-90,-50}})));
  Buildings.Fluid.MixingVolumes.MixingVolume vol(
    nPorts=2,
    redeclare package Medium = Buildings.Media.Air,
    m_flow_nominal=0.1,
    V=30,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
    T_start=293.15) "Air volume (room)"
    annotation (Placement(transformation(extent={{50,-70},{70,-50}})));
  Buildings.Fluid.HeatExchangers.ActiveBeams.Cooling beaCoo(
    redeclare package MediumWat = Buildings.Media.Water,
    redeclare package MediumAir = Buildings.Media.Air,
    redeclare
      Buildings.Fluid.HeatExchangers.ActiveBeams.Data.Trox.DID632A_nozzleH_lenght6ft_cooling
                                                                                                     perCoo,
    energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial) "Active Beam"
    annotation (Placement(transformation(extent={{26,48},{54,72}})));
equation
  connect(fixedTemperature.port,thermalConductor. port_a)
    annotation (Line(points={{-90,-100},{-60,-100}},         color={191,0,0}));
  connect(sou_1.ports[1], pum.port_a) annotation (Line(points={{-60,100},{-40,100},
          {-20,100}}, color={0,127,255}));
  connect(gain.y, prescribedHeatFlow.Q_flow)
    annotation (Line(points={{-47,-60},{-30,-60}}, color={0,0,127}));
  connect(const.y, conPID.u_s)
    annotation (Line(points={{-89,-10},{-72,-10}},
                                                 color={0,0,127}));
  connect(senTem.T, conPID.u_m) annotation (Line(points={{-40,-30},{-50,-30},{-60,
          -30},{-60,-22}}, color={0,0,127}));
  connect(conPID.y, pum.m_flow_in) annotation (Line(points={{-49,-10},{-40,-10},
          {-40,118},{-10.2,118},{-10.2,112}}, color={0,0,127}));
  connect(vol.ports[1], bou.ports[1]) annotation (Line(points={{58,-70},{60,-70},
          {60,-100},{80,-100}}, color={0,127,255}));
  connect(prescribedHeatFlow.port, vol.heatPort)
    annotation (Line(points={{-10,-60},{20,-60},{50,-60}}, color={191,0,0}));
  connect(thermalConductor.port_b, vol.heatPort) annotation (Line(points={{-40,-100},
          {40,-100},{40,-60},{50,-60}}, color={191,0,0}));
  connect(senTem.port, vol.heatPort) annotation (Line(points={{-20,-30},{40,-30},
          {40,-60},{50,-60}}, color={191,0,0}));
  connect(sine.y, gain.u)
    annotation (Line(points={{-89,-60},{-89,-60},{-70,-60}}, color={0,0,127}));
  connect(pum.port_b, beaCoo.watCoo_a) annotation (Line(points={{0,100},{6,100},
          {10,100},{10,66},{26,66}}, color={0,127,255}));
  connect(beaCoo.watCoo_b, sin_1.ports[1]) annotation (Line(points={{54,66},{70,
          66},{70,100},{80,100}}, color={0,127,255}));
  connect(beaCoo.heaPor, vol.heatPort) annotation (Line(points={{40,48},{40,48},
          {40,26},{40,-60},{50,-60}}, color={191,0,0}));
  connect(sou_2.ports[1], beaCoo.air_a) annotation (Line(points={{80,20},{70,20},
          {70,54},{54,54}}, color={0,127,255}));
  connect(beaCoo.air_b, vol.ports[2]) annotation (Line(points={{26,54},{12,54},
          {12,-80},{62,-80},{62,-70}}, color={0,127,255}));
  annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-120,
            -120},{120,120}})),experiment(StopTime=172800),
            __Dymola_Commands(file="modelica://Buildings/Resources/Scripts/Dymola/Fluid/HeatExchangers/ActiveBeams/Examples/CoolingOnly.mos"
        "Simulate and plot"),
    Icon(coordinateSystem(extent={{-120,-120},{120,120}})),
     Documentation(info="<html>
<p>
This example tests the implementation of <a href=\"modelica://Buildings.Fluid.HeatExchangers.ActiveBeams.Cooling\">
Buildings.Fluid.HeatExchangers.ActiveBeams.Cooling</a>.
An air volume is maintained at a temperature below 25&circ;C by a controller that regulates the water flow rate in the active beam.
</p>
</html>", revisions="<html>
<ul>
<li>
June 14, 2016, by Michael Wetter:<br/>
Revised implementation.
</li>
<li>
May 20, 2016, by Alessandro Maccarini:<br/>
First implementation.
</li>
</ul>
</html>"));
end CoolingOnly;
