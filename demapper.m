function [f] = demapper(x,M)
j = 1;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%GRAY ENCONDING 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


     if M == 4
        for i = 1:length(x)
            if x(i) == 0 
                f(j) = 0;
                f(j+1) = 0;
            elseif x(i) == 1 
                f(j) = 0;
                f(j+1) = 1;
            elseif x(i) == 2 
                 f(j) = 1;
                f(j+1) = 1;
            elseif x(i) == 3 
                f(j) = 1;
                f(j+1) = 0;
            end
            j = j+2 ;
        end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
        
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%GRAY ENCONDING 8-PAM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    elseif M == 8
        for i = 1:length(x)
            if x(i) == 0 
                f(j) = 0;
                f(j+1) = 0;
                f(j+2)=0;
            elseif x(i) == 1 
                f(j) = 0;
                f(j+1) = 0;
                f(j+2)=1;
            elseif x(i) == 2 
                 f(j) = 0;
                f(j+1) = 1;
                f(j+2)=1;
            elseif x(i) == 3 
                f(j) = 0;
                f(j+1) = 1;
                f(j+2)=0;
            elseif x(i) == 4
                f(j) = 1;
                f(j+1) = 1;
                f(j+2)=0;
            elseif x(i) == 5 
                f(j) = 1;
                f(j+1) = 1;
                f(j+2)=1;
            elseif x(i) == 6 
                f(j) = 1;
                f(j+1) = 0;
                f(j+2)=1;
            elseif x(i) == 7 
                f(j) = 1;
                f(j+1) = 0;
                f(j+2)=0;
            end
            j = j+3 ;
        end
     end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     
end