% get data

load_system('ssc_fuel_cell_01')
load_system('ssc_fuel_cell_02')

out1 = sim('ssc_fuel_cell_01');

eta1a = out1.simlog_ssc_fuel_cell.Membrane_Electrode_Assembly.efficiency.series.values('1');
power1a = out1.simlog_ssc_fuel_cell.Membrane_Electrode_Assembly.power_elec.series.values;
volt1a = out1.simlog_ssc_fuel_cell.Electrical_Load.Voltage_Sensor.V.series.values;
curr1a = out1.simlog_ssc_fuel_cell.Electrical_Load.Controlled_Current_Source.iT.series.values;

out2 = sim('ssc_fuel_cell_02');

eta2a = out2.simlog_ssc_fuel_cell.Membrane_Electrode_Assembly.efficiency.series.values('1');
power2a = out2.simlog_ssc_fuel_cell.Membrane_Electrode_Assembly.power_elec.series.values;
volt2a = out2.simlog_ssc_fuel_cell.Electrical_Load.Voltage_Sensor.V.series.values;
curr2a = out2.simlog_ssc_fuel_cell.Electrical_Load.Controlled_Current_Source.iT.series.values;

figure(1),plot(power1a,eta1a,power2a,eta2a),legend('FC1','FC2')
xlabel('power (W)'),ylabel('efficiency (pu)')

% interpolate efficency

idx1 = power1a <= 25500;
idx2 = power2a <= 25500;

Pnorm = 0:.01:1;
P = Pnorm*25000;

eff1 = interp1(power1a(idx1),eta1a(idx1),P,'linear','extrap');
eff2 = interp1(power2a(idx2),eta2a(idx2),P,'linear','extrap');

figure(2),plot(Pnorm,eff1,Pnorm,eff2),legend('FC1','FC2')
xlabel('power (pu)'),ylabel('efficiency (pu)')

% interpolate voltage and current

idx1 = curr1a <= 160;
idx2 = curr2a <= 160;

curr = 0:1:160;

volt1 = interp1(curr1a(idx1),volt1a(idx1),curr,'linear','extrap');
volt2 = interp1(curr2a(idx2),volt2a(idx2),curr,'linear','extrap');

figure(3),plot(curr,volt1,curr,volt2),legend('FC1','FC2')
xlabel('current (A)'),ylabel('voltage (V)')
