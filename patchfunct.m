load('GlobalBest2000.mat')

c = physconst('lightspeed');
fmin = 5e9;
fmax = 10e9;
fc = 7e9;
lambda = c/fc;

% Patch Element Spec
patchElement = patchMicrostrip;
patchElement.Length = 0.49*lambda;
patchElement.Width = 0.8*patchElement.Length;
patchElement.GroundPlaneLength = 0.6*lambda;
patchElement.GroundPlaneWidth = 0.4*lambda;
patchElement.Height = 0.01*lambda;
patchElement.FeedOffset = [patchElement.Length/4 0];


% patchElement.Tilt = 90;
patchElement.TiltAxis = [0 1 0];

myFigure = gcf;
myFigure.Color = 'w';
pattern(patchElement,fc)

N1 = 5;

% Patch Array
confarraydef = conformalArray;
confarraydef.Element = patchElement;
spacing = gradient(sort(GlobalBest.Position))

% x position
xpos = zeros(1,N1);
xpos(1:2:N1) = patchElement.Length;
xpos(2:2:N1) = -patchElement.Length;

% Best position
best = sort(GlobalBest.Position)
best = best(1:N1);

confarraydef.ElementPosition = [xpos' best' zeros(1,N1)']
confarraydef.ArraySize;
% show(confarraydef)

pattern(confarraydef,fc)
