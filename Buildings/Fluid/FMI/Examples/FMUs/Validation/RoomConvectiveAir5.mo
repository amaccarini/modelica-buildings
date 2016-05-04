within Buildings.Fluid.FMI.Examples.FMUs.Validation;
block RoomConvectiveAir5 "Validation of simple thermal zone"
  extends RoomConvectiveAir1(
    redeclare package Medium = Buildings.Media.Air(extraPropertiesNames={"CO2", "VOC"}),
    allowFlowReversal = true);
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
__Dymola_Commands(file="modelica://Buildings/Resources/Scripts/Dymola/Fluid/FMI/Examples/FMUs/Validation/RoomConvectiveAir5.mos"
        "Export FMU"));
end RoomConvectiveAir5;