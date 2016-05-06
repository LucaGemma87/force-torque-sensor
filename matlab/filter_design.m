%% Calcualte the coefficient (numerator and denominator  [b, a]) of the filter for the force torque sensor filter.

clear all
close all
clc

%% Design the filter as a Low Pass Filter of a Second Order and Pass Band of 10 Hz
lpFilt = designfilt('lowpassiir','FilterOrder',2, ...
    'PassbandFrequency',10,'PassbandRipple',0.003, ...
         'SampleRate',1e3);
% show filter Filter Visualitazione Tool
fvtool(lpFilt)

t = 0:.001:1; % time vector
x = ones(size(t)); % Create a step signal signal.
data_in = awgn(x,26,'measured'); % Add white Gaussian noise.


% Test filter on data simulated 
dataOut = filter(lpFilt,data_in);

% Returns filter parameters
[b,a] = tf(lpFilt);

%Show filter parameters
disp('Coef a:');vpa(a,5)
disp('Coef b:');vpa(b,5)

% Plot noise and filtered signal  
figure(2)
subplot(2,1,1)
plot(t,data_in,t,dataOut,'LineWidth',2) 
legend({'Signal with AWGN','Signal Filtered'},'Location','Best','FontSize',18,'FontWeight','bold');
title('Low Pass Filter of a Second Order and Pass Band of 10 Hz','FontSize',18,'FontWeight','bold');
xlabel('Time [s]','FontSize',18,'FontWeight','bold'); ylabel('Force [N]','FontSize',18,'FontWeight','bold');
grid on

%% Design the filter as a Low Pass Filter of a Second Order and Pass Band of 5 Hz

lpFilt = designfilt('lowpassiir','FilterOrder',2, ...
    'PassbandFrequency',5,'PassbandRipple',0.0005, ...
         'SampleRate',1e3);
% show filter Filter Visualitazione Tool
fvtool(lpFilt)
% Test filter on data simulated 
dataOut = filter(lpFilt,data_in);

% Returns filter parameters
[b,a] = tf(lpFilt);
disp('Coef a:');vpa(a,5)
disp('Coef b:');vpa(b,5)

% Plot noise and filtered signal  
figure(2)
subplot(2,1,2)
plot(t,data_in,t,dataOut,'LineWidth',2) % Plot both signals.
legend({'Signal with AWGN','Signal Filtered'},'Location','Best','FontSize',18,'FontWeight','bold');
title('Low Pass Filter of a Second Order and Pass Band of 5 Hz','FontSize',18,'FontWeight','bold');
xlabel('Time [s]','FontSize',18,'FontWeight','bold'); ylabel('Force [N]','FontSize',18,'FontWeight','bold');
grid on


%% Design the filter as a Low Pass Filter of a Second Order and Pass Band of 1 Hz

% lpFilt = designfilt('lowpassiir','FilterOrder',4, ...
%     'PassbandFrequency',1,'PassbandRipple',0.3, ...
%          'SampleRate',1e3);
% % show filter Filter Visualitazione Tool
% fvtool(lpFilt)
% % Test filter on data simulated 
% dataOut = filter(lpFilt,data_in);
% 
% % Returns filter parameters
% [b,a] = tf(lpFilt);
% disp('Coef a:');vpa(a,5)
% disp('Coef b:');vpa(b,5)
% 
% % Plot noise and filtered signal  
% figure(2)
% subplot(3,1,3)
% plot(t,data_in,t,dataOut) % Plot both signals.
% 
% legend('Signal with AWGN','Signal Filtered');
% title('Low Pass Filter of a Second Order and Pass Band of 1 Hz');
% xlabel('Time [s]'); ylabel('Force [N]');
% grid on