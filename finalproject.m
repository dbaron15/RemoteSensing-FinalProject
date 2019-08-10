% Locations 
% 
% N3_4_lat = -5:5;
% N3_4_lon = -170:-120;
% 
% N1_2_lat = 0:-10;
% N1_2_lon = -90:-80;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%1998%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Nino3.4 for Jan1997-June1998

a = dir('*199*_chlor_*.nc');

for i = 1:length(a); %%%extract chlor_a from each file for the defined area%
    file1 = a(i).name;
    chlor = ncread(file1, 'chlor_a');
ch_lat = ncread(file1, 'lat');
ch_lon = ncread(file1, 'lon');

N3_4_lat = -5:5;
N3_4_lon = -170:-120;

lon_index = 121:721;
lat_index = 1081:1200;

chlor_N3_4(i,1:601,1:120) = chlor(lon_index,lat_index);

end

dummy = jet;
dummy(1,1:3)=1;
%%loop through each month to show chlor_a for the defined area
for i=1:length(a);
    chlor_2D = reshape(chlor_N3_4(i,:,:),[601 120]);
figure(i)
set(figure, 'Position', [1 1 800 410])
set(gcf,'defaultaxesfontsize',18,'defaultlinelinewidth',1); 
imagesc(N3_4_lon,N3_4_lat,chlor_2D',[0 0.5]);
axis xy; colormap(dummy);colorbar;
xlabel('Longitude (degrees east)','FontName','times','FontSize',18);
ylabel('Latitude (degrees north)','FontName','times','FontSize',18);
title('Chlorophyll a Concentration from Jan 1997 to August 1998 in Nino3.4','FontName','times','FontSize',14);
pause(1)

end

%%%mass export of figures
h=findobj('type','figure') % find the handles of the opened figures
folder='/Users/Deana/Documents/MATLAB/matlabfigures'  % Desination folder
for k=1:numel(h);
  filename=sprintf('n34_chlor1998_fig%d.jpg',k);
  file=fullfile(folder,filename);
  saveas(h(k),file);
end


N34_M98_c = mean(mean(chlor_N3_4, 3, 'omitnan'), 2, 'omitnan'); %%%area average mean

%%%get months label%%
startdate = datenum('01-01-1997');
enddate = datenum('08-31-1998');
xdata = linspace(startdate,enddate,20);
%%%plot timeseries
figure
set(gcf,'defaultaxesfontsize',14,'defaultlinelinewidth',1); 
h=plot(xdata, N34_M98_c,'g', 'LineWidth',2);
set(h,'linewidth',1);
hold on
ax = gca;
ax.XTick = xdata; %%convert ticks into dates
datetick('x','mmm') %%convert dates to month names
xlabel('Month','FontName','times','FontSize',14);
ylabel('Chlorophyll a Concentration','FontName','times','FontSize',14);
title('Area Averaged Chlorophyll a Concentration from Jan 1997 to August 1998 in Nino3.4','FontName','times','FontSize',14);

%%Nino3.4 SST Anom 1997-1998
a = dir('ersst.*.199*.nc');

for i = 1:length(a);
    file1 = a(i).name;
    sst_lat = ncread(file1, 'lat');
    sst_lon = ncread(file1, 'lon');
    anom = ncread(file1, 'anom');

N3_4_lat = -5:5;
N3_4_lon = -170:-120;

lon_index = 96:121;
lat_index = 43:47;

anom_N3_4(i, 1:26, 1:5) = anom(lon_index,lat_index);

end

dummy = jet;
dummy(1,1:3)=1;
%%loop through each month to show sst anomaly for the defined area
for i=1:length(a);
    anom_2D = reshape(anom_N3_4(i,:,:),[26 5]);
figure(i)
set(figure, 'Position', [1 1 800 410])
set(gcf,'defaultaxesfontsize',18,'defaultlinelinewidth',1); 
imagesc(N3_4_lon,N3_4_lat,anom_2D',[-2 2]);
axis xy; colormap(dummy);colorbar;
xlabel('Longitude (degrees east)','FontName','times','FontSize',18);
ylabel('Latitude (degrees north)','FontName','times','FontSize',18);
title('SST Anomaly from Jan 1997 to August 1998 in Nino3.4','FontName','times','FontSize',14);
pause(1)

end

%%%mass export of figures
h=findobj('type','figure') % find the handles of the opened figures
folder='/Users/Deana/Documents/MATLAB/matlabfigures'  % Desination folder
for k=1:numel(h);
  filename=sprintf('n34_sst1998_fig%d.jpg',k);
  file=fullfile(folder,filename);
  saveas(h(k),file);
end

N34_M98_a = mean(mean(anom_N3_4, 3, 'omitnan'), 2, 'omitnan');

%%%get months label%%
startdate = datenum('01-01-1997');
enddate = datenum('08-31-1998');
xdata = linspace(startdate,enddate,20);
%%plot
figure
set(gcf,'defaultaxesfontsize',18,'defaultlinelinewidth',1); 
h=plot(xdata,N34_M98_a,'k');
set(h,'linewidth',1);
hold on
ax = gca;
ax.XTick = xdata; %%convert ticks into dates
datetick('x','mmm') %%convert dates to month names
xlabel('Month','FontName','times','FontSize',18);
ylabel('SST Anomaly (degree Celsius)','FontName','times','FontSize',18);
title('Area Averaged SST Anomaly from Jan 1997 to August 1998 in Nino3.4','FontName','times','FontSize',14);

%Nino1+2 for Jan1997 to June1998
a = dir('*199*_chlor_a_*.nc');

for i = 1:length(a);
    file1 = a(i).name;
    chlor = ncread(file1, 'chlor_a');
ch_lat = ncread(file1, 'lat');
ch_lon = ncread(file1, 'lon');

N1_2_lat = -10:0;
N1_2_lon = -90:-80;

lon_index = 1081:1200;
lat_index = 1081:1200;

chlor_N1_2(i,1:120,1:120) = chlor(lon_index,lat_index);
clear chlor;
end

dummy = jet;
dummy(1,1:3)=1;
%%loop through each month to show chlor_a for the defined area
for i=1:length(a);
    chlor_2D = reshape(chlor_N1_2(i,:,:),[120 120]);
figure(i)
set(figure, 'Position', [1 1 800 410])
set(gcf,'defaultaxesfontsize',18,'defaultlinelinewidth',1); 
imagesc(N1_2_lon,N1_2_lat,chlor_2D',[0 0.5]);
axis xy; colormap(dummy);colorbar;
xlabel('Longitude (degrees east)','FontName','times','FontSize',18);
ylabel('Latitude (degrees north)','FontName','times','FontSize',18);
title('Chlorophyll a Concentration from Jan 1997 to August 1998 in Nino1+2','FontName','times','FontSize',14);
pause(1)

end

%%%mass export of figures
h=findobj('type','figure') % find the handles of the opened figures
folder='/Users/Deana/Documents/MATLAB/matlabfigures'  % Desination folder
for k=1:numel(h);
  filename=sprintf('n12_chlor1998_fig%d.jpg',k);
  file=fullfile(folder,filename);
  saveas(h(k),file);
end

N12_M98_c = mean(mean(chlor_N1_2, 3, 'omitnan'), 2, 'omitnan');

%%%get months label%%
startdate = datenum('01-01-1997');
enddate = datenum('08-31-1998');
xdata = linspace(startdate,enddate,20);
%%plot
figure
set(gcf,'defaultaxesfontsize',18,'defaultlinelinewidth',1); 
h=plot(xdata,N12_M98_c,'k');
set(h,'linewidth',1);
hold on
ax = gca;
ax.XTick = xdata; %%convert ticks into dates
datetick('x','mmm') %%convert dates to month names
xlabel('Month','FontName','times','FontSize',18);
ylabel('Chlorophyll a concentration','FontName','times','FontSize',18);
title('Area Averaged Chlorophyll a Concentration from Jan 1997 to August 1998 in Nino1+2','FontName','times','FontSize',14);

%%Nino1+2 SST Anom 1997-1998
a = dir('ersst.*.199*.nc');

for i = 1:length(a);
    file1 = a(i).name;
    lat = ncread(file1, 'lat');
    lon = ncread(file1, 'lon');
    anom = ncread(file1, 'anom');

N1_2_lat = -10:0;
N1_2_lon = -90:-80;

lon_index = 136:141;
lat_index = 40:45;

anom_N1_2(i, 1:6, 1:6) = anom(lon_index,lat_index);

end

dummy = jet;
dummy(1,1:3)=1;
for i=1:length(a);
    anom_2D = reshape(anom_N1_2(i,:,:),[6 6]);
figure(i)
set(figure, 'Position', [1 1 800 410])
set(gcf,'defaultaxesfontsize',18,'defaultlinelinewidth',1); 
imagesc(N1_2_lon,N1_2_lat,anom_2D',[-4 4]);
axis xy; colormap(dummy);colorbar;
xlabel('Longitude (degrees east)','FontName','times','FontSize',18);
ylabel('Latitude (degrees north)','FontName','times','FontSize',18);
title('SST Anomaly from Jan 1997 to August 1998 in Nino1+2','FontName','times','FontSize',14);
pause(1)

end

%%%mass export of figures
h=findobj('type','figure') % find the handles of the opened figures
folder='/Users/Deana/Documents/MATLAB/matlabfigures/n12_1998sst'  % Desination folder
for k=1:numel(h)
  filename=sprintf('n12_sst1998_fig%d.jpg',k)
  file=fullfile(folder,filename)
  saveas(h(k),file)
end

N12_M98_a = mean(mean(anom_N1_2, 3, 'omitnan'), 2, 'omitnan');

%%get months label%%
startdate = datenum('01-01-1997');
enddate = datenum('08-31-1998');
xdata = linspace(startdate,enddate,20);
%%plot
figure
set(gcf,'defaultaxesfontsize',18,'defaultlinelinewidth',1); 
h=plot(xdata,N12_M98_a,'k');
set(h,'linewidth',1);
hold on
ax = gca;
ax.XTick = xdata; %%convert ticks into dates
datetick('x','mmm') %%convert dates to month names
xlabel('Month','FontName','times','FontSize',18);
ylabel('SST Anomaly (degree Celsius)','FontName','times','FontSize',18);
title('Area Averaged SST Anomaly from Jan 1997 to August 1998 in Nino1+2','FontName','times','FontSize',14);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%2014%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Nino3.4 for Chlor Jan14-Oct16

a = dir('*201*_chlor_*.nc');

for i = 1:length(a); %%%extract chlor_a from each file for the defined area%
    file1 = a(i).name;
    chlor = ncread(file1, 'chlor_a');
ch_lat = ncread(file1, 'lat');
ch_lon = ncread(file1, 'lon');

N3_4_lat = -5:5;
N3_4_lon = -170:-120;

lon_index = 241:1440;
lat_index = 2041:2280;

chlor_N3_4_2014(i,1:1200,1:240) = chlor(lon_index,lat_index);

end

dummy = jet;
dummy(1,1:3)=1;
%%loop through each month to show chlor_a for the defined area
for i=1:length(a);
    chlor2014_2D = reshape(chlor_N3_4_2014(i,:,:),[1200 240]);
figure(i)
set(figure, 'Position', [1 1 800 410])
set(gcf,'defaultaxesfontsize',18,'defaultlinelinewidth',1); 
imagesc(N3_4_lon,N3_4_lat,chlor2014_2D',[0 0.5]);
axis xy; colormap(dummy);colorbar;
xlabel('Longitude (degrees east)','FontName','times','FontSize',18);
ylabel('Latitude (degrees north)','FontName','times','FontSize',18);
title('Chlorophyll a Concentration from May 2014 to August 2016 in Nino3.4','FontName','times','FontSize',14);
pause(1)

end

%%%mass export of figures
h=findobj('type','figure') % find the handles of the opened figures
folder='/Users/Deana/Documents/MATLAB/matlabfigures/n34_2014chlor'  % Desination folder
for k=1:numel(h);
  filename=sprintf('n34_chlor2014_fig%d.jpg',k);
  file=fullfile(folder,filename);
  saveas(h(k),file);
end


N34_M14_c = mean(mean(chlor_N3_4_2014, 3, 'omitnan'), 2, 'omitnan'); %%%area average mean

%%%get months label%%
startdate = datenum('05-01-2014');
enddate = datenum('08-31-2016');
xdata = linspace(startdate,enddate,28);
%%%plot timeseries
figure
set(gcf,'defaultaxesfontsize',18,'defaultlinelinewidth',1); 
h=plot(xdata, N34_M14_c,'k');
set(h,'linewidth',1);
hold on
ax = gca;
ax.XTick = xdata; %%convert ticks into dates
datetick('x','mmm') %%convert dates to month names
xlabel('Month','FontName','times','FontSize',18);
ylabel('Chlorophyll a Concentration','FontName','times','FontSize',18);
title('Area Averaged Chlorophyll a Concentration from May 2014 to August 2016 in Nino3.4','FontName','times','FontSize',14);

%%Nino3.4 SST Anom 1997-1998
a = dir('ersst.*.201*.nc');

for i = 1:length(a);
    file1 = a(i).name;
    sst_lat = ncread(file1, 'lat');
    sst_lon = ncread(file1, 'lon');
    anom = ncread(file1, 'anom');

N3_4_lat = -5:5;
N3_4_lon = -170:-120;

lon_index = 96:121;
lat_index = 43:47;

anom_N3_4_2014(i, 1:26, 1:5) = anom(lon_index,lat_index);

end

dummy = jet;
dummy(1,1:3)=1;
%%loop through each month to show sst anomaly for the defined area
for i=1:length(a);
    anom2014_2D = reshape(anom_N3_4_2014(i,:,:),[26 5]);
figure(i)
set(figure, 'Position', [1 1 800 410])
set(gcf,'defaultaxesfontsize',18,'defaultlinelinewidth',1); 
imagesc(N3_4_lon,N3_4_lat,anom2014_2D',[-2 2]);
axis xy; colormap(dummy);colorbar;
xlabel('Longitude (degrees east)','FontName','times','FontSize',18);
ylabel('Latitude (degrees north)','FontName','times','FontSize',18);
title('SST Anomaly from May 2014 to August 2016 in Nino3.4','FontName','times','FontSize',14);
pause(1)

end

%%%mass export of figures
h=findobj('type','figure') % find the handles of the opened figures
folder='/Users/Deana/Documents/MATLAB/matlabfigures'  % Desination folder
for k=1:numel(h);
  filename=sprintf('n34_sst2014_fig%d.jpg',k);
  file=fullfile(folder,filename);
  saveas(h(k),file);
end

N34_M14_a = mean(mean(anom_N3_4_2014, 3, 'omitnan'), 2, 'omitnan');

%%%get months label%%
startdate = datenum('05-01-2014');
enddate = datenum('08-31-2016');
xdata = linspace(startdate,enddate,28);
%%plot
figure
set(gcf,'defaultaxesfontsize',18,'defaultlinelinewidth',1); 
h=plot(xdata,N34_M14_a,'k');
set(h,'linewidth',1);
hold on
ax = gca;
ax.XTick = xdata; %%convert ticks into dates
datetick('x','mmm') %%convert dates to month names
xlabel('Month','FontName','times','FontSize',18);
ylabel('SST Anomaly (degree Celsius)','FontName','times','FontSize',18);
title('Area Averaged SST Anomaly from Jan 2014 to October 2016 in Nino3.4','FontName','times','FontSize',14);

%Nino1+2 for 2014 to 2016
a = dir('*201*_chlor_a_*.nc');

for i = 1:length(a);
    file1 = a(i).name;
    chlor = ncread(file1, 'chlor_a');
ch_lat = ncread(file1, 'lat');
ch_lon = ncread(file1, 'lon');

N1_2_lat = -10:0;
N1_2_lon = -90:-80;

lon_index = 2161:2400;
lat_index = 2041:2280;

chlor_N1_2_2014(i,1:240,1:240) = chlor(lon_index,lat_index);
clear chlor;
end

dummy = jet;
dummy(1,1:3)=1;
%%loop through each month to show chlor_a for the defined area
for i=1:length(a);
    chlor2014_2D = reshape(chlor_N1_2_2014(i,:,:),[240 240]);
figure(i)
set(figure, 'Position', [1 1 800 410])
set(gcf,'defaultaxesfontsize',18,'defaultlinelinewidth',1); 
imagesc(N1_2_lon,N1_2_lat,chlor2014_2D',[0 0.5]);
axis xy; colormap(dummy);colorbar;
xlabel('Longitude (degrees east)','FontName','times','FontSize',18);
ylabel('Latitude (degrees north)','FontName','times','FontSize',18);
title('Chlorophyll a Concentration from May 2014 to August 2016 in Nino1+2','FontName','times','FontSize',14);
pause(1)

end

%%%mass export of figures
h=findobj('type','figure') % find the handles of the opened figures
folder='/Users/Deana/Documents/MATLAB/matlabfigures/n12_2014chlor'  % Desination folder
for k=1:numel(h);
  filename=sprintf('n12_chlor2014_fig%d.jpg',k);
  file=fullfile(folder,filename);
  saveas(h(k),file);
end

N12_M14_c = mean(mean(chlor_N1_2_2014, 3, 'omitnan'), 2, 'omitnan');

%%%get months label%%
startdate = datenum('05-01-2014');
enddate = datenum('08-31-2016');
xdata = linspace(startdate,enddate,28);
%%plot
figure
set(gcf,'defaultaxesfontsize',18,'defaultlinelinewidth',1); 
h=plot(xdata,N12_M14_c,'k');
set(h,'linewidth',1);
hold on
ax = gca;
ax.XTick = xdata; %%convert ticks into dates
datetick('x','mmm') %%convert dates to month names
xlabel('Month','FontName','times','FontSize',18);
ylabel('Chlorophyll a concentration','FontName','times','FontSize',18);
title('Area Averaged Chlorophyll a Concentration from May 2014 to August 2016 in Nino1+2','FontName','times','FontSize',14);

%%Nino1+2 SST Anom 2014-2016
a = dir('ersst.*.201*.nc');

for i = 1:length(a);
    file1 = a(i).name;
    sst_lat = ncread(file1, 'lat');
    sst_lon = ncread(file1, 'lon');
    anom = ncread(file1, 'anom');

N1_2_lat = -10:0;
N1_2_lon = -90:-80;

lon_index = 136:141;
lat_index = 40:45;

anom_N1_2_2014(i, 1:6, 1:6) = anom(lon_index,lat_index);

end

dummy = jet;
dummy(1,1:3)=1;
for i=1:length(a);
    anom2014_2D = reshape(anom_N1_2_2014(i,:,:),[6 6]);
figure(i)
set(figure, 'Position', [1 1 800 410])
set(gcf,'defaultaxesfontsize',18,'defaultlinelinewidth',1); 
imagesc(N1_2_lon,N1_2_lat,anom2014_2D',[-4 4]);
axis xy; colormap(dummy);colorbar;
xlabel('Longitude (degrees east)','FontName','times','FontSize',18);
ylabel('Latitude (degrees north)','FontName','times','FontSize',18);
title('SST Anomaly from May 2014 to August 2016 in Nino1+2','FontName','times','FontSize',14);
pause(1)

end

%%%mass export of figures
h=findobj('type','figure') % find the handles of the opened figures
folder='/Users/Deana/Documents/MATLAB/matlabfigures/n12_2014sst'  % Desination folder
for k=1:numel(h)
  filename=sprintf('n12_sst2014_fig%d.jpg',k)
  file=fullfile(folder,filename)
  saveas(h(k),file)
end

N12_M14_a = mean(mean(anom_N1_2_2014, 3, 'omitnan'), 2, 'omitnan');

%%get months label%%
startdate = datenum('05-01-2014');
enddate = datenum('08-31-2016');
xdata = linspace(startdate,enddate,28);
%%plot
figure
set(gcf,'defaultaxesfontsize',18,'defaultlinelinewidth',1); 
h=plot(xdata,N12_M14_a,'k');
set(h,'linewidth',1);
hold on
ax = gca;
ax.XTick = xdata; %%convert ticks into dates
datetick('x','mmm') %%convert dates to month names
xlabel('Month','FontName','times','FontSize',18);
ylabel('SST Anomaly (degree Celsius)','FontName','times','FontSize',18);
title('Area Averaged SST Anomaly from May 2014 to August 2016 in Nino1+2','FontName','times','FontSize',14);

%%%%%%%%%%%%%%%%%%More Analysis%%%%%%%%%%%%%%%%%%%%%%%%%
%%find the correlation between sst anomaly and chlorophyll concentration by
%%region and calculate % change per region per year

%%by region
N34_c = vertcat(N34_M98_c, N34_M14_c); %%combine chlorophyll arrays
N34_a = vertcat(N34_M98_a, N34_M14_a); %%combine anomaly arrays

N34_mdl = fitlm(N34_a, N34_c); %%create linear model for area

plot(N34_mdl); %%plot linear model
set(gcf,'defaultaxesfontsize',18,'defaultlinelinewidth',1);
xlabel('SST anomaly (degree Celsius)','FontName','times','FontSize',18);
ylabel('Chlorophyll a concentration','FontName','times','FontSize',18);
title('Chlorophyll a Concentration vs. SST Anomaly in Nino 3.4','FontName','times','FontSize',14);

C34 = corrcoef(N34_a, N34_c, 'rows', 'pairwise'); %%correlation coefficient for Nino 3.4
C34 = C34(2);

N12_c = vertcat(N12_M98_c, N12_M14_c); %%combine chlorophyll arrays
N12_a = vertcat(N12_M98_a, N12_M14_a); %%combine anomaly arrays

N12_mdl = fitlm(N12_a, N12_c); %%create linear model for area

plot(N12_mdl); %%plot linear model
set(gcf,'defaultaxesfontsize',18,'defaultlinelinewidth',1);
xlabel('SST anomaly (degree Celsius)','FontName','times','FontSize',18);
ylabel('Chlorophyll a concentration','FontName','times','FontSize',18);
title('Chlorophyll a Concentration vs. SST Anomaly in Nino 1+2','FontName','times','FontSize',14);

C12 = corrcoef(N12_a, N12_c, 'rows', 'pairwise'); %%correlation coefficient for Nino 1+2
C12 = C12(2);

%%region and year CC and % change
C34_98 = corrcoef(N34_M98_a, N34_M98_c,'rows','pairwise'); %%calculate correlation coefficient
C34_98 = C34_98(2); %%replace with one value

c_PC34_98 = ((N34_M98_c(1) - N34_M98_c(12))/(N34_M98_c(1))*100); %%calculate percent change

C12_98 = corrcoef(N12_M98_a, N12_M98_c, 'rows', 'pairwise'); %%calculate correlation coefficient
C12_98 = C12_98(2); %%replace with one value

c_PC12_98 = ((N12_M98_c(1) - N12_M98_c(12))/(N12_M98_c(1))*100); %%calculate percent change

C34_14 = corrcoef(N34_M14_a, N34_M14_c,'rows','pairwise'); %%calculate correlation coefficient
C34_14 = C34_14(2); %%replace with one value

c_PC34_14 = ((N34_M14_c(4) - N34_M14_c(19))/(N34_M14_c(4))*100); %%calculate percent change

C12_14 = corrcoef(N12_M14_a, N12_M14_c,'rows','pairwise'); %%calculate correlation coefficient
C12_14 = C12_14(2); %%replace with one value

c_PC12_14 = ((N12_M14_c(4) - N12_M14_c(19))/(N12_M14_c(4))*100); %%calculate percent change
