within Buildings.Fluid.FMI.Examples.FMUs.Validation;
block RoomConvectiveMoistAir4 "Validation of simple thermal zone"
  extends RoomConvectiveAir1(
    redeclare package Medium = Modelica.Media.Air.MoistAir(extraPropertiesNames={"CO2"}),
    allowFlowReversal = false);
  annotation (Documentation(info="<html>
<p>
This example validates that 
<a href=\"modelica://Buildings.Fluid.FMI.RoomConvective\">
Buildings.Fluid.FMI.RoomConvective
</a> 
exports correctly as an FMU.
</p>
</html>", revisions="<html>
<ul>
<li>
May 03, 2016, by Thierry S. Nouidui:<br/>
First implementation.
</li>
</ul>
</html>"),
__Dymola_Commands(file="modelica://Buildings/Resources/Scripts/Dymola/Fluid/FMI/Examples/FMUs/Validation/RoomConvectiveSimpleAir4.mos"
        "Export FMU"));
end RoomConvectiveMoistAir4;