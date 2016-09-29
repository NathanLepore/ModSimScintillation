function [Time, Stocks] = chase_the_dragon()
    % simulates stock values of morphine, m3g, m6g in the bloodstream
    
    % time stuff
    time_step = 1; % in hours
    simulation_length = 12; % in hours
    
    % molecular weight
    morphine_weight = 285.33; % in grams / mol
    
    % blood plasma
    plasma_vol = 3; % in liters (2.7 - 3.0)
    
    % initial values
    initial_m = 0;   % in nmols / liter
    initial_m3g = 0; % in nmols / liter
    initial_m6g = 0; % in nmols / liter
    
    % half-lives
    
    % flow constants
    m3g_appearance = 0.6;
    m6g_appearance = 0.1;
    m3g_elimination = 0.2;
    m6g_elimination = 0.2;    
    
    %delivery regimen (m_appearance)
    d_quantity = .0025; % total amount of morphine, in grams
    d_frequency = 1; % frequency of delivery, in 1 / hour
    d_length = 4; % length of delivery, in hours
    
    % time vector
    [Time, Stocks] = morphinulator(transpose(0:time_step:simulation_length), [initial_m initial_m3g initial_m6g]);
     
    function [T, S] = morphinulator(T, S0)
        % takes a time vector and initial values and returns a time vector
        % and a matrix of stocks
        
        % initialize the stock matrix
        S = zeros(length(T), length(S0));
        for i = 1:length(S(1,:))
            S(1,i) = S0(i);
        end
        
        % iterate through stock matrix using morphinometer()
        for i = 2:length(S(:,1)) % rows of S, or T
            Old_stocks = S(i - 1,:);
            Flows = [0 0 0];
            Flows = morphinometer(T(i), Old_stocks);
            S(i, :) = Old_stocks + Flows;
        end
        
    end
    
    function res = morphinometer(t, V)
        % takes 4 stocks of time, morphine, m3g, and m6g concentrations and returns a
        % vector of the flows
        morphine = V(1);
        m3g = V(2);
        m6g = V(3);
        
        % if still dosing, dose
        % converting from grams to mols to nmols
        morphine_flow = 0;
        if t < d_length
            if mod(t, d_frequency) == 0
                morphine_flow = d_quantity / (d_frequency * d_length); % in grams / time
                morphine_flow = morphine_flow / morphine_weight * 1e9 / plasma_vol; % in nmols / liter / time
            end
        end
        
        % other stocks
        
        % m3g
        m3g_flow = morphine * m3g_appearance - m3g * m3g_elimination;
        
        % m6g
        m6g_flow = morphine * m6g_appearance - m6g * m6g_elimination;
        
        % morphine
        morphine_flow = morphine_flow - morphine * (m3g_appearance + m6g_appearance);
        
        res = [morphine_flow, m3g_flow, m6g_flow];
    end
end