close all
clear all

deathcause = readtable('cause_of_death.xlsx');
sanitation = readtable('sanitation.xlsx');
lifeexpect = readtable('life_expectancy.xlsx');
choleradeath = readtable('cholera_deaths.xlsx');
choleracase = readtable('cholera_cases.xlsx');
cholerafatal = readtable('cholera_case_fatality.xlsx');

lifeexpectdouble = str2double(lifeexpect{:,2:11});
lifeexpectyear = lifeexpectdouble(:,2);
sanitationdouble = str2double(sanitation{:,2:8});
deathcausedouble = str2double(deathcause{:,2:5});
choleradeathdouble = str2double(choleradeath{:,2:3});
choleracasedouble = str2double(choleracase{:,2:3});
cholerafataldouble = str2double(cholerafatal{:,2:3});

sanitationx = zeros(194, 3);
sanitationx(:,1) = 1990;
sanitationx(:,2) = 2000;
sanitationx(:,3) = 2013;
sanitationy = zeros(194, 3);

n=1;
m=1;
p=1;
for i = 1:numel(sanitationdouble(:,2)),
    if sanitationdouble(i,1) == 1990,
        sanitationy(n,1) = sanitationdouble(i,4);
        n = n+1;
    end;
    
    if sanitationdouble(i,1) == 2000,
        sanitationy(m,2) = sanitationdouble(i,4);
        m = m+1;
    end;
    
    if sanitationdouble(i,1) == 2015,
        sanitationy(p,3) = sanitationdouble(i,4);
        p = p+1;
    end;
end;

avg1990 = nanmean(sanitationy(:,1))
avg2000 = nanmean(sanitationy(:,2))
avg2015 = nanmean(sanitationy(:,3))

figure;
hold on
plot([sanitationx(1,1),sanitationx(1,2),sanitationx(1,3)],[avg1990,avg2000,avg2015],'k-o')
plot(sanitationx, sanitationy, 'x')
legend('average percent with improved drinking water')
title('Percentages of Improved Drinking Water Resources in Every Country')
xlabel('Year')
ylabel('Percent of Total Population')
axis([1987 2015 0 100])
hold off



