% runs chase_the_dragon
[Time Stocks] = chase_the_dragon()
hold on;
plot(Time, Stocks(:,1))
plot(Time, Stocks(:,2))
plot(Time, Stocks(:,3))