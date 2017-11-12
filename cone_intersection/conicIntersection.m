## Author: Andy Daniel Martinez
## Created: 2017-09-27

function conicIntersection()
a = input("Enter value for a: ");
d = input("Enter value for d: ");
e = input("Enter value for e: ");
f = input("Enter value for f: ");

c=a;
b=0;

% Building matrix C
C = [a b d; b c e; d e f];

% m1 and m2 are points at infinity
m1 = [1 2 0];
m2 = [1 5 0];

% a1 is the coeficient of lambda^2
a1 = dot(mtimes(m2, C), m2);
% b1 is the coeficient of lambda
b1 = 2*dot(mtimes(m2,C), m1);
% c1 is the coeficient multiplying lambda^0
c1 = dot(mtimes(m1, C), m1);

% quadratic equation
lambda1 = (-1*b1 + sqrt(b1**2 - 4*a1*c1))/(2*a1);
lambda2 = (-1*b1 - sqrt(b1**2 - 4*a1*c1))/(2*a1); 

% Calculating interception points
ip1 = m1+lambda1*m2;
ip2 = m1+lambda2*m2;

% Displaying results
disp("First Interception Point: ")
disp(ip1)

disp("Second Interception Point: ")
disp(ip2)

endfunction
