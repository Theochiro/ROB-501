function y = mynormaldist(mu,sigma,x)
y=exp(-((x-mu).^2)/50)/(sigma*sqrt(2*pi));
end

