mainurl='http://www.njuskalo.hr';

linklabel='href="/nekretnine';
%urllinks{1}='http://www.njuskalo.hr/prodaja-stanova/zagreb?f_level_1_location_id=1263&f_price_limit_from=10000&f_year_built_from=1913&page=';
urllinks{1}='http://www.njuskalo.hr/prodaja-stanova/zagreb?f_level_1_location_id=1263&f_price_limit_from=10000&page=';
pages(1)=67;

k=1;
j=1;

for i=1:pages(k)
pause(1);
number=num2str(i);
url=strcat(urllinks{k},number);
html = urlread(url);
txt = regexprep(html,'<script.*?/script>','');
txt = regexprep(txt,'<style.*?/style>','');

fid=fopen('temp.txt','w');
fprintf(fid,'%s',txt);
fclose(fid);

fid=fopen('temp.txt');

while(~feof(fid))
   s = fgetl(fid);
   
   if(findstr(linklabel, s))
       htmlcode=regexprep(s,'<a href=.*?>','');
       [token remain]=strtok(htmlcode, '"');
       [token remain]=strtok(remain, '"');
       [token remain]=strtok(remain, '"');
       [token remain]=strtok(remain, '"');
       stanlink=strcat(mainurl,token);
       svistanovi{j}=stanlink;
       j=j+1;
   end
   
   
end
%k=k+1;
end

fclose(fid);
%url = 'http://www.njuskalo.hr/prodaja-stanova/zagreb';
%stanurl='http://www.njuskalo.hr/nekretnine/stan-zagreb-vrbik-67-m2-oglas-7044279';
debug =0;
if debug == 0

for p=1:(j-1)
pause(1);    
html = urlread(svistanovi{p});
% Use regular expressions to remove undesired markup.
txt = regexprep(html,'<script.*?/script>','');
txt = regexprep(txt,'<style.*?/style>','');
%txt = regexprep(txt,'<.*?>','')

fid=fopen('temp.txt','w');
fprintf(fid,'%s',txt);
fclose(fid);




cijenaL='<div class="price">';

%kvartovi labele:
vrbikL='<td bgcolor="#f8f8f8" width="113">Vrbik</td>';
cvjetnoL='<td bgcolor="#f8f8f8" width="113">Cvjetno naselje</td>';
martinovkaL='<td bgcolor="#f8f8f8" width="113">Martinovka</td>';
krugeL='<td bgcolor="#f8f8f8" width="113">Kruge</td>';
trnje1L='<td><strong>Naselje:</strong></td>';
trnjeL='<td bgcolor="#f8f8f8" width="113">Trnje</td>';
savicaL='<td bgcolor="#f8f8f8" width="113">Savica</td>';
sigecicaL='<td bgcolor="#f8f8f8" width="113">Sigeèica</td>';

%labele
zgradaL='<td bgcolor="#f8f8f8" width="113">u stambenoj zgradi</td>';
kucaL='<td bgcolor="#f8f8f8" width="113">u kuæi</td>';
garsonijera='<td bgcolor="#f8f8f8" width="113">Garsonijera</td>';
jednosobni='<td bgcolor="#f8f8f8" width="113">1-1.5 sobni</td>';
dvosobni='<td bgcolor="#f8f8f8" width="113">2-2.5 sobni</td>';
trosobni='<td bgcolor="#f8f8f8" width="113">3-3.5 sobni</td>';
cetrosobni='<td bgcolor="#f8f8f8" width="113">4+</td>';
visokoprL='<td bgcolor="#f8f8f8" width="113">Visoko prizemlje</td>';
suterenL='<td bgcolor="#f8f8f8" width="113">Suteren</td>';
prizemljeL='<td bgcolor="#f8f8f8" width="113">Prizemlje</td>';
potkrovljeL='<td bgcolor="#f8f8f8" width="113">Potkrovlje</td>';
visokopotL='<td bgcolor="#f8f8f8" width="113">Visoko potkrovlje</td>';
teretniliftL='<td><strong>Teretni lift:</strong></td>';
liftL='<td><strong>Lift:</strong></td>';

povrsinaL='<td><strong>Stambena površina:</strong></td>';
povTeraseL='<td><strong>Površina terase:</strong></td>';
povBalkonaL='<td><strong>Površina balkona:</strong></td>';
povVrtaL='<td><strong>Površina vrta:</strong></td>';

starostL='<td><strong>Godina izgradnje:</strong></td>';
starostadaptL='<td><strong>Godina&nbsp;zadnje&nbsp;adaptacije:</strong></td>';

centralnoL='<li>Centralno grijanje</li>';
toplanaL='<li>Gradska toplana</li>';


%varijable:
cijena=0;

vrbik=0;
cvjetno=0;
martinovka=0;
kruge=0;
trnje=0;
savica=0;
sigecica=0;


