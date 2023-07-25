
% %------------------------% %
% %  NOTES FOR INSTALATION % %
% %------------------------% %

% % This code was implemented using MATLAB_R2011b

% % Open Matlab as administrator in the lab. Then download this file into
% % Downloads folder (or prefered folder)

% % Double click the file to open and should automatically open it in the 
% % correct path. If not, select the correct path. 

% % Take skip sinc test away in lab! If screen doesnt work (because the tests it runs in the Retina dont work) use Screen('Preference','SkipSyncTests',1) first. Then change 1 for 0 to put the test back on.
% % Psychtoolbox does not work properly in terms of timing on macs with retina displays, because of how the screen is upsampled. You have two options:
% % 1) You can disabled the screen sync tests. This will allow PTB to function, but you will have inaccurate timing. This may be ok if you are just using the machine for development purposes or if you don't care about precise timing.
% % 2) You may be able to force your screen into native resolution mode using a non-apple 3rd party software. See this post in the PTB forum for a link to such software and more information:  http://tech.groups.yahoo.com/group/psychtoolbox/message/14954

% % To run the software open the file as a script and then go to matlab's
% % command window. In the command window type the name of the file and in
% % parenthesis write down the subject number or identification with ''. In
% % other words, if the file name is timesoftware.m then type in the command
% % window timesoftware('id') and press enter. 
% % The software will automatically start. The first window has an invisible
% % button in the top right corner. Click it to procede.


% % To exit the screen once the software has been started press control+c and
% % then type clear Screen

% % Compare with a clock that the lab computers are recording well.



% %------------------------% %
% %  NOTES FOR TIME TASK   % %
% %------------------------% %

% %    Order: 2m31s, 1m56s, 31s, 53s, 3m16s, 1m29s, 41s, 1m9s, 24s, 3M39S
% %    #Tasks: 18     14     4    7    24     11     5    9     3    31
% %   note: the last interval 3M39S is not taen into account and is just to
% %   prevent subjects biasing others that have not yet finished. 

% %   To exit the screen once the software has been started press control+c and
% %   then type: clear Screen

% %   The output files are 4:
% %   1) id.txt (records everything to check if there is a problem - not really used for analysis)
% %   2) idData.txt (records the time of the example trials as well as the time of the actual intervals and the proportion of corect tasks)
% %   3) idPayoffs.txt (records all the relevant data)
% %   4) idShortPayoffs.txt (records the relevant data for the person paying
% %      the subjects)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function timesoftware(subjectCode) % Make sure subjectCode is defined as string!!!

% Cancels the sync Tests because of problems with Retina Display. If you 
% are in a regular monitor erase this line or replace the 1 for a 0.
Screen('Preference', 'SkipSyncTests', 1);
% Sets keyboard
KbName('UnifyKeyNames');
% Create the output files named under the inputed subject code.
fileName = strcat(subjectCode,'.txt');
myfile=fopen(fileName,'w');

dataName = strcat(subjectCode,'Data');
dataName = strcat(dataName,'.txt');
myfileData=fopen(dataName,'w');

payoffsName = strcat(subjectCode,'Payoffs');
payoffsName = strcat(payoffsName,'.txt');
payoffs = fopen(payoffsName,'w');
fprintf(payoffs, '%s \n\n',subjectCode);
int='Interval'; realInt ='Length'; yourEstimation ='Estimate'; deviation = 'Deviation'; deviationPercent = 'Percent off'; corrTasks='Correct Tasks'; incorrTasks='Incorrect Tasks'; percCorrTasks='Percent'; amount='You earn'; numberOfInterval='number';
fprintf(payoffs, '%s \t %s \t\t %s \t\t %s \t\t %s \t %s \t\t %s \t\t %s \t %s \t %s \n\n', int, realInt, yourEstimation, deviation, deviationPercent, corrTasks, incorrTasks, percCorrTasks, amount, numberOfInterval);
intNumber2m31s = '1'; intNumber1m56s = '2'; intNumber0m31s = '3'; intNumber0m53s = '4'; intNumber3m16s = '5'; intNumber1m29s = '6';  intNumber0m41s = '7'; intNumber1m09s = '8'; intNumber0m24s = '9'; intNumber4m15s = '10'; 

ShortspayoffsName = strcat(subjectCode,'ShortPayoffs');
ShortspayoffsName = strcat(ShortspayoffsName,'.txt');
shortPayoffs = fopen(ShortspayoffsName,'w');
fprintf(shortPayoffs, '%s \n\n',subjectCode);
numberOfInterval='number'; int='Interval'; amount='You earn'; 
fprintf(shortPayoffs, '%s \t %s \t\t %s\n\n', numberOfInterval, int, amount);
intNumber2m31s = '1'; intNumber1m56s = '2'; intNumber0m31s = '3'; intNumber0m53s = '4'; intNumber3m16s = '5'; intNumber1m29s = '6';  intNumber0m41s = '7'; intNumber1m09s = '8'; intNumber0m24s = '9'; intNumber4m15s = '10'; 

% Defines the screen name (wPtr) and opens Screen with size rect.
[wPtr,rect] = Screen('OpenWindow',max(Screen('Screens'))); % In retina display rect = [0 0 1440 900]. In label computers rect = [0 0 1920 1080]

% Define the grid in relative terms to the size of the screen. 
x0=0; x8=rect(3); x1=x8/8; x2=2*x1; x3=3*x1; x4=4*x1; x5=5*x1; x6=6*x1; x7=7*x1;
y0=0; y8=rect(4); y1=y8/8; y2=2*y1; y3=3*y1; y4=4*y1; y5=5*y1; y6=6*y1; y7=7*y1;      
      y05=(0.5)*y1; y15=(1.5)*y1;
      
% Text positions
positionX = x1/3;
positionY = y1/2;
% Define rectangles
R1=[x0 y4 x1 y5]; R2=[x0 y5 x1 y6]; R3=[x0 y6 x1 y7]; R4=[x0 y7 x1 y8];
C1=[x2 y3 x3 y4]; C2=[x3 y3 x4 y4]; C3=[x4 y3 x5 y4]; C4=[x5 y3 x6 y4]; C5=[x6 y3 x7 y4];  C6=[x7 y3 x8 y4];
      
% Types of waitsecs
afterMouseInstructions=0.25;
afterStartInterval=2;
afterStopInterval=1;
ReadTextFewSeconds=0.25;
startIntervalInstructions=0.25;
taskAnswer=0.5;

% Define how many seconds between the tasks (despues de definir numeros
% acomodar en renglon pero mientras en columna es mas practico para mover)
int1test1=1; % Seconds of blank screen 
int2test1=10; % Seconds of show task 1
int3test1=1; % Seconds of blank screen 
int4test1=16; % 
int5test1=5; %

% Payoffs
highPayment='$25';
midPayment='$10';
lowPayment='$5';

% %    Order: 2m31s, 1m56s, 31s, 53s, 3m16s, 1m29s, 41s, 1m9s, 24s, 4m15s
% %    Tasks: 18     14     4    7    24     11     5    9     3    31
tiempoRapido=1;
if tiempoRapido==1
% 2m31s (1)
int2m31sTask1Lasts=12; 
int2m31sTask2Lasts=12;
int2m31sTask3Lasts=11; 
int2m31sTask4Lasts=13;
int2m31sTask5Lasts=10; 
int2m31sTask6Lasts=11;
int2m31sTask7Lasts=13; 
int2m31sTask8Lasts=11;
int2m31sTask9Lasts=15; 
int2m31sTask10Lasts=13;
int2m31sTask11Lasts=12; 
int2m31sTask12Lasts=14;
int2m31sTask13Lasts=11; 
int2m31sTask14Lasts=10;
int2m31sTask15Lasts=10; 
int2m31sTask16Lasts=11;
int2m31sTask17Lasts=14; 
int2m31sTask18Lasts=10;

% 1m56s (2)
int1m56sTask1Lasts=11; 
int1m56sTask2Lasts=13;
int1m56sTask3Lasts=10; 
int1m56sTask4Lasts=12;
int1m56sTask5Lasts=14; 
int1m56sTask6Lasts=11;
int1m56sTask7Lasts=15; 
int1m56sTask8Lasts=11;
int1m56sTask9Lasts=13; 
int1m56sTask10Lasts=13;
int1m56sTask11Lasts=11; 
int1m56sTask12Lasts=13;
int1m56sTask13Lasts=11; 
int1m56sTask14Lasts=10;
int1m56sTask15Lasts=10;

% 31s (3)
int31sTask1Lasts=11; 
int31sTask2Lasts=11;
int31sTask3Lasts=11; 
int31sTask4Lasts=13;

% 53s (4)
int53sTask1Lasts=12; 
int53sTask2Lasts=11;
int53sTask3Lasts=11; 
int53sTask4Lasts=11;
int53sTask5Lasts=12; 

% 3m16s (5)
int3m16sTask1Lasts=10; 
int3m16sTask2Lasts=12;
int3m16sTask3Lasts=13; 
int3m16sTask4Lasts=14;
int3m16sTask5Lasts=11; 
int3m16sTask6Lasts=10;
int3m16sTask7Lasts=15; 
int3m16sTask8Lasts=11;
int3m16sTask9Lasts=13; 
int3m16sTask10Lasts=12;
int3m16sTask11Lasts=11; 
int3m16sTask12Lasts=12;
int3m16sTask13Lasts=14; 
int3m16sTask14Lasts=10;
int3m16sTask15Lasts=10; 
int3m16sTask16Lasts=13;
int3m16sTask17Lasts=11; 
int3m16sTask18Lasts=10;
int3m16sTask19Lasts=11; 

% 1m29s (6)
int1m29sTask1Lasts=12; 
int1m29sTask2Lasts=10;
int1m29sTask3Lasts=13; 
int1m29sTask4Lasts=14;
int1m29sTask5Lasts=14; 
int1m29sTask6Lasts=11;
int1m29sTask7Lasts=13; 
int1m29sTask8Lasts=10;
int1m29sTask9Lasts=10; 

% 41s (7)
int41sTask1Lasts=11; 
int41sTask2Lasts=13;
int41sTask3Lasts=14; 
int41sTask4Lasts=11;

% 1m9s (8)
int1m9sTask1Lasts=12; 
int1m9sTask2Lasts=13;
int1m9sTask3Lasts=10; 
int1m9sTask4Lasts=11;
int1m9sTask5Lasts=13; 
int1m9sTask6Lasts=12;
int1m9sTask7Lasts=12; 

% 24s (9)
int24sTask1Lasts=13; 
int24sTask2Lasts=12;
int24sTask3Lasts=11; 

% 2m31s (1)
int2m31sTask1Wait=3; 
int2m31sTask2Wait=2;
int2m31sTask3Wait=5; 
int2m31sTask4Wait=7;
int2m31sTask5Wait=3; 
int2m31sTask6Wait=5;
int2m31sTask7Wait=3; 
int2m31sTask8Wait=4;
int2m31sTask9Wait=7; 
int2m31sTask10Wait=3;
int2m31sTask11Wait=5; 
int2m31sTask12Wait=2;
int2m31sTask13Wait=6; 
int2m31sTask14Wait=4;
int2m31sTask15Wait=6; 
int2m31sTask16Wait=2;
int2m31sTask17Wait=3; 
int2m31sTask18Wait=100;

% 1m56s (2)
int1m56sTask1Wait=4; 
int1m56sTask2Wait=5;
int1m56sTask3Wait=3; 
int1m56sTask4Wait=6;
int1m56sTask5Wait=2; 
int1m56sTask6Wait=1;
int1m56sTask7Wait=4; 
int1m56sTask8Wait=3;
int1m56sTask9Wait=5; 
int1m56sTask10Wait=2;
int1m56sTask11Wait=7; 
int1m56sTask12Wait=3;
int1m56sTask13Wait=5; 
int1m56sTask14Wait=2;
int1m56sTask15Wait=100;

% 31s (3)
int31sTask1Wait=4; 
int31sTask2Wait=2;
int31sTask3Wait=6; 
int31sTask4Wait=30;

% 53s (4)
int53sTask2Wait=2;
int53sTask3Wait=5; 
int53sTask4Wait=3;
int53sTask5Wait=6; 
int53sTask6Wait=50;

% 3m16s (5)
int3m16sTask1Wait=3; 
int3m16sTask2Wait=5;
int3m16sTask3Wait=2; 
int3m16sTask4Wait=6;
int3m16sTask5Wait=4; 
int3m16sTask6Wait=5;
int3m16sTask7Wait=2; 
int3m16sTask8Wait=5;
int3m16sTask9Wait=6; 
int3m16sTask10Wait=3;
int3m16sTask11Wait=5; 
int3m16sTask12Wait=2;
int3m16sTask13Wait=6; 
int3m16sTask14Wait=5;
int3m16sTask15Wait=4; 
int3m16sTask16Wait=6;
int3m16sTask17Wait=4; 
int3m16sTask18Wait=100;

% 1m29s (6)
int1m29sTask1Wait=3; 
int1m29sTask2Wait=4;
int1m29sTask3Wait=5; 
int1m29sTask4Wait=2;
int1m29sTask5Wait=4; 
int1m29sTask6Wait=1;
int1m29sTask7Wait=5; 
int1m29sTask8Wait=5;
int1m29sTask9Wait=50; 

% 41s (7)
int41sTask1Wait=4; 
int41sTask2Wait=2;
int41sTask3Wait=6; 
int41sTask4Wait=50;

% 1m9s (8)
int1m9sTask1Wait=4; 
int1m9sTask2Wait=6;
int1m9sTask3Wait=2; 
int1m9sTask4Wait=5;
int1m9sTask5Wait=2; 
int1m9sTask6Wait=4;
int1m9sTask7Wait=50; 

% 24s (9)
int24sTask1Wait=2; 
int24sTask2Wait=5;
int24sTask3Wait=20; 

else
    % 2m31s (1)
int2m31sTask1Lasts=1; 
int2m31sTask2Lasts=1;
int2m31sTask3Lasts=1; 
int2m31sTask4Lasts=1;
int2m31sTask5Lasts=1; 
int2m31sTask6Lasts=1;
int2m31sTask7Lasts=1; 
int2m31sTask8Lasts=1;
int2m31sTask9Lasts=1; 
int2m31sTask10Lasts=1;
int2m31sTask11Lasts=1; 
int2m31sTask12Lasts=1;
int2m31sTask13Lasts=1; 
int2m31sTask14Lasts=1;
int2m31sTask15Lasts=1; 
int2m31sTask16Lasts=1;
int2m31sTask17Lasts=1; 
int2m31sTask18Lasts=1;

% 1m56s (2)
int1m56sTask1Lasts=1; 
int1m56sTask2Lasts=1;
int1m56sTask3Lasts=1; 
int1m56sTask4Lasts=1;
int1m56sTask5Lasts=1; 
int1m56sTask6Lasts=1;
int1m56sTask7Lasts=1; 
int1m56sTask8Lasts=1;
int1m56sTask9Lasts=1; 
int1m56sTask10Lasts=1;
int1m56sTask11Lasts=1; 
int1m56sTask12Lasts=1;
int1m56sTask13Lasts=1; 
int1m56sTask14Lasts=1;
int1m56sTask15Lasts=1;

% 31s (3)
int31sTask1Lasts=1; 
int31sTask2Lasts=1;
int31sTask3Lasts=1; 
int31sTask4Lasts=1;

% 53s (4)
int53sTask1Lasts=1; 
int53sTask2Lasts=1;
int53sTask3Lasts=1; 
int53sTask4Lasts=1;
int53sTask5Lasts=1; 

% 3m16s (5)
int3m16sTask1Lasts=1; 
int3m16sTask2Lasts=1;
int3m16sTask3Lasts=1; 
int3m16sTask4Lasts=1;
int3m16sTask5Lasts=1; 
int3m16sTask6Lasts=1;
int3m16sTask7Lasts=1; 
int3m16sTask8Lasts=1;
int3m16sTask9Lasts=1; 
int3m16sTask10Lasts=1;
int3m16sTask11Lasts=1; 
int3m16sTask12Lasts=1;
int3m16sTask13Lasts=1; 
int3m16sTask14Lasts=1;
int3m16sTask15Lasts=1; 
int3m16sTask16Lasts=1;
int3m16sTask17Lasts=1; 
int3m16sTask18Lasts=1;
int3m16sTask19Lasts=1; 

% 1m29s (6)
int1m29sTask1Lasts=1; 
int1m29sTask2Lasts=1;
int1m29sTask3Lasts=1; 
int1m29sTask4Lasts=1;
int1m29sTask5Lasts=1; 
int1m29sTask6Lasts=1;
int1m29sTask7Lasts=1; 
int1m29sTask8Lasts=1;
int1m29sTask9Lasts=1; 

% 41s (7)
int41sTask1Lasts=1; 
int41sTask2Lasts=1;
int41sTask3Lasts=1; 
int41sTask4Lasts=1;

% 1m9s (8)
int1m9sTask1Lasts=1; 
int1m9sTask2Lasts=1;
int1m9sTask3Lasts=1; 
int1m9sTask4Lasts=1;
int1m9sTask5Lasts=1; 
int1m9sTask6Lasts=1;
int1m9sTask7Lasts=1; 

% 24s (9)
int24sTask1Lasts=1; 
int24sTask2Lasts=1;
int24sTask3Lasts=1; 





% 2m31s (1)
int2m31sTask1Wait=1; 
int2m31sTask2Wait=1;
int2m31sTask3Wait=1; 
int2m31sTask4Wait=1;
int2m31sTask5Wait=1; 
int2m31sTask6Wait=1;
int2m31sTask7Wait=1; 
int2m31sTask8Wait=1;
int2m31sTask9Wait=1; 
int2m31sTask10Wait=1;
int2m31sTask11Wait=1; 
int2m31sTask12Wait=1;
int2m31sTask13Wait=1; 
int2m31sTask14Wait=1;
int2m31sTask15Wait=1; 
int2m31sTask16Wait=1;
int2m31sTask17Wait=1; 
int2m31sTask18Wait=1;

% 1m56s (2)
int1m56sTask1Wait=1; 
int1m56sTask2Wait=1;
int1m56sTask3Wait=1; 
int1m56sTask4Wait=1;
int1m56sTask5Wait=1; 
int1m56sTask6Wait=1;
int1m56sTask7Wait=1; 
int1m56sTask8Wait=1;
int1m56sTask9Wait=1; 
int1m56sTask10Wait=1;
int1m56sTask11Wait=1; 
int1m56sTask12Wait=1;
int1m56sTask13Wait=1; 
int1m56sTask14Wait=1;
int1m56sTask15Wait=1;

% 31s (3)
int31sTask1Wait=1; 
int31sTask2Wait=1;
int31sTask3Wait=1; 
int31sTask4Wait=1;

% 53s (4)
int53sTask2Wait=1;
int53sTask3Wait=1; 
int53sTask4Wait=1;
int53sTask5Wait=1; 
int53sTask6Wait=1;

% 3m16s (5)
int3m16sTask1Wait=1; 
int3m16sTask2Wait=1;
int3m16sTask3Wait=1; 
int3m16sTask4Wait=1;
int3m16sTask5Wait=1; 
int3m16sTask6Wait=1;
int3m16sTask7Wait=1; 
int3m16sTask8Wait=1;
int3m16sTask9Wait=1; 
int3m16sTask10Wait=1;
int3m16sTask11Wait=1; 
int3m16sTask12Wait=1;
int3m16sTask13Wait=1; 
int3m16sTask14Wait=1;
int3m16sTask15Wait=1; 
int3m16sTask16Wait=1;
int3m16sTask17Wait=1; 
int3m16sTask18Wait=1;

% 1m29s (6)
int1m29sTask1Wait=1; 
int1m29sTask2Wait=1;
int1m29sTask3Wait=1; 
int1m29sTask4Wait=1;
int1m29sTask5Wait=1; 
int1m29sTask6Wait=1;
int1m29sTask7Wait=1; 
int1m29sTask8Wait=1;
int1m29sTask9Wait=1; 

% 41s (7)
int41sTask1Wait=1; 
int41sTask2Wait=1;
int41sTask3Wait=1; 
int41sTask4Wait=1;

% 1m9s (8)
int1m9sTask1Wait=1; 
int1m9sTask2Wait=1;
int1m9sTask3Wait=1; 
int1m9sTask4Wait=1;
int1m9sTask5Wait=1; 
int1m9sTask6Wait=1;
int1m9sTask7Wait=1; 

% 24s (9)
int24sTask1Wait=1; 
int24sTask2Wait=1;
int24sTask3Wait=1; 
end

