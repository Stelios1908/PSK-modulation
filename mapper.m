function [f] = mapper(x,M)
k = 1;    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%GRAY ENCONDING 4-PSK
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    if M == 4
        for i = 1:2:length(x)
            if x(i) == 0 && x(i+1) == 0
                f(k) = 0;
            elseif x(i) == 0 && x(i+1) == 1
                f(k) = 1;
            elseif x(i) == 1 && x(i+1) == 1
                f(k) = 2;
            elseif x(i) == 1 && x(i+1) == 0
                f(k) = 3;
            end
            k = k+1 ;
        end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%GRAY ENCONDING 8-PSK
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    elseif M == 8
        for i = 1:3:length(x)
            if x(i) == 0 && x(i+1) == 0 && x(i+2) == 0
                f(k) = 0; 
            elseif x(i) == 0 && x(i+1) == 0 && x(i+2) == 1
                f(k) = 1;
            elseif x(i) == 0 && x(i+1) == 1 && x(i+2) == 1
                f(k) = 2;
            elseif x(i) == 0 && x(i+1) == 1 && x(i+2) == 0
                f(k) = 3;
            elseif x(i) == 1 && x(i+1) == 1 && x(i+2) == 0
                f(k) = 4;
            elseif x(i) == 1 && x(i+1) == 1 && x(i+2) == 1
                f(k) = 5;
            elseif x(i) == 1 && x(i+1) == 0 && x(i+2) == 1
                f(k) = 6;
            elseif x(i) == 1 && x(i+1) == 0 && x(i+2) == 0
                f(k) = 7;
            end
            k = k+1;
        end
    end  
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end