zgrada=0;
kuca=0;

brojSoba=0;

suteren=0;
prizemlje=0;
visokopr=0;
kat=1;
visokopot=0;
potkrovlje=0;

lift=0;
teretnilift=0;

povrsina=0;
povTerase=0;
povBalkona=0;
povVrta=0;

starost=50;
starostadapt=50;

centralno=0;
toplana=0;


fid=fopen('temp.txt');

while(~feof(fid))
   s = fgetl(fid);
   
   if(findstr(cijenaL, s))
   s = fgetl(fid);
   s = fgetl(fid);
   
   cijenatekst=strrep(s,'kn','');
   cijenatekst=strtrim(cijenatekst);
   cijenatekst=strtrim(cijenatekst);
   cijenatekst=strrep(cijenatekst,'.','');
   cijena=str2num(cijenatekst);
   
   end
   
   if(findstr(trnje1L, s))
       s=fgetl(fid);
       if(findstr(trnjeL, s))
        trnje=1;
       end
   end
   if(findstr(vrbikL, s))
   vrbik=1;
   end
   if(findstr(cvjetnoL, s))
   cvjetno=1;
   end
   if(findstr(martinovkaL, s))
   martinovka=1;
   end
   if(findstr(krugeL, s))
   kruge=1;
   end
   if(findstr(savicaL, s))
   savica=1;
   end
   if(findstr(sigecicaL, s))
   sigecica=1;
   end   
   
   if(findstr(zgradaL, s))
   zgrada=1;
   end
   if(findstr(kucaL, s))
   kuca=1;
   end
   
   if(findstr(garsonijera, s))
       brojSoba=0;
   end
   if(findstr(jednosobni, s))
       brojSoba=1;
   end
   if(findstr(dvosobni, s))
       brojSoba=2;
   end
   if(findstr(trosobni, s))
       brojSoba=3;
   end
   if(findstr(cetrosobni, s))
       brojSoba=4;
   end
   
   if(findstr(visokoprL, s))
    visokopr=1;
    kat=0;
   end
   if(findstr(suterenL, s))
    suteren=1;
    kat=0;
   end
   if(findstr(prizemljeL, s))
    prizemlje=1;
    kat=0;
   end
   if(findstr(potkrovljeL, s))
    potkrovlje=1;
    kat=0;
   end
   if(findstr(visokopotL, s))
    visokopot=1;
    kat=0;
   end
   
   if(findstr(liftL, s))
   lift=1;
   end
   if(findstr(teretniliftL, s))
   teretnilift=1;
   end

   if(findstr(povrsinaL, s))
       s=fgetl(fid);
       povtekst=regexprep(s,'<.*?>','');
       povtekst=strtrim(povtekst);
       povtekst=strtrim(povtekst);
       povrsina=str2num(povtekst);
   end
   if(findstr(povTeraseL, s))
       s=fgetl(fid);
       povtekst=regexprep(s,'<.*?>','');
       povtekst=strtrim(povtekst);
       povtekst=strtrim(povtekst);
       povTerase=str2num(povtekst);
   end
   if(findstr(povBalkonaL, s))
       s=fgetl(fid);
       povtekst=regexprep(s,'<.*?>','');
       povtekst=strtrim(povtekst);
       povtekst=strtrim(povtekst);
       povBalkona=str2num(povtekst);
   end
   if(findstr(povVrtaL, s))
       s=fgetl(fid);
       povtekst=regexprep(s,'<.*?>','');
       povtekst=strtrim(povtekst);
       povtekst=strtrim(povtekst);
       povVrta=str2num(povtekst);
   end
   
   if(findstr(starostL, s))
       s=fgetl(fid);
       povtekst=regexprep(s,'<.*?>','');
       star=str2num(povtekst);
       starost=2013-star;
       starostadapt=starost;
   end
   if(findstr(starostadaptL, s))
       s=fgetl(fid);
       povtekst=regexprep(s,'<.*?>','');
       star=str2num(povtekst);
       starostadapt=2013-star;
   end
   
   if(findstr(centralnoL, s))
   centralno=1;
   end
   if(findstr(toplanaL, s))
   toplana=1;
   end

   
end

fclose(fid);
   
var(p,:)=[vrbik cvjetno martinovka kruge trnje savica sigecica zgrada kuca brojSoba suteren prizemlje visokopr kat visokopot potkrovlje lift teretnilift povrsina povTerase povBalkona povVrta starost starostadapt centralno toplana];
y(p,:)=cijena;
minvar(p,:)=[vrbik cvjetno martinovka kruge trnje savica sigecica zgrada kuca brojSoba kat lift povrsina povBalkona starost starostadapt centralno toplana];

save ('trnje_all.mat', 'var', 'y', 'minvar', 'svistanovi');

end


end

   
   

