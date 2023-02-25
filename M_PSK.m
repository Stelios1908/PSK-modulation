function [SER, BER] = M_PSK(p_teliko,pompos_kanali,b,n,input,M)

if M==4
   Sm_symbol=zeros(M,2);
   symbol=[0 1 3 2];
   for i=1:M
         Sm_symbol(i,:)=[cos(2*pi*(i-1)/M) ,sin(2*pi*(i-1)/M)];
   end

end



if M==8
   Sm_symbol=zeros(M,2);
   symbol=[0 1 3 2 6 7 5 4];
   for i=1:M
         Sm_symbol(i,:)=[cos(2*pi*(i-1)/M) ,sin(2*pi*(i-1)/M)];
   end
   
end

Sm_sin1=zeros(size(p_teliko));
Sm_sin2=zeros(size(p_teliko));

%ftiaxno ta metadidomena simbola diladi tis sinistoses
for i=1:4:length(Sm_sin1)
   Sm_sin1(i)=cos(2*pi*(find(symbol==p_teliko(i))-1)/M);
   Sm_sin2(i)=sin(2*pi*(find(symbol==p_teliko(i))-1)/M);
end

%sinelixi Sm me filtro pompo_kanali(an einai idaniko to kanali
%mono me filtro pompoy)

   real_signal=conv(Sm_sin1,pompos_kanali);
   imag_signal=conv(Sm_sin2,pompos_kanali);

   start=round(((length(conv(pompos_kanali,b)+3))/2));
   endd=start+1;

%aexikopoio apo prin gia kaliteri poliplokotita
k=1;
SER=zeros(16,1);
BER=zeros(16,1);
for SNR= 0:2:30
    
   %ftiaxno noise
   div=(1/(2*log2(M)))*(10^(-SNR/10)); 
   noise=(sqrt(div)*randn(length(real_signal),1));
    
   %prostheto kai noise
   real_signal_with_noise = real_signal+noise;
   imag_signal_with_noise = imag_signal+noise;
  

   real_signal_for_sample = conv(real_signal_with_noise,b);
   imag_signal_for_sample = conv(imag_signal_with_noise,b);
 
   
   %perno deigma 
    %sample_real=real_signal_for_sample(round(start+1:4:end-endd));
    %sample_imag=imag_signal_for_sample(round(start+1:4:end-endd));

    sample_real=real_signal_for_sample(round(start:4:end-(endd+1)));
    sample_imag=imag_signal_for_sample(round(start:4:end-(endd+1)));
    

    
 %FORATIS EYKLEIDIA APOSTASH!!! 
       teliko_p=[];
    for i=1:length(sample_real)
        for j=1:M
          temp(i,j)=(sample_real(i)-Sm_symbol(j,1))^2+(sample_imag(i)-Sm_symbol(j,2))^2;
        end
         sm_hat(i)=min(temp(i,:));
        for j=1:M
           if sm_hat(i)==temp(i,j)
             teliko_p(i)=symbol(j);
           end
        end 
    end
   teliko_p=teliko_p'; 
      
   %BRISKO SER 
   SER(k)=1-nnz(teliko_p==p_teliko(1:4:end))/length(teliko_p);
   %SER(k)=1-nnz(teliko_p(1:length(p_teliko(1:4:end)))==p_teliko(1:4:end))/length(teliko_p);
   
   %KALO DENAPPER GIA NA BRW KAI TO BER
   teliko_input=demapper(teliko_p,M);
   BER(k)=1-nnz(teliko_input==input)/length(input);
   
   k=k+1;
    
end
end