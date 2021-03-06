within Buildings.Fluid.HeatExchangers.ActiveBeams.BaseClasses.Characteristics;
record PerformanceCurve_WaterFlow "Record for water parameters"
  extends Modelica.Icons.Record;
  parameter Real Normalized_WaterFlow[:](
    each min=0,
    each final unit="1") "Normalized water volume flow rate at user-selected operating points";
  parameter Real ModFactor[size(Normalized_WaterFlow,1)](
     each min=0,
     each unit="1") "Normalized performance factor at these flow rates";

  annotation (Documentation(info="<html>
<p>
Data record for performance data that describe volume flow rate versus
efficiency.
The volume flow rate <code>r_V</code> must be increasing, i.e.,
<code>r_V[i] &lt; r_V[i+1]</code>.
Both vectors, <code>r_V</code> and <code>eta</code>
must have the same size.
</p>
</html>",
revisions="<html>
<ul>
<li>
September 28, 2011, by Michael Wetter:<br/>
First implementation.
</li>
</ul>
</html>"));
end PerformanceCurve_WaterFlow;