% Names of rows and columns
name1={'red' 'green' 'blue' 'yellow'            'banana' 'peach' 'apple' 'grape' 'orange' 'pear' 'lemon'};
name2={'guitar' 'trumpet' 'piano' 'drums'       'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};
name3={'car' 'truck' 'bike' 'bus'               'shoe' 'coat' 'pants' 'scarf' 'shorts' 'gloves' 'jacket'};
name4={'California' 'Iowa' 'Texas' 'Alaska'     'jazz' 'pop' 'salsa' 'rap' 'classical' 'folk' 'rock'};
name5={'boots' 'moccasin' 'flats' 'sandals'     'terrier' 'beagle' 'chihuahua' 'mastiff' 'boxer' 'pug' 'greyhound'};
name6={'buds' 'leaves' 'trunk' 'roots'        'Cuba' 'Ghana' 'Iraq' 'Nigeria' 'Romania' 'Italy' 'Japan'};
name7={'cumulus' 'nimbus' 'cirrus' 'stratus'    'velociraptor' 'brachiosaurus' 'rex' 'triceratops' 'allosaurus' 'brachiosaurus' 'diplodocus'};
name8={'touring' 'chopper' 'scooter' 'offroad'  'kinetic' 'potential' 'thermal' 'chemical' 'electrical' 'nuclear' 'magnetic'};
name9={'hearts' 'spades' 'diamonds' 'clubs'            'rose' 'daisie' 'orchid' 'daffodil' 'iris' 'sunflower' 'sweetpea'};
name10={'bedroom' 'kitchen' 'rooftop' 'balcony' 'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};
name11={'chair' 'sofa' 'bed' 'bench'            'football' 'hockey' 'soccer' 'baseball' 'rugby' 'lacross' 'basketball'};
name12={'limestone' 'basalt' 'coal' 'marble'    'jazz' 'pop' 'salsa' 'rap' 'classical' 'folk' 'rock'};
name13={'fire' 'water' 'air' 'earth'            'walnut' 'peanut' 'almond' 'macadamia' 'cashew' 'pecan' 'pistachio'};
name14={'sea' 'sky' 'earth' 'space'             'spaghetti' 'capellini' 'fusilli' 'lasagne' 'linguine' 'fettuccine' 'cannelloni'};
name15={'pen' 'pencil' 'eraser' 'ruler'         'saturn' 'earth' 'neptune' 'mercury' 'jupiter' 'uranus' 'venus'};
name16={'girl' 'man' 'woman' 'boy'              'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};
name17={'run' 'sleep' 'eat' 'play'              'jazz' 'pop' 'salsa' 'rap' 'classical' 'folk' 'rock'};
name18={'circle' 'square' 'triangle' 'rectangle' 'oxygen' 'lead' 'iron' 'arsenic' 'silicon' 'lithium' 'carbon'};
name19={'tomato' 'broccoli' 'squash' 'carrot  ' 'painting' 'sculpture' 'dance' 'music' 'film' 'architecture' 'theatre'};
name20={'physics' 'biology' 'chemistry' 'geology' 'hades' 'zeus' 'poseidon' 'athena' 'apollo' 'atlas' 'perses'};
name21={'guitar' 'trumpet' 'piano' 'drums'       'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};
name22={'California' 'Iowa' 'Texas' 'Alaska'     'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};
name23={'buds' 'leaves' 'trunk' 'roots'          'Cuba' 'Ghana' 'Iraq' 'Nigeria' 'Romania' 'Italy' 'Japan'};
name24={'hearts' 'spades' 'diamonds' 'clubs'           'rose' 'daisie' 'orchid' 'daffodil' 'iris' 'sunflower' 'sweetpea'};
name25={'bedroom' 'kitchen' 'rooftop' 'balcony' 'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};
name26={'pen' 'pencil' 'eraser' 'ruler'         'saturn' 'earth' 'neptune' 'mercury' 'jupiter' 'uranus' 'venus'};
name27={'car' 'truck' 'bike' 'bus'               'shoe' 'coat' 'pants' 'scarf' 'shorts' 'gloves' 'jacket'};
name28={'boots' 'moccasin' 'flats' 'sandals'     'terrier' 'beagle' 'chihuahua' 'mastiff' 'boxer' 'pug' 'greyhound'};
name29={'chair' 'sofa' 'bed' 'bench'            'football' 'hockey' 'soccer' 'baseball' 'rugby' 'lacross' 'basketball'};
name30={'red' 'green' 'blue' 'yellow'            'banana' 'peach' 'apple' 'grape' 'orange' 'pear' 'lemon'};
name31={'sea' 'sky' 'earth' 'space'             'spaghetti' 'capellini' 'fusilli' 'lasagne' 'linguine' 'fettuccine' 'cannelloni'};
name32={'girl' 'man' 'woman' 'boy'              'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};
name33={'circle' 'square' 'triangle' 'rectangle' 'oxygen' 'lead' 'iron' 'arsenic' 'silicon' 'lithium' 'carbon'};
name34={'physics' 'biology' 'chemistry' 'geology' 'hades' 'zeus' 'poseidon' 'athena' 'apollo' 'atlas' 'perses'};
name35={'pen' 'pencil' 'eraser' 'ruler'         'saturn' 'earth' 'neptune' 'mercury' 'jupiter' 'uranus' 'venus'};
name36={'run' 'sleep' 'eat' 'play'              'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};
name37={'tomato' 'broccoli' 'squash' 'carrot  ' 'painting' 'sculpture' 'dance' 'music' 'film' 'architecture' 'theatre'};
name38={'California' 'Iowa' 'Texas' 'Alaska'     'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};
name39={'guitar' 'trumpet' 'piano' 'drums'       'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};
name40={'fire' 'water' 'air' 'earth'            'walnut' 'peanut' 'almond' 'macadamia' 'cashew' 'pecan' 'pistachio'};
name41={'buds' 'leaves' 'trunk' 'roots'          'Cuba' 'Ghana' 'Iraq' 'Nigeria' 'Romania' 'Italy' 'Japan'};
name42={'pen' 'pencil' 'eraser' 'ruler'         'saturn' 'earth' 'neptune' 'mercury' 'jupiter' 'uranus' 'venus'};
name43={'buds' 'leaves' 'trunk' 'roots'          'Cuba' 'Ghana' 'Iraq' 'Nigeria' 'Romania' 'Italy' 'Japan'};
name44={'touring' 'chopper' 'scooter' 'offroad'  'kinetic' 'potential' 'thermal' 'chemical' 'electrical' 'nuclear' 'magnetic'};
name45={'guitar' 'trumpet' 'piano' 'drums'       'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};
name46={'hearts' 'spades' 'diamonds' 'clubs'          'rose' 'daisie' 'orchid' 'daffodil' 'iris' 'sunflower' 'sweetpea'};
name47={'run' 'sleep' 'eat' 'play'              'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};
name48={'physics' 'biology' 'chemistry' 'geology' 'hades' 'zeus' 'poseidon' 'athena' 'apollo' 'atlas' 'perses'};
name49={'guitar' 'trumpet' 'piano' 'drums'       'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};
name50={'pen' 'pencil' 'eraser' 'ruler'         'saturn' 'earth' 'neptune' 'mercury' 'jupiter' 'uranus' 'venus'};
name51={'buds' 'leaves' 'trunk' 'roots'          'Cuba' 'Ghana' 'Iraq' 'Nigeria' 'Romania' 'Italy' 'Japan'};
name52={'girl' 'man' 'woman' 'boy'              'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};
name53={'red' 'green' 'blue' 'yellow'            'banana' 'peach' 'apple' 'grape' 'orange' 'pear' 'lemon'};
name54={'California' 'Iowa' 'Texas' 'Alaska'     'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};
name55={'buds' 'leaves' 'trunk' 'roots'          'Cuba' 'Ghana' 'Iraq' 'Nigeria' 'Romania' 'Italy' 'Japan'};
name56={'sea' 'sky' 'earth' 'space'             'spaghetti' 'capellini' 'fusilli' 'lasagne' 'linguine' 'fettuccine' 'cannelloni'};
name57={'cumulus' 'nimbus' 'cirrus' 'stratus'    'velociraptor' 'brachiosaurus' 'rex' 'triceratops' 'allosaurus' 'brachiosaurus' 'diplodocus'};
name58={'pen' 'pencil' 'eraser' 'ruler'         'saturn' 'earth' 'neptune' 'mercury' 'jupiter' 'uranus' 'venus'};
name59={'circle' 'square' 'triangle' 'rectangle' 'oxygen' 'lead' 'iron' 'arsenic' 'silicon' 'lithium' 'carbon'};
name60={'guitar' 'trumpet' 'piano' 'drums'       'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};
name61={'girl' 'man' 'woman' 'boy'              'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};
name62={'physics' 'biology' 'chemistry' 'geology' 'hades' 'zeus' 'poseidon' 'athena' 'apollo' 'atlas' 'perses'};
name63={'touring' 'chopper' 'scooter' 'offroad'  'kinetic' 'potential' 'thermal' 'chemical' 'electrical' 'nuclear' 'magnetic'};
name64={'fire' 'water' 'air' 'earth'            'walnut' 'peanut' 'almond' 'macadamia' 'cashew' 'pecan' 'pistachio'};
name65={'sea' 'sky' 'earth' 'space'             'spaghetti' 'capellini' 'fusilli' 'lasagne' 'linguine' 'fettuccine' 'cannelloni'};

% names={name1 name2 name3 name4 name5 name6 name7 name8 name9 name10 name11 name12 name13 name14 name15 name16 name17 name18 name19 name20 name21 name22 name23 name24 name25 name26 name27 name28 name29 name30 name31 name32 name33 name34 name35 name36 name37 name38 name39 name40 name41 name42 name43 name44 name45 name46 name47 name48 name49 name50 name51 name52 name53 name54 name55 name56 name57 name58 name59 name60 name61 name62 name63 name64 name65};

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%instructions1 = 'SECTION 2 \n \n \n \n \nIn this section you will estimate intervals of time. \n\nIn each of these tasks you will have to read instructions on where to click with the mouse on the screen. \n\nIn order for yor interval estimations to count towards payments it is absolutely necessary that you answer these tasks correctly. \n \n \n \n \nPlease press any key to continue.';
%instructions2 = 'EXAMPLE OF A TASK \n\n\nPlease click with the mouse the row2 col3 cell. \n\nIn this case, you would have to click with the mouse on top of the black cell (where row 2 intersects column 3). \n\nPlease click on this cell (row2 col3 cell) to continue.';
%instructions3 = 'While estimating the intervals of time you will be periodically presented with tasks of this form. \n\nImportantly, you will only have a few of seconds to respond correctly. \n\nAfter a few seconds the task will dissapear and it will count as an incomplete task. \n\nThus, it is crucial that you read the instructions and click with the mouse as fast as possible. \n\nDont try to count the seconds of the interval while solving the tasks. \n\nRemember that the tasks last only a few of seconds and if you miss one your answer of the whole interval estimation wont count. \n\nFinally, the amount of seconds each task will show up also varies. \n\nThe next is a real example of a task. \n \n \n \n \nPlease press any key of the keyboard to continue.';
%instructions4 = 'Please click with the mouse the cell where the row below the blue row intersects the column to the left of the orange column.';

Screen('TextFont',wPtr,'Helvetica');
Screen('TextSize',wPtr,18);
Next='Next';
StartInterval='Start Interval ';
EndInterval='End Interval ';

instructionsWelcome = 'SECTION 2 \n\n\n\n\nPlease click with the mouse on the button labeled "Next".';
instructionsSection2 = 'SECTION 2\n\n\n\n\nIn this section you will estimate time intervals. \n\nFirst we will explain how you earn money.\n\nYou will be told when the choices that count towards payments begin. \n\n\n\n\nTo continue click on "Next".';
instructionsEstimIntervDescr = '\n\n\n\n\nTo mark the beginning and end of a time interval you will always click on the button on the top right corner of the screen.\n\nWhenever you have to start a time interval the button will say "Start Interval".\n\nOnce the time interval starts and you have to end it the button will say "End Interval".\n\n\n\n\nTo continue click on "Next".';
instructionsStatInterv10s = '\n\n\n\n\nYou will now get familiar with how to begin and end a time interval using the button. \n\nPlease estimate a time interval of 5 seconds.\n\n\n\n\nWhen you are ready to mark the beginning of the time interval click on "Start Interval". ';
instructionsEndInterv = '\n\n\n\n\nTo end the time interval click on "End Interval".';
instructionsStatInterv15s = '\n\n\n\n\nVery good. Now please estimate a time interval of 10 seconds.\n \n\n\n\nWhen you are ready to mark the beginning of the time interval click on "Start Interval".';
instructionsSummaryInterv = '\n\n\n\n\nYou are now familliar with how to mark the beggining and end of time intervals using the button. \n\nAs we mentioned before, in this section you will estimate time intervals. \n\nHowever, while estimating the time intervals you will also be asked to solve tasks.\n\nWe will describe these tasks in the next slides. \n\n\n\n\n\n\nTo continue click on "Next".';
instructionsTasksDescription1 = 'The tasks you have to answer while estimating time intervals will always ask you to click on different parts of the screen. \n\nSpecifically, they will ask you to click on one of the 24 cells from the table shown below (4 rows by 6 columns).\n\nIn this table the rows are labeled "row1" through "row4" as an example. In the real tasks they will have other labels.\n\nSimilarly, the columns are labeled "col1" through "col6" as an example. In the real tasks thy will have other labels.\n\n\nTo continue click on "Next".'
instructionsTasksDescription2 = 'Imagine that a task asked you to click on the cell where row2 intersects col3. \n\nFor illustrative purposes we colored this cell in black. In the real tasks there are no colored cells.\n\n\n\n\nPlease click on this cell to continue.';
instructionsTasksExample2 = 'The last task asked you to click on the cell where row2 intersected col3. \n\nHowever, tasks may ask you to click on a specific cell in more complicated ways. \n\nFor example, a task may ask you to click on the cell where "the row below row 2" intersects the "column to the left of column 3". \n\nIn this task you should click on the cell where row 3 (the row below row 2) intersects column 2 (the column to the left of column 3). \n\nFor illustrative purposes we colored this cell in black. In the real tasks there are no colored cells.\n\nPlease click on this cell to continue..';
instructionsTasksExample3 = 'The labels of the rows and columns of real tasks are never row1 through row4 and col1 through col6 but actual names.\n\nThe table below shows some example names. \n\nImagine that a task asks you to click on the row above the Alaska row and the column to the right of the classical column. \n\nIn this task you shold click the cell where row Texas (above row Alaska) intersects column folk (to the right of column classical).\n\n\nPlease click on this cell to continue.';
instructionsTasksDescriptionDynamicsTasks = 'In the last examples there was no time limit for answering the tasks. \n\nHowever, real tasks have a time limit. After a few seconds the real tasks will dissapear from the screen. \n\nIf a task dissapears from the screen it will count as a wrong answer.\n\n\n\n\nThe time limit (of a few seconds) is unknown to you and is not constant from task to task.\n\nThis means that a task may give you more or less time to answer before it dissapears.\n\nIn a moment we will explain how correct or incorrect answers influence the money you earn.\n\nThe important thing to understand is that to make money, it is crucial that you answer tasks correctly (and before they dissapear).\n\n\n\n\n\nTo continue click on "Next".';
instructionsTasksDescriptionRealTry = 'While you are estimating time intervals, tasks of this form will keep appearing one after the other until you end the time interval.\n\nSo tasks will appear and dissapear one after the other until you press "end button".\n\nEach task will dissapear from the screen when either 1) you answer it by clicking on a cell or 2) the tasks time limit is reached.\n\nRemember that the time limit (of a few seconds) is unknown to you and not the same from one task to the other. \n\n\n\n\nImportantly, the amount of time after a task dissapears and the next one appears is also not the same in all tasks. \n\n\n\n\nThe following slides are example tasks with a time limit. This means that the tasks will dissapear if you dont answer them fast enough.\n\nRemember that if a task dissapears (because you didnt click on the cell fast enough) it counts as a wrong answer.\n\nIf you click on the wrong cell of a task it also counts as a wrong answer. \n\n\n\n\nTo continue click on "Next".';
instructionsTaskDynamic1 = 'Please click the cell where the row below the blue row intersects the column to the left of the orange column.';
answerCorrectAnounce = 'Correct! You got it right. \n\n\n\n\nTo continue click on "Next".';
rightanswer = 'The correct cell is the yellow grape cell. \n\nThe yellow row is the row below the blue row and the grape column is the column to the left of the orange column. \n\nTo continue click on "Next".';
instructionsTaskDynamic2 = 'Lets try another task. \n\nPlease click the cell where the row below the guitar row intersects the column to the left of the dog column.';
rightanswer2 = 'The correct cell is the trumpet cat cell. \n\nThe trumpet row is the row below the guitar row and the cat column is the column to the left of the dog column. \n\nTo continue click on "Next".';
instructionsTaskDynamic3 = 'Lets try another task. \n\nPlease click the cell where the row above the bus row intersects the column to the right of the pants column.';
rightanswer3 = 'The correct cell is the bike scarf cell. \n\nThe bike row is the row above the bus row and the scarf column is the column to the right of the pants column. \n\nTo continue click on "Next".';

instructionsIntWithTasksDescription = 'These last examples illustrated 1) how tasks appear into the screen and 2) how they dissapear if you dont answer them fast enough.\n\n\n\n\nWhile you estimate real time intervals, tasks will appear one after the other until you click on the "End interval" button. \n\nWhen a task dissapears you will see a blank screen except for the "End Interval" button until the next task appears.\n\nThe amount of time between a task dissapears and the next one appears is not always the same.\n\n\n\n\nYou may end the interval at any time (either during a task or between tasks) by clicking the "End Interval" button.\n\nYou should always read and answer the tasks carefully until you feel the length of the interval has passed.\n\nThen you should click on "End Interval" regardless of whether you are in a task or in between tasks.\n\nIf you end a time interval estimation during a task (before clicking a cell) it does not count either as a correct nor incorrect answer.\n\n\n\n\n\nTo continue click on "Next".';
instructionsInt20Secs = 'Please estimate an interval of 20 seconds. \n\nYou will have to answer tasks during your estimation of the time interval. \n\nAnswer tasks until you feel the interval length (20 seconds) has passed. Then click on the "End Interval" button.\n\n\n\n\nPlease click "Start Interval" to start the interval.';
instructionsInt20SecsTask1 = 'Please click the cell where the blue row intersects the column to the right of the column labeled peach.';
correctAnswer = 'Correct cell';
wrongAnswer = 'Wrong cell';
wrongAnswerTime = 'Time was up';
instructionsInt20SecsTask2 = 'Please click the cell where the column to the left of the fox column intersects the row below the guitar row.';
instructionsInt20Secs2 = 'Now that you know how to earn money please estimate another practice interval of 20 seconds. \n\nDuring the interval you will have to answer tasks that have a time limit. \n\nAnswer tasks until you feel the interval length (20 seconds) have passed. After click on the "End Interval" button.\n\n\n\n\nPlease click "Start Interval" to start the interval.';
instructionsInt20Secs2Task1 = 'Please click the cell where the row below the cumulus row intersects the column to the left of the rex column.';
instructionsInt20Secs2Task2 = 'Please click the cell where the column to the right of the electrical column intersects the row below the scooter row.';
instructionsCommentAboutTasks = '\n\nIMPORTANT TO REMEMBER\n\n\n1) If you end a time interval estimation during a task (before clicking a cell) it does not count either as a correct nor incorrect answer.\n\n2) The time between a task dissapears and the next one appears is not always the same. \n\n   This means that a task may show up right after the previous task dissapeared or it may take some time.\n\n\n\n\nTo continue click on "Next".'; 
instructionsPayments = 'EARNING MONEY\n\n\n\nHow much money you earn depends on \n\n   1) the proportion of correct and incorrect tasks you accumulate while estimating a time interval and \n\n   2) how good your estimation for a time interval is.\n\n\n\nSpecificly, you only earn money for a time interval if 80 per cent (or more) of your task answers during that interval are correct. \n\nIf less than 80 per cent of the task answers during an interval are correct you earn $0 no matter how good your estimation for the interval was.\n\nTherefore, answering the tasks correctly is crucial for earning money. \n\n\n\nIf you have 80 per cent or more of correct task answers while estimating a time interval, how much you earn also depends on your estimation of the time interval.  \n\nIf you are within plus 5 or minus 5 per cent of the length of the interval you earn $25. \n\nIf you are within plus 10 or minus 10 per cent of the length of the interval you earn $15. \n\nIf you are within plus 20 or minus 20 per cent of the length of the interval you earn $5. \n\nTherefore, you should always target the true length of the interval while answering tasks correctly.\n\nAt the end of this section, only one of the intervals will be picked at random and will be the one that counts towards payments.\n\n\n\nYou will get one more practice interval now. Please click "Next" to continue. '
instructionsInt20Secs3 = 'Please estimate another interval of 20 seconds. \n\nDuring the interval you will have to answer tasks that have a time limit. \n\nAnswer tasks until you feel the interval length (20 seconds) have passed. After click on the "End Interval" button.\n\n\n\n\nPlease click "Start Interval" to start the interval.';
instructionsInt20Secs3Task1 = 'Please click the cell where the row below the row labeled rooftop intersects the cow column.';
instructionsInt20Secs3Task2 = 'Please click the cell where the column to the right of the rugby column intersects the row above the sofa row.';
InstructionsBeforeReal = 'The real time intervals and tasks will now begin and your performance will determine your earnings. \n\nIf you have any question please raise your hand and wait for an experimenter to assist you.\n\n\n\n\nPlease click "Next" to begin the experiment.';


%SCREEN INSTRUCTIONS 0 - (SECTION 2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mouseX=0; mouseY=0;

while mouseX<x7 | mouseY>y1
notouch='Please do NOT touch the mouse or the keyboard.';
 DrawFormattedText(wPtr, notouch, [x2], [y3], [0 0 0]);
% instructionsWelcome = 'SECTION 2 \n\n\n\n\nPlease click with the mouse on the button labeled "Next" to continue.';

% Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
% Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
Screen('Flip',wPtr);

% Wait for mouse click in next button
[clicks,mouseX,mouseY,whichButton] = GetClicks();
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%SCREEN INSTRUCTIONS 0 - (SECTION 2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mouseX=0; mouseY=0;

 DrawFormattedText(wPtr, instructionsWelcome, [positionX], [positionY], [0 0 0]);
% instructionsWelcome = 'SECTION 2 \n\n\n\n\nPlease click with the mouse on the button labeled "Next" to continue.';

Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
Screen('Flip',wPtr);

%%% Wait secs after mouse %%%
WaitSecs(afterMouseInstructions); 

while mouseX<x7 | mouseY>y1

 DrawFormattedText(wPtr, instructionsWelcome, [positionX], [positionY], [0 0 0]);
% instructionsWelcome = 'SECTION 2 \n\n\n\n\nPlease click with the mouse on the button labeled "Next" to continue.';

 Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
 Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
Screen('Flip',wPtr);

% Wait for mouse click in next button
[clicks,mouseX,mouseY,whichButton] = GetClicks();
end
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%SCREEN INSTRUCTIONS 1 - (SECTION 2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mouseX=0; mouseY=0;

DrawFormattedText(wPtr, instructionsSection2, [positionX], [positionY], [0 0 0]);
% instructionsSection2 = 'SECTION 2 \n \n \n \n \nIn this section you will estimate intervals of time. \n\n\n\n\nDuring the intervals you will also have to answer tasks.\n \n \n \n \nPlease click with the mouse on the button labeled "Next" to continue.';

Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
Screen('Flip',wPtr);


%%% Wait secs after mouse %%%
WaitSecs(afterMouseInstructions);


while mouseX<x7 | mouseY>y1
DrawFormattedText(wPtr, instructionsSection2, [positionX], [positionY], [0 0 0]);
% instructionsSection2 = 'SECTION 2 \n \n \n \n \nIn this section you will estimate intervals of time. \n\n\n\n\nDuring the intervals you will also have to answer tasks.\n \n \n \n \nPlease click with the mouse on the button labeled "Next" to continue.';

Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
Screen('Flip',wPtr);

% Wait for mouse click in next button
[clicks,mouseX,mouseY,whichButton] = GetClicks();
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%SCREEN INSTRUCTIONS 2 - (ESTIMA INT DESCRIPTION)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

       mouseX=0; mouseY=0;

               DrawFormattedText(wPtr, instructionsEstimIntervDescr, [positionX], [positionY], [0 0 0]);
        % % instructionsEstimIntervDescr = 'You will now get familiar with how to mark the beginning and end of the time intervals. \n\nTo mark the beginning and end of intervals you will click on the button at the top right corner of the screen. \n\nWhen you are asked to mark the beginning of an interval the button will say "Start Interval".\n\nAfter the interval begins the button will be say "End Interval". To stop the interval you will press the button. \n \n \n \n \n\n\nPlease click on the button labeled "Next" to continue.';
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
        Screen('Flip',wPtr);
        
        %%% Wait secs after mouse %%%
WaitSecs(afterMouseInstructions); 
        
        % Wait for key press
        while mouseX<x7 | mouseY>y1
        DrawFormattedText(wPtr, instructionsEstimIntervDescr, [positionX], [positionY], [0 0 0]);
        % % instructionsEstimIntervDescr = 'You will now get familiar with how to mark the beginning and end of the time intervals. \n\nTo mark the beginning and end of intervals you will click on the button at the top right corner of the screen. \n\nWhen you are asked to mark the beginning of an interval the button will say "Start Interval".\n\nAfter the interval begins the button will be say "End Interval". To stop the interval you will press the button. \n \n \n \n \n\n\nPlease click on the button labeled "Next" to continue.';
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
        Screen('Flip',wPtr);

        % Wait for mouse click in next button
        [clicks,mouseX,mouseY,whichButton] = GetClicks();
        end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%SCREEN INSTRUCTIONS 3 - (START INTERVAL 10 SECS)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mouseX=0; mouseY=0;

        DrawFormattedText(wPtr, instructionsStatInterv10s, [positionX], [positionY], [0 0 0]);
        % instructionsStatInterv10s = 'Please estimate an interval of 10 seconds.\n \nWhen you are ready to mark the start of the interval please click on the button labeled "Start Interval". ';
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        Screen('DrawText',wPtr,StartInterval,x7+(x1/8),y0+(y1/2),[0 0 0]);
        Screen('Flip',wPtr);
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % Wait for key press
        while mouseX<x7 | mouseY>y1
        DrawFormattedText(wPtr, instructionsStatInterv10s, [positionX], [positionY], [0 0 0]);
        % instructionsStatInterv10s = 'Please estimate an interval of 10 seconds.\n \nWhen you are ready to mark the start of the interval please click on the button labeled "Start Interval". ';
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        Screen('DrawText',wPtr,StartInterval,x7+(x1/8),y0+(y1/2),[0 0 0]);
        Screen('Flip',wPtr);

        % Wait for mouse click in next button
        [clicks,mouseX,mouseY,whichButton] = GetClicks();
        end
        
        % Interval Start
        clickBegins=GetSecs();
        now = clickBegins;
 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%SCREEN INSTRUCTIONS 4 - (END INT 10 SECS)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
buttons=[0 0 0];
mouseX=0; mouseY=0;

EndInterval1 = strcat(EndInterval, ' of\n5 seconds');

  DrawFormattedText(wPtr, instructionsEndInterv, [positionX], [positionY], [0 0 0]);
        % instructionsEndInterv = 'When you are ready to mark the end of the interval please click on the button labeled "End Interval".';
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval1, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        
while (mouseX<x7 | mouseY>y1) && now < clickBegins + 20
        % Wait for key press
        while ~max(buttons) && now < clickBegins + 20
        DrawFormattedText(wPtr, instructionsEndInterv, [positionX], [positionY], [0 0 0]);
        % instructionsEndInterv = 'When you are ready to mark the end of the interval please click on the button labeled "End Interval".';
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval1, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % mouseX and mouseY only exist if clicked
        
        now = GetSecs();

        end
        
        buttons=[0 0 0];

end  

 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%SCREEN INSTRUCTIONS 5 - (ANOTHER INTERVAL + START INTERVAL 15 SECS)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mouseX=0; mouseY=0;

        DrawFormattedText(wPtr, instructionsStatInterv15s, [positionX], [positionY], [0 0 0]);
        % instructionsStatInterv15s = 'Very good. Now estimate an interval of 15 seconds.\n \nWhen you are ready to mark the start of the interval please click on the button labeled "Start Interval". \n\nTo end the interval please click this same button which will be labeled "End interval" after the interval has began.';
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        Screen('DrawText',wPtr,StartInterval,x7+(x1/8),y0+(y1/2),[0 0 0]);
        Screen('Flip',wPtr);
        
       %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % Wait for key press
        while mouseX<x7 | mouseY>y1
        DrawFormattedText(wPtr, instructionsStatInterv15s, [positionX], [positionY], [0 0 0]);
        % instructionsStatInterv15s = 'Very good. Now estimate an interval of 15 seconds.\n \nWhen you are ready to mark the start of the interval please click on the button labeled "Start Interval". \n\nTo end the interval please click this same button which will be labeled "End interval" after the interval has began.';
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        Screen('DrawText',wPtr,StartInterval,x7+(x1/8),y0+(y1/2),[0 0 0]);
        Screen('Flip',wPtr);

        % Wait for mouse click in next button
        [clicks,mouseX,mouseY,whichButton] = GetClicks();
        end
        
        % Interval Start
        clickBegins=GetSecs();
        now = clickBegins;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%SCREEN INSTRUCTIONS 6 - (STOP INT 15 SECS)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
buttons=[0 0 0];
mouseX=0; mouseY=0;

EndInterval2 = strcat(EndInterval, ' of\n10 seconds');

  DrawFormattedText(wPtr, instructionsEndInterv, [positionX], [positionY], [0 0 0]);
        % instructionsEndInterv = 'When you are ready to mark the end of the interval please click on the button labeled "End Interval".';
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions); 
        
while (mouseX<x7 | mouseY>y1) && now < clickBegins + 25
        % Wait for key press
        while ~max(buttons) && now < clickBegins + 25
        DrawFormattedText(wPtr, instructionsEndInterv, [positionX], [positionY], [0 0 0]);
        % instructionsEndInterv = 'When you are ready to mark the end of the interval please click on the button labeled "End Interval".';
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % mouseX and mouseY only exist if clicked
        
        now = GetSecs();

        end
        
        buttons=[0 0 0];

end  


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%SCREEN INSTRUCTIONS 7 - (SUMMARY OF INTERVALS)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mouseX=0; mouseY=0;

DrawFormattedText(wPtr, instructionsSummaryInterv, [positionX], [positionY], [0 0 0]);
% instructionsSummaryInterv = 'Very good. \n\nNow you know how to mark the beggining and end of the intervals. \n\nNow you will get familiar with the tasks you will have to answer during the estimation of the intervals. \n\n\n\n\n\n\nPlease click on the button labeled "Next" to continue.'

Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
Screen('Flip',wPtr);

        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
while mouseX<x7 | mouseY>y1
DrawFormattedText(wPtr, instructionsSummaryInterv, [positionX], [positionY], [0 0 0]);
% instructionsSummaryInterv = 'Very good. \n\nNow you know how to mark the beggining and end of the intervals. \n\nNow you will get familiar with the tasks you will have to answer during the estimation of the intervals. \n\n\n\n\n\n\nPlease click on the button labeled "Next" to continue.'

Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
Screen('Flip',wPtr);

% Wait for mouse click in next button
[clicks,mouseX,mouseY,whichButton] = GetClicks();
end


%SCREEN INSTRUCTIONS 8 - (TASK DESCRIPTION + EXAMPLE 1) - Wait for mouse click to continue
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
row1='row1'; row2='row2'; row3='row3'; row4='row4';
col1='col1'; col2='col2'; col3='col3'; col4='col4'; col5='col5'; col6='col6'; col7='col7';

buttons=[0 0 0];
mouseX=0; mouseY=0;

DrawFormattedText(wPtr, instructionsTasksDescription1, [positionX], [positionY], [0 0 0]);
% instructionsTasksDescription1 = 'The tasks you have to answer while estimating intervals of time ask you to click on different parts of the screen. \n\nSpecifically, they ask you to click on one of the 24 cells shown in the table below (4 rows by 6 columns).  \n\n\n\n\nPlease click "Next" to continue.'

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);

% Labels 
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);

%%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
while mouseX<x7 | mouseY>y1
DrawFormattedText(wPtr, instructionsTasksDescription1, [positionX], [positionY], [0 0 0]);
% instructionsTasksDescription1 = 'The tasks you have to answer while estimating intervals of time ask you to click on different parts of the screen. \n\nSpecifically, they ask you to click on one of the 24 cells shown in the table below (4 rows by 6 columns).  \n\n\n\n\nPlease click "Next" to continue.'

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);

% Labels 
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);


mouseX=0; mouseY=0;

% Wait for mouse click in next button
[clicks,mouseX,mouseY,whichButton] = GetClicks();
end



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%SCREEN INSTRUCTIONS 8.2 - (TASK DESCRIPTION + EXAMPLE 1) - Wait for mouse click to continue
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
row1='row1'; row2='row2'; row3='row3'; row4='row4';
col1='col1'; col2='col2'; col3='col3'; col4='col4'; col5='col5'; col6='col6'; col7='col7';

buttons=[0 0 0];
mouseX=0; mouseY=0;

% First show screen so theres no lag in immmage
DrawFormattedText(wPtr, instructionsTasksDescription2, [positionX], [positionY], [0 0 0]);
% instructionsTasksDescription2 = 'For example, a task could ask you to click on the cell where row 2 intersects column 3. \n\nFor illustrative purposes we colored this cell in black. \n\n\n\n\nPlease click on this cell to continue.';

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);
Screen('FillRect',wPtr, [0 0 0], [x4 y5 x5 y6]); 

% Labels 
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);

%%% Wait secs after mouse %%%
WaitSecs(afterMouseInstructions);

% Wait for mouse press in dark cell
while max(buttons)==0 | (mouseX<x4 | mouseX>x5) | (mouseY<y5 | mouseY>y6)
DrawFormattedText(wPtr, instructionsTasksDescription2, [positionX], [positionY], [0 0 0]);
% instructionsTasksDescription = 'All tasks ask you to click on one of the 28 (4 rows x 7 columns) cells shown in the table below.  \n\nFor example, you could be asked to click on the "row2 col3" cell. \n\nThis means that the task is asking you to click on top of cell where row 2 intersects column 3. \n\nIn the table below this cell is the one colored in black. \n\nPlease click on this cell to continue.';

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);
Screen('FillRect',wPtr, [0 0 0], [x4 y5 x5 y6]); 

% Labels 
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);

[mouseX,mouseY,buttons] = GetMouse(); % mouseX and mouseY only exist if clicked
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%SCREEN INSTRUCTIONS 9 - (TASK EXAMPLE 2) - Wait for mouse click to continue
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
row1='row1'; row2='row2'; row3='row3'; row4='row4';
col1='col1'; col2='col2'; col3='col3'; col4='col4'; col5='col5'; col6='col6'; col7='col7';

buttons=[0 0 0];
mouseX=0; mouseY=0;

% First show screen so theres no lag in immmage
DrawFormattedText(wPtr, instructionsTasksExample2, [positionX], [positionY], [0 0 0]);
% instructionsTasksExample2 = 'This last task was to familiarize you with rows and columns. \n\nHowever, the way in which tasks will specify which cell you should click on is slightly more complex. \n\nA task can ask you to click on the cell where "the row below row 2" intersects the "column to the left of column 3". \n\nIn this task you should click on the cell where row 3 (the row below row 2) intersects column 2 (the column to the left of column 3). \n\nIn the table below we colored this cell in black. \n\nPlease click on this cell to continue.';

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);
Screen('FillRect',wPtr, [0 0 0], [x3 y6 x4 y7]); 

% Labels 
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);


Screen('Flip',wPtr);

%%% Wait secs after mouse %%%
WaitSecs(afterMouseInstructions);

% Wait for mouse press in dark cell
while max(buttons)==0 | (mouseX<x3 | mouseX>x4) | (mouseY<y6 | mouseY>y7)
DrawFormattedText(wPtr, instructionsTasksExample2, [positionX], [positionY], [0 0 0]);
% instructionsTasksExample2 = 'This last task was to familiarize you with rows and columns. \n\nHowever, the way in which tasks will specify which cell you should click on is slightly more complex. \n\nA task can ask you to click on the cell where "the row below row 2" intersects the "column to the left of column 3". \n\nIn this task you should click on the cell where row 3 (the row below row 2) intersects column 2 (the column to the left of column 3). \n\nIn the table below we colored this cell in black. \n\nPlease click on this cell to continue.';

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);
Screen('FillRect',wPtr, [0 0 0], [x3 y6 x4 y7]); 

% Labels 
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);

[mouseX,mouseY,buttons] = GetMouse(); % mouseX and mouseY only exist if clicked
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%SCREEN INSTRUCTIONS 10 - (TASK EXAMPLE 3) - Wait for mouse click to continue
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
buttons=[0 0 0];
mouseX=0; mouseY=0;

% First show screen so theres no lag in immmage
DrawFormattedText(wPtr, instructionsTasksExample3, [positionX], [positionY], [0 0 0]);
% instructionsTasksExample3 = 'The tasks will have names (labels) for the rows and columns. \n\nImagine a task asks you to click on the row above the Alaska row and the column to the right of the folk column. \n\nIn this task you shold click the cell where row Texas (above row Alaska) intersects column rock (to the right of column folk).\n\n\n\nPlease click on this cell to continue.';

% name4={'California' 'Iowa' 'Texas' 'Alaska'     'jazz' 'pop' 'salsa' 'rap' 'classical' 'folk' 'rock'};
% ROWS
Screen('DrawText',wPtr,name4{1},x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,name4{2},x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,name4{3},x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,name4{4},x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMN
Screen('DrawText',wPtr,name4{5},x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,name4{6},x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,name4{7},x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,name4{8},x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,name4{9},x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,name4{10},x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);
Screen('FillRect', wPtr, [0 0 0], [x7 y6 x8 y7]); 

% Labels 
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);

%%% Wait secs after mouse %%%
WaitSecs(afterMouseInstructions);

% Wait for mouse press in dark cell
while max(buttons)==0 | (mouseX<x7 | mouseX>x8) | (mouseY<y6 | mouseY>y7)
DrawFormattedText(wPtr, instructionsTasksExample3, [positionX], [positionY], [0 0 0]);
% instructionsTasksExample3 = 'Very good. \n\nNow lets try a real task in which the rows and columns will be labeled with names. \n\nImagine a task asks you to click on the row above the Alaska row and the column to the right of the folk column. \n\nIn this task you shold click on the cell where row Texas (the row above row Alaska) intersects column rock (the column to the right of column folk).';

% ROWS
Screen('DrawText',wPtr,name4{1},x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,name4{2},x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,name4{3},x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,name4{4},x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMN
Screen('DrawText',wPtr,name4{5},x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,name4{6},x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,name4{7},x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,name4{8},x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,name4{9},x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,name4{10},x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);
Screen('FillRect', wPtr, [0 0 0], [x7 y6 x8 y7]); 

% Labels 
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);

[mouseX,mouseY,buttons] = GetMouse(); % mouseX and mouseY only exist if clicked
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%SCREEN INSTRUCTIONS 12 - (TASK DESCRIPTION + EXAMPLE 1) - Wait for mouse click to continue
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mouseX=0; mouseY=0;

while mouseX<x7 | mouseY>y1
DrawFormattedText(wPtr, instructionsTasksDescriptionDynamicsTasks, [positionX], [positionY], [0 0 0]);
% instructionsTasksDescriptionDynamicsTasks = 'All the tasks you will have to answer while estimating intervals will ask you to click on one of the 24 cells. \n\nIn these previous illustrative examples there was no time limit for answering the tasks. \n\nHowever, you will have a time limit to answer the tasks that will show up while you are estimating time intervals. \n\n\n\n\nThe time limit (of a few seconds) is unknown to you and is not constant from task to task.\n\nAfter you reach the time limit the task will dissapear from the screen and count as a wrong answer. \n\nIn a moment we will explain how correct or incorrect answers influence the money you earn. \n\nThe important thing to understand is that you must answer correctly the tasks to make money. \n\nBecause of the time limit you have to answer a task you should carefuly read the instructions and answer promptly. \n\n\n\n\n\n\nPlease click "Next" to continue.';

Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
Screen('Flip',wPtr);

% Wait for mouse click in next button
[clicks,mouseX,mouseY,whichButton] = GetClicks();
end

%%% Wait secs after mouse %%%
WaitSecs(afterMouseInstructions);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%SCREEN INSTRUCTIONS 12.2 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mouseX=0; mouseY=0;

while mouseX<x7 | mouseY>y1
DrawFormattedText(wPtr, instructionsTasksDescriptionRealTry, [positionX], [positionY], [0 0 0]);
% instructionsTasksDescriptionRealTry = 'The following will be an example of how a task would appear while you are estimating a time interval. \n\nIf you dont answer within the time limit the task will dissapear and would have counted as a wrong answer.  \n\nPlease click "Next" to continue.';

Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
Screen('Flip',wPtr);

% Wait for mouse click in next button
[clicks,mouseX,mouseY,whichButton] = GetClicks();
end

%%% Wait secs after mouse %%%
WaitSecs(afterMouseInstructions);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%SCREEN INSTRUCTIONS 13 - (DYNAMIC TASK EXAMPLE 1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Wait secs after mouse %%%
WaitSecs(afterMouseInstructions); 

buttons=[0 0 0];
mouseX=0; mouseY=0;
clickBegins=GetSecs();
now = clickBegins;
d=0;
% name1={'red' 'green' 'blue' 'yellow'            'banana' 'peach' 'apple' 'grape' 'orange' 'pear' 'lemon'};
% Instructions - Row4/Col4

           while ~max(buttons) & now < clickBegins + 15

DrawFormattedText(wPtr, instructionsTaskDynamic1, [positionX], [positionY], [0 0 0]);
% instructionsTaskDynamic1 = 'Please click the cell where the row below the blue row intersects the column to the left of the orange column.';

row1= name1{1}; 
row2= name1{2};
row3= name1{3};
row4= name1{4};

col1= name1{5};
col2= name1{6};
col3= name1{7};
col4= name1{8};
col5= name1{9};
col6= name1{10};
col7= name1{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);


% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);


Screen('Flip',wPtr);

       [mouseX,mouseY,buttons] = GetMouse(); % mouseX and mouseY only exist if clicked

        now = GetSecs();
        
           end
        
       % If he clicked the mouse in time
       if max(buttons)>0 % Row3/Col3
            if mouseY >= R4(2) && mouseY <= R4(4) && mouseX >= C4(1) && mouseX <= C4(3)
            d=1; 
            end
       end
                    
   if d==0
       if max(buttons)>0
           answer='Wrong cell. This would have counted as a wrong answer. \n\nPlease click "Next" to try again.';
       else
          answer='You ran out of time. This would have counted as a wrong answer. \n\nPlease click "Next" to try again.';
       end
       
       DrawFormattedText(wPtr, answer, [x1], [y2], [0 0 0]);

       Screen('Flip',wPtr);

       mouseX=0; mouseY=0;

        while mouseX<x7 | mouseY>y1
        DrawFormattedText(wPtr, answer, [x1], [y2], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
        Screen('Flip',wPtr);

        % Wait for mouse click in next button
        [clicks,mouseX,mouseY,whichButton] = GetClicks();
        end

        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions); 

buttons=[0 0 0];
mouseX=0; mouseY=0;
clickBegins=GetSecs();
now = clickBegins;
% name1={'red' 'green' 'blue' 'yellow'            'banana' 'peach' 'apple' 'grape' 'orange' 'pear' 'lemon'};
% Instructions - Row4/Col4

           while ~max(buttons) & now < clickBegins + 25

DrawFormattedText(wPtr, instructionsTaskDynamic1, [positionX], [positionY], [0 0 0]);
% instructionsTaskDynamic1 = 'Please click the cell where the row below the blue row intersects the column to the left of the orange column.';


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);


% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);

       [mouseX,mouseY,buttons] = GetMouse(); % mouseX and mouseY only exist if clicked

        now = GetSecs();
        
           end
        
       % If he clicked the mouse in time
       if max(buttons)>0 % Row3/Col3
            if mouseY >= R4(2) && mouseY <= R4(4) && mouseX >= C4(1) && mouseX <= C4(3)
           d=1;
            end
       end
                
       WaitSecs(afterMouseInstructions);
       
   if d==0
       if max(buttons)>0
           answer='Wrong cell';
       else
          answer='Your time was up';
       end
       
       Screen('DrawText',wPtr,answer,x1,y2,[0 0 0]);

       Screen('Flip',wPtr);
       
       WaitSecs(taskAnswer);
      
   end % End of second try
   end % End of first try
   
   if d==0 % "If you didnt get it right it two tries"
       
    mouseX=0; mouseY=0;
        % Wait for click
        while mouseX<x7 | mouseY>y1
        DrawFormattedText(wPtr, rightanswer, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
        

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);


% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('FillRect', wPtr, [0 0 0], [x5 y7 x6 y8]); 

Screen('Flip',wPtr);


        % Wait for mouse click in next button
        [clicks,mouseX,mouseY,whichButton] = GetClicks();
        end

        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions); 
       
       
   else % If they got it right in the first two tries
              
      % Tell them they got it right
      DrawFormattedText(wPtr, answerCorrectAnounce, [x1], [y2], [0 0 0]);

       Screen('Flip',wPtr);
       WaitSecs(afterMouseInstructions);
  
       mouseX=0; mouseY=0;

        % Wait for key press
        while mouseX<x7 | mouseY>y1
        DrawFormattedText(wPtr, answerCorrectAnounce, [x1], [y2], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
        Screen('Flip',wPtr);

        % Wait for mouse click in next button
        [clicks,mouseX,mouseY,whichButton] = GetClicks();
        end

        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions); 

   end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%SCREEN INSTRUCTIONS 14 - (DYNAMIC TASK EXAMPLE 2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Wait secs after mouse %%%
WaitSecs(afterMouseInstructions); 

buttons=[0 0 0];
mouseX=0; mouseY=0;
clickBegins=GetSecs();
now = clickBegins;
d=0;
% name1={'red' 'green' 'blue' 'yellow'            'banana' 'peach' 'apple' 'grape' 'orange' 'pear' 'lemon'};
% Instructions - Row4/Col4

           while ~max(buttons) & now < clickBegins + 15

DrawFormattedText(wPtr, instructionsTaskDynamic2, [positionX], [positionY], [0 0 0]);
% instructionsTaskDynamic1 = 'Please click the cell where the row below the blue row intersects the column to the left of the orange column.';

row1= name2{1}; 
row2= name2{2};
row3= name2{3};
row4= name2{4};

col1= name2{5};
col2= name2{6};
col3= name2{7};
col4= name2{8};
col5= name2{9};
col6= name2{10};
col7= name2{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);


% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);


Screen('Flip',wPtr);

       [mouseX,mouseY,buttons] = GetMouse(); % mouseX and mouseY only exist if clicked

        now = GetSecs();
        
           end
        
       % If he clicked the mouse in time
       if max(buttons)>0 % Row3/Col3
            if mouseY >= R2(2) && mouseY <= R2(4) && mouseX >= C4(1) && mouseX <= C4(3)
            d=1; 
            end
       end
                    
   if d==0
       if max(buttons)>0
           answer='Wrong cell. This would have counted as a wrong answer. \n\nPlease click "Next" to try again.';
       else
          answer='You ran out of time. This would have counted as a wrong answer. \n\nPlease click "Next" to try again.';
       end
       
       DrawFormattedText(wPtr, answer, [x1], [y2], [0 0 0]);

       Screen('Flip',wPtr);

       mouseX=0; mouseY=0;

        while mouseX<x7 | mouseY>y1
        DrawFormattedText(wPtr, answer, [x1], [y2], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
        Screen('Flip',wPtr);

        % Wait for mouse click in next button
        [clicks,mouseX,mouseY,whichButton] = GetClicks();
        end

        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions); 

buttons=[0 0 0];
mouseX=0; mouseY=0;
clickBegins=GetSecs();
now = clickBegins;
% name1={'red' 'green' 'blue' 'yellow'            'banana' 'peach' 'apple' 'grape' 'orange' 'pear' 'lemon'};
% Instructions - Row4/Col4

           while ~max(buttons) & now < clickBegins + 25

DrawFormattedText(wPtr, instructionsTaskDynamic2, [positionX], [positionY], [0 0 0]);
% instructionsTaskDynamic1 = 'Please click the cell where the row below the blue row intersects the column to the left of the orange column.';


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);


% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);

       [mouseX,mouseY,buttons] = GetMouse(); % mouseX and mouseY only exist if clicked

        now = GetSecs();
        
           end
        
       % If he clicked the mouse in time
       if max(buttons)>0 % Row3/Col3
            if mouseY >= R2(2) && mouseY <= R2(4) && mouseX >= C4(1) && mouseX <= C4(3)
           d=1;
            end
       end
                
       WaitSecs(afterMouseInstructions);
       
   if d==0
       if max(buttons)>0
           answer='Wrong cell';
       else
          answer='Your time was up';
       end
       
       Screen('DrawText',wPtr,answer,x1,y2,[0 0 0]);

       Screen('Flip',wPtr);
       
       WaitSecs(taskAnswer);
      
   end % End of second try
   end % End of first try
   
   if d==0 % "If you didnt get it right it two tries"
       
    mouseX=0; mouseY=0;
        % Wait for click
        while mouseX<x7 | mouseY>y1
        DrawFormattedText(wPtr, rightanswer2, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
        

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);


% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('FillRect', wPtr, [0 0 0], [x5 y5 x6 y6]); 

Screen('Flip',wPtr);


        % Wait for mouse click in next button
        [clicks,mouseX,mouseY,whichButton] = GetClicks();
        end

        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions); 
       
       
   else % If they got it right in the first two tries
              
      % Tell them they got it right
      DrawFormattedText(wPtr, answerCorrectAnounce, [x1], [y2], [0 0 0]);

       Screen('Flip',wPtr);
       WaitSecs(afterMouseInstructions);
  
       mouseX=0; mouseY=0;

        % Wait for key press
        while mouseX<x7 | mouseY>y1
        DrawFormattedText(wPtr, answerCorrectAnounce, [x1], [y2], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
        Screen('Flip',wPtr);

        % Wait for mouse click in next button
        [clicks,mouseX,mouseY,whichButton] = GetClicks();
        end

        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions); 

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%SCREEN INSTRUCTIONS 15 - (DYNAMIC TASK EXAMPLE 3)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% Wait secs after mouse %%%
WaitSecs(afterMouseInstructions); 

buttons=[0 0 0];
mouseX=0; mouseY=0;
clickBegins=GetSecs();
now = clickBegins;
d=0;
% name3={'car' 'truck' 'bike' 'bus'               'shoe' 'coat' 'pants' 'scarf' 'shorts' 'gloves' 'jacket'};
% Instructions - Row3/Col4

           while ~max(buttons) & now < clickBegins + 15

DrawFormattedText(wPtr, instructionsTaskDynamic3, [positionX], [positionY], [0 0 0]);
% instructionsTaskDynamic3 = 'Lets try another task. \n\nPlease click the cell where the row above the bus row intersects the column to the right of the pants column.';

row1= name3{1}; 
row2= name3{2};
row3= name3{3};
row4= name3{4};

col1= name3{5};
col2= name3{6};
col3= name3{7};
col4= name3{8};
col5= name3{9};
col6= name3{10};
col7= name3{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);


% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);


