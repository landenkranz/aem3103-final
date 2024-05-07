%	Example 1.3-1 Paper Airplane Flight Path
%	Copyright 2005 by Robert Stengel
%	August 23, 2005

	
%	a) Equilibrium Glide at Maximum Lift/Drag Ratio
    [V, Gam, H, R] = setup_sim();
	to		=	0;			% Initial Time, sec
	tf		=	6;			% Final Time, sec
	tspan	=	[to tf];
    VMIN    =   2;
    VMAX    =   7.5;
    GamMIN  =   -0.5;
    GamMAX  =   0.4;

	xo		=	[V;Gam;H;R];
	[tv1,xv1]	=	ode23('EqMotion',tspan,xo);
    xo      =   [VMIN;Gam;H;R];
    [tv2,xv2] =   ode23('EqMotion',tspan,xo);
    xo      =   [VMAX;Gam;H;R];
    [tv3,xv3] =   ode23('EqMotion',tspan,xo);

    xo		=	[V;Gam;H;R];
	[tf1,xf1]	=	ode23('EqMotion',tspan,xo);
    xo      =   [V;GamMIN;H;R];
    [tf2,xf2] =   ode23('EqMotion',tspan,xo);
    xo      =   [V;GamMAX;H;R];
    [tf3,xf3] =   ode23('EqMotion',tspan,xo);

	
    tiledlayout(2,1)
    nexttile
	plot(xv1(:,4),xv1(:,3),'k',xv2(:,4),xv2(:,3),'r',xv3(:,4),xv3(:,3),'g')
	xlabel('Range, m'), ylabel('Height, m'), grid
    title('Trajectory, Varying Initial Velocity');
    legend('Nominal', 'Lower', 'Higher');
    hold on; nexttile;
    plot(xf1(:,4),xf1(:,3),'k',xf2(:,4),xf2(:,3),'r',xf3(:,4),xf3(:,3),'g')
    xlabel('Range, m'), ylabel('Height, m'), grid
    title('Trajectory, Varying Initial Flight Path Angle')
    legend('Nominal', 'Lower', 'Higher');
    

    figure
    tspan = (to:0.08:tf);
    range = zeros(76,100);
    height = zeros(76,100);
    time = zeros(76,100);
    for i = 1:100
        V(i) = VMIN + (VMAX-VMIN)*rand(1);
        Gam(i) = GamMIN + (GamMAX-GamMIN)*rand(1);
        xo		=	[V(i);Gam(i);H;R];
	    [t,x]	=	ode23('EqMotion',tspan,xo);
        plot(x(:,4),x(:,3), 'Color',[0 0 1 0.3]);
        hold on
        range(:,i) = x(:,4);
        height(:,i) = x(:,3);
        time(:,i) = tspan;
    end
  
    p = polyfit(time,range,10);
    range_fit = polyval(p, time);

    q = polyfit(time,height,10);
    height_fit = polyval(q, time);

    fit = plot(range_fit, height_fit, 'Color', [1 0.2 0 1], LineWidth=3);
    legend(fit, 'Polynomial Fit');
    xlim([0 22])
    xlabel('Range, m'), ylabel('Height, m');
    title('Trajectories, Randomly Varying Velocity and Flight Path Angle')

    dp = zeros(1, 10);
    dq = zeros(1, 10);
    for i = 1:10
        dp(i) = p(i)*(11-i);
        dq(i) = q(i)*(11-i);
    end

    figure
    tiledlayout(2,1)
    nexttile
    drange = polyval(dp, time);
    plot(time,drange);
    xlabel('Time, s'), ylabel('dRange, m/s'), title('Time Derivative of Range')
    nexttile
    dheight = polyval(dq, time);
    plot(time,dheight);
    xlabel('Time, s'), ylabel('dHeight, m/s'), title('Time Derivative of Height')


