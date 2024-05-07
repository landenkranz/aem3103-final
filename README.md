  # Paper Airplane Numerical Study
  Final Project: AEM 3103 Spring 2024

  - By: Landen Kranz

  ## Summary of Findings

  This study was conducted to learn more about the flight properties of a glider by using paper airplane simulator. Height vs Range graphs were plotted to show the trajectory of the plane. The intitial velocity and flight path angle were adjusted to see how they affected trajectory. As shown in figure one, it seems that increasing the starting velocity results in the overall range of the airplane increasing. Varying the flight path angle didn't seem to affect the trajectory significantly.
 
  # Code Listing
 
  - PaperPlane.m - This main script runs all the functions and plots the figures.
  - EqMotion.m - This function finds the equation of motion to be used in ode23.
  - setup_sim.m - This function sets up the simulation by assigning values to all of the properties and parameters of the airplane.
  
  # Figures

  ## Fig. 1: Single Parameter Variation
  ![figure1](https://github.com/landenkranz/aem3103-final/assets/167818361/c1446faa-e04d-4797-a16f-af581727e5e2)

  This figure shows the trajectory of the airplane while varying a single parameter. The top plot varies initial velocity and the bottom plot varies flight path angle. The plots depict the nominal value, an upper limit value and a lower limit value.

  ## Fig. 2: Monte Carlo Simulation
  ![figure2](https://github.com/landenkranz/aem3103-final/assets/167818361/2cf5d940-a806-42c0-b652-666c5ae304ec)

  This figure shows 100 runs of random parameters for initial velocity and flight path angle between the upper and lower limits. The red line is a 10th order polynomial fit to the data that represents an average trajectory.

 ## Fig. 3: Time Derivatives
 ![figure3](https://github.com/landenkranz/aem3103-final/assets/167818361/236e2fca-66e7-4512-909a-4a9a7a69bc92)

 This figure shows the time derivatives of both the range and the height of the airplane. It also represents the velocity in the horizontal and vertical direction as a function of time.