Screen('Flip',wPtr);

       [mouseX,mouseY,buttons] = GetMouse(); % mouseX and mouseY only exist if clicked

        now = GetSecs();
        
           end
        
       % If he clicked the mouse in time
       if max(buttons)>0 % Row3/Col3
            if mouseY >= R3(2) && mouseY <= R3(4) && mouseX >= C4(1) && mouseX <= C4(3)
            d=1; 
            end
       end
                    
   if d==0
       if max(buttons)>0
           answer='Wrong cell. This would have counted as a wrong answer. \n\nPlease click "Next" to try again.';
       else
          answer='You ran out of time. This would have counted as a wrong answer. \n\nPlease click "Next" to try again.';
       end
       
       DrawFormattedText(wPtr, answer, [x1], [y2], [0 0 0]);

       Screen('Flip',wPtr);

       mouseX=0; mouseY=0;

        while mouseX<x7 | mouseY>y1
        DrawFormattedText(wPtr, answer, [x1], [y2], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
        Screen('Flip',wPtr);

        % Wait for mouse click in next button
        [clicks,mouseX,mouseY,whichButton] = GetClicks();
        end

        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions); 

buttons=[0 0 0];
mouseX=0; mouseY=0;
clickBegins=GetSecs();
now = clickBegins;
% name1={'red' 'green' 'blue' 'yellow'            'banana' 'peach' 'apple' 'grape' 'orange' 'pear' 'lemon'};
% Instructions - Row4/Col4

           while ~max(buttons) & now < clickBegins + 25

DrawFormattedText(wPtr, instructionsTaskDynamic3, [positionX], [positionY], [0 0 0]);
% instructionsTaskDynamic1 = 'Please click the cell where the row below the blue row intersects the column to the left of the orange column.';


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);


% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);

       [mouseX,mouseY,buttons] = GetMouse(); % mouseX and mouseY only exist if clicked

        now = GetSecs();
        
           end
        
       % If he clicked the mouse in time
       if max(buttons)>0 % Row3/Col3
            if mouseY >= R3(2) && mouseY <= R3(4) && mouseX >= C4(1) && mouseX <= C4(3)
           d=1;
            end
       end
                
       WaitSecs(afterMouseInstructions);
       
   if d==0
       if max(buttons)>0
           answer='Wrong cell';
       else
          answer='Your time was up';
       end
       
       Screen('DrawText',wPtr,answer,x1,y2,[0 0 0]);

       Screen('Flip',wPtr);
       
       WaitSecs(taskAnswer);
      
   end % End of second try
   end % End of first try
   
   if d==0 % "If you didnt get it right it two tries"
       
    mouseX=0; mouseY=0;
        % Wait for click
        while mouseX<x7 | mouseY>y1
        DrawFormattedText(wPtr, rightanswer3, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
        

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);


% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('FillRect', wPtr, [0 0 0], [x5 y6 x6 y7]); 

Screen('Flip',wPtr);


        % Wait for mouse click in next button
        [clicks,mouseX,mouseY,whichButton] = GetClicks();
        end

        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions); 
       
       
   else % If they got it right in the first two tries
              
      % Tell them they got it right
      DrawFormattedText(wPtr, answerCorrectAnounce, [x1], [y2], [0 0 0]);

       Screen('Flip',wPtr);
       WaitSecs(afterMouseInstructions);
  
       mouseX=0; mouseY=0;

        % Wait for key press
        while mouseX<x7 | mouseY>y1
        DrawFormattedText(wPtr, answerCorrectAnounce, [x1], [y2], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
        Screen('Flip',wPtr);

        % Wait for mouse click in next button
        [clicks,mouseX,mouseY,whichButton] = GetClicks();
        end

        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions); 

end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%SCREEN INSTRUCTIONS 16 - (Descriptions of intervals with tasks)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       

mouseX=0; mouseY=0;

while mouseX<x7 | mouseY>y1
DrawFormattedText(wPtr, instructionsIntWithTasksDescription, [positionX], [positionY], [0 0 0]);
% instructionsTasksDescriptionRealTry = 'The following will be an example of how a task would appear while you are estimating a time interval. \n\nIf you dont answer within the time limit the task will dissapear and would have counted as a wrong answer.  \n\nPlease click "Next" to continue.';

Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
Screen('Flip',wPtr);

% Wait for mouse click in next button
[clicks,mouseX,mouseY,whichButton] = GetClicks();
end

%%% Wait secs after mouse %%%
WaitSecs(afterMouseInstructions);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%SCREEN INSTRUCTIONS 17 - (Instructions for interval of 20 secs with tasks)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Screen('TextFont',wPtr,'Helvetica');
Screen('TextSize',wPtr,18);

mouseX=0; mouseY=0;

        % Wait for key press
        while mouseX<x7 | mouseY>y1
        DrawFormattedText(wPtr, instructionsInt20Secs, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        Screen('DrawText',wPtr,StartInterval,x7+(x1/8),y0+(y1/2),[0 0 0]);
        Screen('Flip',wPtr);

        % Wait for mouse click in next button
        [clicks,mouseX,mouseY,whichButton] = GetClicks();
        end
        
  
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%SCREEN INSTRUCTIONS 18 - (Interval of 20 seconds with tasks) task 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf(myfile,'Beginning of first test interval (of 20 seconds) \n');
EndInterval1 = strcat(EndInterval, '\nof 20 seconds');

clickBegins=GetSecs();
startPracticeInterval1=clickBegins;
now = clickBegins;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;
counterCorrectas=0;
counterIncorrectas=0;
buttonEnd=0;

fprintf(myfile,'Beginning of task \n');


% If hasnt clicked on "end int" button
% 1
if buttonEnd == 0
    
    % Until he presses the end button or time for task runs out
    % 2
    while (mouseY < R3(2) | mouseY > R3(4) | mouseX < C3(1) | mouseX > C3(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int2test1        
        % 3
        while ~max(buttons) && now < clickBegins + int2test1
        DrawFormattedText(wPtr, instructionsInt20SecsTask1, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval1, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name1{1}; 
row2= name1{2};
row3= name1{3};
row4= name1{4};

col1= name1{5};
col2= name1{6};
col3= name1{7};
col4= name1{8};
col5= name1{9};
col6= name1{10};
col7= name1{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startPracticeInterval1;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R3(2) && mouseY <= R3(4) && mouseX >= C3(1) && mouseX <= C3(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                fprintf(myfileData, '%i \n', d)
                
            end
        
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int2test1 
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click

    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
    
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions); % Since there is a click
    % 2
    end
    
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int3test1
            % 2.3
            while ~max(buttons) && now < clickBegins + int3test1
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval1, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);

        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;

% If hasnt clicked on "end int" button
% 3.1
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2
    while (mouseY < R2(2) | mouseY > R2(4) | mouseX < C2(1) | mouseX > C2(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int4test1        
        % 3.3
        while ~max(buttons) && now < clickBegins + int4test1
        DrawFormattedText(wPtr, instructionsInt20SecsTask2, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval1, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name2{1}; 
row2= name2{2};
row3= name2{3};
row4= name2{4};

col1= name2{5};
col2= name2{6};
col3= name2{7};
col4= name2{8};
col5= name2{9};
col6= name2{10};
col7= name2{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R2(2) && mouseY <= R2(4) && mouseX >= C2(1) && mouseX <= C2(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                fprintf(myfileData, '%i \n', d)
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int4test1   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2    
    end
    % 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % If hasnt clicked on "end int" button
    % 4.1
        if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 4.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int5test1
            % 4.3
            while ~max(buttons) && now < clickBegins + int5test1
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval1, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 4.3
            end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 4.2
        end 
        
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

            % 4.1
            end
        % 3.1      
        end
    % 2.1    
    end
% 1        
end
lengthPracticeInterval = now - startPracticeInterval1;
correctas = num2str(counterCorrectas);
incorrectas = num2str(counterIncorrectas);
proportionCorrectas = counterCorrectas/(counterCorrectas+counterIncorrectas);

if (counterCorrectas/(counterCorrectas+counterIncorrectas))>.79
    proportion=' over or equal to 80 per cent.';
else
    proportion=' under 80 per cent.';
end

Answer = 'We cant tell you how good your estimate for the 20 second interval was. \n\nHowever, we will tell you how many correct and incorrect task answers you had. \n\nYou had <';
Answer = strcat(Answer,correctas);
Answer = strcat(Answer,'> correct answers and <');
Answer = strcat(Answer,incorrectas);
Answer = strcat(Answer,'> incorrect answers.');
Answer = strcat(Answer,' The proportion of correct anwers is ');
Answer = strcat(Answer,proportion);
Answer = strcat(Answer,'\n\n\n\n\nPlease click the button labeled "Next" to continue.');

fprintf(myfile,'%s \n', Answer);
        fprintf(myfileData, '%.2f \n', proportionCorrectas)
fprintf(myfile,'The length of the 1st practice interval is %.5f \n\n', lengthPracticeInterval);
        fprintf(myfileData, '%.5f \n', lengthPracticeInterval)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mouseX=0; mouseY=0;

while mouseX<x7 | mouseY>y1
DrawFormattedText(wPtr, Answer, [positionX], [positionY], [0 0 0]);
Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
Screen('Flip',wPtr);

% Wait for mouse click in next button
[clicks,mouseX,mouseY,whichButton] = GetClicks();
end

%%% Wait secs after mouse %%%
WaitSecs(afterMouseInstructions); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%SCREEN INSTRUCTIONS 19.1 - (Comment about tasks after 1st 20 sec int)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Screen('TextFont',wPtr,'Helvetica');
Screen('TextSize',wPtr,18);

mouseX=0; mouseY=0;

        % Wait for key press
        while mouseX<x7 | mouseY>y1
        DrawFormattedText(wPtr, instructionsCommentAboutTasks, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
        Screen('Flip',wPtr);

        % Wait for mouse click in next button
        [clicks,mouseX,mouseY,whichButton] = GetClicks();
        end
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%SCREEN INSTRUCTIONS 21 - (Payments explanation)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mouseX=0; mouseY=0;

        % Wait for key press
        while mouseX<x7 | mouseY>y1
        DrawFormattedText(wPtr, instructionsPayments, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
        Screen('Flip',wPtr);

        % Wait for mouse click in next button
        [clicks,mouseX,mouseY,whichButton] = GetClicks();
        end
        
  
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%SCREEN INSTRUCTIONS 19.2 - (Instructions for second interval of 20 secs with tasks)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Screen('TextFont',wPtr,'Helvetica');
Screen('TextSize',wPtr,18);

mouseX=0; mouseY=0;

        % Wait for key press
        while mouseX<x7 | mouseY>y1
        DrawFormattedText(wPtr, instructionsInt20Secs2, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        Screen('DrawText',wPtr,StartInterval,x7+(x1/8),y0+(y1/2),[0 0 0]);
        Screen('Flip',wPtr);

        % Wait for mouse click in next button
        [clicks,mouseX,mouseY,whichButton] = GetClicks();
        end
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%SCREEN INSTRUCTIONS 20 - (Second interval of 20 seconds with tasks) task 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf(myfile,'Beginning of second test interval (of 20 seconds) \n');
EndInterval2 = strcat(EndInterval, '\nof 20 seconds');

clickBegins=GetSecs();
startPracticeInterval2=clickBegins;
now = clickBegins;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;
counterCorrectas=0;
counterIncorrectas=0;
buttonEnd=0;

fprintf(myfile,'Beginning of task \n');


% If hasnt clicked on "end int" button
% 1
if buttonEnd == 0
    
    % Until he presses the end button or time for task runs out
    % 2
while (mouseY < R2(2) | mouseY > R2(4) | mouseX < C2(1) | mouseX > C2(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int2test1        
        % 3
        while ~max(buttons) && now < clickBegins + int2test1
        DrawFormattedText(wPtr, instructionsInt20Secs2Task1, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name7{1}; 
row2= name7{2};
row3= name7{3};
row4= name7{4};

col1= name7{5};
col2= name7{6};
col3= name7{7};
col4= name7{8};
col5= name7{9};
col6= name7{10};
col7= name7{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startPracticeInterval2;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R2(2) && mouseY <= R2(4) && mouseX >= C2(1) && mouseX <= C2(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
               fprintf(myfileData, '%i \n', d)

                
            end
        
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int2test1   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
    
    
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions); % Since there is a click
    % 2    
    end
    
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int3test1
            % 2.3
            while ~max(buttons) && now < clickBegins + int3test1
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;

% If hasnt clicked on "end int" button
% 3.1
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2
    while (mouseY < R4(2) | mouseY > R4(4) | mouseX < C6(1) | mouseX > C6(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int4test1        
        % 3.3
        while ~max(buttons) && now < clickBegins + int4test1
        DrawFormattedText(wPtr, instructionsInt20Secs2Task2, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name8{1}; 
row2= name8{2};
row3= name8{3};
row4= name8{4};

col1= name8{5};
col2= name8{6};
col3= name8{7};
col4= name8{8};
col5= name8{9};
col6= name8{10};
col7= name8{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R4(2) && mouseY <= R4(4) && mouseX >= C6(1) && mouseX <= C6(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
               fprintf(myfileData, '%i \n', d)

                
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int4test1   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2    
    end
    % 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % If hasnt clicked on "end int" button
    % 4.1
        if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 4.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int5test1
            % 4.3
            while ~max(buttons) && now < clickBegins + int5test1
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 4.3
            end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 4.2
        end 
        
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

            % 4.1
            end
        % 3.1      
        end
    % 2.1    
    end
% 1        
end
lengthPracticeInterval = now - startPracticeInterval2;
correctas = num2str(counterCorrectas);
incorrectas = num2str(counterIncorrectas);
proportionCorrectas = counterCorrectas/(counterCorrectas+counterIncorrectas);

if (counterCorrectas/(counterCorrectas+counterIncorrectas))>.79
    proportion=' over or equal to 80 per cent.\n\nSo you would have earned money for this time interval if your estimation was good.\n\nRemember: if less than 80 per cent of the task answers during an interval are correct you earn $0 no matter how good your estimation for the interval.';
else
    proportion=' under 80 per cent.\n\nSo you would have earned zero for this time interval regardless of your estimation.\n\nRemember: if less than 80 per cent of the task answers during an interval are correct you earn $0 no matter how good your estimation for the interval.';

end
Answer = 'We cant tell you how good your estimate for the 20 second interval was. \n\nHowever, we can tell you how many correct and incorrect task answers you had. \n\nYou had <';
Answer = strcat(Answer,correctas);
Answer = strcat(Answer,'> correct answers and <');
Answer = strcat(Answer,incorrectas);
Answer = strcat(Answer,'> incorrect answers.');
Answer = strcat(Answer,' The proportion of correct anwers is ');
Answer = strcat(Answer,proportion);
Answer = strcat(Answer,'\n\n\n\n\nPlease click the button labeled "Next" to continue.');

fprintf(myfile,'%s \n', Answer);
fprintf(myfile,'The length of the 2nd practice interval is %.5f \n\n', lengthPracticeInterval);
        fprintf(myfileData, '%.2f \n', proportionCorrectas)
        fprintf(myfileData, '%.5f \n', lengthPracticeInterval)
                 
                
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mouseX=0; mouseY=0;

while mouseX<x7 | mouseY>y1
DrawFormattedText(wPtr, Answer, [positionX], [positionY], [0 0 0]);
Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
Screen('Flip',wPtr);

% Wait for mouse click in next button
[clicks,mouseX,mouseY,whichButton] = GetClicks();
end

%%% Wait secs after mouse %%%
WaitSecs(afterMouseInstructions); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%SCREEN INSTRUCTIONS 22 - (Instructions for third interval of 20 secs with tasks)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Screen('TextFont',wPtr,'Helvetica');
Screen('TextSize',wPtr,18);

mouseX=0; mouseY=0;

        % Wait for key press
        while mouseX<x7 | mouseY>y1
        DrawFormattedText(wPtr, instructionsInt20Secs3, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        Screen('DrawText',wPtr,StartInterval,x7+(x1/8),y0+(y1/2),[0 0 0]);
        Screen('Flip',wPtr);

        % Wait for mouse click in next button
        [clicks,mouseX,mouseY,whichButton] = GetClicks();
        end
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%SCREEN INSTRUCTIONS 23 - (Third Interval of 20 seconds with tasks) task 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf(myfile,'Beginning of third test interval (of 20 seconds) \n');
EndInterval2 = strcat(EndInterval, '\nof 20 seconds');

clickBegins=GetSecs();
startPracticeInterval3=clickBegins;
now = clickBegins;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;
counterCorrectas=0;
counterIncorrectas=0;
buttonEnd=0;

fprintf(myfile,'Beginning of task \n');


% If hasnt clicked on "end int" button
% 1
if buttonEnd == 0
    
    % Until he presses the end button or time for task runs out
    % 2
while (mouseY < R4(2) | mouseY > R4(4) | mouseX < C2(1) | mouseX > C2(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int2test1        
        % 3
        while ~max(buttons) && now < clickBegins + int2test1
        DrawFormattedText(wPtr, instructionsInt20Secs3Task1, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name10{1}; 
row2= name10{2};
row3= name10{3};
row4= name10{4};

col1= name10{5};
col2= name10{6};
col3= name10{7};
col4= name10{8};
col5= name10{9};
col6= name10{10};
col7= name10{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startPracticeInterval3;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R4(2) && mouseY <= R4(4) && mouseX >= C2(1) && mouseX <= C2(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
               fprintf(myfileData, '%i \n', d)

                
            end
        
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int2test1   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
    
    
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions); % Since there is a click
    % 2    
    end
    
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int3test1
            % 2.3
            while ~max(buttons) && now < clickBegins + int3test1
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;

% If hasnt clicked on "end int" button
% 3.1
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2
    while (mouseY < R4(2) | mouseY > R4(4) | mouseX < C6(1) | mouseX > C6(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int4test1        
        % 3.3
        while ~max(buttons) && now < clickBegins + int4test1
        DrawFormattedText(wPtr, instructionsInt20Secs3Task2, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name11{1}; 
row2= name11{2};
row3= name11{3};
row4= name11{4};

col1= name11{5};
col2= name11{6};
col3= name11{7};
col4= name11{8};
col5= name11{9};
col6= name11{10};
col7= name11{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R1(2) && mouseY <= R1(4) && mouseX >= C6(1) && mouseX <= C6(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
               fprintf(myfileData, '%i \n', d)
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int4test1   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2    
    end
    


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % If hasnt clicked on "end int" button
    % 4.1
        if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 4.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int5test1
            % 4.3
            while ~max(buttons) && now < clickBegins + int5test1
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 4.3
            end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 4.2
        end 
        
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

            % 4.1
            end
        % 3.1      
        end
    % 2.1    
    end
% 1        
end
lengthPracticeInterval = now - startPracticeInterval3;
correctas = num2str(counterCorrectas);
incorrectas = num2str(counterIncorrectas);
proportionCorrectas = counterCorrectas/(counterCorrectas+counterIncorrectas);

if (counterCorrectas/(counterCorrectas+counterIncorrectas))>.79
    proportion=' over or equal to 80 per cent.\n\nSo you would have earned money for this time interval if your estimation was good.\n\nRemember: if less than 80 per cent of the task answers during an interval are correct you earn $0 no matter how good your estimation for the interval.';
else
    proportion=' under 80 per cent.\n\nSo you would have earned zero for this time interval regardless of your estimation.\n\nRemember: if less than 80 per cent of the task answers during an interval are correct you earn $0 no matter how good your estimation for the interval.';

end
Answer = 'We cant tell you how good your estimate for the 20 second interval was. \n\nHowever, we can tell you how many correct and incorrect task answers you had. \n\nYou had <';
Answer = strcat(Answer,correctas);
Answer = strcat(Answer,'> correct answers and <');
Answer = strcat(Answer,incorrectas);
Answer = strcat(Answer,'> incorrect answers.');
Answer = strcat(Answer,' The proportion of correct anwers is ');
Answer = strcat(Answer,proportion);
Answer = strcat(Answer,'\n\n\n\n\nPlease click the button labeled "Next" to continue.');

fprintf(myfile,'%s \n', Answer);
fprintf(myfile,'The length of the 3rd practice interval is %.5f \n\n', lengthPracticeInterval);
        fprintf(myfileData, '%.2f \n', proportionCorrectas)
        fprintf(myfileData, '%.5f \n', lengthPracticeInterval)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mouseX=0; mouseY=0;

while mouseX<x7 | mouseY>y1
DrawFormattedText(wPtr, Answer, [positionX], [positionY], [0 0 0]);
Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
Screen('Flip',wPtr);

% Wait for mouse click in next button
[clicks,mouseX,mouseY,whichButton] = GetClicks();
end

%%% Wait secs after mouse %%%
WaitSecs(afterMouseInstructions); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%SCREEN INSTRUCTIONS 24 - (Beginning of experiment)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mouseX=0; mouseY=0;

        % Wait for key press
        while mouseX<x7 | mouseY>y1
        DrawFormattedText(wPtr, InstructionsBeforeReal, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
        Screen('Flip',wPtr);

        % Wait for mouse click in next button
        [clicks,mouseX,mouseY,whichButton] = GetClicks();
        end
        
  
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);

        
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%SCREEN INSTRUCTIONS 22 - (Instructions for 2m31s int)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Screen('TextFont',wPtr,'Helvetica');
Screen('TextSize',wPtr,18);

mouseX=0; mouseY=0;

        DrawFormattedText(wPtr, 'Please produce an interval of 2 minutes and 31 seconds.\n\n\n\n\nClick "Start Interval" to start the interval.', [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        Screen('DrawText',wPtr,StartInterval,x7+(x1/8),y0+(y1/2),[0 0 0]);
        Screen('Flip',wPtr);
        
        WaitSecs(startIntervalInstructions);
        
        % Wait for key press
        while mouseX<x7 | mouseY>y1
        DrawFormattedText(wPtr, 'Please produce an interval of 2 minutes and 31 seconds.\n\n\n\n\nClick "Start Interval" to start the interval.', [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        Screen('DrawText',wPtr,StartInterval,x7+(x1/8),y0+(y1/2),[0 0 0]);
        Screen('Flip',wPtr);

        % Wait for mouse click in next button
        [clicks,mouseX,mouseY,whichButton] = GetClicks();
        end
        
 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%SCREEN INSTRUCTIONS 23 - (2m31s int)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
instructionsInt8task1 = 'Please click the cell where the column to the right of the column labeled athena intersects the row above the biology row.';
% 1/5 name48={'physics' 'biology' 'chemistry' 'geology'    'hades' 'zeus' 'poseidon' 'athena' 'apollo' 'atlas' 'perses'};
instructionsInt8task2 = 'Please click the cell where the drums row intersects the column to the right of the column labeled fox.';
% 4/4 name49={'guitar' 'trumpet' 'piano' 'drums'       'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};
instructionsInt8task3 = 'Please click the cell where the row below the pen row intersects the column to the left of the earth column.';
% 2/1 name50={'pen' 'pencil' 'eraser' 'ruler'         'saturn' 'earth' 'neptune' 'mercury' 'jupiter' 'uranus' 'venus'};
instructionsInt8task4 = 'Please click the cell where the column to the right of the Romania column intersects the trunk row.';
% 3/6 name51={'buds' 'leaves' 'trunk' 'roots'          'Cuba' 'Ghana' 'Iraq' 'Nigeria' 'Romania' 'Italy' 'Japan'};
instructionsInt8task5 = 'Please click the cell where the column to the left of the column labeled goat intersects the row below the woman row.';
% 4/1 name52={'girl' 'man' 'woman' 'boy'              'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};
instructionsInt8task6 = 'Please click the cell where the column labeled peach intersects the row below the green row.';
% 3/2 name53={'red' 'green' 'blue' 'yellow'            'banana' 'peach' 'apple' 'grape' 'orange' 'pear' 'lemon'};
instructionsInt8task7 = 'Please click the cell where the row above the row labeled Texas intersects the column labeled fox.';
% 2/3 name54={'California' 'Iowa' 'Texas' 'Alaska'     'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};
instructionsInt8task8 = 'Please click the cell where the row above the roots row intersects the column to the left of the Nigeria column.';
% 3/3 name55={'buds' 'leaves' 'trunk' 'roots'          'Cuba' 'Ghana' 'Iraq' 'Nigeria' 'Romania' 'Italy' 'Japan'};
instructionsInt8task9 = 'Please click the cell where the capellini column intersects the row below the row labeled earth.';
% 4/2 name56={'sea' 'sky' 'earth' 'space'             'spaghetti' 'capellini' 'fusilli' 'lasagne' 'linguine' 'fettuccine' 'cannelloni'};
instructionsInt8task10 = 'Please click the cell where the column to the right of the rex column intersects the row above the nimbus row.';
% 1/4 name57={'cumulus' 'nimbus' 'cirrus' 'stratus'    'velociraptor' 'brachiosaurus' 'rex' 'triceratops' 'allosaurus' 'brachiosaurus' 'diplodocus'};
instructionsInt8task11 = 'Please click the cell where the row above the row labeled pencil intersects the column labeled jupiter.';
% 1/5 name58={'pen' 'pencil' 'eraser' 'ruler'         'saturn' 'earth' 'neptune' 'mercury' 'jupiter' 'uranus' 'venus'};
instructionsInt8task12 = 'Please click the cell where the row labeled circle intersects the column to the left of the iron column.';
% 1/2 name59={'circle' 'square' 'triangle' 'rectangle' 'oxygen' 'lead' 'iron' 'arsenic' 'silicon' 'lithium' 'carbon'};
instructionsInt8task13 = 'Please click the cell where the column labeled dog intersects the row above the drums row.';
% 3/5 name60={'guitar' 'trumpet' 'piano' 'drums'       'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};
instructionsInt8task14 = 'Please click the cell where the column to the left of the column labeled fox intersects the row labeled man.';
% 2/2 name61={'girl' 'man' 'woman' 'boy'              'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};
instructionsInt8task15 = 'Please click the cell where the row below the row labeled chemistry intersects the column labeled poseidon.';
% 4/3 name62={'physics' 'biology' 'chemistry' 'geology' 'hades' 'zeus' 'poseidon' 'athena' 'apollo' 'atlas' 'perses'};
instructionsInt8task16 = 'Please click the cell where the column labeled kinetic intersects the row below the chopper row.';
% 3/1 name63={'touring' 'chopper' 'scooter' 'offroad'  'kinetic' 'potential' 'thermal' 'chemical' 'electrical' 'nuclear' 'magnetic'};
instructionsInt8task17 = 'Please click the cell where the row above the water row intersects the column to the right of the cashew column.';
% 1/6 name64={'fire' 'water' 'air' 'earth'            'walnut' 'peanut' 'almond' 'macadamia' 'cashew' 'pecan' 'pistachio'};
instructionsInt8task18 = 'Please click the cell where the space row intersects the column to the right of the column labeled linguine.';
% 4/6 name65={'sea' 'sky' 'earth' 'space'             'spaghetti' 'capellini' 'fusilli' 'lasagne' 'linguine' 'fettuccine' 'cannelloni'};


fprintf(myfile,'Beginning of int of 2 minutes and 31 seconds \n');
EndInterval2 = strcat(EndInterval, ' of\n2 minutes\n31 seconds');

clickBegins=GetSecs();
startPracticeInterval3=clickBegins;
now = clickBegins;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;
counterCorrectas=0;
counterIncorrectas=0;
buttonEnd=0;

fprintf(myfile,'Beginning of task \n');

DrawFormattedText(wPtr, instructionsInt8task1, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name48{1}; 
row2= name48{2};
row3= name48{3};
row4= name48{4};

col1= name48{5};
col2= name48{6};
col3= name48{7};
col4= name48{8};
col5= name48{9};
col6= name48{10};
col7= name48{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);

WaitSecs(afterStartInterval);


% If hasnt clicked on "end int" button
% 1
if buttonEnd == 0
    
    % Until he presses the end button or time for task runs out
    % 2
while (mouseY < R1(2) | mouseY > R1(4) | mouseX < C5(1) | mouseX > C5(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int2m31sTask1Lasts        
        % 3
        while ~max(buttons) && now < clickBegins + int2m31sTask1Lasts
        DrawFormattedText(wPtr, instructionsInt8task1, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name48{1}; 
row2= name48{2};
row3= name48{3};
row4= name48{4};

col1= name48{5};
col2= name48{6};
col3= name48{7};
col4= name48{8};
col5= name48{9};
col6= name48{10};
col7= name48{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startPracticeInterval3;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R1(2) && mouseY <= R1(4) && mouseX >= C5(1) && mouseX <= C5(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
        
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int2m31sTask1Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
    
    
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions); % Since there is a click
    % 2    
    end
    
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int2m31sTask1Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int2m31sTask1Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2
    while (mouseY < R4(2) | mouseY > R4(4) | mouseX < C4(1) | mouseX > C4(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int2m31sTask2Lasts        
        % 3.3
        while ~max(buttons) && now < clickBegins + int2m31sTask2Lasts
        DrawFormattedText(wPtr, instructionsInt8task2, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name49{1}; 
row2= name49{2};
row3= name49{3};
row4= name49{4};

col1= name49{5};
col2= name49{6};
col3= name49{7};
col4= name49{8};
col5= name49{9};
col6= name49{10};
col7= name49{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R4(2) && mouseY <= R4(4) && mouseX >= C4(1) && mouseX <= C4(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int2m31sTask2Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2    
    end
    

        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int2m31sTask2Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int2m31sTask2Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.2
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.2
    while (mouseY < R2(2) | mouseY > R2(4) | mouseX < C1(1) | mouseX > C1(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int2m31sTask3Lasts        
        % 3.3.2
        while ~max(buttons) && now < clickBegins + int2m31sTask3Lasts
        DrawFormattedText(wPtr, instructionsInt8task3, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name50{1}; 
row2= name50{2};
row3= name50{3};
row4= name50{4};

col1= name50{5};
col2= name50{6};
col3= name50{7};
col4= name50{8};
col5= name50{9};
col6= name50{10};
col7= name50{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.2
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R2(2) && mouseY <= R2(4) && mouseX >= C1(1) && mouseX <= C1(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int2m31sTask3Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.2    
    end
    

        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int2m31sTask3Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int2m31sTask3Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.3
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.3
    while (mouseY < R3(2) | mouseY > R3(4) | mouseX < C6(1) | mouseX > C6(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int2m31sTask4Lasts        
        % 3.3.3
        while ~max(buttons) && now < clickBegins + int2m31sTask4Lasts
        DrawFormattedText(wPtr, instructionsInt8task4, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name51{1};
row2= name51{2};
row3= name51{3};
row4= name51{4};

col1= name51{5};
col2= name51{6};
col3= name51{7};
col4= name51{8};
col5= name51{9};
col6= name51{10};
col7= name51{11};
% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.3
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R3(2) && mouseY <= R3(4) && mouseX >= C6(1) && mouseX <= C6(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int2m31sTask4Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.3    
    end
    

        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int2m31sTask4Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int2m31sTask4Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.4
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.4
    while (mouseY < R4(2) | mouseY > R4(4) | mouseX < C1(1) | mouseX > C1(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int2m31sTask5Lasts        
        % 3.3.4
        while ~max(buttons) && now < clickBegins + int2m31sTask5Lasts
        DrawFormattedText(wPtr, instructionsInt8task5, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name52{1};
row2= name52{2};
row3= name52{3};
row4= name52{4};

col1= name52{5};
col2= name52{6};
col3= name52{7};
col4= name52{8};
col5= name52{9};
col6= name52{10};
col7= name52{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.4
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R4(2) && mouseY <= R4(4) && mouseX >= C1(1) && mouseX <= C1(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int2m31sTask5Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.4    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int2m31sTask5Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int2m31sTask5Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.5
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.5
    while (mouseY < R3(2) | mouseY > R3(4) | mouseX < C2(1) | mouseX > C2(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int2m31sTask6Lasts        
        % 3.3.5
        while ~max(buttons) && now < clickBegins + int2m31sTask6Lasts
        DrawFormattedText(wPtr, instructionsInt8task6, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name53{1};
row2= name53{2};
row3= name53{3};
row4= name53{4};

col1= name53{5};
col2= name53{6};
col3= name53{7};
col4= name53{8};
col5= name53{9};
col6= name53{10};
col7= name53{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.5
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R3(2) && mouseY <= R3(4) && mouseX >= C2(1) && mouseX <= C2(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int2m31sTask6Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.5    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int2m31sTask6Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int2m31sTask6Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.6
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.6
    while (mouseY < R2(2) | mouseY > R2(4) | mouseX < C3(1) | mouseX > C3(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int2m31sTask7Lasts        
        % 3.3.6
        while ~max(buttons) && now < clickBegins + int2m31sTask7Lasts
        DrawFormattedText(wPtr, instructionsInt8task7, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name54{1};
row2= name54{2};
row3= name54{3};
row4= name54{4};

col1= name54{5};
col2= name54{6};
col3= name54{7};
col4= name54{8};
col5= name54{9};
col6= name54{10};
col7= name54{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.6
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R2(2) && mouseY <= R2(4) && mouseX >= C3(1) && mouseX <= C3(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int2m31sTask7Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.6    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int2m31sTask7Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int2m31sTask7Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.7
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.7
    while (mouseY < R3(2) | mouseY > R3(4) | mouseX < C3(1) | mouseX > C3(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int2m31sTask8Lasts       
        % 3.3.7
        while ~max(buttons) && now < clickBegins + int2m31sTask8Lasts
        DrawFormattedText(wPtr, instructionsInt8task8, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name55{1};
row2= name55{2};
row3= name55{3};
row4= name55{4};

col1= name55{5};
col2= name55{6};
col3= name55{7};
col4= name55{8};
col5= name55{9};
col6= name55{10};
col7= name55{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.7
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R3(2) && mouseY <= R3(4) && mouseX >= C3(1) && mouseX <= C3(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int2m31sTask8Lasts
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.7    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int2m31sTask8Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int2m31sTask8Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.8
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.8
    while (mouseY < R4(2) | mouseY > R4(4) | mouseX < C2(1) | mouseX > C2(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int2m31sTask9Lasts       
        % 3.3.8
        while ~max(buttons) && now < clickBegins + int2m31sTask9Lasts
        DrawFormattedText(wPtr, instructionsInt8task9, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name56{1};
row2= name56{2};
row3= name56{3};
row4= name56{4};

col1= name56{5};
col2= name56{6};
col3= name56{7};
col4= name56{8};
col5= name56{9};
col6= name56{10};
col7= name56{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.8
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R4(2) && mouseY <= R4(4) && mouseX >= C2(1) && mouseX <= C2(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int2m31sTask9Lasts
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.8    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int2m31sTask9Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int2m31sTask9Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.9
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.9
    while (mouseY < R1(2) | mouseY > R1(4) | mouseX < C4(1) | mouseX > C4(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int2m31sTask10Lasts      
        % 3.3.10
        while ~max(buttons) && now < clickBegins + int2m31sTask10Lasts
        DrawFormattedText(wPtr, instructionsInt8task10, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name57{1};
row2= name57{2};
row3= name57{3};
row4= name57{4};

col1= name57{5};
col2= name57{6};
col3= name57{7};
col4= name57{8};
col5= name57{9};
col6= name57{10};
col7= name57{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.9
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R1(2) && mouseY <= R1(4) && mouseX >= C4(1) && mouseX <= C4(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int2m31sTask10Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.9    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int2m31sTask10Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int2m31sTask10Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.10
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.10
    while (mouseY < R1(2) | mouseY > R1(4) | mouseX < C2(1) | mouseX > C2(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int2m31sTask11Lasts        
        % 3.3.10
        while ~max(buttons) && now < clickBegins + int2m31sTask11Lasts
        DrawFormattedText(wPtr, instructionsInt8task12, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name59{1};
row2= name59{2};
row3= name59{3};
row4= name59{4};

col1= name59{5};
col2= name59{6};
col3= name59{7};
col4= name59{8};
col5= name59{9};
col6= name59{10};
col7= name59{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.10
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R1(2) && mouseY <= R1(4) && mouseX >= C2(1) && mouseX <= C2(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int2m31sTask11Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.10    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int2m31sTask11Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int2m31sTask11Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.11
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.11
    while (mouseY < R3(2) | mouseY > R3(4) | mouseX < C5(1) | mouseX > C5(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int2m31sTask12Lasts        
        % 3.3.11
        while ~max(buttons) && now < clickBegins + int2m31sTask12Lasts
        DrawFormattedText(wPtr, instructionsInt8task13, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name60{1}; 
row2= name60{2};
row3= name60{3};
row4= name60{4};

col1= name60{5};
col2= name60{6};
col3= name60{7};
col4= name60{8};
col5= name60{9};
col6= name60{10};
col7= name60{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.11
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R3(2) && mouseY <= R3(4) && mouseX >= C5(1) && mouseX <= C5(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int2m31sTask12Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.11    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int2m31sTask12Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int2m31sTask12Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.12
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.12
    while (mouseY < R2(2) | mouseY > R2(4) | mouseX < C2(1) | mouseX > C2(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int2m31sTask13Lasts        
        % 3.3.12
        while ~max(buttons) && now < clickBegins + int2m31sTask13Lasts
        DrawFormattedText(wPtr, instructionsInt8task14, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
   

row1= name61{1}; 
row2= name61{2};
row3= name61{3};
row4= name61{4};

col1= name61{5};
col2= name61{6};
col3= name61{7};
col4= name61{8};
col5= name61{9};
col6= name61{10};
col7= name61{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.12
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R2(2) && mouseY <= R2(4) && mouseX >= C2(1) && mouseX <= C2(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int2m31sTask13Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.12    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int2m31sTask13Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int2m31sTask13Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.13
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.13
    while (mouseY < R4(2) | mouseY > R4(4) | mouseX < C3(1) | mouseX > C3(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int2m31sTask14Lasts        
        % 3.3.13
        while ~max(buttons) && now < clickBegins + int2m31sTask14Lasts
        DrawFormattedText(wPtr, instructionsInt8task15, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
   
row1= name62{1}; 
row2= name62{2};
row3= name62{3};
row4= name62{4};

col1= name62{5};
col2= name62{6};
col3= name62{7};
col4= name62{8};
col5= name62{9};
col6= name62{10};
col7= name62{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.13
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R4(2) && mouseY <= R4(4) && mouseX >= C3(1) && mouseX <= C3(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int2m31sTask14Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.13    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int2m31sTask14Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int2m31sTask14Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.14
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.14
    while (mouseY < R3(2) | mouseY > R3(4) | mouseX < C1(1) | mouseX > C1(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int2m31sTask15Lasts        
        % 3.3.14
        while ~max(buttons) && now < clickBegins + int2m31sTask15Lasts
        DrawFormattedText(wPtr, instructionsInt8task16, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
   

row1= name63{1}; 
row2= name63{2};
row3= name63{3};
row4= name63{4};

col1= name63{5};
col2= name63{6};
col3= name63{7};
col4= name63{8};
col5= name63{9};
col6= name63{10};
col7= name63{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.14
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R3(2) && mouseY <= R3(4) && mouseX >= C1(1) && mouseX <= C1(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int2m31sTask15Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.14    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int2m31sTask15Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int2m31sTask15Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.15
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.15
    while (mouseY < R1(2) | mouseY > R1(4) | mouseX < C5(1) | mouseX > C5(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int2m31sTask16Lasts        
        % 3.3.15
        while ~max(buttons) && now < clickBegins + int2m31sTask16Lasts
        DrawFormattedText(wPtr, instructionsInt8task11, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
   
row1= name58{1}; 
row2= name58{2};
row3= name58{3};
row4= name58{4};

col1= name58{5};
col2= name58{6};
col3= name58{7};
col4= name58{8};
col5= name58{9};
col6= name58{10};
col7= name58{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.15
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R1(2) && mouseY <= R1(4) && mouseX >= C5(1) && mouseX <= C5(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int2m31sTask16Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.15    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int2m31sTask16Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int2m31sTask16Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.16
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.16
    while (mouseY < R1(2) | mouseY > R1(4) | mouseX < C6(1) | mouseX > C6(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int2m31sTask17Lasts        
        % 3.3.16
        while ~max(buttons) && now < clickBegins + int2m31sTask17Lasts
        DrawFormattedText(wPtr, instructionsInt8task17, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);

row1= name64{1}; 
row2= name64{2};
row3= name64{3};
row4= name64{4};

col1= name64{5};
col2= name64{6};
col3= name64{7};
col4= name64{8};
col5= name64{9};
col6= name64{10};
col7= name64{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.16
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R1(2) && mouseY <= R1(4) && mouseX >= C6(1) && mouseX <= C6(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int2m31sTask17Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.16    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int2m31sTask17Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int2m31sTask17Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.17
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.17
    while (mouseY < R4(2) | mouseY > R4(4) | mouseX < C6(1) | mouseX > C6(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int2m31sTask18Lasts        
        % 3.3.17
        while ~max(buttons) && now < clickBegins + int2m31sTask18Lasts
        DrawFormattedText(wPtr, instructionsInt8task18, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);


row1= name65{1}; 
row2= name65{2};
row3= name65{3};
row4= name65{4};

col1= name65{5};
col2= name65{6};
col3= name65{7};
col4= name65{8};
col5= name65{9};
col6= name65{10};
col7= name65{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.17
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R4(2) && mouseY <= R4(4) && mouseX >= C6(1) && mouseX <= C6(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int2m31sTask18Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.17    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int2m31sTask18Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int2m31sTask18Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 

        
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                                                            % 4.1
        end
              %3.1.17   
end
         %3.1.16
end
                                                            %3.1.15       
                                                             end
                                                        % 3.1.14
                                                        end
                                                    % 3.1.13
                                                    end
                                                % 3.1.12
                                                end
                                            %3.1.11
                                            end
                                        %3.1.10
                                        end
                                    %3.1.9
                                    end
                                %3.1.8
                                end
                        %3.1.7
                        end
                        %3.1.6
                    end
                    %3.1.5
                    end
                %3.1.4
                end
            %3.1.3
            end
          %3.1.2
          end
        % 3.1      
        end
    % 2.1    
    end
% 1        
    end

    end 
end
    end
end
    end
end
    end
end
    end
end
    end
end
    end
end
    end
end


lengthPracticeInterval = now - startPracticeInterval3;
correctas = num2str(counterCorrectas);
incorrectas = num2str(counterIncorrectas);


if (counterCorrectas+counterIncorrectas)>0
    if (counterCorrectas/(counterCorrectas+counterIncorrectas))>.79
    proportion=' over or equal to 80 per cent.';
    getPayed=1;
else
    proportion=' under 80 per cent.';
    getPayed=0;
    end
else
    proportion=' over or equal to 80 per cent.';
    getPayed=1;
end


fprintf(myfile,'The length of the 2m31s interval is %.5f \n\n', lengthPracticeInterval);

Answer = 'Interval Ended. Please click the button labeled "Next" to continue.';

realInt = 151;
percentualDifference = (abs(lengthPracticeInterval-realInt))/realInt;

if percentualDifference >0.2
    getPayedYes='$0';
end
if getPayed==1
if percentualDifference <= 0.2 && percentualDifference > 0.10 && getPayed==1
    getPayedYes=lowPayment;

end
    if percentualDifference <= 0.10 && percentualDifference > 0.05 && getPayed==1
        getPayedYes=midPayment;
    end
        if percentualDifference <= 0.05 && getPayed==1
                getPayedYes=highPayment;
        end
else
    getPayedYes='$0';
end
        
% PAYMENTS  
text='2m31s';
deviationInt = abs(lengthPracticeInterval-realInt);
proportionCorrectas = counterCorrectas/(counterCorrectas+counterIncorrectas);

         fprintf(myfileData, '%.2f \n', proportionCorrectas);
         fprintf(myfileData, '%.5f \n', lengthPracticeInterval);
fprintf(payoffs, '%s \t\t %.5f \t\t %.5f \t\t %.5f \t\t %.2f \t\t\t\t %i \t\t\t\t\t %i \t\t\t\t\t %.2f \t\t\t %s \t\t %s \n\n', text, realInt, lengthPracticeInterval, deviationInt, percentualDifference, counterCorrectas, counterIncorrectas, proportionCorrectas, getPayedYes, intNumber2m31s);
fprintf(shortPayoffs, '%s \t\t %s \t\t\t %s\n\n',intNumber2m31s, text, getPayedYes);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mouseX=0; mouseY=0;

DrawFormattedText(wPtr, Answer, [positionX], [positionY], [0 0 0]);
Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
Screen('Flip',wPtr);

WaitSecs(afterStopInterval); 

while mouseX<x7 | mouseY>y1
DrawFormattedText(wPtr, Answer, [positionX], [positionY], [0 0 0]);
Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
Screen('Flip',wPtr);

% Wait for mouse click in next button
[clicks,mouseX,mouseY,whichButton] = GetClicks();
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%SCREEN INSTRUCTIONS 32 - (Instructions for 1m 56s int)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Screen('TextFont',wPtr,'Helvetica');
Screen('TextSize',wPtr,18);

mouseX=0; mouseY=0;

        DrawFormattedText(wPtr, 'Please produce an interval of 1 minute 56 seconds.\n\n\n\n\nClick "Start Interval" to start the interval.', [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        Screen('DrawText',wPtr,StartInterval,x7+(x1/8),y0+(y1/2),[0 0 0]);
        Screen('Flip',wPtr);

        WaitSecs(startIntervalInstructions);

        % Wait for key press
        while mouseX<x7 | mouseY>y1
        DrawFormattedText(wPtr, 'Please produce an interval of 1 minute 56 seconds.\n\n\n\n\nClick "Start Interval" to start the interval.', [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        Screen('DrawText',wPtr,StartInterval,x7+(x1/8),y0+(y1/2),[0 0 0]);
        Screen('Flip',wPtr);

        % Wait for mouse click in next button
        [clicks,mouseX,mouseY,whichButton] = GetClicks();
        end
        
 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%SCREEN INSTRUCTIONS 33 - (1m56s int)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
instructionsInt7task1 = 'Please click the cell where the column to the left of the column labeled lead intersects the row above the triangle row.';
% 2/1 name33={'circle' 'square' 'triangle' 'rectangle'  'oxygen' 'lead' 'iron' 'arsenic' 'silicon' 'lithium' 'carbon'};
instructionsInt7task2 = 'Please click the cell where the row labeled chemistry intersects the column to the left of the apollo column.';
% 3/4 name34={'physics' 'biology' 'chemistry' 'geology' 'hades' 'zeus' 'poseidon' 'athena' 'apollo' 'atlas' 'perses'};
instructionsInt7task3 = 'Please click the cell where the column to the left of the uranus column intersects the ruler row.';
% 4/5 name35={'pen' 'pencil' 'eraser' 'ruler'         'saturn' 'earth' 'neptune' 'mercury' 'jupiter' 'uranus' 'venus'};
instructionsInt7task4 = 'Please click the cell where the row above the row labeled play intersects the column labeled horse.';
% 3/6 name36={'run' 'sleep' 'eat' 'play'              'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};
instructionsInt7task5 = 'Please click the cell where the column to the right of the music column intersects the row above the broccoli row.';
% 1/5 name37={'tomato' 'broccoli' 'squash' 'carrot  ' 'painting' 'sculpture' 'dance' 'music' 'film' 'architecture' 'theatre'};
instructionsInt7task6 = 'Please click the cell where the row below the Texas row intersects the column to the right of the fox column.';
% 4/4 name38={'California' 'Iowa' 'Texas' 'Alaska'     'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};
instructionsInt7task7 = 'Please click the cell where the column to the left of the column labeled horse intersects the row labeled trumpet.';
% 2/5 name39={'guitar' 'trumpet' 'piano' 'drums'       'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};
instructionsInt7task8 = 'Please click the cell where the row above the water row intersects the column to the left of the macadamia column.';
% 1/3 name40={'fire' 'water' 'air' 'earth'            'walnut' 'peanut' 'almond' 'macadamia' 'cashew' 'pecan' 'pistachio'};
instructionsInt7task9 = 'Please click the cell where the column to the right of the column labeled Cuba intersects the row below the leaves row.';
% 3/2 name41={'buds' 'leaves' 'trunk' 'roots'          'Cuba' 'Ghana' 'Iraq' 'Nigeria' 'Romania' 'Italy' 'Japan'};
instructionsInt7task10 = 'Please click the cell where the uranus column intersects the row above the row labeled ruler.';
% 3/6 name42={'pen' 'pencil' 'eraser' 'ruler'         'saturn' 'earth' 'neptune' 'mercury' 'jupiter' 'uranus' 'venus'};
instructionsInt7task11 = 'Please click the cell where the row above the row labeled trunk intersects the column labeled Romania.';
% 2/5 name43={'buds' 'leaves' 'trunk' 'roots'          'Cuba' 'Ghana' 'Iraq' 'Nigeria' 'Romania' 'Italy' 'Japan'};
instructionsInt7task12 = 'Please click the cell where the column labeled kinetic intersects the row above the scooter row.';
% 2/1 name44={'touring' 'chopper' 'scooter' 'offroad'  'kinetic' 'potential' 'thermal' 'chemical' 'electrical' 'nuclear' 'magnetic'};
instructionsInt7task13 = 'Please click the cell where the drums row intersects the column to the right of the column labeled cat.';
% 4/5 name45={'guitar' 'trumpet' 'piano' 'drums'       'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'}; 
instructionsInt7task14 = 'Please click the cell where the column labeled orchid intersects the row below the hearts row.';
% 2/3 name46={'hearts' 'spades' 'diamonds' 'clubs'          'rose' 'daisie' 'orchid' 'daffodil' 'iris' 'sunflower' 'sweetpea'};
instructionsInt7task15 = 'Please click the cell where the row below the row labeled run intersects the column labeled goat.';
% 2/2 name47={'run' 'sleep' 'eat' 'play'              'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};


fprintf(myfile,'Beginning of int of 1 minute 56 seconds \n');
EndInterval2 = strcat(EndInterval, ' of\n1 minute\n56 seconds');

clickBegins=GetSecs();
startPracticeInterval3=clickBegins;
now = clickBegins;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;
counterCorrectas=0;
counterIncorrectas=0;
buttonEnd=0;

fprintf(myfile,'Beginning of task \n');

DrawFormattedText(wPtr, instructionsInt7task1, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name33{1}; 
row2= name33{2};
row3= name33{3};
row4= name33{4};

col1= name33{5};
col2= name33{6};
col3= name33{7};
col4= name33{8};
col5= name33{9};
col6= name33{10};
col7= name33{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);

WaitSecs(afterStartInterval);


% If hasnt clicked on "end int" button
% 1
if buttonEnd == 0
    
    % Until he presses the end button or time for task runs out
    % 2
while (mouseY < R2(2) | mouseY > R2(4) | mouseX < C1(1) | mouseX > C1(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m56sTask1Lasts        
        % 3
        while ~max(buttons) && now < clickBegins + int1m56sTask1Lasts
        DrawFormattedText(wPtr, instructionsInt7task1, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name33{1}; 
row2= name33{2};
row3= name33{3};
row4= name33{4};

col1= name33{5};
col2= name33{6};
col3= name33{7};
col4= name33{8};
col5= name33{9};
col6= name33{10};
col7= name33{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startPracticeInterval3;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R2(2) && mouseY <= R2(4) && mouseX >= C1(1) && mouseX <= C1(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
        
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int1m56sTask1Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
    
    
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions); % Since there is a click
    % 2    
    end
    
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m56sTask1Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int1m56sTask1Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2
    while (mouseY < R3(2) | mouseY > R3(4) | mouseX < C4(1) | mouseX > C4(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m56sTask2Lasts        
        % 3.3
        while ~max(buttons) && now < clickBegins + int1m56sTask2Lasts
        DrawFormattedText(wPtr, instructionsInt7task2, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name34{1}; 
row2= name34{2};
row3= name34{3};
row4= name34{4};

col1= name34{5};
col2= name34{6};
col3= name34{7};
col4= name34{8};
col5= name34{9};
col6= name34{10};
col7= name34{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R3(2) && mouseY <= R3(4) && mouseX >= C4(1) && mouseX <= C4(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int1m56sTask2Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2    
    end
    

        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m56sTask2Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int1m56sTask2Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.2
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.2
    while (mouseY < R4(2) | mouseY > R4(4) | mouseX < C5(1) | mouseX > C5(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m56sTask3Lasts        
        % 3.3.2
        while ~max(buttons) && now < clickBegins + int1m56sTask3Lasts
        DrawFormattedText(wPtr, instructionsInt7task3, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name35{1}; 
row2= name35{2};
row3= name35{3};
row4= name35{4};

col1= name35{5};
col2= name35{6};
col3= name35{7};
col4= name35{8};
col5= name35{9};
col6= name35{10};
col7= name35{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.2
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R4(2) && mouseY <= R4(4) && mouseX >= C5(1) && mouseX <= C5(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int1m56sTask3Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.2    
    end
    

        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m56sTask3Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int1m56sTask3Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.3
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.3
    while (mouseY < R3(2) | mouseY > R3(4) | mouseX < C6(1) | mouseX > C6(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m56sTask4Lasts        
        % 3.3.3
        while ~max(buttons) && now < clickBegins + int1m56sTask4Lasts
        DrawFormattedText(wPtr, instructionsInt7task4, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name36{1};
row2= name36{2};
row3= name36{3};
row4= name36{4};

col1= name36{5};
col2= name36{6};
col3= name36{7};
col4= name36{8};
col5= name36{9};
col6= name36{10};
col7= name36{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.3
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R3(2) && mouseY <= R3(4) && mouseX >= C6(1) && mouseX <= C6(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int1m56sTask4Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.3    
    end
    

        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m56sTask4Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int1m56sTask4Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.4
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.4
    while (mouseY < R1(2) | mouseY > R1(4) | mouseX < C5(1) | mouseX > C5(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m56sTask5Lasts        
        % 3.3.4
        while ~max(buttons) && now < clickBegins + int1m56sTask5Lasts
        DrawFormattedText(wPtr, instructionsInt7task5, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name37{1};
row2= name37{2};
row3= name37{3};
row4= name37{4};

col1= name37{5};
col2= name37{6};
col3= name37{7};
col4= name37{8};
col5= name37{9};
col6= name37{10};
col7= name37{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.4
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R1(2) && mouseY <= R1(4) && mouseX >= C5(1) && mouseX <= C5(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int1m56sTask5Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.4    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m56sTask5Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int1m56sTask5Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.5
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.5
    while (mouseY < R4(2) | mouseY > R4(4) | mouseX < C4(1) | mouseX > C4(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m56sTask6Lasts        
        % 3.3.5
        while ~max(buttons) && now < clickBegins + int1m56sTask6Lasts
        DrawFormattedText(wPtr, instructionsInt7task6, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name38{1};
row2= name38{2};
row3= name38{3};
row4= name38{4};

col1= name38{5};
col2= name38{6};
col3= name38{7};
col4= name38{8};
col5= name38{9};
col6= name38{10};
col7= name38{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.5
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R4(2) && mouseY <= R4(4) && mouseX >= C4(1) && mouseX <= C4(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int1m56sTask6Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.5    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m56sTask6Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int1m56sTask6Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.6
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.6
    while (mouseY < R2(2) | mouseY > R2(4) | mouseX < C5(1) | mouseX > C5(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m56sTask7Lasts        
        % 3.3.6
        while ~max(buttons) && now < clickBegins + int1m56sTask7Lasts
        DrawFormattedText(wPtr, instructionsInt7task7, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name39{1};
row2= name39{2};
row3= name39{3};
row4= name39{4};

col1= name39{5};
col2= name39{6};
col3= name39{7};
col4= name39{8};
col5= name39{9};
col6= name39{10};
col7= name39{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.6
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R2(2) && mouseY <= R2(4) && mouseX >= C5(1) && mouseX <= C5(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int1m56sTask7Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.6    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m56sTask7Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int1m56sTask7Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.7
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.7
    while (mouseY < R1(2) | mouseY > R1(4) | mouseX < C3(1) | mouseX > C3(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m56sTask8Lasts        
        % 3.3.7
        while ~max(buttons) && now < clickBegins + int1m56sTask8Lasts
        DrawFormattedText(wPtr, instructionsInt7task8, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name40{1};
row2= name40{2};
row3= name40{3};
row4= name40{4};

col1= name40{5};
col2= name40{6};
col3= name40{7};
col4= name40{8};
col5= name40{9};
col6= name40{10};
col7= name40{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.7
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R1(2) && mouseY <= R1(4) && mouseX >= C3(1) && mouseX <= C3(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int1m56sTask8Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.7    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m56sTask8Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int1m56sTask8Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.8
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.8
    while (mouseY < R3(2) | mouseY > R3(4) | mouseX < C2(1) | mouseX > C2(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m56sTask9Lasts        
        % 3.3.8
        while ~max(buttons) && now < clickBegins + int1m56sTask9Lasts
        DrawFormattedText(wPtr, instructionsInt7task9, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    


row1= name41{1};
row2= name41{2};
row3= name41{3};
row4= name41{4};

col1= name41{5};
col2= name41{6};
col3= name41{7};
col4= name41{8};
col5= name41{9};
col6= name41{10};
col7= name41{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.8
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R3(2) && mouseY <= R3(4) && mouseX >= C2(1) && mouseX <= C2(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int1m56sTask9Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.8    
    end
    

        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m56sTask9Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int1m56sTask9Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.9
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.9
    while (mouseY < R3(2) | mouseY > R3(4) | mouseX < C6(1) | mouseX > C6(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m56sTask10Lasts        
        % 3.3.10
        while ~max(buttons) && now < clickBegins + int1m56sTask10Lasts
        DrawFormattedText(wPtr, instructionsInt7task10, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    


row1= name42{1};
row2= name42{2};
row3= name42{3};
row4= name42{4};

col1= name42{5};
col2= name42{6};
col3= name42{7};
col4= name42{8};
col5= name42{9};
col6= name42{10};
col7= name42{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.9
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R3(2) && mouseY <= R3(4) && mouseX >= C6(1) && mouseX <= C6(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int1m56sTask10Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.9    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m56sTask10Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int1m56sTask10Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.10
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.10
    while (mouseY < R2(2) | mouseY > R2(4) | mouseX < C5(1) | mouseX > C5(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m56sTask11Lasts        
        % 3.3.10
        while ~max(buttons) && now < clickBegins + int1m56sTask11Lasts
        DrawFormattedText(wPtr, instructionsInt7task11, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    


row1= name43{1};
row2= name43{2};
row3= name43{3};
row4= name43{4};

col1= name43{5};
col2= name43{6};
col3= name43{7};
col4= name43{8};
col5= name43{9};
col6= name43{10};
col7= name43{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.10
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R2(2) && mouseY <= R2(4) && mouseX >= C5(1) && mouseX <= C5(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int1m56sTask11Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.10    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m56sTask11Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int1m56sTask11Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.11
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.11
    while (mouseY < R2(2) | mouseY > R2(4) | mouseX < C1(1) | mouseX > C1(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m56sTask12Lasts        
        % 3.3.11
        while ~max(buttons) && now < clickBegins + int1m56sTask12Lasts
        DrawFormattedText(wPtr, instructionsInt7task12, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    


row1= name44{1}; 
row2= name44{2};
row3= name44{3};
row4= name44{4};

col1= name44{5};
col2= name44{6};
col3= name44{7};
col4= name44{8};
col5= name44{9};
col6= name44{10};
col7= name44{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.11
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R2(2) && mouseY <= R2(4) && mouseX >= C1(1) && mouseX <= C1(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int1m56sTask12Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.11    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m56sTask12Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int1m56sTask12Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.12
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.12
    while (mouseY < R4(2) | mouseY > R4(4) | mouseX < C5(1) | mouseX > C5(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m56sTask13Lasts        
        % 3.3.12
        while ~max(buttons) && now < clickBegins + int1m56sTask13Lasts
        DrawFormattedText(wPtr, instructionsInt7task13, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
   

row1= name45{1}; 
row2= name45{2};
row3= name45{3};
row4= name45{4};

col1= name45{5};
col2= name45{6};
col3= name45{7};
col4= name45{8};
col5= name45{9};
col6= name45{10};
col7= name45{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.12
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R4(2) && mouseY <= R4(4) && mouseX >= C5(1) && mouseX <= C5(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int1m56sTask13Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.12    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m56sTask13Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int1m56sTask13Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.13
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.13
    while (mouseY < R2(2) | mouseY > R2(4) | mouseX < C3(1) | mouseX > C3(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m56sTask14Lasts        
        % 3.3.13
        while ~max(buttons) && now < clickBegins + int1m56sTask14Lasts
        DrawFormattedText(wPtr, instructionsInt7task14, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
   

row1= name46{1}; 
row2= name46{2};
row3= name46{3};
row4= name46{4};

col1= name46{5};
col2= name46{6};
col3= name46{7};
col4= name46{8};
col5= name46{9};
col6= name46{10};
col7= name46{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.13
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R2(2) && mouseY <= R2(4) && mouseX >= C3(1) && mouseX <= C3(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int1m56sTask14Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.13    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m56sTask14Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int1m56sTask14Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.14
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.14
    while (mouseY < R2(2) | mouseY > R2(4) | mouseX < C2(1) | mouseX > C2(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m56sTask15Lasts        
        % 3.3.14
        while ~max(buttons) && now < clickBegins + int1m56sTask15Lasts
        DrawFormattedText(wPtr, instructionsInt7task15, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
   

row1= name47{1}; 
row2= name47{2};
row3= name47{3};
row4= name47{4};

col1= name47{5};
col2= name47{6};
col3= name47{7};
col4= name47{8};
col5= name47{9};
col6= name47{10};
col7= name47{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.14
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R2(2) && mouseY <= R2(4) && mouseX >= C2(1) && mouseX <= C2(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int1m56sTask15Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.14    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m56sTask15Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int1m56sTask15Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
        
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                                                            % 4.1
                                                            end
                                                        % 3.1.14
                                                        end
                                                    % 3.1.13
                                                    end
                                                % 3.1.12
                                                end
                                            %3.1.11
                                            end
                                        %3.1.10
                                        end
                                    %3.1.9
                                    end
                                %3.1.8
                                end
                        %3.1.7
                        end
                        %3.1.6
                    end
                    %3.1.5
                    end
                %3.1.4
                end
            %3.1.3
            end
          %3.1.2
          end
        % 3.1      
        end
    % 2.1    
    end
% 1        
    end
end
    end
end
    end
end
    end
end
    end
end
    end
end
    end
end

lengthPracticeInterval = now - startPracticeInterval3;
correctas = num2str(counterCorrectas);
incorrectas = num2str(counterIncorrectas);


if (counterCorrectas+counterIncorrectas)>0
    if (counterCorrectas/(counterCorrectas+counterIncorrectas))>.79
    proportion=' over or equal to 80 per cent.';
    getPayed=1;
else
    proportion=' under 80 per cent.';
    getPayed=0;
    end
else
    proportion=' over or equal to 80 per cent.';
    getPayed=1;
end


%Answer = 'We cant tell you how good your estimate for the interval was. \n\nHowever, we can tell you how many correct and incorrect task answers you had. \n\nYou had <';
% Answer = strcat(Answer,correctas);
% Answer = strcat(Answer,'> correct answers and <');
% Answer = strcat(Answer,incorrectas);
% Answer = strcat(Answer,'> incorrect answers.');
% Answer = strcat(Answer,' The proportion of correct anwers is ');
% Answer = strcat(Answer,proportion);
% Answer = strcat(Answer,'\n\n\n\n\nPlease click the button labeled "Next" to continue.');
% fprintf(myfile,'%s \n', Answer);

fprintf(myfile,'The length of the 1m56s interval is %.5f \n\n', lengthPracticeInterval);

Answer = 'Interval Ended. Please click the button labeled "Next" to continue.';

realInt = 116;
percentualDifference = (abs(lengthPracticeInterval-realInt))/realInt;

if percentualDifference >0.2
    getPayedYes='$0';
end
if getPayed==1
if percentualDifference <= 0.2 && percentualDifference > 0.10 && getPayed==1
    getPayedYes=lowPayment;

end
    if percentualDifference <= 0.10 && percentualDifference > 0.05 && getPayed==1
        getPayedYes=midPayment;
    end
        if percentualDifference <= 0.05 && getPayed==1
                getPayedYes=highPayment;
        end
else
    getPayedYes='$0';
end
        
% PAYMENTS
text='1m56s';
deviationInt = abs(lengthPracticeInterval-realInt);
proportionCorrectas = counterCorrectas/(counterCorrectas+counterIncorrectas);

         fprintf(myfileData, '%.2f \n', proportionCorrectas);
         fprintf(myfileData, '%.5f \n', lengthPracticeInterval);
fprintf(payoffs, '%s \t\t %.5f \t\t %.5f \t\t %.5f \t\t %.2f \t\t\t\t %i \t\t\t\t\t %i \t\t\t\t\t %.2f \t\t\t %s \t\t %s\n\n', text, realInt, lengthPracticeInterval, deviationInt, percentualDifference, counterCorrectas, counterIncorrectas, proportionCorrectas, getPayedYes, intNumber1m56s);
fprintf(shortPayoffs, '%s \t\t %s \t\t\t %s\n\n',intNumber1m56s, text, getPayedYes);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mouseX=0; mouseY=0;

DrawFormattedText(wPtr, Answer, [positionX], [positionY], [0 0 0]);
Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
Screen('Flip',wPtr);

WaitSecs(afterStopInterval); 

while mouseX<x7 | mouseY>y1
DrawFormattedText(wPtr, Answer, [positionX], [positionY], [0 0 0]);
Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
Screen('Flip',wPtr);

% Wait for mouse click in next button
[clicks,mouseX,mouseY,whichButton] = GetClicks();
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%SCREEN INSTRUCTIONS 24 - (Instructions for 31s int)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Screen('TextFont',wPtr,'Helvetica');
Screen('TextSize',wPtr,18);

mouseX=0; mouseY=0;


        DrawFormattedText(wPtr, 'Please produce an interval of 31 seconds.\n\n\n\n\nClick "Start Interval" to start the interval.', [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        Screen('DrawText',wPtr,StartInterval,x7+(x1/8),y0+(y1/2),[0 0 0]);
        Screen('Flip',wPtr);
        
WaitSecs(startIntervalInstructions);


        % Wait for key press
        while mouseX<x7 | mouseY>y1
        DrawFormattedText(wPtr, 'Please produce an interval of 31 seconds.\n\n\n\n\nClick "Start Interval" to start the interval.', [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        Screen('DrawText',wPtr,StartInterval,x7+(x1/8),y0+(y1/2),[0 0 0]);
        Screen('Flip',wPtr);

        % Wait for mouse click in next button
        [clicks,mouseX,mouseY,whichButton] = GetClicks();
        end
        
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%SCREEN INSTRUCTIONS 25 - (31s int)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
instructionsInt2task1 = 'Please click the cell where the column to the left of the column labeled salsa intersects the row above the Iowa row.';
% name4={'California' 'Iowa' 'Texas' 'Alaska'     'jazz' 'pop' 'salsa' 'rap' 'classical' 'folk' 'rock'};
instructionsInt2task2 = 'Please click the cell where the row below the boots row intersects the column labeled pug.';
% 2/6 name5={'boots' 'moccasin' 'flats' 'sandals'     'terrier' 'beagle' 'chihuahua' 'mastiff' 'boxer' 'pug' 'greyhound'};
instructionsInt2task3 = 'Please click the cell where the column to the right of the Cuba column intersects the row below the trunk row.';
% 4/2 name6={'buds' 'leaves' 'trunk' 'roots'          'Cuba' 'Ghana' 'Iraq' 'Nigeria' 'Romania' 'Italy' 'Japan'};
instructionsInt2task4 = 'Please click the cell where the row above the row labeled stratus intersects the column to the left of the allosaurus column.';
% 3/4 name7={'cumulus' 'nimbus' 'cirrus' 'stratus'    'velociraptor' 'brachiosaurus' 'rex' 'triceratops' 'allosaurus' 'brachiosaurus' 'diplodocus'};

fprintf(myfile,'Beginning of int of 31 seconds \n');
EndInterval2 = strcat(EndInterval, ' of\n31 seconds');

clickBegins=GetSecs();
startPracticeInterval3=clickBegins;
now = clickBegins;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;
counterCorrectas=0;
counterIncorrectas=0;
buttonEnd=0;

fprintf(myfile,'Beginning of task \n');


DrawFormattedText(wPtr, instructionsInt2task1, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name4{1};
row2= name4{2};
row3= name4{3};
row4= name4{4};

col1= name4{5};
col2= name4{6};
col3= name4{7};
col4= name4{8};
col5= name4{9};
col6= name4{10};
col7= name4{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);

WaitSecs(afterStartInterval);



% If hasnt clicked on "end int" button
% 1
if buttonEnd == 0
    
    % Until he presses the end button or time for task runs out
    % 2
while (mouseY < R1(2) | mouseY > R1(4) | mouseX < C2(1) | mouseX > C2(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int31sTask1Lasts        
        % 3
        while ~max(buttons) && now < clickBegins + int31sTask1Lasts
        DrawFormattedText(wPtr, instructionsInt2task1, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name4{1};
row2= name4{2};
row3= name4{3};
row4= name4{4};

col1= name4{5};
col2= name4{6};
col3= name4{7};
col4= name4{8};
col5= name4{9};
col6= name4{10};
col7= name4{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startPracticeInterval3;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R1(2) && mouseY <= R1(4) && mouseX >= C2(1) && mouseX <= C2(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
        
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int31sTask1Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
    
    
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions); % Since there is a click
    % 2    
    end
    
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int31sTask1Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int31sTask1Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2
    while (mouseY < R2(2) | mouseY > R2(4) | mouseX < C6(1) | mouseX > C6(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int31sTask2Lasts        
        % 3.3
        while ~max(buttons) && now < clickBegins + int31sTask2Lasts
        DrawFormattedText(wPtr, instructionsInt2task2, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name5{1};
row2= name5{2};
row3= name5{3};
row4= name5{4};

col1= name5{5};
col2= name5{6};
col3= name5{7};
col4= name5{8};
col5= name5{9};
col6= name5{10};
col7= name5{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R2(2) && mouseY <= R2(4) && mouseX >= C6(1) && mouseX <= C6(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int31sTask2Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2    
    end
    

        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int31sTask2Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int31sTask2Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.2
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.2
    while (mouseY < R4(2) | mouseY > R4(4) | mouseX < C2(1) | mouseX > C2(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int31sTask3Lasts        
        % 3.3.2
        while ~max(buttons) && now < clickBegins + int31sTask3Lasts
        DrawFormattedText(wPtr, instructionsInt2task3, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name6{1};
row2= name6{2};
row3= name6{3};
row4= name6{4};

col1= name6{5};
col2= name6{6};
col3= name6{7};
col4= name6{8};
col5= name6{9};
col6= name6{10};
col7= name6{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.2
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R4(2) && mouseY <= R4(4) && mouseX >= C2(1) && mouseX <= C2(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int31sTask3Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.2    
    end
    

        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int31sTask3Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int31sTask3Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.3
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.3
    while (mouseY < R3(2) | mouseY > R3(4) | mouseX < C4(1) | mouseX > C4(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int31sTask4Lasts        
        % 3.3.3
        while ~max(buttons) && now < clickBegins + int31sTask4Lasts
        DrawFormattedText(wPtr, instructionsInt2task4, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name7{1};
row2= name7{2};
row3= name7{3};
row4= name7{4};

col1= name7{5};
col2= name7{6};
col3= name7{7};
col4= name7{8};
col5= name7{9};
col6= name7{10};
col7= name7{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.3
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R3(2) && mouseY <= R3(4) && mouseX >= C4(1) && mouseX <= C4(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int31sTask4Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.3    
    end
    

        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int31sTask4Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int31sTask4Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
        
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

            % 4.1
            end
          %3.1.2
          end
        % 3.1      
        end
    % 2.1    
    end
% 1        
    end
end
    end
end
lengthPracticeInterval = now - startPracticeInterval3;
correctas = num2str(counterCorrectas);
incorrectas = num2str(counterIncorrectas);

if (counterCorrectas+counterIncorrectas)>0
    if (counterCorrectas/(counterCorrectas+counterIncorrectas))>.79
    proportion=' over or equal to 80 per cent.';
    getPayed=1;
else
    proportion=' under 80 per cent.';
    getPayed=0;
    end
else
    proportion=' over or equal to 80 per cent.';
    getPayed=1;
end


fprintf(myfile,'The length of the 31s interval is %.5f \n\n', lengthPracticeInterval);

Answer = 'Interval Ended. Please click the button labeled "Next" to continue.';

realInt = 31;
percentualDifference = (abs(lengthPracticeInterval-realInt))/realInt;

if percentualDifference >0.2
    getPayedYes='$0';
end
if getPayed==1
if percentualDifference <= 0.2 && percentualDifference > 0.10 && getPayed==1
    getPayedYes=lowPayment;

end
    if percentualDifference <= 0.10 && percentualDifference > 0.05 && getPayed==1
        getPayedYes=midPayment;
    end
        if percentualDifference <= 0.05 && getPayed==1
                getPayedYes=highPayment;
        end
else
    getPayedYes='$0';
end
       
        
text='0m31s';
deviationInt = abs(lengthPracticeInterval-realInt);
proportionCorrectas = counterCorrectas/(counterCorrectas+counterIncorrectas);


         fprintf(myfileData, '%.2f \n', proportionCorrectas);
         fprintf(myfileData, '%.5f \n', lengthPracticeInterval);
fprintf(payoffs, '%s \t\t %.5f \t\t %.5f \t\t %.5f \t\t %.2f \t\t\t\t %i \t\t\t\t\t %i \t\t\t\t\t %.2f \t\t\t %s \t\t %s \n\n', text, realInt, lengthPracticeInterval, deviationInt, percentualDifference, counterCorrectas, counterIncorrectas, proportionCorrectas, getPayedYes, intNumber0m31s);
fprintf(shortPayoffs, '%s \t\t %s \t\t\t %s\n\n',intNumber0m31s, text, getPayedYes);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mouseX=0; mouseY=0;

DrawFormattedText(wPtr, Answer, [positionX], [positionY], [0 0 0]);
Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
Screen('Flip',wPtr);
WaitSecs(afterStopInterval);

while mouseX<x7 | mouseY>y1
DrawFormattedText(wPtr, Answer, [positionX], [positionY], [0 0 0]);
Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
Screen('Flip',wPtr);

% Wait for mouse click in next button
[clicks,mouseX,mouseY,whichButton] = GetClicks();
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%SCREEN INSTRUCTIONS 28 - (Instructions for 56s int)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Screen('TextFont',wPtr,'Helvetica');
Screen('TextSize',wPtr,18);

mouseX=0; mouseY=0;

        DrawFormattedText(wPtr, 'Please produce an interval of 53 seconds.\n\n\n\n\nClick "Start Interval" to start the interval.', [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        Screen('DrawText',wPtr,StartInterval,x7+(x1/8),y0+(y1/2),[0 0 0]);
        Screen('Flip',wPtr);
WaitSecs(startIntervalInstructions);

        % Wait for key press
        while mouseX<x7 | mouseY>y1
        DrawFormattedText(wPtr, 'Please produce an interval of 53 seconds.\n\n\n\n\nClick "Start Interval" to start the interval.', [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        Screen('DrawText',wPtr,StartInterval,x7+(x1/8),y0+(y1/2),[0 0 0]);
        Screen('Flip',wPtr);

        % Wait for mouse click in next button
        [clicks,mouseX,mouseY,whichButton] = GetClicks();
        end
            
         
%SCREEN INSTRUCTIONS 29 - (53s int)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
instructionsInt4task1 = 'Please click the cell where the row above the row labeled basalt intersects the column labeled folk.';
% 1/6 name12={'limestone' 'basalt' 'coal' 'marble'    'jazz' 'pop' 'salsa' 'rap' 'classical' 'folk' 'rock'};
instructionsInt4task2 = 'Please click the cell where the column to the right of the macadamia column intersects the row above the row labeled air.';
% 2/5 name13={'fire' 'water' 'air' 'earth'            'walnut' 'peanut' 'almond' 'macadamia' 'cashew' 'pecan' 'pistachio'};
instructionsInt4task3 = 'Please click the cell where the column to the right of the column labeled linguine intersects the row above the space row.';
% 3/6 name14={'sea' 'sky' 'earth' 'space'             'spaghetti' 'capellini' 'fusilli' 'lasagne' 'linguine' 'fettuccine' 'cannelloni'};
instructionsInt4task4 = 'Please click the cell where the row labeled ruler intersects the column to the left of the column labeled earth.';
% 4/1 name15={'pen' 'pencil' 'eraser' 'ruler'         'saturn' 'earth' 'neptune' 'mercury' 'jupiter' 'uranus' 'venus'};
instructionsInt4task5 = 'Please click the cell where the row above the boy row intersects the column to the left of the goat column.';
% 3/1 name16={'girl' 'man' 'woman' 'boy'              'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};

fprintf(myfile,'Beginning of int of 53 seconds \n');
EndInterval2 = strcat(EndInterval, ' of\n53 seconds');

clickBegins=GetSecs();
startPracticeInterval3=clickBegins;
now = clickBegins;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;
counterCorrectas=0;
counterIncorrectas=0;
buttonEnd=0;

fprintf(myfile,'Beginning of task \n');

DrawFormattedText(wPtr, instructionsInt4task1, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name12{1};
row2= name12{2};
row3= name12{3};
row4= name12{4};

col1= name12{5};
col2= name12{6};
col3= name12{7};
col4= name12{8};
col5= name12{9};
col6= name12{10};
col7= name12{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);

WaitSecs(afterStartInterval);

% If hasnt clicked on "end int" button
% 1
if buttonEnd == 0
    
    % Until he presses the end button or time for task runs out
    % 2
while (mouseY < R1(2) | mouseY > R1(4) | mouseX < C6(1) | mouseX > C6(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int53sTask1Lasts        
        % 3
        while ~max(buttons) && now < clickBegins + int53sTask1Lasts
        DrawFormattedText(wPtr, instructionsInt4task1, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name12{1};
row2= name12{2};
row3= name12{3};
row4= name12{4};

col1= name12{5};
col2= name12{6};
col3= name12{7};
col4= name12{8};
col5= name12{9};
col6= name12{10};
col7= name12{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startPracticeInterval3;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R1(2) && mouseY <= R1(4) && mouseX >= C6(1) && mouseX <= C6(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
        
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int53sTask1Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
    
    
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions); % Since there is a click
    % 2    
    end
    
    
        
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int53sTask2Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int53sTask2Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2
    while (mouseY < R2(2) | mouseY > R2(4) | mouseX < C5(1) | mouseX > C5(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int53sTask2Lasts        
        % 3.3
        while ~max(buttons) && now < clickBegins + int53sTask2Lasts
        DrawFormattedText(wPtr, instructionsInt4task2, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name13{1};
row2= name13{2};
row3= name13{3};
row4= name13{4};

col1= name13{5};
col2= name13{6};
col3= name13{7};
col4= name13{8};
col5= name13{9};
col6= name13{10};
col7= name13{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R2(2) && mouseY <= R2(4) && mouseX >= C5(1) && mouseX <= C5(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int53sTask2Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2    
    end
    

        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int53sTask3Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int53sTask3Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.2
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.2
    while (mouseY < R3(2) | mouseY > R3(4) | mouseX < C6(1) | mouseX > C6(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int53sTask3Lasts        
        % 3.3.2
        while ~max(buttons) && now < clickBegins + int53sTask3Lasts
        DrawFormattedText(wPtr, instructionsInt4task3, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name14{1};
row2= name14{2};
row3= name14{3};
row4= name14{4};

col1= name14{5};
col2= name14{6};
col3= name14{7};
col4= name14{8};
col5= name14{9};
col6= name14{10};
col7= name14{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.2
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R3(2) && mouseY <= R3(4) && mouseX >= C6(1) && mouseX <= C6(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int53sTask3Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.2    
    end
    

        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int53sTask4Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int53sTask4Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.3
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.3
    while (mouseY < R4(2) | mouseY > R4(4) | mouseX < C1(1) | mouseX > C1(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int53sTask4Lasts        
        % 3.3.3
        while ~max(buttons) && now < clickBegins + int53sTask4Lasts
        DrawFormattedText(wPtr, instructionsInt4task4, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name15{1};
row2= name15{2};
row3= name15{3};
row4= name15{4};

col1= name15{5};
col2= name15{6};
col3= name15{7};
col4= name15{8};
col5= name15{9};
col6= name15{10};
col7= name15{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.3
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R4(2) && mouseY <= R4(4) && mouseX >= C1(1) && mouseX <= C1(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int53sTask4Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.3    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int53sTask5Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int53sTask5Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.4
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.4
    while (mouseY < R3(2) | mouseY > R3(4) | mouseX < C1(1) | mouseX > C1(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int53sTask5Lasts        
        % 3.3.4
        while ~max(buttons) && now < clickBegins + int53sTask5Lasts
        DrawFormattedText(wPtr, instructionsInt4task5, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name16{1}; 
row2= name16{2};
row3= name16{3};
row4= name16{4};

col1= name16{5};
col2= name16{6};
col3= name16{7};
col4= name16{8};
col5= name16{9};
col6= name16{10};
col7= name16{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.4
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R3(2) && mouseY <= R3(4) && mouseX >= C1(1) && mouseX <= C1(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int53sTask5Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.4    
    end

        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int53sTask6Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int53sTask6Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
        
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                    % 4.1
                    end
                %3.1.4
                end
            %3.1.3
            end
          %3.1.2
          end
        % 3.1      
        end
    % 2.1    
    end
% 1        
    end
end
    end
    end
 

lengthPracticeInterval = now - startPracticeInterval3;
correctas = num2str(counterCorrectas);
incorrectas = num2str(counterIncorrectas);

if (counterCorrectas+counterIncorrectas)>0
    if (counterCorrectas/(counterCorrectas+counterIncorrectas))>.79
    proportion=' over or equal to 80 per cent.';
    getPayed=1;
else
    proportion=' under 80 per cent.';
    getPayed=0;
    end
else
    proportion=' over or equal to 80 per cent.';
    getPayed=1;
end


fprintf(myfile,'The length of the 56s interval is %.5f \n\n', lengthPracticeInterval);

Answer = 'Interval Ended. Please click the button labeled "Next" to continue.';

realInt = 53;
percentualDifference = (abs(lengthPracticeInterval-realInt))/realInt;

if percentualDifference >0.2
    getPayedYes='$0';
end
if getPayed==1
if percentualDifference <= 0.2 && percentualDifference > 0.10 && getPayed==1
    getPayedYes=lowPayment;

end
    if percentualDifference <= 0.10 && percentualDifference > 0.05 && getPayed==1
        getPayedYes=midPayment;
    end
        if percentualDifference <= 0.05 && getPayed==1
                getPayedYes=highPayment;
        end
else
    getPayedYes='$0';
end
        
        
text='0m53s';
deviationInt = abs(lengthPracticeInterval-realInt);
proportionCorrectas = counterCorrectas/(counterCorrectas+counterIncorrectas);


         fprintf(myfileData, '%.2f \n', proportionCorrectas);
         fprintf(myfileData, '%.5f \n', lengthPracticeInterval);
fprintf(payoffs, '%s \t\t %.5f \t\t %.5f \t\t %.5f \t\t %.2f \t\t\t\t %i \t\t\t\t\t %i \t\t\t\t\t %.2f \t\t\t %s \t\t %s \n\n', text, realInt, lengthPracticeInterval, deviationInt, percentualDifference, counterCorrectas, counterIncorrectas, proportionCorrectas, getPayedYes, intNumber0m53s);
fprintf(shortPayoffs, '%s \t\t %s \t\t\t %s\n\n',intNumber0m53s, text, getPayedYes);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mouseX=0; mouseY=0;


DrawFormattedText(wPtr, Answer, [positionX], [positionY], [0 0 0]);
Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
Screen('Flip',wPtr);

WaitSecs(afterStopInterval);

while mouseX<x7 | mouseY>y1
DrawFormattedText(wPtr, Answer, [positionX], [positionY], [0 0 0]);
Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
Screen('Flip',wPtr);

% Wait for mouse click in next button
[clicks,mouseX,mouseY,whichButton] = GetClicks();
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%SCREEN INSTRUCTIONS 22 - (Instructions for 3m16s int)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Screen('TextFont',wPtr,'Helvetica');
Screen('TextSize',wPtr,18);

mouseX=0; mouseY=0;

        DrawFormattedText(wPtr, 'Please produce an interval of 3 minutes and 16 seconds.\n\n\n\n\nClick "Start Interval" to start the interval.', [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        Screen('DrawText',wPtr,StartInterval,x7+(x1/8),y0+(y1/2),[0 0 0]);
        Screen('Flip',wPtr);
        
        WaitSecs(startIntervalInstructions);
        
        % Wait for key press
        while mouseX<x7 | mouseY>y1
        DrawFormattedText(wPtr, 'Please produce an interval of 3 minutes and 16 seconds.\n\n\n\n\nClick "Start Interval" to start the interval.', [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        Screen('DrawText',wPtr,StartInterval,x7+(x1/8),y0+(y1/2),[0 0 0]);
        Screen('Flip',wPtr);

        % Wait for mouse click in next button
        [clicks,mouseX,mouseY,whichButton] = GetClicks();
        end
        
 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%SCREEN INSTRUCTIONS 23 - (3m16s int) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%There are 19 tasks not 18 because I added an extra one borrowed from
%%other place. 
instructionsInt8task1 = 'Please click the cell where the column to the left of the column labeled atlas intersects the row above the biology row.';
% 1/5 name48={'physics' 'biology' 'chemistry' 'geology'    'hades' 'zeus' 'poseidon' 'athena' 'apollo' 'atlas' 'perses'};
instructionsInt8task2 = 'Please click the cell where the row below the row labeled piano intersects the column labeled cat.';
% 4/4 name49={'guitar' 'trumpet' 'piano' 'drums'       'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};
instructionsInt8task3 = 'Please click the cell where the row above the eraser row intersects the column to the left of the earth column.';
% 2/1 name50={'pen' 'pencil' 'eraser' 'ruler'         'saturn' 'earth' 'neptune' 'mercury' 'jupiter' 'uranus' 'venus'};
instructionsInt8task4 = 'Please click the cell where the Italy column intersects the trunk row.';
% 3/6 name51={'buds' 'leaves' 'trunk' 'roots'          'Cuba' 'Ghana' 'Iraq' 'Nigeria' 'Romania' 'Italy' 'Japan'};
instructionsInt8task5 = 'Please click the cell where the column to the left of the column labeled goat intersects the row below the woman row.';
% 4/1 name52={'girl' 'man' 'woman' 'boy'              'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};
instructionsInt8task6 = 'Please click the cell where the column to the left of the column labeled apple intersects the row below the green row.';
% 3/2 name53={'red' 'green' 'blue' 'yellow'            'banana' 'peach' 'apple' 'grape' 'orange' 'pear' 'lemon'};
instructionsInt8task7 = 'Please click the cell where the row below the row labeled California intersects the column to the right of the goat column.';
% 2/3 name54={'California' 'Iowa' 'Texas' 'Alaska'     'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};
instructionsInt8task8 = 'Please click the cell where the row above the roots row intersects the column to the right of the Ghana column.';
% 3/3 name55={'buds' 'leaves' 'trunk' 'roots'          'Cuba' 'Ghana' 'Iraq' 'Nigeria' 'Romania' 'Italy' 'Japan'};
instructionsInt8task9 = 'Please click the cell where the column to the right of the spaghetti column intersects the row labeled space.';
% 4/2 name56={'sea' 'sky' 'earth' 'space'             'spaghetti' 'capellini' 'fusilli' 'lasagne' 'linguine' 'fettuccine' 'cannelloni'};
instructionsInt8task10 = 'Please click the cell where the column to the left of the allosaurus column intersects the row above the nimbus row.';
% 1/4 name57={'cumulus' 'nimbus' 'cirrus' 'stratus'    'velociraptor' 'brachiosaurus' 'rex' 'triceratops' 'allosaurus' 'brachiosaurus' 'diplodocus'};
instructionsInt8task11 = 'Please click the cell where the row above the row labeled pencil intersects the column to the right of the mercury column.';
% 1/5 name58={'pen' 'pencil' 'eraser' 'ruler'         'saturn' 'earth' 'neptune' 'mercury' 'jupiter' 'uranus' 'venus'};
instructionsInt8task12 = 'Please click the cell where the row labeled circle intersects the column to the left of the iron column.';
% 1/2 name59={'circle' 'square' 'triangle' 'rectangle' 'oxygen' 'lead' 'iron' 'arsenic' 'silicon' 'lithium' 'carbon'};
instructionsInt8task13 = 'Please click the cell where the column labeled dog intersects the row above the drums row.';
% 3/5 name60={'guitar' 'trumpet' 'piano' 'drums'       'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};
instructionsInt8task14 = 'Please click the cell where the column to the left of the column labeled fox intersects the row below the row labeled girl.';
% 2/2 name61={'girl' 'man' 'woman' 'boy'              'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};
instructionsInt8task15 = 'Please click the cell where the row below the row labeled chemistry intersects the column to the right of the zeus column.';
% 4/3 name62={'physics' 'biology' 'chemistry' 'geology' 'hades' 'zeus' 'poseidon' 'athena' 'apollo' 'atlas' 'perses'};
instructionsInt8task16 = 'Please click the cell where the column to the left of the column labeled potential intersects the row above the offroad row.';
% 3/1 name63={'touring' 'chopper' 'scooter' 'offroad'  'kinetic' 'potential' 'thermal' 'chemical' 'electrical' 'nuclear' 'magnetic'};
instructionsInt8task17 = 'Please click the cell where the row above the water row intersects the column to the right of the cashew column.';
% 1/6 name64={'fire' 'water' 'air' 'earth'            'walnut' 'peanut' 'almond' 'macadamia' 'cashew' 'pecan' 'pistachio'};
instructionsInt8task18 = 'Please click the cell where the row below the earth row intersects the column to the right of the column labeled linguine.';
% 4/6 name65={'sea' 'sky' 'earth' 'space'             'spaghetti' 'capellini' 'fusilli' 'lasagne' 'linguine' 'fettuccine' 'cannelloni'};


fprintf(myfile,'Beginning of int of 3 minutes and 16 seconds \n');
EndInterval2 = strcat(EndInterval, ' of\n3 minutes\n16 seconds');

clickBegins=GetSecs();
startPracticeInterval3=clickBegins;
now = clickBegins;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;
counterCorrectas=0;
counterIncorrectas=0;
buttonEnd=0;

fprintf(myfile,'Beginning of task \n');

DrawFormattedText(wPtr, instructionsInt8task1, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name48{1}; 
row2= name48{2};
row3= name48{3};
row4= name48{4};

col1= name48{5};
col2= name48{6};
col3= name48{7};
col4= name48{8};
col5= name48{9};
col6= name48{10};
col7= name48{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);

WaitSecs(afterStartInterval);


% If hasnt clicked on "end int" button
% 1
if buttonEnd == 0
    
    % Until he presses the end button or time for task runs out
    % 2
while (mouseY < R1(2) | mouseY > R1(4) | mouseX < C5(1) | mouseX > C5(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask1Lasts        
        % 3
        while ~max(buttons) && now < clickBegins + int3m16sTask1Lasts
        DrawFormattedText(wPtr, instructionsInt8task1, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name48{1}; 
row2= name48{2};
row3= name48{3};
row4= name48{4};

col1= name48{5};
col2= name48{6};
col3= name48{7};
col4= name48{8};
col5= name48{9};
col6= name48{10};
col7= name48{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startPracticeInterval3;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R1(2) && mouseY <= R1(4) && mouseX >= C5(1) && mouseX <= C5(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
        
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int3m16sTask1Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
    
    
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions); % Since there is a click
    % 2    
    end
    
    
        
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask1Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int3m16sTask1Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
        
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2
    while (mouseY < R4(2) | mouseY > R4(4) | mouseX < C4(1) | mouseX > C4(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask2Lasts        
        % 3.3
        while ~max(buttons) && now < clickBegins + int3m16sTask2Lasts
        DrawFormattedText(wPtr, instructionsInt8task2, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name49{1}; 
row2= name49{2};
row3= name49{3};
row4= name49{4};

col1= name49{5};
col2= name49{6};
col3= name49{7};
col4= name49{8};
col5= name49{9};
col6= name49{10};
col7= name49{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R4(2) && mouseY <= R4(4) && mouseX >= C4(1) && mouseX <= C4(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int3m16sTask2Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2    
    end
    

        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask2Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int3m16sTask2Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.4.1
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.4.2
    while (mouseY < R4(2) | mouseY > R4(4) | mouseX < C6(1) | mouseX > C6(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask3Lasts        
        % 3.4.3
        while ~max(buttons) && now < clickBegins + int3m16sTask3Lasts
        DrawFormattedText(wPtr, instructionsInt8task18, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);


row1= name65{1}; 
row2= name65{2};
row3= name65{3};
row4= name65{4};

col1= name65{5};
col2= name65{6};
col3= name65{7};
col4= name65{8};
col5= name65{9};
col6= name65{10};
col7= name65{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.4.4
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R4(2) && mouseY <= R4(4) && mouseX >= C6(1) && mouseX <= C6(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int3m16sTask3Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.4.5    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask3Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int3m16sTask3Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.2
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.2
    while (mouseY < R2(2) | mouseY > R2(4) | mouseX < C1(1) | mouseX > C1(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask4Lasts        
        % 3.3.2
        while ~max(buttons) && now < clickBegins + int3m16sTask4Lasts
        DrawFormattedText(wPtr, instructionsInt8task3, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name50{1}; 
row2= name50{2};
row3= name50{3};
row4= name50{4};

col1= name50{5};
col2= name50{6};
col3= name50{7};
col4= name50{8};
col5= name50{9};
col6= name50{10};
col7= name50{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.2
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R2(2) && mouseY <= R2(4) && mouseX >= C1(1) && mouseX <= C1(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int3m16sTask4Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.2    
    end
    

        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask4Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int3m16sTask4Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.3
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.3
    while (mouseY < R3(2) | mouseY > R3(4) | mouseX < C6(1) | mouseX > C6(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask5Lasts        
        % 3.3.3
        while ~max(buttons) && now < clickBegins + int3m16sTask5Lasts
        DrawFormattedText(wPtr, instructionsInt8task4, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name51{1};
row2= name51{2};
row3= name51{3};
row4= name51{4};

col1= name51{5};
col2= name51{6};
col3= name51{7};
col4= name51{8};
col5= name51{9};
col6= name51{10};
col7= name51{11};
% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.3
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R3(2) && mouseY <= R3(4) && mouseX >= C6(1) && mouseX <= C6(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int3m16sTask5Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.3    
    end
    

        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask5Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int3m16sTask5Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.4
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.4
    while (mouseY < R4(2) | mouseY > R4(4) | mouseX < C1(1) | mouseX > C1(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask6Lasts        
        % 3.3.4
        while ~max(buttons) && now < clickBegins + int3m16sTask6Lasts
        DrawFormattedText(wPtr, instructionsInt8task5, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name52{1};
row2= name52{2};
row3= name52{3};
row4= name52{4};

col1= name52{5};
col2= name52{6};
col3= name52{7};
col4= name52{8};
col5= name52{9};
col6= name52{10};
col7= name52{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.4
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R4(2) && mouseY <= R4(4) && mouseX >= C1(1) && mouseX <= C1(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int3m16sTask6Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.4    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask6Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int3m16sTask6Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.5
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.5
    while (mouseY < R3(2) | mouseY > R3(4) | mouseX < C2(1) | mouseX > C2(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask7Lasts        
        % 3.3.5
        while ~max(buttons) && now < clickBegins + int3m16sTask7Lasts
        DrawFormattedText(wPtr, instructionsInt8task6, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name53{1};
row2= name53{2};
row3= name53{3};
row4= name53{4};

col1= name53{5};
col2= name53{6};
col3= name53{7};
col4= name53{8};
col5= name53{9};
col6= name53{10};
col7= name53{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.5
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R3(2) && mouseY <= R3(4) && mouseX >= C2(1) && mouseX <= C2(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int3m16sTask7Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.5    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask7Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int3m16sTask7Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.6
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.6
    while (mouseY < R2(2) | mouseY > R2(4) | mouseX < C3(1) | mouseX > C3(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask8Lasts        
        % 3.3.6
        while ~max(buttons) && now < clickBegins + int3m16sTask8Lasts
        DrawFormattedText(wPtr, instructionsInt8task7, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name54{1};
row2= name54{2};
row3= name54{3};
row4= name54{4};

col1= name54{5};
col2= name54{6};
col3= name54{7};
col4= name54{8};
col5= name54{9};
col6= name54{10};
col7= name54{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.6
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R2(2) && mouseY <= R2(4) && mouseX >= C3(1) && mouseX <= C3(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int3m16sTask8Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.6    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask8Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int3m16sTask8Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.7
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.7
    while (mouseY < R3(2) | mouseY > R3(4) | mouseX < C3(1) | mouseX > C3(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask9Lasts        
        % 3.3.7
        while ~max(buttons) && now < clickBegins + int3m16sTask9Lasts
        DrawFormattedText(wPtr, instructionsInt8task8, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name55{1};
row2= name55{2};
row3= name55{3};
row4= name55{4};

col1= name55{5};
col2= name55{6};
col3= name55{7};
col4= name55{8};
col5= name55{9};
col6= name55{10};
col7= name55{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.7
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R3(2) && mouseY <= R3(4) && mouseX >= C3(1) && mouseX <= C3(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int3m16sTask9Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.7    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask9Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int3m16sTask9Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.8
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.8
    while (mouseY < R4(2) | mouseY > R4(4) | mouseX < C2(1) | mouseX > C2(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask10Lasts        
        % 3.3.8
        while ~max(buttons) && now < clickBegins + int3m16sTask10Lasts
        DrawFormattedText(wPtr, instructionsInt8task9, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name56{1};
row2= name56{2};
row3= name56{3};
row4= name56{4};

col1= name56{5};
col2= name56{6};
col3= name56{7};
col4= name56{8};
col5= name56{9};
col6= name56{10};
col7= name56{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.8
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R4(2) && mouseY <= R4(4) && mouseX >= C2(1) && mouseX <= C2(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int3m16sTask10Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.8    
    end
    

        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask10Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int3m16sTask10Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.9
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.9
    while (mouseY < R1(2) | mouseY > R1(4) | mouseX < C4(1) | mouseX > C4(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask11Lasts        
        % 3.3.10
        while ~max(buttons) && now < clickBegins + int3m16sTask11Lasts
        DrawFormattedText(wPtr, instructionsInt8task10, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name57{1};
row2= name57{2};
row3= name57{3};
row4= name57{4};

col1= name57{5};
col2= name57{6};
col3= name57{7};
col4= name57{8};
col5= name57{9};
col6= name57{10};
col7= name57{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.9
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R1(2) && mouseY <= R1(4) && mouseX >= C4(1) && mouseX <= C4(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int3m16sTask11Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.9    
    end
   
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask11Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int3m16sTask11Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
         
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.10
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.10
    while (mouseY < R1(2) | mouseY > R1(4) | mouseX < C2(1) | mouseX > C2(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask12Lasts        
        % 3.3.10
        while ~max(buttons) && now < clickBegins + int3m16sTask12Lasts
        DrawFormattedText(wPtr, instructionsInt8task12, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name59{1};
row2= name59{2};
row3= name59{3};
row4= name59{4};

col1= name59{5};
col2= name59{6};
col3= name59{7};
col4= name59{8};
col5= name59{9};
col6= name59{10};
col7= name59{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.10
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R1(2) && mouseY <= R1(4) && mouseX >= C2(1) && mouseX <= C2(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int3m16sTask12Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.10    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask12Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int3m16sTask12Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.11
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.11
    while (mouseY < R3(2) | mouseY > R3(4) | mouseX < C5(1) | mouseX > C5(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask13Lasts        
        % 3.3.11
        while ~max(buttons) && now < clickBegins + int3m16sTask13Lasts
        DrawFormattedText(wPtr, instructionsInt8task13, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name60{1}; 
row2= name60{2};
row3= name60{3};
row4= name60{4};

col1= name60{5};
col2= name60{6};
col3= name60{7};
col4= name60{8};
col5= name60{9};
col6= name60{10};
col7= name60{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.11
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R3(2) && mouseY <= R3(4) && mouseX >= C5(1) && mouseX <= C5(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int3m16sTask13Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.11    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask13Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int3m16sTask13Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.12
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.12
    while (mouseY < R2(2) | mouseY > R2(4) | mouseX < C2(1) | mouseX > C2(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask14Lasts        
        % 3.3.12
        while ~max(buttons) && now < clickBegins + int3m16sTask14Lasts
        DrawFormattedText(wPtr, instructionsInt8task14, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
   

row1= name61{1}; 
row2= name61{2};
row3= name61{3};
row4= name61{4};

col1= name61{5};
col2= name61{6};
col3= name61{7};
col4= name61{8};
col5= name61{9};
col6= name61{10};
col7= name61{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.12
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R2(2) && mouseY <= R2(4) && mouseX >= C2(1) && mouseX <= C2(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int3m16sTask14Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.12    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask14Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int3m16sTask14Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.13
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.13
    while (mouseY < R4(2) | mouseY > R4(4) | mouseX < C3(1) | mouseX > C3(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask15Lasts        
        % 3.3.13
        while ~max(buttons) && now < clickBegins + int3m16sTask15Lasts
        DrawFormattedText(wPtr, instructionsInt8task15, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
   
row1= name62{1}; 
row2= name62{2};
row3= name62{3};
row4= name62{4};

col1= name62{5};
col2= name62{6};
col3= name62{7};
col4= name62{8};
col5= name62{9};
col6= name62{10};
col7= name62{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.13
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R4(2) && mouseY <= R4(4) && mouseX >= C3(1) && mouseX <= C3(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int3m16sTask15Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.13    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask15Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int3m16sTask15Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.14
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.14
    while (mouseY < R3(2) | mouseY > R3(4) | mouseX < C1(1) | mouseX > C1(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask16Lasts        
        % 3.3.14
        while ~max(buttons) && now < clickBegins + int3m16sTask16Lasts
        DrawFormattedText(wPtr, instructionsInt8task16, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
   

row1= name63{1}; 
row2= name63{2};
row3= name63{3};
row4= name63{4};

col1= name63{5};
col2= name63{6};
col3= name63{7};
col4= name63{8};
col5= name63{9};
col6= name63{10};
col7= name63{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.14
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R3(2) && mouseY <= R3(4) && mouseX >= C1(1) && mouseX <= C1(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int3m16sTask16Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.14    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask16Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int3m16sTask16Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.15
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.15
    while (mouseY < R1(2) | mouseY > R1(4) | mouseX < C5(1) | mouseX > C5(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask17Lasts        
        % 3.3.15
        while ~max(buttons) && now < clickBegins + int3m16sTask17Lasts
        DrawFormattedText(wPtr, instructionsInt8task11, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
   
row1= name58{1}; 
row2= name58{2};
row3= name58{3};
row4= name58{4};

col1= name58{5};
col2= name58{6};
col3= name58{7};
col4= name58{8};
col5= name58{9};
col6= name58{10};
col7= name58{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.15
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R1(2) && mouseY <= R1(4) && mouseX >= C5(1) && mouseX <= C5(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int3m16sTask17Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.15    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask17Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int3m16sTask17Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.16
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.16
    while (mouseY < R1(2) | mouseY > R1(4) | mouseX < C6(1) | mouseX > C6(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask18Lasts        
        % 3.3.16
        while ~max(buttons) && now < clickBegins + int3m16sTask18Lasts
        DrawFormattedText(wPtr, instructionsInt8task17, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);

row1= name64{1}; 
row2= name64{2};
row3= name64{3};
row4= name64{4};

col1= name64{5};
col2= name64{6};
col3= name64{7};
col4= name64{8};
col5= name64{9};
col6= name64{10};
col7= name64{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.16
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R1(2) && mouseY <= R1(4) && mouseX >= C6(1) && mouseX <= C6(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int3m16sTask18Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.16    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask18Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int3m16sTask18Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.17
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.17
    while (mouseY < R4(2) | mouseY > R4(4) | mouseX < C6(1) | mouseX > C6(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask19Lasts        
        % 3.3.17
        while ~max(buttons) && now < clickBegins + int3m16sTask19Lasts
        DrawFormattedText(wPtr, instructionsInt8task18, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);


row1= name65{1}; 
row2= name65{2};
row3= name65{3};
row4= name65{4};

col1= name65{5};
col2= name65{6};
col3= name65{7};
col4= name65{8};
col5= name65{9};
col6= name65{10};
col7= name65{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.17
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R4(2) && mouseY <= R4(4) && mouseX >= C6(1) && mouseX <= C6(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int3m16sTask19Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.17    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask18Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int3m16sTask18Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
        
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                                                            % 4.1
        end
              %3.1.17   
end
         %3.1.16
end
                                                            %3.1.15       
                                                             end
                                                        % 3.1.14
                                                        end
                                                    % 3.1.13
                                                    end
                                                % 3.1.12
                                                end
                                            %3.1.11
                                            end
                                        %3.1.10
                                        end
                                    %3.1.9
                                    end
                                %3.1.8
                                end
                        %3.1.7
                        end
                        %3.1.6
                    end
                    %3.1.5
                    end
                %3.1.4
                end
            %3.1.3
            end
          %3.1.2
end
          %3.4.1
end
        % 3.1      
        end
    % 2.1    
    end
% 1        
    end
end
    end
end
    end
end
    end
end
    end
end
    end
end
    end
end
    end
end
    end
end

lengthPracticeInterval = now - startPracticeInterval3;
correctas = num2str(counterCorrectas);
incorrectas = num2str(counterIncorrectas);


if (counterCorrectas+counterIncorrectas)>0
    if (counterCorrectas/(counterCorrectas+counterIncorrectas))>.79
    proportion=' over or equal to 80 per cent.';
    getPayed=1;
else
    proportion=' under 80 per cent.';
    getPayed=0;
    end
else
    proportion=' over or equal to 80 per cent.';
    getPayed=1;
end


fprintf(myfile,'The length of the 3m16s interval is %.5f \n\n', lengthPracticeInterval);

Answer = 'Interval Ended. Please click the button labeled "Next" to continue.';

realInt = 196;
percentualDifference = (abs(lengthPracticeInterval-realInt))/realInt;

if percentualDifference >0.2
    getPayedYes='$0';
end
if getPayed==1
if percentualDifference <= 0.2 && percentualDifference > 0.10 && getPayed==1
    getPayedYes=lowPayment;

end
    if percentualDifference <= 0.10 && percentualDifference > 0.05 && getPayed==1
        getPayedYes=midPayment;
    end
        if percentualDifference <= 0.05 && getPayed==1
                getPayedYes=highPayment;
        end
else
    getPayedYes='$0';
end
        
% PAYMENTS  
text='3m16s';
deviationInt = abs(lengthPracticeInterval-realInt);
proportionCorrectas = counterCorrectas/(counterCorrectas+counterIncorrectas);

         fprintf(myfileData, '%.2f \n', proportionCorrectas);
         fprintf(myfileData, '%.5f \n', lengthPracticeInterval);
fprintf(payoffs, '%s \t\t %.5f \t\t %.5f \t\t %.5f \t\t %.2f \t\t\t\t %i \t\t\t\t\t %i \t\t\t\t\t %.2f \t\t\t %s \t\t %s \n\n', text, realInt, lengthPracticeInterval, deviationInt, percentualDifference, counterCorrectas, counterIncorrectas, proportionCorrectas, getPayedYes, intNumber3m16s);
fprintf(shortPayoffs, '%s \t\t %s \t\t\t %s\n\n',intNumber3m16s, text, getPayedYes);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mouseX=0; mouseY=0;

DrawFormattedText(wPtr, Answer, [positionX], [positionY], [0 0 0]);
Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
Screen('Flip',wPtr);

WaitSecs(afterStopInterval); 

while mouseX<x7 | mouseY>y1
DrawFormattedText(wPtr, Answer, [positionX], [positionY], [0 0 0]);
Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
Screen('Flip',wPtr);

% Wait for mouse click in next button
[clicks,mouseX,mouseY,whichButton] = GetClicks();
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%SCREEN INSTRUCTIONS 30 - (Instructions for 1m 29s int)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Screen('TextFont',wPtr,'Helvetica');
Screen('TextSize',wPtr,18);

mouseX=0; mouseY=0;

        DrawFormattedText(wPtr, 'Please produce an interval of 1 minute 29 seconds.\n\n\n\n\nClick "Start Interval" to start the interval.', [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        Screen('DrawText',wPtr,StartInterval,x7+(x1/8),y0+(y1/2),[0 0 0]);
        Screen('Flip',wPtr);
        
WaitSecs(startIntervalInstructions);

        % Wait for key press
        while mouseX<x7 | mouseY>y1
        DrawFormattedText(wPtr, 'Please produce an interval of 1 minute 29 seconds.\n\n\n\n\nClick "Start Interval" to start the interval.', [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        Screen('DrawText',wPtr,StartInterval,x7+(x1/8),y0+(y1/2),[0 0 0]);
        Screen('Flip',wPtr);

        % Wait for mouse click in next button
        [clicks,mouseX,mouseY,whichButton] = GetClicks();
        end

        

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%SCREEN INSTRUCTIONS 31 - (1m29s int)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
instructionsInt6task1 = 'Please click the cell where the column to the right of the column labeled daffodil intersects the row above the row labeled clubs.';
% 3/5 name24={'hearts' 'spades' 'diamonds' 'clubs'           'rose' 'daisie' 'orchid' 'daffodil' 'iris' 'sunflower' 'sweetpea'};
instructionsInt6task2 = 'Please click the cell where the rooftop row intersects the column to the left of the column labeled goat.';
% 3/1 name25={'bedroom' 'kitchen' 'rooftop' 'balcony' 'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};
instructionsInt6task3 = 'Please click the cell where the column to the left of the uranus column intersects the row above the pencil row.';
% 1/5 name26={'pen' 'pencil' 'eraser' 'ruler'         'saturn' 'earth' 'neptune' 'mercury' 'jupiter' 'uranus' 'venus'};
instructionsInt6task4 = 'Please click the cell where the truck row intersects the column to the right of the column labeled pants.';
% 2/4 name27={'car' 'truck' 'bike' 'bus'               'shoe' 'coat' 'pants' 'scarf' 'shorts' 'gloves' 'jacket'};
instructionsInt6task5 = 'Please click the cell where the column to the right of the boxer column intersects the row above the flats row.';
% 2/6 name28={'boots' 'moccasin' 'flats' 'sandals'     'terrier' 'beagle' 'chihuahua' 'mastiff' 'boxer' 'pug' 'greyhound'};
instructionsInt6task6 = 'Please click the cell where the row above the row labeled sofa intersects the column to the left of the hockey column.';
% 1/1 name29={'chair' 'sofa' 'bed' 'bench'            'football' 'hockey' 'soccer' 'baseball' 'rugby' 'lacross' 'basketball'};
instructionsInt6task7 = 'Please click the cell where the column to the right of the grape column intersects the row above the yellow row.';
% 3/5 name30={'red' 'green' 'blue' 'yellow'            'banana' 'peach' 'apple' 'grape' 'orange' 'pear' 'lemon'};
instructionsInt6task8 = 'Please click the cell where the earth row intersects the column to the left of the column labeled fusilli.';
% 3/2 name31={'sea' 'sky' 'earth' 'space'             'spaghetti' 'capellini' 'fusilli' 'lasagne' 'linguine' 'fettuccine' 'cannelloni'};
instructionsInt6task9 = 'Please click the cell where the column to the right of the cow column intersects the row below the woman row.';
% 4/2 name32={'girl' 'man' 'woman' 'boy'              'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};

fprintf(myfile,'Beginning of int of 1 minute 29 seconds \n');
EndInterval2 = strcat(EndInterval, ' of\n1 minute\n29 seconds');

clickBegins=GetSecs();
startPracticeInterval3=clickBegins;
now = clickBegins;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;
counterCorrectas=0;
counterIncorrectas=0;
buttonEnd=0;

fprintf(myfile,'Beginning of task \n');

DrawFormattedText(wPtr, instructionsInt6task1, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name24{1}; 
row2= name24{2};
row3= name24{3};
row4= name24{4};

col1= name24{5};
col2= name24{6};
col3= name24{7};
col4= name24{8};
col5= name24{9};
col6= name24{10};
col7= name24{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);

WaitSecs(afterStartInterval);

% If hasnt clicked on "end int" button
% 1
if buttonEnd == 0
    
    % Until he presses the end button or time for task runs out
    % 2
while (mouseY < R3(2) | mouseY > R3(4) | mouseX < C5(1) | mouseX > C5(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m29sTask1Lasts        
        % 3
        while ~max(buttons) && now < clickBegins + int1m29sTask1Lasts
        DrawFormattedText(wPtr, instructionsInt6task1, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name24{1}; 
row2= name24{2};
row3= name24{3};
row4= name24{4};

col1= name24{5};
col2= name24{6};
col3= name24{7};
col4= name24{8};
col5= name24{9};
col6= name24{10};
col7= name24{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startPracticeInterval3;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R3(2) && mouseY <= R3(4) && mouseX >= C5(1) && mouseX <= C5(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
        
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int1m29sTask1Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
    
    
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions); % Since there is a click
    % 2    
    end
    
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m29sTask1Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int1m29sTask1Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2
    while (mouseY < R3(2) | mouseY > R3(4) | mouseX < C1(1) | mouseX > C1(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m29sTask2Lasts        
        % 3.3
        while ~max(buttons) && now < clickBegins + int1m29sTask2Lasts
        DrawFormattedText(wPtr, instructionsInt6task2, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name25{1}; 
row2= name25{2};
row3= name25{3};
row4= name25{4};

col1= name25{5};
col2= name25{6};
col3= name25{7};
col4= name25{8};
col5= name25{9};
col6= name25{10};
col7= name25{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R3(2) && mouseY <= R3(4) && mouseX >= C1(1) && mouseX <= C1(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int1m29sTask2Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m29sTask2Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int1m29sTask2Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.2
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.2
    while (mouseY < R1(2) | mouseY > R1(4) | mouseX < C5(1) | mouseX > C5(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m29sTask3Lasts        
        % 3.3.2
        while ~max(buttons) && now < clickBegins + int1m29sTask3Lasts
        DrawFormattedText(wPtr, instructionsInt6task3, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name26{1}; 
row2= name26{2};
row3= name26{3};
row4= name26{4};

col1= name26{5};
col2= name26{6};
col3= name26{7};
col4= name26{8};
col5= name26{9};
col6= name26{10};
col7= name26{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.2
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R1(2) && mouseY <= R1(4) && mouseX >= C5(1) && mouseX <= C5(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int1m29sTask3Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.2    
    end
    

        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m29sTask3Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int1m29sTask3Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.3
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.3
    while (mouseY < R2(2) | mouseY > R2(4) | mouseX < C4(1) | mouseX > C4(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m29sTask4Lasts        
        % 3.3.3
        while ~max(buttons) && now < clickBegins + int1m29sTask4Lasts
        DrawFormattedText(wPtr, instructionsInt6task4, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name27{1}; 
row2= name27{2};
row3= name27{3};
row4= name27{4};

col1= name27{5};
col2= name27{6};
col3= name27{7};
col4= name27{8};
col5= name27{9};
col6= name27{10};
col7= name27{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.3
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R2(2) && mouseY <= R2(4) && mouseX >= C4(1) && mouseX <= C4(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int1m29sTask4Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.3    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m29sTask4Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int1m29sTask4Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.4
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.4
    while (mouseY < R2(2) | mouseY > R2(4) | mouseX < C6(1) | mouseX > C6(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m29sTask5Lasts        
        % 3.3.4
        while ~max(buttons) && now < clickBegins + int1m29sTask5Lasts
        DrawFormattedText(wPtr, instructionsInt6task5, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name28{1}; 
row2= name28{2};
row3= name28{3};
row4= name28{4};

col1= name28{5};
col2= name28{6};
col3= name28{7};
col4= name28{8};
col5= name28{9};
col6= name28{10};
col7= name28{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.4
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R2(2) && mouseY <= R2(4) && mouseX >= C6(1) && mouseX <= C6(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int1m29sTask5Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.4    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m29sTask5Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int1m29sTask5Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.5
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.5
    while (mouseY < R1(2) | mouseY > R1(4) | mouseX < C1(1) | mouseX > C1(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m29sTask6Lasts        
        % 3.3.5
        while ~max(buttons) && now < clickBegins + int1m29sTask6Lasts
        DrawFormattedText(wPtr, instructionsInt6task6, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name29{1}; 
row2= name29{2};
row3= name29{3};
row4= name29{4};

col1= name29{5};
col2= name29{6};
col3= name29{7};
col4= name29{8};
col5= name29{9};
col6= name29{10};
col7= name29{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.5
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R1(2) && mouseY <= R1(4) && mouseX >= C1(1) && mouseX <= C1(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int1m29sTask6Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.5    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m29sTask6Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int1m29sTask6Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.6
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.6
    while (mouseY < R3(2) | mouseY > R3(4) | mouseX < C5(1) | mouseX > C5(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m29sTask7Lasts        
        % 3.3.6
        while ~max(buttons) && now < clickBegins + int1m29sTask7Lasts
        DrawFormattedText(wPtr, instructionsInt6task7, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name30{1}; 
row2= name30{2};
row3= name30{3};
row4= name30{4};

col1= name30{5};
col2= name30{6};
col3= name30{7};
col4= name30{8};
col5= name30{9};
col6= name30{10};
col7= name30{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.6
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R3(2) && mouseY <= R3(4) && mouseX >= C5(1) && mouseX <= C5(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int1m29sTask7Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.6    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m29sTask7Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int1m29sTask7Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.7
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.7
    while (mouseY < R3(2) | mouseY > R3(4) | mouseX < C2(1) | mouseX > C2(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m29sTask8Lasts        
        % 3.3.7
        while ~max(buttons) && now < clickBegins + int1m29sTask8Lasts
        DrawFormattedText(wPtr, instructionsInt6task8, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name31{1}; 
row2= name31{2};
row3= name31{3};
row4= name31{4};

col1= name31{5};
col2= name31{6};
col3= name31{7};
col4= name31{8};
col5= name31{9};
col6= name31{10};
col7= name31{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.7
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R3(2) && mouseY <= R3(4) && mouseX >= C2(1) && mouseX <= C2(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int1m29sTask8Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.7    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m29sTask8Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int1m29sTask8Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.8
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.8
    while (mouseY < R4(2) | mouseY > R4(4) | mouseX < C2(1) | mouseX > C2(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m29sTask9Lasts        
        % 3.3.8
        while ~max(buttons) && now < clickBegins + int1m29sTask9Lasts
        DrawFormattedText(wPtr, instructionsInt6task9, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name32{1}; 
row2= name32{2};
row3= name32{3};
row4= name32{4};

col1= name32{5};
col2= name32{6};
col3= name32{7};
col4= name32{8};
col5= name32{9};
col6= name32{10};
col7= name32{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.8
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R4(2) && mouseY <= R4(4) && mouseX >= C2(1) && mouseX <= C2(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int1m29sTask9Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.8    
    end
    

        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m29sTask9Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int1m29sTask9Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
        
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                                % 4.1
                                end
                                %3.1.8
                                end
                        %3.1.7
                        end
                        %3.1.6
                    end
                    %3.1.5
                    end
                %3.1.4
                end
            %3.1.3
            end
          %3.1.2
          end
        % 3.1      
        end
    % 2.1    
    end
% 1        
    end
end
    end
end
    end
end
    end
end

lengthPracticeInterval = now - startPracticeInterval3;
correctas = num2str(counterCorrectas);
incorrectas = num2str(counterIncorrectas);


if (counterCorrectas+counterIncorrectas)>0
    if (counterCorrectas/(counterCorrectas+counterIncorrectas))>.79
    proportion=' over or equal to 80 per cent.';
    getPayed=1;
else
    proportion=' under 80 per cent.';
    getPayed=0;
    end
else
    proportion=' over or equal to 80 per cent.';
    getPayed=1;
end


fprintf(myfile,'The length of the 1m29s interval is %.5f \n\n', lengthPracticeInterval);

Answer = 'Interval Ended. Please click the button labeled "Next" to continue.';

realInt = 89;
percentualDifference = (abs(lengthPracticeInterval-realInt))/realInt;

if percentualDifference >0.2
    getPayedYes='$0';
end
if getPayed==1
if percentualDifference <= 0.2 && percentualDifference > 0.10 && getPayed==1
    getPayedYes=lowPayment;

end
    if percentualDifference <= 0.10 && percentualDifference > 0.05 && getPayed==1
        getPayedYes=midPayment;
    end
        if percentualDifference <= 0.05 && getPayed==1
                getPayedYes=highPayment;
        end
else
    getPayedYes='$0';
end
       
        
text='1m29s';
deviationInt = abs(lengthPracticeInterval-realInt);
proportionCorrectas = counterCorrectas/(counterCorrectas+counterIncorrectas);


         fprintf(myfileData, '%.2f \n', proportionCorrectas);
         fprintf(myfileData, '%.5f \n', lengthPracticeInterval);
fprintf(payoffs, '%s \t\t %.5f \t\t %.5f \t\t %.5f \t\t %.2f \t\t\t\t %i \t\t\t\t\t %i \t\t\t\t\t %.2f \t\t\t %s \t\t %s \n\n', text, realInt, lengthPracticeInterval, deviationInt, percentualDifference, counterCorrectas, counterIncorrectas, proportionCorrectas, getPayedYes,intNumber1m29s);
fprintf(shortPayoffs, '%s \t\t %s \t\t\t %s\n\n',intNumber1m29s, text, getPayedYes);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mouseX=0; mouseY=0;

DrawFormattedText(wPtr, Answer, [positionX], [positionY], [0 0 0]);
Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
Screen('Flip',wPtr);
WaitSecs(afterStopInterval);

while mouseX<x7 | mouseY>y1
DrawFormattedText(wPtr, Answer, [positionX], [positionY], [0 0 0]);
Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
Screen('Flip',wPtr);

% Wait for mouse click in next button
[clicks,mouseX,mouseY,whichButton] = GetClicks();
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%SCREEN INSTRUCTIONS 26 - (Instructions for 41s int)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Screen('TextFont',wPtr,'Helvetica');
Screen('TextSize',wPtr,18);

mouseX=0; mouseY=0;

        DrawFormattedText(wPtr, 'Please produce an interval of 41 seconds.\n\n\n\n\nClick "Start Interval" to start the interval.', [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        Screen('DrawText',wPtr,StartInterval,x7+(x1/8),y0+(y1/2),[0 0 0]);
        Screen('Flip',wPtr);
WaitSecs(startIntervalInstructions);


        % Wait for key press
        while mouseX<x7 | mouseY>y1
        DrawFormattedText(wPtr, 'Please produce an interval of 41 seconds.\n\n\n\n\nClick "Start Interval" to start the interval.', [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        Screen('DrawText',wPtr,StartInterval,x7+(x1/8),y0+(y1/2),[0 0 0]);
        Screen('Flip',wPtr);

        % Wait for mouse click in next button
        [clicks,mouseX,mouseY,whichButton] = GetClicks();
        end
        

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%SCREEN INSTRUCTIONS 27 - (41s int)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
instructionsInt3task1 = 'Please click the cell where the column to the left of the column labeled potential intersects the row labeled chopper.';
% 2/1 name8={'touring' 'chopper' 'scooter' 'offroad'  'kinetic' 'potential' 'thermal' 'chemical' 'electrical' 'nuclear' 'magnetic'};
instructionsInt3task2 = 'Please click the cell where the row above the row labeled spades intersects the column labeled sunflower.';
% 1/6 name9={'hearts, 'spades' 'diamonds' 'clubs'            'rose' 'daisie' 'orchid' 'daffodil' 'iris' 'sunflower' 'sweetpea'};
instructionsInt3task3 = 'Please click the cell where the column to the right of the cat column intersects the row above the rooftop row.';
% 2/5 name10={'bedroom' 'kitchen' 'rooftop' 'balcony'   'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};
instructionsInt3task4 = 'Please click the cell where the row below the row labeled bed intersects the column to the left of the column labeled baseball.';
% 4/3 name11={'chair' 'sofa' 'bed' 'bench'            'football' 'hockey' 'soccer' 'baseball' 'rugby' 'lacross' 'basketball'};

fprintf(myfile,'Beginning of int of 41 seconds \n');
EndInterval2 = strcat(EndInterval, ' of\n41 seconds');

clickBegins=GetSecs();
startPracticeInterval3=clickBegins;
now = clickBegins;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;
counterCorrectas=0;
counterIncorrectas=0;
buttonEnd=0;

fprintf(myfile,'Beginning of task \n');


DrawFormattedText(wPtr, instructionsInt3task1, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name8{1};
row2= name8{2};
row3= name8{3};
row4= name8{4};

col1= name8{5};
col2= name8{6};
col3= name8{7};
col4= name8{8};
col5= name8{9};
col6= name8{10};
col7= name8{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);

WaitSecs(afterStartInterval);

% If hasnt clicked on "end int" button
% 1
if buttonEnd == 0
    
    % Until he presses the end button or time for task runs out
    % 2
while (mouseY < R2(2) | mouseY > R2(4) | mouseX < C1(1) | mouseX > C1(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int41sTask1Lasts        
        % 3
        while ~max(buttons) && now < clickBegins + int41sTask1Lasts
        DrawFormattedText(wPtr, instructionsInt3task1, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name8{1};
row2= name8{2};
row3= name8{3};
row4= name8{4};

col1= name8{5};
col2= name8{6};
col3= name8{7};
col4= name8{8};
col5= name8{9};
col6= name8{10};
col7= name8{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startPracticeInterval3;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R2(2) && mouseY <= R2(4) && mouseX >= C1(1) && mouseX <= C1(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
        
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int41sTask1Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
    
    
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions); % Since there is a click
    % 2    
    end
    
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int41sTask1Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int41sTask1Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2
    while (mouseY < R1(2) | mouseY > R1(4) | mouseX < C6(1) | mouseX > C6(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int41sTask2Lasts        
        % 3.3
        while ~max(buttons) && now < clickBegins + int41sTask2Lasts
        DrawFormattedText(wPtr, instructionsInt3task2, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name9{1};
row2= name9{2};
row3= name9{3};
row4= name9{4};

col1= name9{5};
col2= name9{6};
col3= name9{7};
col4= name9{8};
col5= name9{9};
col6= name9{10};
col7= name9{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R1(2) && mouseY <= R1(4) && mouseX >= C6(1) && mouseX <= C6(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int41sTask2Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2    
    end

  fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int41sTask2Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int41sTask2Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.2
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.2
    while (mouseY < R2(2) | mouseY > R2(4) | mouseX < C5(1) | mouseX > C5(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int41sTask3Lasts        
        % 3.3.2
        while ~max(buttons) && now < clickBegins + int41sTask3Lasts
        DrawFormattedText(wPtr, instructionsInt3task3, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name10{1};
row2= name10{2};
row3= name10{3};
row4= name10{4};

col1= name10{5};
col2= name10{6};
col3= name10{7};
col4= name10{8};
col5= name10{9};
col6= name10{10};
col7= name10{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.2
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R2(2) && mouseY <= R2(4) && mouseX >= C5(1) && mouseX <= C5(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int41sTask3Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.2    
    end
    
  fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int41sTask3Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int41sTask3Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.3
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.3
    while (mouseY < R4(2) | mouseY > R4(4) | mouseX < C3(1) | mouseX > C3(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int41sTask4Lasts        
        % 3.3.3
        while ~max(buttons) && now < clickBegins + int41sTask4Lasts
        DrawFormattedText(wPtr, instructionsInt3task4, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name11{1};
row2= name11{2};
row3= name11{3};
row4= name11{4};

col1= name11{5};
col2= name11{6};
col3= name11{7};
col4= name11{8};
col5= name11{9};
col6= name11{10};
col7= name11{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.3
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R4(2) && mouseY <= R4(4) && mouseX >= C3(1) && mouseX <= C3(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int41sTask4Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.3    
    end
    
  fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int41sTask4Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int41sTask4Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end         
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                 % 4.1
                 end
            %3.1.3
            end
          %3.1.2
          end
        % 3.1      
        end
    % 2.1    
    end
% 1        
end
    end

end

lengthPracticeInterval = now - startPracticeInterval3;
correctas = num2str(counterCorrectas);
incorrectas = num2str(counterIncorrectas);

if (counterCorrectas+counterIncorrectas)>0
    if (counterCorrectas/(counterCorrectas+counterIncorrectas))>.79
    proportion=' over or equal to 80 per cent.';
    getPayed=1;
else
    proportion=' under 80 per cent.';
    getPayed=0;
    end
else
    proportion=' over or equal to 80 per cent.';
    getPayed=1;
end


fprintf(myfile,'The length of the 41s interval is %.5f \n\n', lengthPracticeInterval);

Answer = 'Interval Ended. Please click the button labeled "Next" to continue.';

realInt = 41;
percentualDifference = (abs(lengthPracticeInterval-realInt))/realInt;

if percentualDifference >0.2
    getPayedYes='$0';
end
if getPayed==1
if percentualDifference <= 0.2 && percentualDifference > 0.10 && getPayed==1
    getPayedYes=lowPayment;

end
    if percentualDifference <= 0.10 && percentualDifference > 0.05 && getPayed==1
        getPayedYes=midPayment;
    end
        if percentualDifference <= 0.05 && getPayed==1
                getPayedYes=highPayment;
        end
else
    getPayedYes='$0';
end
       
        
text='0m41s';
deviationInt = abs(lengthPracticeInterval-realInt);
proportionCorrectas = counterCorrectas/(counterCorrectas+counterIncorrectas);


         fprintf(myfileData, '%.2f \n', proportionCorrectas);
         fprintf(myfileData, '%.5f \n', lengthPracticeInterval);
fprintf(payoffs, '%s \t\t %.5f \t\t %.5f \t\t %.5f \t\t %.2f \t\t\t\t %i \t\t\t\t\t %i \t\t\t\t\t %.2f \t\t\t %s \t\t %s \n\n', text, realInt, lengthPracticeInterval, deviationInt, percentualDifference, counterCorrectas, counterIncorrectas, proportionCorrectas, getPayedYes, intNumber0m41s);
fprintf(shortPayoffs, '%s \t\t %s \t\t\t %s\n\n',intNumber0m41s, text, getPayedYes);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mouseX=0; mouseY=0;


DrawFormattedText(wPtr, Answer, [positionX], [positionY], [0 0 0]);
Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
Screen('Flip',wPtr);
WaitSecs(afterStopInterval);

while mouseX<x7 | mouseY>y1
DrawFormattedText(wPtr, Answer, [positionX], [positionY], [0 0 0]);
Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
Screen('Flip',wPtr);

% Wait for mouse click in next button
[clicks,mouseX,mouseY,whichButton] = GetClicks();
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%SCREEN INSTRUCTIONS 28 - (Instructions for 1m 9s int)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Screen('TextFont',wPtr,'Helvetica');
Screen('TextSize',wPtr,18);

mouseX=0; mouseY=0;

        DrawFormattedText(wPtr, 'Please produce an interval of 1 minute 9 seconds.\n\n\n\n\nClick "Start Interval" to start the interval.', [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        Screen('DrawText',wPtr,StartInterval,x7+(x1/8),y0+(y1/2),[0 0 0]);
        Screen('Flip',wPtr);
WaitSecs(startIntervalInstructions);


        % Wait for key press
        while mouseX<x7 | mouseY>y1
        DrawFormattedText(wPtr, 'Please produce an interval of 1 minute 9 seconds.\n\n\n\n\nClick "Start Interval" to start the interval.', [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        Screen('DrawText',wPtr,StartInterval,x7+(x1/8),y0+(y1/2),[0 0 0]);
        Screen('Flip',wPtr);

        % Wait for mouse click in next button
        [clicks,mouseX,mouseY,whichButton] = GetClicks();
        end
        

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%SCREEN INSTRUCTIONS 29 - (1m9s int)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
instructionsInt5task1 = 'Please click the cell where the row below the row labeled run intersects the classical column.';
% 2/5 name17={'run' 'sleep' 'eat' 'play'              'jazz' 'pop' 'salsa' 'rap' 'classical' 'folk' 'rock'};
instructionsInt5task2 = 'Please click the cell where the row below the triangle row intersects the column to the right of the iron column.';
% 4/4 name18={'circle' 'square' 'triangle' 'rectangle' 'oxygen' 'lead' 'iron' 'arsenic' 'silicon' 'lithium' 'carbon'};
instructionsInt5task3 = 'Please click the cell where the column to the right of the column labeled sculpture intersects the tomato row.';
% 1/3 name19={'tomato' 'broccoli' 'squash' 'carrot  ' 'painting' 'sculpture' 'dance' 'music' 'film' 'architecture' 'theatre'};
instructionsInt5task4 = 'Please click the cell where the row above the chemistry row intersects the column to the left of the atlas column.';
% 2/5 name20={'physics' 'biology' 'chemistry' 'geology' 'hades' 'zeus' 'poseidon' 'athena' 'apollo' 'atlas' 'perses'};
instructionsInt5task5 = 'Please click the cell where the piano row intersects the column labeled cat.';
% 3/4 name21={'guitar' 'trumpet' 'piano' 'drums'       'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};
instructionsInt5task6 = 'Please click the cell where the row above the Texas row intersects the column to the left of the column labeled fox.';
% 2/2 name22={'California' 'Iowa' 'Texas' 'Alaska'     'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};
instructionsInt5task7 = 'Please click the cell where the trunk row intersects the column to the right of the column labeled Nigeria.';
% 3/5 name23={'buds' 'leaves' 'trunk' 'roots'          'Cuba' 'Ghana' 'Iraq' 'Nigeria' 'Romania' 'Italy' 'Japan'};

fprintf(myfile,'Beginning of int of 1 minute 9 seconds \n');
EndInterval2 = strcat(EndInterval, ' of\n1 minute\n9 seconds');

clickBegins=GetSecs();
startPracticeInterval3=clickBegins;
now = clickBegins;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;
counterCorrectas=0;
counterIncorrectas=0;
buttonEnd=0;

fprintf(myfile,'Beginning of task \n');


DrawFormattedText(wPtr, instructionsInt5task1, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name17{1}; 
row2= name17{2};
row3= name17{3};
row4= name17{4};

col1= name17{5};
col2= name17{6};
col3= name17{7};
col4= name17{8};
col5= name17{9};
col6= name17{10};
col7= name17{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
WaitSecs(afterStartInterval);

% If hasnt clicked on "end int" button
% 1
if buttonEnd == 0
    
    % Until he presses the end button or time for task runs out
    % 2
while (mouseY < R2(2) | mouseY > R2(4) | mouseX < C5(1) | mouseX > C5(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m9sTask1Lasts        
        % 3
        while ~max(buttons) && now < clickBegins + int1m9sTask1Lasts
        DrawFormattedText(wPtr, instructionsInt5task1, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name17{1}; 
row2= name17{2};
row3= name17{3};
row4= name17{4};

col1= name17{5};
col2= name17{6};
col3= name17{7};
col4= name17{8};
col5= name17{9};
col6= name17{10};
col7= name17{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startPracticeInterval3;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R2(2) && mouseY <= R2(4) && mouseX >= C5(1) && mouseX <= C5(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
        
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int1m9sTask1Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
    
    
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions); % Since there is a click
    % 2    
    end
    
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m9sTask1Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int1m9sTask1Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2
    while (mouseY < R4(2) | mouseY > R4(4) | mouseX < C4(1) | mouseX > C4(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m9sTask2Lasts        
        % 3.3
        while ~max(buttons) && now < clickBegins + int1m9sTask2Lasts
        DrawFormattedText(wPtr, instructionsInt5task2, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name18{1}; 
row2= name18{2};
row3= name18{3};
row4= name18{4};

col1= name18{5};
col2= name18{6};
col3= name18{7};
col4= name18{8};
col5= name18{9};
col6= name18{10};
col7= name18{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R4(2) && mouseY <= R4(4) && mouseX >= C4(1) && mouseX <= C4(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int1m9sTask2Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2    
    end
    
  fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m9sTask2Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int1m9sTask2Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.2
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.2
    while (mouseY < R1(2) | mouseY > R1(4) | mouseX < C3(1) | mouseX > C3(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m9sTask3Lasts        
        % 3.3.2
        while ~max(buttons) && now < clickBegins + int1m9sTask3Lasts
        DrawFormattedText(wPtr, instructionsInt5task3, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name19{1}; 
row2= name19{2};
row3= name19{3};
row4= name19{4};

col1= name19{5};
col2= name19{6};
col3= name19{7};
col4= name19{8};
col5= name19{9};
col6= name19{10};
col7= name19{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.2
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R1(2) && mouseY <= R1(4) && mouseX >= C3(1) && mouseX <= C3(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int1m9sTask3Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.2    
    end
    
  fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m9sTask3Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int1m9sTask3Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.3
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.3
    while (mouseY < R2(2) | mouseY > R2(4) | mouseX < C5(1) | mouseX > C5(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m9sTask4Lasts        
        % 3.3.3
        while ~max(buttons) && now < clickBegins + int1m9sTask4Lasts
        DrawFormattedText(wPtr, instructionsInt5task4, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name20{1}; 
row2= name20{2};
row3= name20{3};
row4= name20{4};

col1= name20{5};
col2= name20{6};
col3= name20{7};
col4= name20{8};
col5= name20{9};
col6= name20{10};
col7= name20{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.3
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R2(2) && mouseY <= R2(4) && mouseX >= C5(1) && mouseX <= C5(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int1m9sTask4Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.3    
    end
      fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m9sTask4Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int1m9sTask4Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.4
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.4
    while (mouseY < R3(2) | mouseY > R3(4) | mouseX < C4(1) | mouseX > C4(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m9sTask5Lasts        
        % 3.3.4
        while ~max(buttons) && now < clickBegins + int1m9sTask5Lasts
        DrawFormattedText(wPtr, instructionsInt5task5, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name21{1}; 
row2= name21{2};
row3= name21{3};
row4= name21{4};

col1= name21{5};
col2= name21{6};
col3= name21{7};
col4= name21{8};
col5= name21{9};
col6= name21{10};
col7= name21{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.4
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R3(2) && mouseY <= R3(4) && mouseX >= C4(1) && mouseX <= C4(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int1m9sTask5Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.4    
    end
      fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m9sTask5Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int1m9sTask5Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.5
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.5
    while (mouseY < R2(2) | mouseY > R2(4) | mouseX < C2(1) | mouseX > C2(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m9sTask6Lasts        
        % 3.3.5
        while ~max(buttons) && now < clickBegins + int1m9sTask6Lasts
        DrawFormattedText(wPtr, instructionsInt5task6, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name22{1}; 
row2= name22{2};
row3= name22{3};
row4= name22{4};

col1= name22{5};
col2= name22{6};
col3= name22{7};
col4= name22{8};
col5= name22{9};
col6= name22{10};
col7= name22{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.5
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R2(2) && mouseY <= R2(4) && mouseX >= C2(1) && mouseX <= C2(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int1m9sTask6Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.5    
    end
    
  fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m9sTask6Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int1m9sTask6Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.6
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.6
    while (mouseY < R3(2) | mouseY > R3(4) | mouseX < C5(1) | mouseX > C5(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m9sTask7Lasts        
        % 3.3.6
        while ~max(buttons) && now < clickBegins + int1m9sTask7Lasts
        DrawFormattedText(wPtr, instructionsInt5task7, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name23{1}; 
row2= name23{2};
row3= name23{3};
row4= name23{4};

col1= name23{5};
col2= name23{6};
col3= name23{7};
col4= name23{8};
col5= name23{9};
col6= name23{10};
col7= name23{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.6
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R3(2) && mouseY <= R3(4) && mouseX >= C5(1) && mouseX <= C5(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int1m9sTask7Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.6    
    end
    
  fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int1m9sTask7Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int1m9sTask7Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                         % 4.1
                           end
                        %3.1.6
                    end
                    %3.1.5
                    end
                %3.1.4
                end
            %3.1.3
            end
          %3.1.2
          end
        % 3.1      
        end
    % 2.1    
    end
% 1        
    end
end
    end
end
    end
end

lengthPracticeInterval = now - startPracticeInterval3;
correctas = num2str(counterCorrectas);
incorrectas = num2str(counterIncorrectas);

if (counterCorrectas+counterIncorrectas)>0
    if (counterCorrectas/(counterCorrectas+counterIncorrectas))>.79
    proportion=' over or equal to 80 per cent.';
    getPayed=1;
else
    proportion=' under 80 per cent.';
    getPayed=0;
    end
else
    proportion=' over or equal to 80 per cent.';
    getPayed=1;
end


fprintf(myfile,'The length of the 1m09s interval is %.5f \n\n', lengthPracticeInterval);

Answer = 'Interval Ended. Please click the button labeled "Next" to continue.';

realInt = 69;
percentualDifference = (abs(lengthPracticeInterval-realInt))/realInt;

if percentualDifference >0.2
    getPayedYes='$0';
end
if getPayed==1
if percentualDifference <= 0.2 && percentualDifference > 0.10 && getPayed==1
    getPayedYes=lowPayment;

end
    if percentualDifference <= 0.10 && percentualDifference > 0.05 && getPayed==1
        getPayedYes=midPayment;
    end
        if percentualDifference <= 0.05 && getPayed==1
                getPayedYes=highPayment;
        end
else
    getPayedYes='$0';
end
       
        
text='1m09s';
deviationInt = abs(lengthPracticeInterval-realInt);
proportionCorrectas = counterCorrectas/(counterCorrectas+counterIncorrectas);


         fprintf(myfileData, '%.2f \n', proportionCorrectas);
         fprintf(myfileData, '%.5f \n', lengthPracticeInterval);
fprintf(payoffs, '%s \t\t %.5f \t\t %.5f \t\t %.5f \t\t %.2f \t\t\t\t %i \t\t\t\t\t %i \t\t\t\t\t %.2f \t\t\t %s \t\t %s \n\n', text, realInt, lengthPracticeInterval, deviationInt, percentualDifference, counterCorrectas, counterIncorrectas, proportionCorrectas, getPayedYes, intNumber1m09s);
fprintf(shortPayoffs, '%s \t\t %s \t\t\t %s\n\n',intNumber1m09s, text, getPayedYes);
         
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mouseX=0; mouseY=0;

DrawFormattedText(wPtr, Answer, [positionX], [positionY], [0 0 0]);
Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
Screen('Flip',wPtr);
WaitSecs(afterStopInterval);

while mouseX<x7 | mouseY>y1
DrawFormattedText(wPtr, Answer, [positionX], [positionY], [0 0 0]);
Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
Screen('Flip',wPtr);

% Wait for mouse click in next button
[clicks,mouseX,mouseY,whichButton] = GetClicks();
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%SCREEN INSTRUCTIONS 22 - (Instructions for 24s int)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Screen('TextFont',wPtr,'Helvetica');
Screen('TextSize',wPtr,18);

mouseX=0; mouseY=0;

        DrawFormattedText(wPtr, 'Please produce an interval of 24 seconds.\n\n\n\n\nClick "Start Interval" to start the interval.', [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        Screen('DrawText',wPtr,StartInterval,x7+(x1/8),y0+(y1/2),[0 0 0]);
        Screen('Flip',wPtr);
        
        WaitSecs(startIntervalInstructions);
        
        % Wait for key press
        while mouseX<x7 | mouseY>y1
        DrawFormattedText(wPtr, 'Please produce an interval of 24 seconds.\n\n\n\n\nClick "Start Interval" to start the interval.', [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        Screen('DrawText',wPtr,StartInterval,x7+(x1/8),y0+(y1/2),[0 0 0]);
        Screen('Flip',wPtr);

        % Wait for mouse click in next button
        [clicks,mouseX,mouseY,whichButton] = GetClicks();
        end
        
 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%SCREEN INSTRUCTIONS 23 - (24s int)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
instructionsInt1task1 = 'Please click the cell where the column to the right of the column labeled peach intersects the blue row.';
% name1={'red' 'green' 'blue' 'yellow'            'banana' 'peach' 'apple' 'grape' 'orange' 'pear' 'lemon'};
instructionsInt1task2 = 'Please click the cell where the horse column intersects the row below the piano row.';
% name2={'guitar' 'trumpet' 'piano' 'drums'       'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};
instructionsInt1task3 = 'Please click the cell where the the row above the row labeled truck intersects the column to the left of the column labeled shorts.';
% name3={'car' 'truck' 'bike' 'bus'               'shoe' 'coat' 'pants' 'scarf' 'shorts' 'gloves' 'jacket'};

fprintf(myfile,'Beginning of int of 24 seconds \n');
EndInterval2 = strcat(EndInterval, ' of\n24 seconds');

clickBegins=GetSecs();
startPracticeInterval3=clickBegins;
now = clickBegins;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;
counterCorrectas=0;
counterIncorrectas=0;
buttonEnd=0;

fprintf(myfile,'Beginning of task \n');


DrawFormattedText(wPtr, instructionsInt1task1, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name1{1}; 
row2= name1{2};
row3= name1{3};
row4= name1{4};

col1= name1{5};
col2= name1{6};
col3= name1{7};
col4= name1{8};
col5= name1{9};
col6= name1{10};
col7= name1{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);


WaitSecs(afterStartInterval);


% If hasnt clicked on "end int" button
% 1
if buttonEnd == 0
    
    % Until he presses the end button or time for task runs out
    % 2
while (mouseY < R3(2) | mouseY > R3(4) | mouseX < C3(1) | mouseX > C3(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int24sTask1Lasts        
        % 3
        while ~max(buttons) && now < clickBegins + int24sTask1Lasts
        DrawFormattedText(wPtr, instructionsInt1task1, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name1{1}; 
row2= name1{2};
row3= name1{3};
row4= name1{4};

col1= name1{5};
col2= name1{6};
col3= name1{7};
col4= name1{8};
col5= name1{9};
col6= name1{10};
col7= name1{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startPracticeInterval3;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R3(2) && mouseY <= R3(4) && mouseX >= C3(1) && mouseX <= C3(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
        
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int24sTask1Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
    
    
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions); % Since there is a click
    % 2    
    end
    
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int24sTask1Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int24sTask1Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2
    while (mouseY < R4(2) | mouseY > R4(4) | mouseX < C6(1) | mouseX > C6(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int24sTask2Lasts        
        % 3.3
        while ~max(buttons) && now < clickBegins + int24sTask2Lasts
        DrawFormattedText(wPtr, instructionsInt1task2, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name2{1}; 
row2= name2{2};
row3= name2{3};
row4= name2{4};

col1= name2{5};
col2= name2{6};
col3= name2{7};
col4= name2{8};
col5= name2{9};
col6= name2{10};
col7= name2{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R4(2) && mouseY <= R4(4) && mouseX >= C6(1) && mouseX <= C6(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int24sTask2Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2    
    end
    
  fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int24sTask2Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int24sTask2Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.2
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.2
    while (mouseY < R1(2) | mouseY > R1(4) | mouseX < C4(1) | mouseX > C4(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int24sTask3Lasts        
        % 3.3.2
        while ~max(buttons) && now < clickBegins + int24sTask3Lasts
        DrawFormattedText(wPtr, instructionsInt1task3, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name3{1}; 
row2= name3{2};
row3= name3{3};
row4= name3{4};

col1= name3{5};
col2= name3{6};
col3= name3{7};
col4= name3{8};
col5= name3{9};
col6= name3{10};
col7= name3{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.2
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R1(2) && mouseY <= R1(4) && mouseX >= C4(1) && mouseX <= C4(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int24sTask3Lasts   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.2    
    end
    
  fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int24sTask3Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int24sTask3Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

            % 4.1
            end
          %3.1.2
          end
        % 3.1      
        end
    % 2.1    
    end
% 1        
    end
end

lengthPracticeInterval = now - startPracticeInterval3;
correctas = num2str(counterCorrectas);
incorrectas = num2str(counterIncorrectas);


if (counterCorrectas+counterIncorrectas)>0
    if (counterCorrectas/(counterCorrectas+counterIncorrectas))>.79
    proportion=' over or equal to 80 per cent.';
    getPayed=1;
else
    proportion=' under 80 per cent.';
    getPayed=0;
    end
else
    proportion=' over or equal to 80 per cent.';
    getPayed=1;
end


fprintf(myfile,'The length of the 24s interval is %.5f \n\n', lengthPracticeInterval);

Answer = 'Interval Ended. Please click the button labeled "Next" to continue.';
interval24s='24s';

realInt = 24;
percentualDifference = (abs(lengthPracticeInterval-realInt))/realInt;

if percentualDifference >0.2
    getPayedYes='$0';
end
if getPayed==1
if percentualDifference <= 0.2 && percentualDifference > 0.10 && getPayed==1
    getPayedYes=lowPayment;

end
    if percentualDifference <= 0.10 && percentualDifference > 0.05 && getPayed==1
        getPayedYes=midPayment;
    end
        if percentualDifference <= 0.05 && getPayed==1
                getPayedYes=highPayment;
        end
else
    getPayedYes='$0';
end
        
text='0m24s';
deviationInt = abs(lengthPracticeInterval-realInt);
proportionCorrectas = counterCorrectas/(counterCorrectas+counterIncorrectas);

         fprintf(myfileData, '%.2f \n', proportionCorrectas);
         fprintf(myfileData, '%.5f \n', lengthPracticeInterval);
fprintf(payoffs, '%s \t\t %.5f \t\t %.5f \t\t %.5f \t\t %.2f \t\t\t\t %i \t\t\t\t\t %i \t\t\t\t\t %.2f \t\t\t %s \t\t %s \n\n', text, realInt, lengthPracticeInterval, deviationInt, percentualDifference, counterCorrectas, counterIncorrectas, proportionCorrectas, getPayedYes, intNumber0m24s);
fprintf(shortPayoffs, '%s \t\t %s \t\t\t %s\n\n',intNumber0m24s, text, getPayedYes);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mouseX=0; mouseY=0;

DrawFormattedText(wPtr, Answer, [positionX], [positionY], [0 0 0]);
Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
Screen('Flip',wPtr);
WaitSecs(afterStopInterval); 

while mouseX<x7 | mouseY>y1
DrawFormattedText(wPtr, Answer, [positionX], [positionY], [0 0 0]);
Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
Screen('Flip',wPtr);

% Wait for mouse click in next button
[clicks,mouseX,mouseY,whichButton] = GetClicks();
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%SCREEN INSTRUCTIONS 22 - (Instructions for 3m39s int)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Screen('TextFont',wPtr,'Helvetica');
Screen('TextSize',wPtr,18);

mouseX=0; mouseY=0;

        DrawFormattedText(wPtr, 'Please produce an interval of 3 minutes and 39 seconds.\n\n\n\n\nClick "Start Interval" to start the interval.', [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        Screen('DrawText',wPtr,StartInterval,x7+(x1/8),y0+(y1/2),[0 0 0]);
        Screen('Flip',wPtr);
        
        WaitSecs(startIntervalInstructions);
        
        % Wait for key press
        while mouseX<x7 | mouseY>y1
        DrawFormattedText(wPtr, 'Please produce an interval of 3 minutes and 39 seconds.\n\n\n\n\nClick "Start Interval" to start the interval.', [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        Screen('DrawText',wPtr,StartInterval,x7+(x1/8),y0+(y1/2),[0 0 0]);
        Screen('Flip',wPtr);

        % Wait for mouse click in next button
        [clicks,mouseX,mouseY,whichButton] = GetClicks();
        end
        
 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%SCREEN INSTRUCTIONS 23 - (EXTRA) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%There are 19 tasks not 18 because I added an extra one borrowed from
%%other place. 
instructionsInt8task1 = 'Please click the cell where the column to the left of the column labeled atlas intersects the row above the biology row.';
% 1/5 name48={'physics' 'biology' 'chemistry' 'geology'    'hades' 'zeus' 'poseidon' 'athena' 'apollo' 'atlas' 'perses'};
instructionsInt8task2 = 'Please click the cell where the row below the row labeled piano intersects the column labeled cat.';
% 4/4 name49={'guitar' 'trumpet' 'piano' 'drums'       'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};
instructionsInt8task3 = 'Please click the cell where the row above the eraser row intersects the column to the left of the earth column.';
% 2/1 name50={'pen' 'pencil' 'eraser' 'ruler'         'saturn' 'earth' 'neptune' 'mercury' 'jupiter' 'uranus' 'venus'};
instructionsInt8task4 = 'Please click the cell where the Italy column intersects the trunk row.';
% 3/6 name51={'buds' 'leaves' 'trunk' 'roots'          'Cuba' 'Ghana' 'Iraq' 'Nigeria' 'Romania' 'Italy' 'Japan'};
instructionsInt8task5 = 'Please click the cell where the column to the left of the column labeled goat intersects the row below the woman row.';
% 4/1 name52={'girl' 'man' 'woman' 'boy'              'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};
instructionsInt8task6 = 'Please click the cell where the column to the left of the column labeled apple intersects the row below the green row.';
% 3/2 name53={'red' 'green' 'blue' 'yellow'            'banana' 'peach' 'apple' 'grape' 'orange' 'pear' 'lemon'};
instructionsInt8task7 = 'Please click the cell where the row below the row labeled California intersects the column to the right of the goat column.';
% 2/3 name54={'California' 'Iowa' 'Texas' 'Alaska'     'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};
instructionsInt8task8 = 'Please click the cell where the row above the roots row intersects the column to the right of the Ghana column.';
% 3/3 name55={'buds' 'leaves' 'trunk' 'roots'          'Cuba' 'Ghana' 'Iraq' 'Nigeria' 'Romania' 'Italy' 'Japan'};
instructionsInt8task9 = 'Please click the cell where the column to the right of the spaghetti column intersects the row labeled space.';
% 4/2 name56={'sea' 'sky' 'earth' 'space'             'spaghetti' 'capellini' 'fusilli' 'lasagne' 'linguine' 'fettuccine' 'cannelloni'};
instructionsInt8task10 = 'Please click the cell where the column to the left of the allosaurus column intersects the row above the nimbus row.';
% 1/4 name57={'cumulus' 'nimbus' 'cirrus' 'stratus'    'velociraptor' 'brachiosaurus' 'rex' 'triceratops' 'allosaurus' 'brachiosaurus' 'diplodocus'};
instructionsInt8task11 = 'Please click the cell where the row above the row labeled pencil intersects the column to the right of the mercury column.';
% 1/5 name58={'pen' 'pencil' 'eraser' 'ruler'         'saturn' 'earth' 'neptune' 'mercury' 'jupiter' 'uranus' 'venus'};
instructionsInt8task12 = 'Please click the cell where the row labeled circle intersects the column to the left of the iron column.';
% 1/2 name59={'circle' 'square' 'triangle' 'rectangle' 'oxygen' 'lead' 'iron' 'arsenic' 'silicon' 'lithium' 'carbon'};
instructionsInt8task13 = 'Please click the cell where the column labeled dog intersects the row above the drums row.';
% 3/5 name60={'guitar' 'trumpet' 'piano' 'drums'       'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};
instructionsInt8task14 = 'Please click the cell where the column to the left of the column labeled fox intersects the row below the row labeled girl.';
% 2/2 name61={'girl' 'man' 'woman' 'boy'              'cow' 'goat' 'fox' 'cat' 'dog' 'horse' 'duck'};
instructionsInt8task15 = 'Please click the cell where the row below the row labeled chemistry intersects the column to the right of the zeus column.';
% 4/3 name62={'physics' 'biology' 'chemistry' 'geology' 'hades' 'zeus' 'poseidon' 'athena' 'apollo' 'atlas' 'perses'};
instructionsInt8task16 = 'Please click the cell where the column to the left of the column labeled potential intersects the row above the offroad row.';
% 3/1 name63={'touring' 'chopper' 'scooter' 'offroad'  'kinetic' 'potential' 'thermal' 'chemical' 'electrical' 'nuclear' 'magnetic'};
instructionsInt8task17 = 'Please click the cell where the row above the water row intersects the column to the right of the cashew column.';
% 1/6 name64={'fire' 'water' 'air' 'earth'            'walnut' 'peanut' 'almond' 'macadamia' 'cashew' 'pecan' 'pistachio'};
instructionsInt8task18 = 'Please click the cell where the row below the earth row intersects the column to the right of the column labeled linguine.';
% 4/6 name65={'sea' 'sky' 'earth' 'space'             'spaghetti' 'capellini' 'fusilli' 'lasagne' 'linguine' 'fettuccine' 'cannelloni'};


fprintf(myfile,'Beginning of int of 3 minutes and 39 seconds \n');
EndInterval2 = strcat(EndInterval, ' of\n3 minutes\n39 seconds');

clickBegins=GetSecs();
startPracticeInterval3=clickBegins;
now = clickBegins;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;
counterCorrectas=0;
counterIncorrectas=0;
buttonEnd=0;

fprintf(myfile,'Beginning of task \n');

DrawFormattedText(wPtr, instructionsInt8task1, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name48{1}; 
row2= name48{2};
row3= name48{3};
row4= name48{4};

col1= name48{5};
col2= name48{6};
col3= name48{7};
col4= name48{8};
col5= name48{9};
col6= name48{10};
col7= name48{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);

WaitSecs(afterStartInterval);


% If hasnt clicked on "end int" button
% 1
if buttonEnd == 0
    
    % Until he presses the end button or time for task runs out
    % 2
while (mouseY < R1(2) | mouseY > R1(4) | mouseX < C5(1) | mouseX > C5(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask18Lasts + 2      
        % 3
        while ~max(buttons) && now < clickBegins + int3m16sTask18Lasts+2
        DrawFormattedText(wPtr, instructionsInt8task1, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name48{1}; 
row2= name48{2};
row3= name48{3};
row4= name48{4};

col1= name48{5};
col2= name48{6};
col3= name48{7};
col4= name48{8};
col5= name48{9};
col6= name48{10};
col7= name48{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startPracticeInterval3;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R1(2) && mouseY <= R1(4) && mouseX >= C5(1) && mouseX <= C5(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
        
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int3m16sTask18Lasts+2   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
    
    
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions); % Since there is a click
    % 2    
    end
    
    
        
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask15Wait + 2
            % 2.3
            while ~max(buttons) && now < clickBegins + int3m16sTask15Wait + 2
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
        
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2
    while (mouseY < R4(2) | mouseY > R4(4) | mouseX < C4(1) | mouseX > C4(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask17Lasts+2        
        % 3.3
        while ~max(buttons) && now < clickBegins + int3m16sTask17Lasts+2
        DrawFormattedText(wPtr, instructionsInt8task2, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name49{1}; 
row2= name49{2};
row3= name49{3};
row4= name49{4};

col1= name49{5};
col2= name49{6};
col3= name49{7};
col4= name49{8};
col5= name49{9};
col6= name49{10};
col7= name49{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R4(2) && mouseY <= R4(4) && mouseX >= C4(1) && mouseX <= C4(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int3m16sTask17Lasts+2   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2    
    end
    

        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask14Wait + 2
            % 2.3
            while ~max(buttons) && now < clickBegins + int3m16sTask14Wait + 2
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.4.1
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.4.2
    while (mouseY < R4(2) | mouseY > R4(4) | mouseX < C6(1) | mouseX > C6(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask16Lasts+2        
        % 3.4.3
        while ~max(buttons) && now < clickBegins + int3m16sTask16Lasts+2
        DrawFormattedText(wPtr, instructionsInt8task18, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);


row1= name65{1}; 
row2= name65{2};
row3= name65{3};
row4= name65{4};

col1= name65{5};
col2= name65{6};
col3= name65{7};
col4= name65{8};
col5= name65{9};
col6= name65{10};
col7= name65{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.4.4
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R4(2) && mouseY <= R4(4) && mouseX >= C6(1) && mouseX <= C6(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int3m16sTask16Lasts+2   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.4.5    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask13Wait + 2
            % 2.3
            while ~max(buttons) && now < clickBegins + int3m16sTask13Wait + 2
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.2
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.2
    while (mouseY < R2(2) | mouseY > R2(4) | mouseX < C1(1) | mouseX > C1(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask15Lasts+2        
        % 3.3.2
        while ~max(buttons) && now < clickBegins + int3m16sTask15Lasts+2
        DrawFormattedText(wPtr, instructionsInt8task3, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name50{1}; 
row2= name50{2};
row3= name50{3};
row4= name50{4};

col1= name50{5};
col2= name50{6};
col3= name50{7};
col4= name50{8};
col5= name50{9};
col6= name50{10};
col7= name50{11};

% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/3),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/3),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/3),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/3),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/3),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/3),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.2
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R2(2) && mouseY <= R2(4) && mouseX >= C1(1) && mouseX <= C1(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int3m16sTask15Lasts+2   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.2    
    end
    

        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask13Wait + 5
            % 2.3
            while ~max(buttons) && now < clickBegins + int3m16sTask13Wait + 5
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.3
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.3
    while (mouseY < R3(2) | mouseY > R3(4) | mouseX < C6(1) | mouseX > C6(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask14Lasts+2        
        % 3.3.3
        while ~max(buttons) && now < clickBegins + int3m16sTask14Lasts+2
        DrawFormattedText(wPtr, instructionsInt8task4, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name51{1};
row2= name51{2};
row3= name51{3};
row4= name51{4};

col1= name51{5};
col2= name51{6};
col3= name51{7};
col4= name51{8};
col5= name51{9};
col6= name51{10};
col7= name51{11};
% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.3
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R3(2) && mouseY <= R3(4) && mouseX >= C6(1) && mouseX <= C6(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int3m16sTask14Lasts+2   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.3    
    end
    

        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask12Wait  + 2
            % 2.3
            while ~max(buttons) && now < clickBegins + int3m16sTask12Wait + 2
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.4
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.4
    while (mouseY < R4(2) | mouseY > R4(4) | mouseX < C1(1) | mouseX > C1(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask13Lasts+2        
        % 3.3.4
        while ~max(buttons) && now < clickBegins + int3m16sTask13Lasts+2
        DrawFormattedText(wPtr, instructionsInt8task5, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name52{1};
row2= name52{2};
row3= name52{3};
row4= name52{4};

col1= name52{5};
col2= name52{6};
col3= name52{7};
col4= name52{8};
col5= name52{9};
col6= name52{10};
col7= name52{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.4
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R4(2) && mouseY <= R4(4) && mouseX >= C1(1) && mouseX <= C1(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int3m16sTask13Lasts+2   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.4    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask12Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int3m16sTask12Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.5
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.5
    while (mouseY < R3(2) | mouseY > R3(4) | mouseX < C2(1) | mouseX > C2(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask12Lasts+2        
        % 3.3.5
        while ~max(buttons) && now < clickBegins + int3m16sTask12Lasts+2
        DrawFormattedText(wPtr, instructionsInt8task6, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name53{1};
row2= name53{2};
row3= name53{3};
row4= name53{4};

col1= name53{5};
col2= name53{6};
col3= name53{7};
col4= name53{8};
col5= name53{9};
col6= name53{10};
col7= name53{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.5
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R3(2) && mouseY <= R3(4) && mouseX >= C2(1) && mouseX <= C2(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int3m16sTask12Lasts+2   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.5    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask11Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int3m16sTask11Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.6
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.6
    while (mouseY < R2(2) | mouseY > R2(4) | mouseX < C3(1) | mouseX > C3(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask12Lasts+2        
        % 3.3.6
        while ~max(buttons) && now < clickBegins + int3m16sTask12Lasts+2
        DrawFormattedText(wPtr, instructionsInt8task7, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name54{1};
row2= name54{2};
row3= name54{3};
row4= name54{4};

col1= name54{5};
col2= name54{6};
col3= name54{7};
col4= name54{8};
col5= name54{9};
col6= name54{10};
col7= name54{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.6
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R2(2) && mouseY <= R2(4) && mouseX >= C3(1) && mouseX <= C3(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int3m16sTask12Lasts+2   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.6    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask10Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int3m16sTask10Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.7
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.7
    while (mouseY < R3(2) | mouseY > R3(4) | mouseX < C3(1) | mouseX > C3(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask12Lasts+2        
        % 3.3.7
        while ~max(buttons) && now < clickBegins + int3m16sTask12Lasts+2
        DrawFormattedText(wPtr, instructionsInt8task8, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name55{1};
row2= name55{2};
row3= name55{3};
row4= name55{4};

col1= name55{5};
col2= name55{6};
col3= name55{7};
col4= name55{8};
col5= name55{9};
col6= name55{10};
col7= name55{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.7
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R3(2) && mouseY <= R3(4) && mouseX >= C3(1) && mouseX <= C3(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int3m16sTask12Lasts+2   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.7    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask9Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int3m16sTask9Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.8
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.8
    while (mouseY < R4(2) | mouseY > R4(4) | mouseX < C2(1) | mouseX > C2(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask12Lasts+2        
        % 3.3.8
        while ~max(buttons) && now < clickBegins + int3m16sTask12Lasts+2
        DrawFormattedText(wPtr, instructionsInt8task9, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name56{1};
row2= name56{2};
row3= name56{3};
row4= name56{4};

col1= name56{5};
col2= name56{6};
col3= name56{7};
col4= name56{8};
col5= name56{9};
col6= name56{10};
col7= name56{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.8
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R4(2) && mouseY <= R4(4) && mouseX >= C2(1) && mouseX <= C2(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int3m16sTask12Lasts+2   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.8    
    end
    

        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask8Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int3m16sTask8Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.9
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.9
    while (mouseY < R1(2) | mouseY > R1(4) | mouseX < C4(1) | mouseX > C4(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask12Lasts+2        
        % 3.3.10
        while ~max(buttons) && now < clickBegins + int3m16sTask12Lasts+2
        DrawFormattedText(wPtr, instructionsInt8task10, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name57{1};
row2= name57{2};
row3= name57{3};
row4= name57{4};

col1= name57{5};
col2= name57{6};
col3= name57{7};
col4= name57{8};
col5= name57{9};
col6= name57{10};
col7= name57{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.9
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R1(2) && mouseY <= R1(4) && mouseX >= C4(1) && mouseX <= C4(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int3m16sTask12Lasts+2   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.9    
    end
   
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask7Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int3m16sTask7Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
         
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.10
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.10
    while (mouseY < R1(2) | mouseY > R1(4) | mouseX < C2(1) | mouseX > C2(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask12Lasts+2        
        % 3.3.10
        while ~max(buttons) && now < clickBegins + int3m16sTask12Lasts+2
        DrawFormattedText(wPtr, instructionsInt8task12, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    

row1= name59{1};
row2= name59{2};
row3= name59{3};
row4= name59{4};

col1= name59{5};
col2= name59{6};
col3= name59{7};
col4= name59{8};
col5= name59{9};
col6= name59{10};
col7= name59{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.10
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R1(2) && mouseY <= R1(4) && mouseX >= C2(1) && mouseX <= C2(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int3m16sTask12Lasts+2   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.10    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask6Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int3m16sTask6Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.11
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.11
    while (mouseY < R3(2) | mouseY > R3(4) | mouseX < C5(1) | mouseX > C5(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask12Lasts+2        
        % 3.3.11
        while ~max(buttons) && now < clickBegins + int3m16sTask12Lasts+2
        DrawFormattedText(wPtr, instructionsInt8task13, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
    
row1= name60{1}; 
row2= name60{2};
row3= name60{3};
row4= name60{4};

col1= name60{5};
col2= name60{6};
col3= name60{7};
col4= name60{8};
col5= name60{9};
col6= name60{10};
col7= name60{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.11
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R3(2) && mouseY <= R3(4) && mouseX >= C5(1) && mouseX <= C5(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int3m16sTask12Lasts+2   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.11    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask5Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int3m16sTask5Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.12
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.12
    while (mouseY < R2(2) | mouseY > R2(4) | mouseX < C2(1) | mouseX > C2(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask12Lasts+2        
        % 3.3.12
        while ~max(buttons) && now < clickBegins + int3m16sTask12Lasts+2
        DrawFormattedText(wPtr, instructionsInt8task14, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
   

row1= name61{1}; 
row2= name61{2};
row3= name61{3};
row4= name61{4};

col1= name61{5};
col2= name61{6};
col3= name61{7};
col4= name61{8};
col5= name61{9};
col6= name61{10};
col7= name61{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.12
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R2(2) && mouseY <= R2(4) && mouseX >= C2(1) && mouseX <= C2(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int3m16sTask12Lasts+2   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.12    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask4Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int3m16sTask4Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.13
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.13
    while (mouseY < R4(2) | mouseY > R4(4) | mouseX < C3(1) | mouseX > C3(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask12Lasts+2        
        % 3.3.13
        while ~max(buttons) && now < clickBegins + int3m16sTask12Lasts+2
        DrawFormattedText(wPtr, instructionsInt8task15, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
   
row1= name62{1}; 
row2= name62{2};
row3= name62{3};
row4= name62{4};

col1= name62{5};
col2= name62{6};
col3= name62{7};
col4= name62{8};
col5= name62{9};
col6= name62{10};
col7= name62{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.13
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R4(2) && mouseY <= R4(4) && mouseX >= C3(1) && mouseX <= C3(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int3m16sTask12Lasts+2   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.13    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask3Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int3m16sTask3Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.14
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.14
    while (mouseY < R3(2) | mouseY > R3(4) | mouseX < C1(1) | mouseX > C1(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask12Lasts+2        
        % 3.3.14
        while ~max(buttons) && now < clickBegins + int3m16sTask12Lasts+2
        DrawFormattedText(wPtr, instructionsInt8task16, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
   

row1= name63{1}; 
row2= name63{2};
row3= name63{3};
row4= name63{4};

col1= name63{5};
col2= name63{6};
col3= name63{7};
col4= name63{8};
col5= name63{9};
col6= name63{10};
col7= name63{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.14
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R3(2) && mouseY <= R3(4) && mouseX >= C1(1) && mouseX <= C1(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int3m16sTask12Lasts+2   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.14    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask2Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int3m16sTask2Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.15
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.15
    while (mouseY < R1(2) | mouseY > R1(4) | mouseX < C5(1) | mouseX > C5(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask12Lasts+2        
        % 3.3.15
        while ~max(buttons) && now < clickBegins + int3m16sTask12Lasts+2
        DrawFormattedText(wPtr, instructionsInt8task11, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
   
row1= name58{1}; 
row2= name58{2};
row3= name58{3};
row4= name58{4};

col1= name58{5};
col2= name58{6};
col3= name58{7};
col4= name58{8};
col5= name58{9};
col6= name58{10};
col7= name58{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.15
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R1(2) && mouseY <= R1(4) && mouseX >= C5(1) && mouseX <= C5(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int3m16sTask12Lasts+2   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.15    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask2Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int3m16sTask2Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.16
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.16
    while (mouseY < R1(2) | mouseY > R1(4) | mouseX < C6(1) | mouseX > C6(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask12Lasts+2        
        % 3.3.16
        while ~max(buttons) && now < clickBegins + int3m16sTask12Lasts+2
        DrawFormattedText(wPtr, instructionsInt8task17, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);

row1= name64{1}; 
row2= name64{2};
row3= name64{3};
row4= name64{4};

col1= name64{5};
col2= name64{6};
col3= name64{7};
col4= name64{8};
col5= name64{9};
col6= name64{10};
col7= name64{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.16
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R1(2) && mouseY <= R1(4) && mouseX >= C6(1) && mouseX <= C6(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int3m16sTask12Lasts+2   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.16    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask1Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int3m16sTask1Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clickBegins=GetSecs();
now = clickBegins;
startTaskTime = now;
buttons=[0 0 0];
mouseX=0; mouseY=0;
d=0;

% If hasnt clicked on "end int" button
% 3.1.17
if buttonEnd == 0
    
    fprintf(myfile,'Beginning of task \n');

    % Until he presses the end button or time for task runs out
    % 3.2.17
    while (mouseY < R4(2) | mouseY > R4(4) | mouseX < C6(1) | mouseX > C6(3)) && (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask12Lasts+2        
        % 3.3.17
        while ~max(buttons) && now < clickBegins + int3m16sTask12Lasts+2
        DrawFormattedText(wPtr, instructionsInt8task18, [positionX], [positionY], [0 0 0]);
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);


row1= name65{1}; 
row2= name65{2};
row3= name65{3};
row4= name65{4};

col1= name65{5};
col2= name65{6};
col3= name65{7};
col4= name65{8};
col5= name65{9};
col6= name65{10};
col7= name65{11};


% ROWS
Screen('DrawText',wPtr,row1,x1+(x1/4),y4+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row2,x1+(x1/4),y5+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row3,x1+(x1/4),y6+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,row4,x1+(x1/4),y7+(y1/2),[0 0 0]);
% COLUMNS
Screen('DrawText',wPtr,col1,x2+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col2,x3+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col3,x4+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col4,x5+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col5,x6+(x1/4),y3+(y1/2),[0 0 0]);
Screen('DrawText',wPtr,col6,x7+(x1/4),y3+(y1/2),[0 0 0]);
%Screen('DrawText',wPtr,col7,x7+(x1/3),y3+(y1/2),[0 0 0]);

% Draw lines
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x8, y3, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y4, x8, y4, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y5, x8, y5, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y6, x8, y6, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y7, x8, y7, [3]); Screen('DrawLine',wPtr, [0 0 0], x1, y8, x8, y8, [8]);
Screen('DrawLine',wPtr, [0 0 0], x1, y3, x1, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x2, y3, x2, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x3, y3, x3, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x4, y3, x4, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x5, y3, x5, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x6, y3, x6, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y3, x7, y8, [3]); Screen('DrawLine',wPtr, [0 0 0], x8, y3, x8, y8, [8]);

% Labels Directions
Screen('DrawText',wPtr,'Above',x1/3,y4,[0 200 0]);
Screen('DrawText',wPtr,'Below',x1/3,y7+y1/1.6,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x1/2, y4+y1/3, x1/2, y7+y1/2, [2]);

Screen('DrawText',wPtr,'Left',x2,y3-y1/3,[0 200 0]);
Screen('DrawText',wPtr,'Right',x8-x1/2,y3-y1/3,[0 200 0]);
Screen('DrawLine',wPtr, [0 200 0], x2+x1/3, y3-y1/4, x7+x1/3, y3-y1/4, [2]);

Screen('Flip',wPtr);
        

        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        % 3.3.17
        end
        
            % Register if clicked on button end int 
            if max(buttons)>0 && (mouseX>x7 && mouseY<y1) % Check if end interval button
                buttonEnd=1; 
                timeIntoTaskWithNoResponse = now - startTaskTime;
                fprintf(myfile,'Time into Task with no response %.5f \n', timeIntoTaskWithNoResponse);

            else
                buttonEnd=0;
                
                 if max(buttons)>0 % Check if clicked on Row3/Col3
                    if mouseY >= R4(2) && mouseY <= R4(4) && mouseX >= C6(1) && mouseX <= C6(3)
                    d=1; % If this happens we get out of while
                    counterCorrectas = counterCorrectas + 1;
                    DrawFormattedText(wPtr, correctAnswer, [x3], [y3], [0 0 0]);

                    else
                    d=0;
                    counterIncorrectas = counterIncorrectas + 1;
                    DrawFormattedText(wPtr, wrongAnswer, [x3], [y3], [0 0 0]);

                    end
                    
                    Screen('Flip',wPtr);
                    WaitSecs(taskAnswer); % Since there is a click

                 end
                
                fprintf(myfile,'%i \n', d);
                
            end
            
            
            
    % If I exited the while because time was up then mark wrong answer
    if now > clickBegins + int3m16sTask12Lasts+2   
        counterIncorrectas = counterIncorrectas + 1;
        fprintf(myfile,'This last 0 was because time was up. \n');
        DrawFormattedText(wPtr, wrongAnswerTime, [x3], [y3], [0 0 0]);
        Screen('Flip',wPtr);
        WaitSecs(taskAnswer); % Since there is a click
    else
        timeBeforeClick = now - clickBegins;
        fprintf(myfile,'This last interval took the user %.5f seconds to click since begining of task. \n',timeBeforeClick);
    end
            
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
    % 3.2.17    
    end
    
        fprintf(myfile,'End of task. \n');

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % If hasnt clicked on "end int" button
    % 2.1
    if buttonEnd == 0

        clickBegins=GetSecs();
        now = clickBegins;
        buttons=[0 0 0];
        mouseX=0; mouseY=0;

        % These two whiles wait for a click on the "End Inverval" button or the time to pass to the next screen (with the task) 
        % 2.2
        while (mouseX<x7 | mouseY>y1) && now < clickBegins + int3m16sTask1Wait
            % 2.3
            while ~max(buttons) && now < clickBegins + int3m16sTask1Wait
        Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        DrawFormattedText(wPtr, EndInterval2, [x7+(x1/12)], [y0+(y1/5)], [0 0 0]);
        Screen('Flip',wPtr);
            
        [mouseX,mouseY,buttons] = GetMouse(); % x and y only exist if clicked
        
        now = GetSecs();
        
            % 2.3
            end
        
            % Register if clicked on button end int
            if max(buttons)>0 && mouseX>x7 && mouseY<y1
                buttonEnd=1;
            else
                buttonEnd=0;
            end
        
        buttons=[0 0 0];
        
        %%% Wait secs after mouse %%%
        WaitSecs(afterMouseInstructions);
        
        % 2.2
        end 
        
        
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

                                                            % 4.1
        end
              %3.1.17   
end
         %3.1.16
end
                                                            %3.1.15       
                                                             end
                                                        % 3.1.14
                                                        end
                                                    % 3.1.13
                                                    end
                                                % 3.1.12
                                                end
                                            %3.1.11
                                            end
                                        %3.1.10
                                        end
                                    %3.1.9
                                    end
                                %3.1.8
                                end
                        %3.1.7
                        end
                        %3.1.6
                    end
                    %3.1.5
                    end
                %3.1.4
                end
            %3.1.3
            end
          %3.1.2
end
          %3.4.1
end
        % 3.1      
        end
    % 2.1    
    end
% 1        
    end
end
    end
end
    end
end
    end
end
    end
end
    end
end
    end
end
    end
end
    end
end

lengthPracticeInterval = now - startPracticeInterval3;
correctas = num2str(counterCorrectas);
incorrectas = num2str(counterIncorrectas);


if (counterCorrectas+counterIncorrectas)>0
    if (counterCorrectas/(counterCorrectas+counterIncorrectas))>.79
    proportion=' over or equal to 80 per cent.';
    getPayed=1;
else
    proportion=' under 80 per cent.';
    getPayed=0;
    end
else
    proportion=' over or equal to 80 per cent.';
    getPayed=1;
end


fprintf(myfile,'The length of the 3m16s interval is %.5f \n\n', lengthPracticeInterval);

Answer = 'Interval Ended. Please click the button labeled "Next" to continue.';

realInt = 219;
percentualDifference = (abs(lengthPracticeInterval-realInt))/realInt;

if percentualDifference >0.2
    getPayedYes='$0';
end
if getPayed==1
if percentualDifference <= 0.2 && percentualDifference > 0.10 && getPayed==1
    getPayedYes=lowPayment;

end
    if percentualDifference <= 0.10 && percentualDifference > 0.05 && getPayed==1
        getPayedYes=midPayment;
    end
        if percentualDifference <= 0.05 && getPayed==1
                getPayedYes=highPayment;
        end
else
    getPayedYes='$0';
end
        
% PAYMENTS  
text='3m39s';
deviationInt = abs(lengthPracticeInterval-realInt);
proportionCorrectas = counterCorrectas/(counterCorrectas+counterIncorrectas);

         fprintf(myfileData, '%.2f \n', proportionCorrectas);
         fprintf(myfileData, '%.5f \n', lengthPracticeInterval);
fprintf(payoffs, '%s \t\t %.5f \t\t %.5f \t\t %.5f \t\t %.2f \t\t\t\t %i \t\t\t\t\t %i \t\t\t\t\t %.2f \t\t\t %s \t\t %s \n\n', text, realInt, lengthPracticeInterval, deviationInt, percentualDifference, counterCorrectas, counterIncorrectas, proportionCorrectas, getPayedYes, intNumber4m15s);
fprintf(shortPayoffs, '%s \t\t %s \t\t\t %s\n\n',intNumber4m15s, text, getPayedYes);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

mouseX=0; mouseY=0;

DrawFormattedText(wPtr, Answer, [positionX], [positionY], [0 0 0]);
Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
Screen('Flip',wPtr);

WaitSecs(afterStopInterval); 

while mouseX<x7 | mouseY>y1
DrawFormattedText(wPtr, Answer, [positionX], [positionY], [0 0 0]);
Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
Screen('DrawText',wPtr,Next,x7+(x1/3),y0+(y1/2),[0 0 0]);
Screen('Flip',wPtr);

% Wait for mouse click in next button
[clicks,mouseX,mouseY,whichButton] = GetClicks();
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%SCREEN INSTRUCTIONS 24 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Screen('TextFont',wPtr,'Helvetica');
Screen('TextSize',wPtr,18);

mouseX=0; mouseY=0;

        % Wait for key press
        while mouseX<x7 | mouseY>y1
        DrawFormattedText(wPtr, 'End of section 2...', [positionX], [positionY], [0 0 0]);
        %Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        %Screen('DrawText',wPtr,StartInterval,x7+(x1/8),y0+(y1/2),[0 0 0]);
        Screen('Flip',wPtr);

        % Wait for mouse click in next button
        [clicks,mouseX,mouseY,whichButton] = GetClicks();
        end
       

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%SCREEN INSTRUCTIONS 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Screen('TextFont',wPtr,'Helvetica');
Screen('TextSize',wPtr,18);

mouseX=0; mouseY=0;

        % Wait for key press
        while mouseX<x7 | mouseY>y1
        DrawFormattedText(wPtr, 'Stop clicking now. Please raise your hand to continue.', [positionX], [positionY], [0 0 0]);
        %Screen('DrawLine',wPtr, [0 0 0], x7, y1, x8, y1, [3]); Screen('DrawLine',wPtr, [0 0 0], x7, y0, x7, y1, [3]);
        %Screen('DrawText',wPtr,StartInterval,x7+(x1/8),y0+(y1/2),[0 0 0]);
        Screen('Flip',wPtr);

        % Wait for mouse click in next button
        [clicks,mouseX,mouseY,whichButton] = GetClicks();
        end
       

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%fclose(fileName);
fclose(myfile);
Screen('CloseAll') 

end



